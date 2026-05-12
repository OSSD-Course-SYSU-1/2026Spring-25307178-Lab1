import { HardwareEncodingType } from "./HardwareEncodingType";
import { TranscodingInfoTranscodeReasonsEnum } from "./TranscodingInfoTranscodeReasonsEnum";

/**
 *
 * @export
 * @interface TranscodingInfo
 */
export interface TranscodingInfo {
  /**
   *
   * @type {string}
   * @memberof TranscodingInfo
   */
  'AudioCodec'?: string | null;
  /**
   *
   * @type {string}
   * @memberof TranscodingInfo
   */
  'VideoCodec'?: string | null;
  /**
   *
   * @type {string}
   * @memberof TranscodingInfo
   */
  'Container'?: string | null;
  /**
   *
   * @type {boolean}
   * @memberof TranscodingInfo
   */
  'IsVideoDirect'?: boolean;
  /**
   *
   * @type {boolean}
   * @memberof TranscodingInfo
   */
  'IsAudioDirect'?: boolean;
  /**
   *
   * @type {number}
   * @memberof TranscodingInfo
   */
  'Bitrate'?: number | null;
  /**
   *
   * @type {number}
   * @memberof TranscodingInfo
   */
  'Framerate'?: number | null;
  /**
   *
   * @type {number}
   * @memberof TranscodingInfo
   */
  'CompletionPercentage'?: number | null;
  /**
   *
   * @type {number}
   * @memberof TranscodingInfo
   */
  'Width'?: number | null;
  /**
   *
   * @type {number}
   * @memberof TranscodingInfo
   */
  'Height'?: number | null;
  /**
   *
   * @type {number}
   * @memberof TranscodingInfo
   */
  'AudioChannels'?: number | null;
  /**
   *
   * @type {HardwareEncodingType}
   * @memberof TranscodingInfo
   */
  'HardwareAccelerationType'?: HardwareEncodingType;
  /**
   *
   * @type {Array<TranscodeReason>}
   * @memberof TranscodingInfo
   */
  'TranscodeReasons'?: TranscodingInfoTranscodeReasonsEnum;
}