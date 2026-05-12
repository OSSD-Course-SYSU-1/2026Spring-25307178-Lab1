import { FinItem } from "./FinItem"

/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2024/11/11 21:49
 * @Version V1.0
 * @Description fin view
 */
export interface FinView {

  id: string

  name: string

  items?: Array<FinItem>,

  type: CollectionType
}