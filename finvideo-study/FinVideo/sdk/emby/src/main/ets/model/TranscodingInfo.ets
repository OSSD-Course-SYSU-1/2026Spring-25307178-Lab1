import { TranscodeReason } from "./TranscodeReason";
import { VpStepInfo } from "./VpStepInfo";

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
  'SubProtocol'?: string | null;
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
  'AudioBitrate'?: number;
  'VideoBitrate'?: number;
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
  'TranscodingPositionTicks'?: number;
  'TranscodingStartPositionTicks'?: number;
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
   * @type {Array<TranscodeReason>}
   * @memberof TranscodingInfo
   */
  'TranscodeReasons'?: Array<TranscodeReason>;
  'CurrentCpuUsage'?: number;
  'AverageCpuUsage'?: number;
  // 'CpuHistory'?:
  'CurrentThrottle'?: number;
  'VideoDecoder'?: string;
  'VideoDecoderIsHardware'?: boolean;
  'VideoDecoderMediaType'?: string;
  'VideoDecoderHwAccel'?: string;
  'VideoEncoder'?: string;
  'VideoEncoderIsHardware'?: boolean;
  'VideoEncoderMediaType'?: string;
  'VideoEncoderHwAccel'?: string;
  'VideoPipelineInfo'?: Array<VpStepInfo> | null;
  'SubtitlePipelineInfos'?: Array<string> | null;
}