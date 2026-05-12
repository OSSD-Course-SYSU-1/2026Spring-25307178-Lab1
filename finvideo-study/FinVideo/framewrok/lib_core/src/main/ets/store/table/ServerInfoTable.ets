/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2024/11/9 16:30
 * @Version V1.0
 * @Description Server info
 */
export class ServerInfoTable {

  static readonly TABLE_NAME = "server_info"

  /**
   * server id
   */
  static readonly SERVER_ID = "server_id"

  /**
   * server name
   */
  static readonly SERVER_NAME = "server_name"

  /**
   * server type
   */
  static readonly SERVER_TYPE = "server_type"

  static readonly CREATE_SQL = `CREATE TABLE IF NOT EXISTS ${ServerInfoTable.TABLE_NAME} (
    ${ServerInfoTable.SERVER_ID} VARCHAR(255) PRIMARY KEY NOT NULL,
    ${ServerInfoTable.SERVER_NAME} VARCHAR(255) NOT NULL,
    ${ServerInfoTable.SERVER_TYPE} VARCHAR(255) NOT NULL
  )`
}