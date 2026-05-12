import { MediaSourceInfo } from "./MediaSourceInfo";
import { PlayMethod } from "./PlayMethod";
import { SleepTimerMode } from "./SleepTimerMode";

/**
 *
 * @export
 * @interface PlayerStateInfo
 */
export interface PlayerStateInfo {
  /**
   * Gets or sets the now playing position ticks.
   * @type {number}
   * @memberof PlayerStateInfo
   */
  'PositionTicks'?: number | null;
  /**
   * Gets or sets a value indicating whether this instance can seek.
   * @type {boolean}
   * @memberof PlayerStateInfo
   */
  'CanSeek'?: boolean;
  /**
   * Gets or sets a value indicating whether this instance is paused.
   * @type {boolean}
   * @memberof PlayerStateInfo
   */
  'IsPaused'?: boolean;
  /**
   * Gets or sets a value indicating whether this instance is muted.
   * @type {boolean}
   * @memberof PlayerStateInfo
   */
  'IsMuted'?: boolean;
  /**
   * Gets or sets the volume level.
   * @type {number}
   * @memberof PlayerStateInfo
   */
  'VolumeLevel'?: number | null;
  /**
   * Gets or sets the index of the now playing audio stream.
   * @type {number}
   * @memberof PlayerStateInfo
   */
  'AudioStreamIndex'?: number | null;
  /**
   * Gets or sets the index of the now playing subtitle stream.
   * @type {number}
   * @memberof PlayerStateInfo
   */
  'SubtitleStreamIndex'?: number | null;
  /**
   * Gets or sets the now playing media version identifier.
   * @type {string}
   * @memberof PlayerStateInfo
   */
  'MediaSourceId'?: string | null;
  'MediaSource'?: Array<MediaSourceInfo> | null;
  /**
   *
   * @type {PlayMethod}
   * @memberof PlayerStateInfo
   */
  'PlayMethod'?: PlayMethod;
  /**
   *
   * @type {RepeatMode}
   * @memberof PlayerStateInfo
   */
  'RepeatMode'?: RepeatMode;
  'SleepTimerMode'?: SleepTimerMode;
  'SleepTimerEndTime'?: string | null
  'SubtitleOffset'?: number;
  'Shuffle'?: boolean;
  'PlaybackRate'?: number;
}