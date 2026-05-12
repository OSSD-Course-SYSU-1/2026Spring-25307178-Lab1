import { AddressInfo } from "./AddressInfo"
import { ServerInfo } from "./ServerInfo"
import { UserInfo } from "./UserInfo"

/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2024/11/9 11:01
 * @Version V1.0
 * @Description Active Info
 */
export interface ActiveInfo {

  /**
   * server info
   */
  serverInfo: ServerInfo

  /**
   * address info
   */
  addressInfo: AddressInfo

  /**
   * user info
   */
  userInfo: UserInfo

}