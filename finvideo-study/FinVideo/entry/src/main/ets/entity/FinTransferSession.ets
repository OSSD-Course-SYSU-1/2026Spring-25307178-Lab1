import { FinItemType } from "@ohpg/fin-core"

/**
 * 跨设备续播时传递的最小播放状态。
 */
export interface FinTransferSession {
  version: number
  id: string
  name: string
  type: FinItemType
  position: number
  duration: number
  createdAt: number
}
