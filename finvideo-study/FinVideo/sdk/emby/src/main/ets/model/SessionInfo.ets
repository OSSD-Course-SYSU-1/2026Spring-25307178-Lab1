import { MediaType } from "./MediaType";
import { BaseItemDto } from "./BaseItemDto";
import { GeneralCommandType } from "./GeneralCommandType";
import { PlayerStateInfo } from "./PlayerStateInfo";
import { SessionUserInfo } from "./SessionUserInfo";
import { TranscodingInfo } from "./TranscodingInfo";

/**
 * Class SessionInfo.
 * @export
 * @interface SessionInfo
 */
export interface SessionInfo {
  /**
   *
   * @type {PlayerStateInfo}
   * @memberof SessionInfo
   */
  'PlayState'?: Array<PlayerStateInfo> | null;
  /**
   *
   * @type {Array<SessionUserInfo>}
   * @memberof SessionInfo
   */
  'AdditionalUsers'?: Array<SessionUserInfo> | null;
  /**
   * Gets or sets the remote end point.
   * @type {string}
   * @memberof SessionInfo
   */
  'RemoteEndPoint'?: string | null;
  'Protocol'?: string | null;
  /**
   * Gets the playable media types.
   * @type {Array<MediaType>}
   * @memberof SessionInfo
   */
  'PlayableMediaTypes'?: Array<MediaType> | null;
  /**
   *
   * @type {string}
   * @memberof SessionInfo
   */
  'PlaylistItemId'?: string | null;
  'PlaylistIndex'?: number;
  'PlaylistLength'?: number;
  /**
   * Gets or sets the id.
   * @type {string}
   * @memberof SessionInfo
   */
  'Id'?: string | null;
  /**
   *
   * @type {string}
   * @memberof SessionInfo
   */
  'ServerId'?: string | null;
  /**
   * Gets or sets the user id.
   * @type {string}
   * @memberof SessionInfo
   */
  'UserId'?: string;
  /**
   * Gets or sets the username.
   * @type {string}
   * @memberof SessionInfo
   */
  'UserName'?: string | null;
  /**
   *
   * @type {string}
   * @memberof SessionInfo
   */
  'UserPrimaryImageTag'?: string | null;
  /**
   * Gets or sets the type of the client.
   * @type {string}
   * @memberof SessionInfo
   */
  'Client'?: string | null;
  /**
   * Gets or sets the last activity date.
   * @type {string}
   * @memberof SessionInfo
   */
  'LastActivityDate'?: string;
  /**
   * Gets or sets the name of the device.
   * @type {string}
   * @memberof SessionInfo
   */
  'DeviceName'?: string | null;
  /**
   * Gets or sets the type of the device.
   * @type {string}
   * @memberof SessionInfo
   */
  'DeviceType'?: string | null;
  /**
   *
   * @type {BaseItemDto}
   * @memberof SessionInfo
   */
  'NowPlayingItem'?: Array<BaseItemDto> | null;
  'InternalDeviceId'?: number;
  /**
   * Gets or sets the device id.
   * @type {string}
   * @memberof SessionInfo
   */
  'DeviceId'?: string | null;
  /**
   * Gets or sets the application version.
   * @type {string}
   * @memberof SessionInfo
   */
  'ApplicationVersion'?: string | null;
  'AppIconUrl'?: string | null;
  /**
   * Gets the supported commands.
   * @type {Array<GeneralCommandType>}
   * @memberof SessionInfo
   */
  'SupportedCommands'?: Array<GeneralCommandType> | null;
  /**
   *
   * @type {TranscodingInfo}
   * @memberof SessionInfo
   */
  'TranscodingInfo'?: TranscodingInfo;
  /**
   *
   * @type {boolean}
   * @memberof SessionInfo
   */
  'SupportsRemoteControl'?: boolean;

}