import { fileIo as fs } from '@kit.CoreFileKit'
import { FinTransferSession } from '../entity/FinTransferSession'

const CONTINUATION_FILE_DIR = 'mediahub-continuation'
const SESSION_MANIFEST_FILE = 'mediahub-continuation-session.json'
const LATEST_PREVIEW_FILE_KEY = 'mediahub.continuation.latestPreviewFile'
const CONTINUATION_FILE_VERSION = 1

export interface ContinuationFileAsset {
  role: string
  fileName: string
  relativePath: string
  mimeType: string
  size: number
  createdAt: number
}

interface ContinuationFileManifest {
  version: number
  scene: string
  createdAt: number
  description: string
  session: FinTransferSession
  files: ContinuationFileAsset[]
}

/**
 * Stores file-like continuation assets under Context.distributedFilesDir.
 * The video stream itself is intentionally not copied; receivers use this manifest
 * to restore state and can also access lightweight preview assets when available.
 */
export class ContinuationFileStore {
  private static context?: Context = undefined

  public static configure(context: Context): void {
    ContinuationFileStore.context = context
  }

  public static writeSessionManifest(session: FinTransferSession): ContinuationFileAsset | undefined {
    let dir = ContinuationFileStore.ensureContinuationDir()
    if (!dir) {
      return undefined
    }

    try {
      let previewFiles = ContinuationFileStore.getLatestPreviewFile()
      let manifest: ContinuationFileManifest = {
        version: CONTINUATION_FILE_VERSION,
        scene: 'player',
        createdAt: Date.now(),
        description: 'MediaHub continuation manifest. The receiver restores playback from this file when distributed files are available.',
        session: session,
        files: previewFiles ? [previewFiles] : []
      }
      let payload = JSON.stringify(manifest)
      let path = ContinuationFileStore.buildFilePath(SESSION_MANIFEST_FILE)
      let file = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC)
      try {
        let size = fs.writeSync(file.fd, payload)
        return {
          role: 'continuation-manifest',
          fileName: SESSION_MANIFEST_FILE,
          relativePath: `${CONTINUATION_FILE_DIR}/${SESSION_MANIFEST_FILE}`,
          mimeType: 'application/json',
          size: size,
          createdAt: manifest.createdAt
        }
      } finally {
        fs.closeSync(file)
      }
    } catch (_) {
      return undefined
    }
  }

  public static readSessionFromManifest(fileName?: string): FinTransferSession | undefined {
    if (!fileName || fileName.length === 0) {
      return undefined
    }
    try {
      let payload = fs.readTextSync(ContinuationFileStore.buildFilePath(ContinuationFileStore.safeFileName(fileName)))
      let manifest = JSON.parse(payload) as ContinuationFileManifest
      if (manifest.version !== CONTINUATION_FILE_VERSION || manifest.scene !== 'player') {
        return undefined
      }
      return manifest.session
    } catch (_) {
      return undefined
    }
  }

  public static savePreviewImage(fileName: string, buffer: ArrayBuffer): ContinuationFileAsset | undefined {
    let dir = ContinuationFileStore.ensureContinuationDir()
    if (!dir) {
      return undefined
    }
    try {
      let safeName = ContinuationFileStore.safeFileName(fileName)
      let path = ContinuationFileStore.buildFilePath(safeName)
      let file = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC)
      try {
        let size = fs.writeSync(file.fd, buffer)
        let asset: ContinuationFileAsset = {
          role: 'video-preview',
          fileName: safeName,
          relativePath: `${CONTINUATION_FILE_DIR}/${safeName}`,
          mimeType: 'image/jpeg',
          size: size,
          createdAt: Date.now()
        }
        AppStorage.setOrCreate<string>(LATEST_PREVIEW_FILE_KEY, JSON.stringify(asset))
        return asset
      } finally {
        fs.closeSync(file)
      }
    } catch (_) {
      return undefined
    }
  }

  private static getLatestPreviewFile(): ContinuationFileAsset | undefined {
    let payload = AppStorage.get<string>(LATEST_PREVIEW_FILE_KEY)
    if (!payload || payload.length === 0) {
      return undefined
    }
    try {
      return JSON.parse(payload) as ContinuationFileAsset
    } catch (_) {
      return undefined
    }
  }

  private static ensureContinuationDir(): string | undefined {
    let baseDir = ContinuationFileStore.context?.distributedFilesDir
    if (!baseDir || baseDir.length === 0) {
      return undefined
    }
    let dir = `${baseDir}/${CONTINUATION_FILE_DIR}`
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

  private static buildFilePath(fileName: string): string {
    return `${ContinuationFileStore.context!.distributedFilesDir}/${CONTINUATION_FILE_DIR}/${fileName}`
  }

  private static safeFileName(fileName: string): string {
    return fileName.replace(/[^a-zA-Z0-9._-]/g, '_')
  }
}
