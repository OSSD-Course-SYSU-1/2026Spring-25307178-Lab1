import { MediaSourceInfo } from "./MediaSourceInfo";
import { PlaybackErrorCode } from "./PlaybackErrorCode";

/**
 * Class PlaybackInfoResponse.
 * @export
 * @interface PlaybackInfoResponse
 */
export interface PlaybackInfoResponse {
  /**
   * Gets or sets the media sources.
   * @type {Array<MediaSourceInfo>}
   * @memberof PlaybackInfoResponse
   */
  'MediaSources'?: Array<MediaSourceInfo>;
  /**
   * Gets or sets the play session identifier.
   * @type {string}
   * @memberof PlaybackInfoResponse
   */
  'PlaySessionId'?: string | null;
  /**
   *
   * @type {PlaybackErrorCode}
   * @memberof PlaybackInfoResponse
   */
  'ErrorCode'?: PlaybackErrorCode;
}
