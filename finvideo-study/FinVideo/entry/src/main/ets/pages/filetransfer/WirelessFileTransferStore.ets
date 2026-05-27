import { fileIo as fs, picker } from '@kit.CoreFileKit'

const TRANSFER_DIR = 'mediahub-wireless-transfer'
const MANIFEST_FILE = 'mediahub-wireless-transfer-manifest.json'
const MANIFEST_VERSION = 1

export interface WirelessTransferFile {
  id: string
  fileName: string
  storedName: string
  relativePath: string
  size: number
  source: string
  createdAt: number
}

interface WirelessTransferManifest {
  version: number
  updatedAt: number
  files: WirelessTransferFile[]
}

/**
 * Handles the standalone cross-device file transfer demo.
 * Files are copied into distributedFilesDir so another trusted device can read them
 * after HarmonyOS finishes distributed file synchronization.
 */
export class WirelessFileTransferStore {
  /**
   * Sender flow: pick real files from the system document picker and copy them
   * into the app's distributed file directory.
   */
  public static async pickAndSend(context: Context): Promise<WirelessTransferFile[]> {
    let documentPicker = new picker.DocumentViewPicker(context)
    let options = new picker.DocumentSelectOptions()
    options.maxSelectNumber = 5
    let uris = await documentPicker.select(options)
    let sentFiles: WirelessTransferFile[] = []
    for (let uri of uris) {
      let file = WirelessFileTransferStore.copyUriToDistributed(context, uri)
      if (file) {
        sentFiles.push(file)
      }
    }
    return sentFiles
  }

  /**
   * Sender fallback for classroom demos: create a tiny text file when there is
   * no convenient local document to pick.
   */
  public static createDemoFile(context: Context): WirelessTransferFile | undefined {
    let dir = WirelessFileTransferStore.ensureTransferDir(context)
    if (!dir) {
      return undefined
    }
    let now = Date.now()
    let id = WirelessFileTransferStore.createId()
    let fileName = `MediaHub-跨设备文件演示-${now}.txt`
    let storedName = `${id}_${WirelessFileTransferStore.safeFileName(fileName)}`
    let path = WirelessFileTransferStore.buildPath(context, storedName)
    let payload = [
      'MediaHub 跨设备无线文件传输演示',
      `生成时间：${new Date(now).toLocaleString()}`,
      '发送端：点击“生成演示文件”或“选择文件发送”',
      '接收端：在另一台同账号 HarmonyOS 设备打开本页并点击“刷新接收列表”',
      '说明：文件写入 context.distributedFilesDir，用于课堂展示自由流转/分布式文件能力。'
    ].join('\n')
    try {
      let file = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC)
      let size = 0
      try {
        size = fs.writeSync(file.fd, payload)
      } finally {
        fs.closeSync(file)
      }
      let item: WirelessTransferFile = {
        id: id,
        fileName: fileName,
        storedName: storedName,
        relativePath: `${TRANSFER_DIR}/${storedName}`,
        size: size,
        source: 'demo',
        createdAt: now
      }
      WirelessFileTransferStore.appendManifest(context, item)
      return item
    } catch (_) {
      return undefined
    }
  }

  /**
   * Receiver flow: read the manifest first; if it has not synchronized yet,
   * scan the distributed directory so the page can still show received files.
   */
  public static listFiles(context: Context): WirelessTransferFile[] {
    let dir = WirelessFileTransferStore.ensureTransferDir(context)
    if (!dir) {
      return []
    }
    let files = WirelessFileTransferStore.readManifest(context).files
      .filter((file: WirelessTransferFile) => WirelessFileTransferStore.fileExists(context, file.storedName))
    if (files.length > 0) {
      return files.sort((a: WirelessTransferFile, b: WirelessTransferFile) => b.createdAt - a.createdAt)
    }
    return WirelessFileTransferStore.scanTransferDir(context)
  }

  /**
   * Receiver flow: let the user choose a local destination and copy the
   * synchronized file out of distributedFilesDir.
   */
  public static async saveToUserSelectedPath(context: Context, file: WirelessTransferFile): Promise<boolean> {
    try {
      let documentPicker = new picker.DocumentViewPicker(context)
      let options = new picker.DocumentSaveOptions()
      options.newFileNames = [file.fileName]
      let targets = await documentPicker.save(options)
      if (!targets || targets.length === 0) {
        return false
      }
      let sourcePath = WirelessFileTransferStore.buildPath(context, file.storedName)
      fs.copyFileSync(sourcePath, targets[0])
      return true
    } catch (_) {
      return false
    }
  }

  /**
   * Copies one picker URI into the distributed directory and records it in the manifest.
   */
  private static copyUriToDistributed(context: Context, sourceUri: string): WirelessTransferFile | undefined {
    let dir = WirelessFileTransferStore.ensureTransferDir(context)
    if (!dir) {
      return undefined
    }
    let now = Date.now()
    let id = WirelessFileTransferStore.createId()
    let fileName = WirelessFileTransferStore.fileNameFromUri(sourceUri)
    let storedName = `${id}_${WirelessFileTransferStore.safeFileName(fileName)}`
    let targetPath = WirelessFileTransferStore.buildPath(context, storedName)
    try {
      try {
        fs.copyFileSync(sourceUri, targetPath)
      } catch (_) {
        let sourceFile = fs.openSync(sourceUri, fs.OpenMode.READ_ONLY)
        try {
          fs.copyFileSync(sourceFile.fd, targetPath)
        } finally {
          fs.closeSync(sourceFile)
        }
      }
      let stat = fs.statSync(targetPath)
      let item: WirelessTransferFile = {
        id: id,
        fileName: fileName,
        storedName: storedName,
        relativePath: `${TRANSFER_DIR}/${storedName}`,
        size: stat.size,
        source: 'picker',
        createdAt: now
      }
      WirelessFileTransferStore.appendManifest(context, item)
      return item
    } catch (_) {
      return undefined
    }
  }

  private static appendManifest(context: Context, file: WirelessTransferFile): void {
    let manifest = WirelessFileTransferStore.readManifest(context)
    let nextFiles = manifest.files.filter((item: WirelessTransferFile) => item.storedName !== file.storedName)
    nextFiles.push(file)
    let nextManifest: WirelessTransferManifest = {
      version: MANIFEST_VERSION,
      updatedAt: Date.now(),
      files: nextFiles
    }
    try {
      let path = WirelessFileTransferStore.buildPath(context, MANIFEST_FILE)
      let manifestFile = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC)
      try {
        fs.writeSync(manifestFile.fd, JSON.stringify(nextManifest))
      } finally {
        fs.closeSync(manifestFile)
      }
    } catch (_) {
    }
  }

  private static readManifest(context: Context): WirelessTransferManifest {
    try {
      let payload = fs.readTextSync(WirelessFileTransferStore.buildPath(context, MANIFEST_FILE))
      let manifest = JSON.parse(payload) as WirelessTransferManifest
      if (manifest.version === MANIFEST_VERSION && manifest.files) {
        return manifest
      }
    } catch (_) {
    }
    return {
      version: MANIFEST_VERSION,
      updatedAt: 0,
      files: []
    }
  }

  private static scanTransferDir(context: Context): WirelessTransferFile[] {
    try {
      let names = fs.listFileSync(WirelessFileTransferStore.transferDir(context))
      let files: WirelessTransferFile[] = []
      for (let name of names) {
        if (name === MANIFEST_FILE || name.length === 0) {
          continue
        }
        let stat = fs.statSync(WirelessFileTransferStore.buildPath(context, name))
        files.push({
          id: name,
          fileName: WirelessFileTransferStore.restoreOriginalName(name),
          storedName: name,
          relativePath: `${TRANSFER_DIR}/${name}`,
          size: stat.size,
          source: 'scan',
          createdAt: stat.mtime
        })
      }
      return files.sort((a: WirelessTransferFile, b: WirelessTransferFile) => b.createdAt - a.createdAt)
    } catch (_) {
      return []
    }
  }

  private static fileExists(context: Context, storedName: string): boolean {
    try {
      fs.accessSync(WirelessFileTransferStore.buildPath(context, storedName))
      return true
    } catch (_) {
      return false
    }
  }

  private static ensureTransferDir(context: Context): string | undefined {
    let dir = WirelessFileTransferStore.transferDir(context)
    try {
      fs.accessSync(dir)
    } catch (_) {
      try {
        fs.mkdirSync(dir, true)
      } catch (_) {
        return undefined
      }
    }
    return dir
  }

  private static transferDir(context: Context): string {
    return `${context.distributedFilesDir}/${TRANSFER_DIR}`
  }

  private static buildPath(context: Context, fileName: string): string {
    return `${WirelessFileTransferStore.transferDir(context)}/${fileName}`
  }

  private static createId(): string {
    return `${Date.now()}_${Math.floor(Math.random() * 100000)}`
  }

  private static fileNameFromUri(uri: string): string {
    let cleanUri = uri.split('?')[0]
    let slashIndex = cleanUri.lastIndexOf('/')
    let rawName = slashIndex >= 0 ? cleanUri.substring(slashIndex + 1) : cleanUri
    let name = decodeURIComponent(rawName)
    if (!name || name.length === 0) {
      return `MediaHub-transfer-${Date.now()}`
    }
    return name
  }

  private static restoreOriginalName(storedName: string): string {
    let firstUnderline = storedName.indexOf('_')
    let secondUnderline = firstUnderline >= 0 ? storedName.indexOf('_', firstUnderline + 1) : -1
    return secondUnderline >= 0 ? storedName.substring(secondUnderline + 1) : storedName
  }

  private static safeFileName(fileName: string): string {
    return fileName.replace(/[^a-zA-Z0-9.\u4e00-\u9fa5_-]/g, '_')
  }
}
