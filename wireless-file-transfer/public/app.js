const state = {
  pin: '',
  files: []
}

const elements = {
  refreshButton: document.querySelector('#refreshButton'),
  pinValue: document.querySelector('#pinValue'),
  addressList: document.querySelector('#addressList'),
  fileInput: document.querySelector('#fileInput'),
  dropZone: document.querySelector('#dropZone'),
  uploadQueue: document.querySelector('#uploadQueue'),
  fileList: document.querySelector('#fileList'),
  fileCount: document.querySelector('#fileCount'),
  statusLine: document.querySelector('#statusLine')
}

init()

async function init() {
  bindEvents()
  await loadConfig()
  await refreshFiles()
}

function bindEvents() {
  elements.refreshButton.addEventListener('click', refreshFiles)
  elements.fileInput.addEventListener('change', () => {
    uploadFiles(Array.from(elements.fileInput.files ?? []))
    elements.fileInput.value = ''
  })

  for (const eventName of ['dragenter', 'dragover']) {
    elements.dropZone.addEventListener(eventName, (event) => {
      event.preventDefault()
      elements.dropZone.classList.add('is-over')
    })
  }

  for (const eventName of ['dragleave', 'drop']) {
    elements.dropZone.addEventListener(eventName, (event) => {
      event.preventDefault()
      elements.dropZone.classList.remove('is-over')
    })
  }

  elements.dropZone.addEventListener('drop', (event) => {
    uploadFiles(Array.from(event.dataTransfer.files ?? []))
  })
}

async function loadConfig() {
  const response = await fetch('/api/config')
  const config = await response.json()
  state.pin = config.pin
  elements.pinValue.textContent = config.pin
  renderAddresses(config.urls ?? [])
  setStatus('服务已启动，可以开始传输文件。')
}

function renderAddresses(urls) {
  const allUrls = [window.location.origin, ...urls].filter((value, index, array) => array.indexOf(value) === index)
  elements.addressList.innerHTML = ''

  for (const url of allUrls) {
    const item = document.createElement('div')
    item.className = 'address-item'

    const link = document.createElement('a')
    link.href = url
    link.textContent = url
    link.target = '_blank'
    link.rel = 'noreferrer'

    const button = document.createElement('button')
    button.className = 'secondary'
    button.type = 'button'
    button.textContent = '复制'
    button.addEventListener('click', () => copyText(url))

    item.append(link, button)
    elements.addressList.append(item)
  }
}

async function uploadFiles(files) {
  if (files.length === 0) {
    return
  }

  for (const file of files) {
    await uploadFile(file)
  }
  await refreshFiles()
}

function uploadFile(file) {
  const item = document.createElement('div')
  item.className = 'upload-item'
  item.innerHTML = `
    <div class="upload-item-head">
      <span class="file-name"></span>
      <span class="meta">等待上传</span>
    </div>
    <progress max="100" value="0"></progress>
  `
  item.querySelector('.file-name').textContent = file.name
  elements.uploadQueue.prepend(item)

  const progress = item.querySelector('progress')
  const meta = item.querySelector('.meta')

  return new Promise((resolve) => {
    const request = new XMLHttpRequest()
    request.open('POST', `/api/upload?pin=${encodeURIComponent(state.pin)}&name=${encodeURIComponent(file.name)}`)
    request.upload.addEventListener('progress', (event) => {
      if (event.lengthComputable) {
        const percent = Math.round((event.loaded / event.total) * 100)
        progress.value = percent
        meta.textContent = `${percent}%`
      }
    })
    request.addEventListener('load', () => {
      if (request.status >= 200 && request.status < 300) {
        progress.value = 100
        meta.textContent = '上传完成'
        setStatus(`已上传 ${file.name}`)
      } else {
        meta.textContent = '上传失败'
        setStatus(`上传失败：${file.name}`)
      }
      resolve()
    })
    request.addEventListener('error', () => {
      meta.textContent = '网络错误'
      setStatus(`网络错误：${file.name}`)
      resolve()
    })
    request.send(file)
  })
}

async function refreshFiles() {
  const response = await fetch(`/api/files?pin=${encodeURIComponent(state.pin)}`)
  if (!response.ok) {
    setStatus('刷新文件列表失败，请确认 PIN 是否有效。')
    return
  }
  const payload = await response.json()
  state.files = payload.files ?? []
  renderFiles()
  setStatus('文件列表已更新。')
}

function renderFiles() {
  elements.fileCount.textContent = `${state.files.length} 个文件`
  elements.fileList.innerHTML = ''

  if (state.files.length === 0) {
    const empty = document.createElement('div')
    empty.className = 'empty-state'
    empty.textContent = '还没有文件。发送端上传后，接收端会在这里看到下载入口。'
    elements.fileList.append(empty)
    return
  }

  for (const file of state.files) {
    const downloadPath = `/files/${encodeURIComponent(file.name)}?pin=${encodeURIComponent(state.pin)}`
    const downloadUrl = new URL(downloadPath, window.location.origin).toString()
    const item = document.createElement('article')
    item.className = 'file-item'
    item.innerHTML = `
      <div class="file-item-head">
        <span class="file-name"></span>
        <span class="meta"></span>
      </div>
      <div class="file-actions">
        <a download>下载</a>
        <button type="button" class="secondary">复制链接</button>
        <button type="button" class="danger">删除</button>
      </div>
    `

    item.querySelector('.file-name').textContent = file.name
    item.querySelector('.meta').textContent = `${formatBytes(file.size)} · ${formatDate(file.uploadedAt)}`

    const downloadLink = item.querySelector('a')
    downloadLink.href = downloadPath

    const buttons = item.querySelectorAll('button')
    buttons[0].addEventListener('click', () => copyText(downloadUrl))
    buttons[1].addEventListener('click', () => deleteFile(file.name))

    elements.fileList.append(item)
  }
}

async function deleteFile(fileName) {
  const response = await fetch(`/api/files/${encodeURIComponent(fileName)}?pin=${encodeURIComponent(state.pin)}`, {
    method: 'DELETE'
  })
  if (response.ok) {
    setStatus(`已删除 ${fileName}`)
    await refreshFiles()
  } else {
    setStatus(`删除失败：${fileName}`)
  }
}

async function copyText(text) {
  try {
    await navigator.clipboard.writeText(text)
    setStatus('链接已复制。')
  } catch {
    setStatus(text)
  }
}

function formatBytes(bytes) {
  if (bytes < 1024) return `${bytes} B`
  if (bytes < 1024 * 1024) return `${(bytes / 1024).toFixed(1)} KB`
  if (bytes < 1024 * 1024 * 1024) return `${(bytes / 1024 / 1024).toFixed(1)} MB`
  return `${(bytes / 1024 / 1024 / 1024).toFixed(1)} GB`
}

function formatDate(value) {
  return new Date(value).toLocaleString('zh-CN', {
    month: '2-digit',
    day: '2-digit',
    hour: '2-digit',
    minute: '2-digit'
  })
}

function setStatus(message) {
  elements.statusLine.textContent = message
}
