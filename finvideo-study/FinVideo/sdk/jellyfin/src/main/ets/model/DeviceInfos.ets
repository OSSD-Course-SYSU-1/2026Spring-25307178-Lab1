import { ClientCapabilities } from "./ClientCapabilities";

/**
 *
 * @export
 * @interface DeviceInfo
 */
export interface DeviceInfos {
  /**
   *
   * @type {string}
   * @memberof DeviceInfo
   */
  'Name'?: string | null;
  /**
   *
   * @type {string}
   * @memberof DeviceInfo
   */
  'CustomName'?: string | null;
  /**
   * Gets or sets the access token.
   * @type {string}
   * @memberof DeviceInfo
   */
  'AccessToken'?: string | null;
  /**
   * Gets or sets the identifier.
   * @type {string}
   * @memberof DeviceInfo
   */
  'Id'?: string | null;
  /**
   * Gets or sets the last name of the user.
   * @type {string}
   * @memberof DeviceInfo
   */
  'LastUserName'?: string | null;
  /**
   * Gets or sets the name of the application.
   * @type {string}
   * @memberof DeviceInfo
   */
  'AppName'?: string | null;
  /**
   * Gets or sets the application version.
   * @type {string}
   * @memberof DeviceInfo
   */
  'AppVersion'?: string | null;
  /**
   * Gets or sets the last user identifier.
   * @type {string}
   * @memberof DeviceInfo
   */
  'LastUserId'?: string;
  /**
   * Gets or sets the date last modified.
   * @type {string}
   * @memberof DeviceInfo
   */
  'DateLastActivity'?: string;
  /**
   *
   * @type {ClientCapabilities}
   * @memberof DeviceInfo
   */
  'Capabilities'?: ClientCapabilities;
  /**
   *
   * @type {string}
   * @memberof DeviceInfo
   */
  'IconUrl'?: string | null;
}