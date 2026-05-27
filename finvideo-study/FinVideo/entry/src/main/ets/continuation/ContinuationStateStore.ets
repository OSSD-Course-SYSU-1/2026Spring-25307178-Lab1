import { Want } from '@kit.AbilityKit'
import { router } from '@kit.ArkUI'
import { FinTransferSession } from '../entity/FinTransferSession'
import { PlayerArgs } from '../pages/player/PlayerArgs'
import { ContinuationFileStore } from './ContinuationFileStore'

const CURRENT_SESSION_KEY = 'mediahub.continuation.currentSession'
const PENDING_SESSION_KEY = 'mediahub.continuation.pendingSession'
const WANT_PARAM_SESSION = 'mediahub.continuation.session'
const WANT_PARAM_SCENE = 'mediahub.continuation.scene'
const WANT_PARAM_VERSION = 'mediahub.continuation.version'
const WANT_PARAM_FILE_MANIFEST = 'mediahub.continuation.fileManifest'
const WANT_PARAM_FILE_MANIFEST_SIZE = 'mediahub.continuation.fileManifestSize'
const WANT_PARAM_FILE_COUNT = 'mediahub.continuation.fileCount'
const CONTINUATION_VERSION = 1
const PLAYER_SCENE = 'player'

/**
 * Keeps the video playback state small enough for HarmonyOS application continuation.
 * The large media stream still comes from the receiver device's own Jellyfin/Emby config.
 */
export class ContinuationStateStore {
  public static configureContext(context: Context): void {
    ContinuationFileStore.configure(context)
  }

  public static saveCurrentSession(session: FinTransferSession): void {
    AppStorage.setOrCreate<string>(CURRENT_SESSION_KEY, ContinuationStateStore.serialize(session))
  }

  public static clearCurrentSession(): void {
    AppStorage.setOrCreate<string>(CURRENT_SESSION_KEY, '')
  }

  public static writeCurrentSessionToWant(wantParam: Record<string, Object>): boolean {
    let session = ContinuationStateStore.getCurrentSession()
    if (!session) {
      return false
    }
    wantParam[WANT_PARAM_VERSION] = CONTINUATION_VERSION
    wantParam[WANT_PARAM_SCENE] = PLAYER_SCENE
    wantParam[WANT_PARAM_SESSION] = ContinuationStateStore.serialize(session)
    let manifestAsset = ContinuationFileStore.writeSessionManifest(session)
    if (manifestAsset) {
      wantParam[WANT_PARAM_FILE_MANIFEST] = manifestAsset.fileName
      wantParam[WANT_PARAM_FILE_MANIFEST_SIZE] = manifestAsset.size
      wantParam[WANT_PARAM_FILE_COUNT] = 1
    }
    return true
  }

  public static savePendingFromWant(want: Want): boolean {
    let session = ContinuationStateStore.readSessionFromWant(want)
    if (!session) {
      return false
    }
    AppStorage.setOrCreate<string>(PENDING_SESSION_KEY, ContinuationStateStore.serialize(session))
    return true
  }

  public static openPendingSession(replace: boolean): boolean {
    let session = ContinuationStateStore.consumePendingSession()
    if (!session) {
      return false
    }
    let args: PlayerArgs = {
      id: session.id,
      name: session.name,
      type: session.type,
      startPosition: session.position
    }
    if (replace) {
      router.replaceUrl({ url: 'pages/player/PlayerPage', params: args })
    } else {
      router.pushUrl({ url: 'pages/player/PlayerPage', params: args })
    }
    return true
  }

  private static getCurrentSession(): FinTransferSession | undefined {
    return ContinuationStateStore.parse(AppStorage.get<string>(CURRENT_SESSION_KEY))
  }

  private static consumePendingSession(): FinTransferSession | undefined {
    let session = ContinuationStateStore.parse(AppStorage.get<string>(PENDING_SESSION_KEY))
    AppStorage.setOrCreate<string>(PENDING_SESSION_KEY, '')
    return session
  }

  private static readSessionFromWant(want: Want): FinTransferSession | undefined {
    let parameters = want.parameters
    if (!parameters || parameters[WANT_PARAM_SCENE] !== PLAYER_SCENE) {
      return undefined
    }
    let manifestFileName = parameters[WANT_PARAM_FILE_MANIFEST] as string
    let sessionFromFile = ContinuationFileStore.readSessionFromManifest(manifestFileName)
    if (sessionFromFile) {
      return sessionFromFile
    }
    return ContinuationStateStore.parse(parameters[WANT_PARAM_SESSION] as string)
  }

  private static serialize(session: FinTransferSession): string {
    return JSON.stringify(session)
  }

  private static parse(payload?: string): FinTransferSession | undefined {
    if (!payload || payload.length === 0) {
      return undefined
    }
    try {
      let session = JSON.parse(payload) as FinTransferSession
      if (session.version !== CONTINUATION_VERSION || !session.id || !session.name || session.position < 0) {
        return undefined
      }
      return session
    } catch (_) {
      return undefined
    }
  }
}
