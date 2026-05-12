import { ServerType } from "./ServerType"

/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2024/11/9 11:01
 * @Version V1.0
 * @Description Server Info
 */
export interface ServerInfo {

  /**
   * server id
   */
  serverId: string

  /**
   * Server Name
   */
  serverName: string

  /**
   * Server Type
   */
  serverType: ServerType

}