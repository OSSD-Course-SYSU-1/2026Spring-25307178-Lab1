/**
 * @export
 * @interface PublicSystemInfo
 */
export interface PublicSystemInfo {
  /**
   * Gets or sets the local address.
   * @type {string}
   * @memberof PublicSystemInfo
   */
  'LocalAddress'?: string | null;

  'LocalAddresses'?: Array<string> | null;

  'WanAddress'?: string | null

  'RemoteAddresses'?: Array<string> | null

  /**
   * Gets or sets the name of the server.
   * @type {string}
   * @memberof PublicSystemInfo
   */
  'ServerName'?: string | null;

  /**
   * Gets or sets the server version.
   * @type {string}
   * @memberof PublicSystemInfo
   */
  'Version'?: string | null;

  /**
   * Gets or sets the id.
   * @type {string}
   * @memberof PublicSystemInfo
   */
  'Id'?: string | null;

}
