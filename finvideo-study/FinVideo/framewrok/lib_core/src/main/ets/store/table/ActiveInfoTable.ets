/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2024/11/9 16:30
 * @Version V1.0
 * @Description
 */
export class ActiveInfoTable {

  static readonly TABLE_NAME = "active_info"

  /**
   * server id
   */
  static readonly SERVER_ID = "server_id"

  /**
   * address id
   */
  static readonly ADDRESS_ID = "address_id"

  /**
   * user id
   */
  static readonly USER_ID = "user_id"

  static readonly CREATE_SQL = `CREATE TABLE IF NOT EXISTS ${ActiveInfoTable.TABLE_NAME} (
    ${ActiveInfoTable.SERVER_ID} VARCHAR(255) PRIMARY KEY NOT NULL,
    ${ActiveInfoTable.ADDRESS_ID} VARCHAR(255) NOT NULL,
    ${ActiveInfoTable.USER_ID} VARCHAR(255) NOT NULL
  )`

}