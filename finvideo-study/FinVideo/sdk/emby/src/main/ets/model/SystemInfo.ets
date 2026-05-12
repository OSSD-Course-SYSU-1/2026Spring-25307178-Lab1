import { InstallationInfo } from "./InstallationInfo";
import { PackageVersionClass } from "./PackageVersionClass";
import { WakeOnLanInfo } from "./WakeOnLanInfo";

/**
 * Class SystemInfo.
 * @export
 * @interface SystemInfo
 */
export interface SystemInfo {

  'SystemUpdateLevel'?: PackageVersionClass

  /**
   * Gets or sets the display name of the operating system.
   * @type {string}
   * @memberof SystemInfo
   * @deprecated
   */
  'OperatingSystemDisplayName'?: string | null;

  /**
   * Gets or sets the package name.
   * @type {string}
   * @memberof SystemInfo
   */
  'PackageName'?: string | null;

  /**
   * Gets or sets a value indicating whether this instance has pending restart.
   * @type {boolean}
   * @memberof SystemInfo
   */
  'HasPendingRestart'?: boolean;

  /**
   *
   * @type {boolean}
   * @memberof SystemInfo
   */
  'IsShuttingDown'?: boolean;

  'HasImageEnhancers'?: boolean | null;

  /**
   * Gets or sets the operating system.
   * @type {string}
   * @memberof SystemInfo
   * @deprecated
   */
  'OperatingSystem'?: string | null;

  /**
   * Gets or sets a value indicating whether [supports library monitor].
   * @type {boolean}
   * @memberof SystemInfo
   */
  'SupportsLibraryMonitor'?: boolean;

  'SupportsLocalPortConfiguration'?: boolean;

  'SupportsWakeServer'?: boolean

  /**
   * Gets or sets the web socket port number.
   * @type {number}
   * @memberof SystemInfo
   */
  'WebSocketPortNumber'?: number;

  /**
   * Gets or sets the completed installations.
   * @type {Array<InstallationInfo>}
   * @memberof SystemInfo
   */
  'CompletedInstallations'?: Array<InstallationInfo> | null;

  /**
   * Gets or sets a value indicating whether this instance can self restart.
   * @type {boolean}
   * @memberof SystemInfo
   * @deprecated
   */
  'CanSelfRestart'?: boolean;

  'CanSelfUpdate'?: boolean;

  /**
   *
   * @type {boolean}
   * @memberof SystemInfo
   * @deprecated
   */
  'CanLaunchWebBrowser'?: boolean;

  /**
   * Gets or sets the program data path.
   * @type {string}
   * @memberof SystemInfo
   */
  'ProgramDataPath'?: string | null;

  /**
   * Gets or sets the items by name path.
   * @type {string}
   * @memberof SystemInfo
   */
  'ItemsByNamePath'?: string | null;

  /**
   * Gets or sets the cache path.
   * @type {string}
   * @memberof SystemInfo
   */
  'CachePath'?: string | null;

  /**
   * Gets or sets the log path.
   * @type {string}
   * @memberof SystemInfo
   */
  'LogPath'?: string | null;
  /**
   * Gets or sets the internal metadata path.
   * @type {string}
   * @memberof SystemInfo
   */
  'InternalMetadataPath'?: string | null;
  /**
   * Gets or sets the transcode path.
   * @type {string}
   * @memberof SystemInfo
   */
  'TranscodingTempPath'?: string | null;

  'HttpServerPortNumber'?: number

  'SupportsHttps'?: boolean

  'HttpsPortNumber'?: number

  /**
   * Gets or sets a value indicating whether this instance has update available.
   * @type {boolean}
   * @memberof SystemInfo
   * @deprecated
   */
  'HasUpdateAvailable'?: boolean;

  'SupportsAutoRunAtStartup'?: boolean

  'HardwareAccelerationRequiresPremiere'?: boolean

  'WakeOnLanInfo'?: Array<WakeOnLanInfo> | null

  /**
   * Gets or sets the local address.
   * @type {string}
   * @memberof SystemInfo
   */
  'LocalAddress'?: string | null;

  'LocalAddresses'?: Array<string> | null

  'WanAddress'?: string | null

  'RemoteAddresses'?: Array<string> | null

  /**
   * Gets or sets the name of the server.
   * @type {string}
   * @memberof SystemInfo
   */
  'ServerName'?: string | null;

  /**
   * Gets or sets the server version.
   * @type {string}
   * @memberof SystemInfo
   */
  'Version'?: string | null;

  /**
   * Gets or sets the id.
   * @type {string}
   * @memberof SystemInfo
   */
  'Id'?: string | null;

}