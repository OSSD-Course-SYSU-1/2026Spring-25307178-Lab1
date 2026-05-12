import { QueueItem } from "./QueueItem";
import { PlayMethod } from "./PlayMethod";
import { BaseItemDto } from "./BaseItemDto";
import { PlaybackOrder } from "./PlaybackOrder";

/**
 * Class PlaybackStartInfo.
 * @export
 * @interface PlaybackStartInfo
 */
export interface PlaybackStartInfo {
  /**
   * Gets or sets a value indicating whether this instance can seek.
   * @type {boolean}
   * @memberof PlaybackStartInfo
   */
  'CanSeek'?: boolean;
  /**
   *
   * @type {BaseItemDto}
   * @memberof PlaybackStartInfo
   */
  'Item'?: BaseItemDto;
  /**
   * Gets or sets the item identifier.
   * @type {string}
   * @memberof PlaybackStartInfo
   */
  'ItemId'?: string;
  /**
   * Gets or sets the session id.
   * @type {string}
   * @memberof PlaybackStartInfo
   */
  'SessionId'?: string | null;
  /**
   * Gets or sets the media version identifier.
   * @type {string}
   * @memberof PlaybackStartInfo
   */
  'MediaSourceId'?: string | null;
  /**
   * Gets or sets the index of the audio stream.
   * @type {number}
   * @memberof PlaybackStartInfo
   */
  'AudioStreamIndex'?: number | null;
  /**
   * Gets or sets the index of the subtitle stream.
   * @type {number}
   * @memberof PlaybackStartInfo
   */
  'SubtitleStreamIndex'?: number | null;
  /**
   * Gets or sets a value indicating whether this instance is paused.
   * @type {boolean}
   * @memberof PlaybackStartInfo
   */
  'IsPaused'?: boolean;
  /**
   * Gets or sets a value indicating whether this instance is muted.
   * @type {boolean}
   * @memberof PlaybackStartInfo
   */
  'IsMuted'?: boolean;
  /**
   * Gets or sets the position ticks.
   * @type {number}
   * @memberof PlaybackStartInfo
   */
  'PositionTicks'?: number | null;
  /**
   *
   * @type {number}
   * @memberof PlaybackStartInfo
   */
  'PlaybackStartTimeTicks'?: number | null;
  /**
   * Gets or sets the volume level.
   * @type {number}
   * @memberof PlaybackStartInfo
   */
  'VolumeLevel'?: number | null;
  /**
   *
   * @type {number}
   * @memberof PlaybackStartInfo
   */
  'Brightness'?: number | null;
  /**
   *
   * @type {string}
   * @memberof PlaybackStartInfo
   */
  'AspectRatio'?: string | null;
  /**
   *
   * @type {PlayMethod}
   * @memberof PlaybackStartInfo
   */
  'PlayMethod'?: PlayMethod;
  /**
   * Gets or sets the live stream identifier.
   * @type {string}
   * @memberof PlaybackStartInfo
   */
  'LiveStreamId'?: string | null;
  /**
   * Gets or sets the play session identifier.
   * @type {string}
   * @memberof PlaybackStartInfo
   */
  'PlaySessionId'?: string | null;
  /**
   *
   * @type {RepeatMode}
   * @memberof PlaybackStartInfo
   */
  'RepeatMode'?: RepeatMode;
  /**
   *
   * @type {PlaybackOrder}
   * @memberof PlaybackStartInfo
   */
  'PlaybackOrder'?: PlaybackOrder;
  /**
   *
   * @type {Array<QueueItem>}
   * @memberof PlaybackStartInfo
   */
  'NowPlayingQueue'?: Array<QueueItem> | null;
  /**
   *
   * @type {string}
   * @memberof PlaybackStartInfo
   */
  'PlaylistItemId'?: string | null;
}