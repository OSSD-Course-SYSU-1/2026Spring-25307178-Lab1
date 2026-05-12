import { MediaType } from "./MediaType";
import { DeviceProfile } from "./DeviceProfile";
import { GeneralCommandType } from "./GeneralCommandType";

/**
 * Client capabilities dto.
 * @export
 * @interface ClientCapabilitiesDto
 */
export interface ClientCapabilitiesDto {
  /**
   * Gets or sets the list of playable media types.
   * @type {Array<MediaType>}
   * @memberof ClientCapabilitiesDto
   */
  'PlayableMediaTypes'?: Array<MediaType>;
  /**
   * Gets or sets the list of supported commands.
   * @type {Array<GeneralCommandType>}
   * @memberof ClientCapabilitiesDto
   */
  'SupportedCommands'?: Array<GeneralCommandType>;
  /**
   * Gets or sets a value indicating whether session supports media control.
   * @type {boolean}
   * @memberof ClientCapabilitiesDto
   */
  'SupportsMediaControl'?: boolean;
  /**
   * Gets or sets a value indicating whether session supports a persistent identifier.
   * @type {boolean}
   * @memberof ClientCapabilitiesDto
   */
  'SupportsPersistentIdentifier'?: boolean;
  /**
   *
   * @type {DeviceProfile}
   * @memberof ClientCapabilitiesDto
   */
  'DeviceProfile'?: DeviceProfile;
  /**
   * Gets or sets the app store url.
   * @type {string}
   * @memberof ClientCapabilitiesDto
   */
  'AppStoreUrl'?: string | null;
  /**
   * Gets or sets the icon url.
   * @type {string}
   * @memberof ClientCapabilitiesDto
   */
  'IconUrl'?: string | null;
  /**
   *
   * @type {boolean}
   * @memberof ClientCapabilitiesDto
   * @deprecated
   */
  'SupportsContentUploading'?: boolean | null;
  /**
   *
   * @type {boolean}
   * @memberof ClientCapabilitiesDto
   * @deprecated
   */
  'SupportsSync'?: boolean | null;
}