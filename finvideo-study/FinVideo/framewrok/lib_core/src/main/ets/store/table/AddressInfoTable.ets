/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2024/11/9 16:28
 * @Version V1.0
 * @Description
 */
export class AddressInfoTable {

  static readonly TABLE_NAME = "address_info"

  /**
   * address id
   */
  static readonly ADDRESS_ID = "address_id"

  /**
   * address url
   */
  static readonly ADDRESS_URL = "address_url"

  /**
   * server id
   */
  static readonly SERVER_ID = "server_id"

  static readonly CREATE_SQL = `CREATE TABLE IF NOT EXISTS ${AddressInfoTable.TABLE_NAME} (
    ${AddressInfoTable.ADDRESS_ID} VARCHAR(255) PRIMARY KEY NOT NULL,
    ${AddressInfoTable.ADDRESS_URL} VARCHAR(255) NOT NULL,
    ${AddressInfoTable.SERVER_ID} VARCHAR(255) NOT NULL
  )`
}