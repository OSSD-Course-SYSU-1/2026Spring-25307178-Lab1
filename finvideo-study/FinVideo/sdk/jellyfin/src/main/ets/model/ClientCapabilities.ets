import { MediaType } from "./MediaType";
import { DeviceProfile } from "./DeviceProfile";
import { GeneralCommandType } from "./GeneralCommandType";

/**
 *
 * @export
 * @interface ClientCapabilities
 */
export interface ClientCapabilities {
  /**
   *
   * @type {Array<MediaType>}
   * @memberof ClientCapabilities
   */
  'PlayableMediaTypes'?: Array<MediaType> | null;
  /**
   *
   * @type {Array<GeneralCommandType>}
   * @memberof ClientCapabilities
   */
  'SupportedCommands'?: Array<GeneralCommandType> | null;
  /**
   *
   * @type {boolean}
   * @memberof ClientCapabilities
   */
  'SupportsMediaControl'?: boolean;
  /**
   *
   * @type {boolean}
   * @memberof ClientCapabilities
   */
  'SupportsPersistentIdentifier'?: boolean;
  /**
   *
   * @type {DeviceProfile}
   * @memberof ClientCapabilities
   */
  'DeviceProfile'?: DeviceProfile;
  /**
   *
   * @type {string}
   * @memberof ClientCapabilities
   */
  'AppStoreUrl'?: string | null;
  /**
   *
   * @type {string}
   * @memberof ClientCapabilities
   */
  'IconUrl'?: string | null;
  /**
   *
   * @type {boolean}
   * @memberof ClientCapabilities
   * @deprecated
   */
  'SupportsContentUploading'?: boolean | null;
  /**
   *
   * @type {boolean}
   * @memberof ClientCapabilities
   * @deprecated
   */
  'SupportsSync'?: boolean | null;
}