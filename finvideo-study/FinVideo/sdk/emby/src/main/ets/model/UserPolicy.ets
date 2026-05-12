import { UnratedItem } from "./UnratedItem";
import { AccessSchedule } from "./AccessSchedule";

/**
 *
 * @export
 * @interface UserPolicy
 */
export interface UserPolicy {
  /**
   * Gets or sets a value indicating whether this instance is administrator.
   * @type {boolean}
   * @memberof UserPolicy
   */
  'IsAdministrator'?: boolean;
  /**
   * Gets or sets a value indicating whether this instance is hidden.
   * @type {boolean}
   * @memberof UserPolicy
   */
  'IsHidden'?: boolean;
  'IsHiddenRemotely'?: boolean;
  'IsHiddenFromUnusedDevices'?: boolean;
  /**
   * Gets or sets a value indicating whether this instance is disabled.
   * @type {boolean}
   * @memberof UserPolicy
   */
  'IsDisabled'?: boolean;
  'LockedOutDate'?: number;
  /**
   * Gets or sets the max parental rating.
   * @type {number}
   * @memberof UserPolicy
   */
  'MaxParentalRating'?: number | null;
  'AllowTagOrRating'?: boolean;
  /**
   *
   * @type {Array<string>}
   * @memberof UserPolicy
   */
  'BlockedTags'?: Array<string> | null;
  'IsTagBlockingModeInclusive'?: boolean;
  'IncludeTags'?: Array<string>;
  /**
   *
   * @type {boolean}
   * @memberof UserPolicy
   */
  'EnableUserPreferenceAccess'?: boolean;
  /**
   *
   * @type {Array<AccessSchedule>}
   * @memberof UserPolicy
   */
  'AccessSchedules'?: Array<AccessSchedule> | null;
  /**
   *
   * @type {Array<UnratedItem>}
   * @memberof UserPolicy
   */
  'BlockUnratedItems'?: Array<UnratedItem> | null;
  /**
   *
   * @type {boolean}
   * @memberof UserPolicy
   */
  'EnableRemoteControlOfOtherUsers'?: boolean;
  /**
   *
   * @type {boolean}
   * @memberof UserPolicy
   */
  'EnableSharedDeviceControl'?: boolean;
  /**
   *
   * @type {boolean}
   * @memberof UserPolicy
   */
  'EnableRemoteAccess'?: boolean;
  /**
   *
   * @type {boolean}
   * @memberof UserPolicy
   */
  'EnableLiveTvManagement'?: boolean;
  /**
   *
   * @type {boolean}
   * @memberof UserPolicy
   */
  'EnableLiveTvAccess'?: boolean;
  /**
   *
   * @type {boolean}
   * @memberof UserPolicy
   */
  'EnableMediaPlayback'?: boolean;
  /**
   *
   * @type {boolean}
   * @memberof UserPolicy
   */
  'EnableAudioPlaybackTranscoding'?: boolean;
  /**
   *
   * @type {boolean}
   * @memberof UserPolicy
   */
  'EnableVideoPlaybackTranscoding'?: boolean;
  /**
   *
   * @type {boolean}
   * @memberof UserPolicy
   */
  'EnablePlaybackRemuxing'?: boolean;
  /**
   *
   * @type {boolean}
   * @memberof UserPolicy
   */
  'EnableContentDeletion'?: boolean;
  'RestrictedFeatures'?: Array<string> | null
  /**
   *
   * @type {Array<string>}
   * @memberof UserPolicy
   */
  'EnableContentDeletionFromFolders'?: Array<string> | null;
  /**
   *
   * @type {boolean}
   * @memberof UserPolicy
   */
  'EnableContentDownloading'?: boolean;
  'EnableSubtitleDownloading'?: boolean;
  /**
   * Gets or sets a value indicating whether this instance can manage subtitles.
   * @type {boolean}
   * @memberof UserPolicy
   */
  'EnableSubtitleManagement'?: boolean;
  /**
   * Gets or sets a value indicating whether [enable synchronize].
   * @type {boolean}
   * @memberof UserPolicy
   */
  'EnableSyncTranscoding'?: boolean;
  /**
   *
   * @type {boolean}
   * @memberof UserPolicy
   */
  'EnableMediaConversion'?: boolean;
  /**
   *
   * @type {Array<string>}
   * @memberof UserPolicy
   */
  'EnabledChannels'?: Array<string> | null;
  /**
   *
   * @type {boolean}
   * @memberof UserPolicy
   */
  'EnableAllChannels'?: boolean;
  /**
   *
   * @type {Array<string>}
   * @memberof UserPolicy
   */
  'EnabledFolders'?: Array<string> | null;
  /**
   *
   * @type {boolean}
   * @memberof UserPolicy
   */
  'EnableAllFolders'?: boolean;
  /**
   *
   * @type {number}
   * @memberof UserPolicy
   */
  'InvalidLoginAttemptCount'?: number;
  /**
   *
   * @type {boolean}
   * @memberof UserPolicy
   */
  'EnablePublicSharing'?: boolean;
  /**
   *
   * @type {number}
   * @memberof UserPolicy
   */
  'RemoteClientBitrateLimit'?: number;
  /**
   *
   * @type {string}
   * @memberof UserPolicy
   */
  'AuthenticationProviderId': string;
  'ExcludedSubFolders'?: Array<string> | null;
  'SimultaneousStreamLimit'?: number;
  /**
   *
   * @type {Array<string>}
   * @memberof UserPolicy
   */
  'EnabledDevices'?: Array<string> | null;
  /**
   *
   * @type {boolean}
   * @memberof UserPolicy
   */
  'EnableAllDevices'?: boolean;
  'AllowCameraUpload'?: boolean;
  'AllowSharingPersonalItems'?: boolean;
}