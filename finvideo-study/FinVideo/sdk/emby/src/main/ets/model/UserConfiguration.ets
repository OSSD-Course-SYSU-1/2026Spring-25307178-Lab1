import { SegmentSkipMode } from "./SegmentSkipMode";
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
  'ProfilePin'?: string | null
  /**
   *
   * @type {boolean}
   * @memberof UserConfiguration
   */
  'DisplayMissingEpisodes'?: boolean;
  /**
   *
   * @type {SubtitlePlaybackMode}
   * @memberof UserConfiguration
   */
  'SubtitleMode'?: SubtitlePlaybackMode;
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
  'HidePlayedInMoreLikeThis'?: boolean
  'HidePlayedInSuggestions'?: boolean
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
  'ResumeRewindSeconds'?: number
  'IntroSkipMode'?: SegmentSkipMode
  /**
   *
   * @type {boolean}
   * @memberof UserConfiguration
   */
  'EnableLocalPassword'?: boolean;
}
