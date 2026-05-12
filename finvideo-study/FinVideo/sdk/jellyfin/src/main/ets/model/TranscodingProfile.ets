import { DlnaProfileType } from "./DlnaProfileType";
import { EncodingContext } from "./EncodingContext";
import { MediaStreamProtocol } from "./MediaStreamProtocol";
import { ProfileCondition } from "./ProfileCondition";
import { TranscodeSeekInfo } from "./TranscodeSeekInfo";

/**
 *
 * @export
 * @interface TranscodingProfile
 */
export interface TranscodingProfile {
  /**
   *
   * @type {string}
   * @memberof TranscodingProfile
   */
  'Container'?: string;
  /**
   *
   * @type {DlnaProfileType}
   * @memberof TranscodingProfile
   */
  'Type'?: DlnaProfileType;
  /**
   *
   * @type {string}
   * @memberof TranscodingProfile
   */
  'VideoCodec'?: string;
  /**
   *
   * @type {string}
   * @memberof TranscodingProfile
   */
  'AudioCodec'?: string;
  /**
   *
   * @type {MediaStreamProtocol}
   * @memberof TranscodingProfile
   */
  'Protocol'?: MediaStreamProtocol;
  /**
   *
   * @type {boolean}
   * @memberof TranscodingProfile
   */
  'EstimateContentLength'?: boolean;
  /**
   *
   * @type {boolean}
   * @memberof TranscodingProfile
   */
  'EnableMpegtsM2TsMode'?: boolean;
  /**
   *
   * @type {TranscodeSeekInfo}
   * @memberof TranscodingProfile
   */
  'TranscodeSeekInfo'?: TranscodeSeekInfo;
  /**
   *
   * @type {boolean}
   * @memberof TranscodingProfile
   */
  'CopyTimestamps'?: boolean;
  /**
   *
   * @type {EncodingContext}
   * @memberof TranscodingProfile
   */
  'Context'?: EncodingContext;
  /**
   *
   * @type {boolean}
   * @memberof TranscodingProfile
   */
  'EnableSubtitlesInManifest'?: boolean;
  /**
   *
   * @type {string}
   * @memberof TranscodingProfile
   */
  'MaxAudioChannels'?: string | null;
  /**
   *
   * @type {number}
   * @memberof TranscodingProfile
   */
  'MinSegments'?: number;
  /**
   *
   * @type {number}
   * @memberof TranscodingProfile
   */
  'SegmentLength'?: number;
  /**
   *
   * @type {boolean}
   * @memberof TranscodingProfile
   */
  'BreakOnNonKeyFrames'?: boolean;
  /**
   *
   * @type {Array<ProfileCondition>}
   * @memberof TranscodingProfile
   */
  'Conditions'?: Array<ProfileCondition>;
}