import { createReadStream, createWriteStream } from 'node:fs'
import { mkdir, readdir, rm, stat } from 'node:fs/promises'
import { createServer } from 'node:http'
import { networkInterfaces } from 'node:os'
import path from 'node:path'
import { fileURLToPath } from 'node:url'
import { randomInt } from 'node:crypto'
import { once } from 'node:events'

const ROOT_DIR = path.dirname(fileURLToPath(import.meta.url))
const PUBLIC_DIR = path.join(ROOT_DIR, 'public')
const DEFAULT_UPLOAD_DIR = path.join(ROOT_DIR, 'uploads')
const DEFAULT_PORT = 5731
const DEFAULT_HOST = '0.0.0.0'
const MAX_UPLOAD_BYTES = Number.parseInt(process.env.TRANSFER_MAX_BYTES ?? '', 10) || 2 * 1024 * 1024 * 1024

const args = parseArgs(process.argv.slice(2))
const port = Number.parseInt(args.port ?? String(DEFAULT_PORT), 10)
const host = args.host ?? DEFAULT_HOST
const uploadDir = path.resolve(args['data-dir'] ?? DEFAULT_UPLOAD_DIR)
const transferPin = process.env.TRANSFER_PIN ?? String(randomInt(100000, 1000000))

await mkdir(uploadDir, { recursive: true })

const server = createServer(async (request, response) => {
  try {
    await routeRequest(request, response)
  } catch (error) {
    if (error instanceof Error && error.message === 'INVALID_PIN') {
      return sendJson(response, 401, { error: 'PIN 不正确' })
    }
    console.error('[wireless-transfer] request failed:', error)
    sendJson(response, 500, { error: '服务器处理失败' })
  }
})

server.listen(port, host, () => {
  const urls = getLocalUrls(port)
  console.log(`Wireless File Transfer is running.`)
  console.log(`PIN: ${transferPin}`)
  console.log(`Local: http://127.0.0.1:${port}`)
  urls.forEach((url) => console.log(`LAN:   ${url}`))
  console.log(`Upload directory: ${uploadDir}`)
})

async function routeRequest(request, response) {
  const requestUrl = new URL(request.url ?? '/', `http://${request.headers.host ?? 'localhost'}`)

  if (request.method === 'GET' && requestUrl.pathname === '/api/config') {
    return sendJson(response, 200, {
      pin: transferPin,
      urls: getLocalUrls(port),
      maxUploadBytes: MAX_UPLOAD_BYTES
    })
  }

  if (request.method === 'GET' && requestUrl.pathname === '/api/files') {
    requirePin(request, requestUrl)
    return sendJson(response, 200, { files: await listFiles() })
  }

  if (request.method === 'POST' && requestUrl.pathname === '/api/upload') {
    requirePin(request, requestUrl)
    return receiveUpload(request, response, requestUrl)
  }

  if (request.method === 'DELETE' && requestUrl.pathname.startsWith('/api/files/')) {
    requirePin(request, requestUrl)
    const fileName = decodeURIComponent(requestUrl.pathname.substring('/api/files/'.length))
    await deleteFile(fileName)
    return sendJson(response, 200, { ok: true })
  }

  if (request.method === 'GET' && requestUrl.pathname.startsWith('/files/')) {
    requirePin(request, requestUrl)
    const fileName = decodeURIComponent(requestUrl.pathname.substring('/files/'.length))
    return sendDownload(response, fileName)
  }

  if (request.method === 'GET' || request.method === 'HEAD') {
    return sendStatic(response, requestUrl.pathname)
  }

  sendJson(response, 405, { error: '不支持的请求方法' })
}

async function receiveUpload(request, response, requestUrl) {
  const originalName = requestUrl.searchParams.get('name') ?? 'unnamed-file'
  const safeName = sanitizeFileName(originalName)
  const finalName = await reserveFileName(safeName)
  const finalPath = path.join(uploadDir, finalName)
  const declaredLength = Number.parseInt(request.headers['content-length'] ?? '0', 10)

  if (declaredLength > MAX_UPLOAD_BYTES) {
    return sendJson(response, 413, { error: '文件超过大小限制' })
  }

  let receivedBytes = 0
  const output = createWriteStream(finalPath, { flags: 'wx' })

  try {
    // 使用原始请求体保存 Blob，避免引入 multipart 解析依赖，演示时更稳定。
    for await (const chunk of request) {
      receivedBytes += chunk.length
      if (receivedBytes > MAX_UPLOAD_BYTES) {
        throw new Error('FILE_TOO_LARGE')
      }
      if (!output.write(chunk)) {
        await once(output, 'drain')
      }
    }
    output.end()
    await once(output, 'finish')
    sendJson(response, 201, {
      file: {
        name: finalName,
        originalName,
        size: receivedBytes,
        uploadedAt: new Date().toISOString()
      }
    })
  } catch (error) {
    output.destroy()
    await rm(finalPath, { force: true })
    if (error instanceof Error && error.message === 'FILE_TOO_LARGE') {
      return sendJson(response, 413, { error: '文件超过大小限制' })
    }
    throw error
  }
}

async function listFiles() {
  const entries = await readdir(uploadDir, { withFileTypes: true })
  const files = []
  for (const entry of entries) {
    if (!entry.isFile() || entry.name === '.gitkeep') {
      continue
    }
    const filePath = path.join(uploadDir, entry.name)
    const info = await stat(filePath)
    files.push({
      name: entry.name,
      size: info.size,
      uploadedAt: info.mtime.toISOString()
    })
  }
  return files.sort((a, b) => b.uploadedAt.localeCompare(a.uploadedAt))
}

async function deleteFile(fileName) {
  const target = resolveUploadPath(fileName)
  await rm(target, { force: true })
}

async function sendDownload(response, fileName) {
  const target = resolveUploadPath(fileName)
  const info = await stat(target)
  response.writeHead(200, {
    'content-type': 'application/octet-stream',
    'content-length': info.size,
    'content-disposition': `attachment; filename*=UTF-8''${encodeURIComponent(fileName)}`
  })
  createReadStream(target).pipe(response)
}

async function sendStatic(response, pathname) {
  const normalized = pathname === '/' ? '/index.html' : pathname
  const target = path.resolve(PUBLIC_DIR, `.${decodeURIComponent(normalized)}`)
  if (!target.startsWith(PUBLIC_DIR)) {
    return sendText(response, 403, 'Forbidden')
  }

  try {
    const info = await stat(target)
    if (!info.isFile()) {
      return sendText(response, 404, 'Not Found')
    }
    response.writeHead(200, { 'content-type': contentType(target), 'content-length': info.size })
    createReadStream(target).pipe(response)
  } catch {
    sendText(response, 404, 'Not Found')
  }
}

function requirePin(request, requestUrl) {
  const headerPin = request.headers['x-transfer-pin']
  const queryPin = requestUrl.searchParams.get('pin')
  const nextPin = Array.isArray(headerPin) ? headerPin[0] : headerPin
  if ((nextPin ?? queryPin) !== transferPin) {
    throw new Error('INVALID_PIN')
  }
}

function resolveUploadPath(fileName) {
  const safeName = sanitizeFileName(fileName)
  const target = path.resolve(uploadDir, safeName)
  if (!target.startsWith(uploadDir)) {
    throw new Error('INVALID_PATH')
  }
  return target
}

async function reserveFileName(fileName) {
  const parsed = path.parse(fileName)
  let index = 0
  while (true) {
    const suffix = index === 0 ? '' : `-${index}`
    const candidate = `${parsed.name}${suffix}${parsed.ext}`
    try {
      await stat(path.join(uploadDir, candidate))
      index += 1
    } catch {
      return candidate
    }
  }
}

function sanitizeFileName(fileName) {
  const baseName = path.basename(fileName).replace(/[<>:"/\\|?*\u0000-\u001f]/g, '_').trim()
  return baseName.length > 0 ? baseName.slice(0, 180) : `file-${Date.now()}`
}

function getLocalUrls(nextPort) {
  const urls = []
  const interfaces = networkInterfaces()
  for (const values of Object.values(interfaces)) {
    for (const address of values ?? []) {
      if (address.family === 'IPv4' && !address.internal) {
        urls.push(`http://${address.address}:${nextPort}`)
      }
    }
  }
  return urls
}

function sendJson(response, statusCode, payload) {
  const body = JSON.stringify(payload)
  response.writeHead(statusCode, {
    'content-type': 'application/json; charset=utf-8',
    'content-length': Buffer.byteLength(body)
  })
  response.end(body)
}

function sendText(response, statusCode, text) {
  response.writeHead(statusCode, { 'content-type': 'text/plain; charset=utf-8' })
  response.end(text)
}

function contentType(filePath) {
  if (filePath.endsWith('.html')) return 'text/html; charset=utf-8'
  if (filePath.endsWith('.css')) return 'text/css; charset=utf-8'
  if (filePath.endsWith('.js')) return 'text/javascript; charset=utf-8'
  if (filePath.endsWith('.svg')) return 'image/svg+xml'
  return 'application/octet-stream'
}

function parseArgs(values) {
  const parsed = {}
  for (let index = 0; index < values.length; index += 1) {
    const value = values[index]
    if (!value.startsWith('--')) {
      continue
    }
    const key = value.slice(2)
    const nextValue = values[index + 1]
    if (nextValue && !nextValue.startsWith('--')) {
      parsed[key] = nextValue
      index += 1
    } else {
      parsed[key] = 'true'
    }
  }
  return parsed
}
