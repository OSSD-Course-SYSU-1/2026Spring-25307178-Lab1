import { FinTransferSession } from "../../entity/FinTransferSession"

const TRANSFER_SESSION_PREFIX = 'FINVIDEO_TRANSFER_V1:'

export class TransferSessionCodec {
  public static encode(session: FinTransferSession): string {
    return TRANSFER_SESSION_PREFIX + encodeURIComponent(JSON.stringify(session))
  }

  public static decode(code: string): FinTransferSession {
    let normalizedCode = code.trim()
    if (!normalizedCode.startsWith(TRANSFER_SESSION_PREFIX)) {
      throw new Error('不是 FinVideo 续播码')
    }
    let rawJson = decodeURIComponent(normalizedCode.substring(TRANSFER_SESSION_PREFIX.length))
    let session = JSON.parse(rawJson) as FinTransferSession
    if (session.version !== 1 || !session.id || !session.name || session.position < 0) {
      throw new Error('续播码内容不完整')
    }
    return session
  }
}
