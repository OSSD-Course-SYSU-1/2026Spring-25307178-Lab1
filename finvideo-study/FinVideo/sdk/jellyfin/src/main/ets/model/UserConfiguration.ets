import { SubtitlePlaybackMode } from "./SubtitlePlaybackMode";

/**
 * Class UserConfiguration.
 * @export
 * @interface UserConfiguration
 */
export interface UserConfiguration {
  /**
   * Gets or sets the audio language preference.
   * @type {string}
   * @memberof UserConfiguration
   */
  'AudioLanguagePreference'?: string | null;
  /**
   * Gets or sets a value indicating whether [play default audio track].
   * @type {boolean}
   * @memberof UserConfiguration
   */
  'PlayDefaultAudioTrack'?: boolean;
  /**
   * Gets or sets the subtitle language preference.
   * @type {string}
   * @memberof UserConfiguration
   */
  'SubtitleLanguagePreference'?: string | null;
  /**
   *
   * @type {boolean}
   * @memberof UserConfiguration
   */
  'DisplayMissingEpisodes'?: boolean;
  /**
   *
   * @type {Array<string>}
   * @memberof UserConfiguration
   */
  'GroupedFolders'?: Array<string>;
  /**
   *
   * @type {SubtitlePlaybackMode}
   * @memberof UserConfiguration
   */
  'SubtitleMode'?: SubtitlePlaybackMode;
  /**
   *
   * @type {boolean}
   * @memberof UserConfiguration
   */
  'DisplayCollectionsView'?: boolean;
  /**
   *
   * @type {boolean}
   * @memberof UserConfiguration
   */
  'EnableLocalPassword'?: boolean;
  /**
   *
   * @type {Array<string>}
   * @memberof UserConfiguration
   */
  'OrderedViews'?: Array<string>;
  /**
   *
   * @type {Array<string>}
   * @memberof UserConfiguration
   */
  'LatestItemsExcludes'?: Array<string>;
  /**
   *
   * @type {Array<string>}
   * @memberof UserConfiguration
   */
  'MyMediaExcludes'?: Array<string>;
  /**
   *
   * @type {boolean}
   * @memberof UserConfiguration
   */
  'HidePlayedInLatest'?: boolean;
  /**
   *
   * @type {boolean}
   * @memberof UserConfiguration
   */
  'RememberAudioSelections'?: boolean;
  /**
   *
   * @type {boolean}
   * @memberof UserConfiguration
   */
  'RememberSubtitleSelections'?: boolean;
  /**
   *
   * @type {boolean}
   * @memberof UserConfiguration
   */
  'EnableNextEpisodeAutoPlay'?: boolean;
  /**
   * Gets or sets the id of the selected cast receiver.
   * @type {string}
   * @memberof UserConfiguration
   */
  'CastReceiverId'?: string | null;
}
