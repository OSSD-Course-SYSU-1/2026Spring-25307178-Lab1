/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2024/11/9 16:31
 * @Version V1.0
 * @Description
 */
export class UserInfoTable {

  /**
   * user info
   */
  static readonly TABLE_NAME = "user_info"

  /**
   * user id
   */
  static readonly USER_ID = "user_id"

  /**
   * user name
   */
  static readonly USER_NAME = "user_name"

  /**
   * server id
   */
  static readonly SERVER_ID = "server_id"

  /**
   * access token
   */
  static readonly ACCESS_TOKEN = "access_token"

  /**
   * user info table sql
   */
  static readonly CREATE_SQL = `CREATE TABLE IF NOT EXISTS ${UserInfoTable.TABLE_NAME} (
    ${UserInfoTable.USER_ID} VARCHAR(255) PRIMARY KEY NOT NULL,
    ${UserInfoTable.USER_NAME} VARCHAR(255) NOT NULL,
    ${UserInfoTable.ACCESS_TOKEN} VARCHAR(255) NOT NULL,
    ${UserInfoTable.SERVER_ID} VARCHAR(255) NOT NULL
  )`
}