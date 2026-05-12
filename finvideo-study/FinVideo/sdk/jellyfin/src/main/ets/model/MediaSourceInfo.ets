import { IsoType } from "./IsoType";
import { VideoType } from "./VideoType";
import { MediaStream } from "./MediaStream";
import { Video3DFormat } from "./Video3DFormat";
import { MediaProtocol } from "./MediaProtocol";
import { MediaAttachment } from "./MediaAttachment";
import { MediaSourceType } from "./MediaSourceType";
import { MediaStreamProtocol } from "./MediaStreamProtocol";
import { TransportStreamTimestamp } from "./TransportStreamTimestamp";

/**
 *
 * @export
 * @interface MediaSourceInfo
 */
export interface MediaSourceInfo {
  /**
   *
   * @type {MediaProtocol}
   * @memberof MediaSourceInfo
   */
  'Protocol'?: MediaProtocol;
  /**
   *
   * @type {string}
   * @memberof MediaSourceInfo
   */
  'Id'?: string | null;
  /**
   *
   * @type {string}
   * @memberof MediaSourceInfo
   */
  'Path'?: string | null;
  /**
   *
   * @type {string}
   * @memberof MediaSourceInfo
   */
  'EncoderPath'?: string | null;
  /**
   *
   * @type {MediaProtocol}
   * @memberof MediaSourceInfo
   */
  'EncoderProtocol'?: MediaProtocol;
  /**
   *
   * @type {MediaSourceType}
   * @memberof MediaSourceInfo
   */
  'Type'?: MediaSourceType;
  /**
   *
   * @type {string}
   * @memberof MediaSourceInfo
   */
  'Container'?: string | null;
  /**
   *
   * @type {number}
   * @memberof MediaSourceInfo
   */
  'Size'?: number | null;
  /**
   *
   * @type {string}
   * @memberof MediaSourceInfo
   */
  'Name'?: string | null;
  /**
   * Gets or sets a value indicating whether the media is remote.  Differentiate internet url vs local network.
   * @type {boolean}
   * @memberof MediaSourceInfo
   */
  'IsRemote'?: boolean;
  /**
   *
   * @type {string}
   * @memberof MediaSourceInfo
   */
  'ETag'?: string | null;
  /**
   *
   * @type {number}
   * @memberof MediaSourceInfo
   */
  'RunTimeTicks'?: number | null;
  /**
   *
   * @type {boolean}
   * @memberof MediaSourceInfo
   */
  'ReadAtNativeFramerate'?: boolean;
  /**
   *
   * @type {boolean}
   * @memberof MediaSourceInfo
   */
  'IgnoreDts'?: boolean;
  /**
   *
   * @type {boolean}
   * @memberof MediaSourceInfo
   */
  'IgnoreIndex'?: boolean;
  /**
   *
   * @type {boolean}
   * @memberof MediaSourceInfo
   */
  'GenPtsInput'?: boolean;
  /**
   *
   * @type {boolean}
   * @memberof MediaSourceInfo
   */
  'SupportsTranscoding'?: boolean;
  /**
   *
   * @type {boolean}
   * @memberof MediaSourceInfo
   */
  'SupportsDirectStream'?: boolean;
  /**
   *
   * @type {boolean}
   * @memberof MediaSourceInfo
   */
  'SupportsDirectPlay'?: boolean;
  /**
   *
   * @type {boolean}
   * @memberof MediaSourceInfo
   */
  'IsInfiniteStream'?: boolean;
  /**
   *
   * @type {boolean}
   * @memberof MediaSourceInfo
   */
  'RequiresOpening'?: boolean;
  /**
   *
   * @type {string}
   * @memberof MediaSourceInfo
   */
  'OpenToken'?: string | null;
  /**
   *
   * @type {boolean}
   * @memberof MediaSourceInfo
   */
  'RequiresClosing'?: boolean;
  /**
   *
   * @type {string}
   * @memberof MediaSourceInfo
   */
  'LiveStreamId'?: string | null;
  /**
   *
   * @type {number}
   * @memberof MediaSourceInfo
   */
  'BufferMs'?: number | null;
  /**
   *
   * @type {boolean}
   * @memberof MediaSourceInfo
   */
  'RequiresLooping'?: boolean;
  /**
   *
   * @type {boolean}
   * @memberof MediaSourceInfo
   */
  'SupportsProbing'?: boolean;
  /**
   *
   * @type {VideoType}
   * @memberof MediaSourceInfo
   */
  'VideoType'?: VideoType;
  /**
   *
   * @type {IsoType}
   * @memberof MediaSourceInfo
   */
  'IsoType'?: IsoType;
  /**
   *
   * @type {Video3DFormat}
   * @memberof MediaSourceInfo
   */
  'Video3DFormat'?: Video3DFormat;
  /**
   *
   * @type {Array<MediaStream>}
   * @memberof MediaSourceInfo
   */
  'MediaStreams'?: Array<MediaStream> | null;
  /**
   *
   * @type {Array<MediaAttachment>}
   * @memberof MediaSourceInfo
   */
  'MediaAttachments'?: Array<MediaAttachment> | null;
  /**
   *
   * @type {Array<string>}
   * @memberof MediaSourceInfo
   */
  'Formats'?: Array<string> | null;
  /**
   *
   * @type {number}
   * @memberof MediaSourceInfo
   */
  'Bitrate'?: number | null;
  /**
   *
   * @type {TransportStreamTimestamp}
   * @memberof MediaSourceInfo
   */
  'Timestamp'?: TransportStreamTimestamp;
  /**
   *
   * @type {{ [key: string]: string | null; }}
   * @memberof MediaSourceInfo
   */
  'RequiredHttpHeaders'?: Record<string, string | null> | null;
  /**
   *
   * @type {string}
   * @memberof MediaSourceInfo
   */
  'TranscodingUrl'?: string | null;
  /**
   *
   * @type {MediaStreamProtocol}
   * @memberof MediaSourceInfo
   */
  'TranscodingSubProtocol'?: MediaStreamProtocol;
  /**
   *
   * @type {string}
   * @memberof MediaSourceInfo
   */
  'TranscodingContainer'?: string | null;
  /**
   *
   * @type {number}
   * @memberof MediaSourceInfo
   */
  'AnalyzeDurationMs'?: number | null;
  /**
   *
   * @type {number}
   * @memberof MediaSourceInfo
   */
  'DefaultAudioStreamIndex'?: number | null;
  /**
   *
   * @type {number}
   * @memberof MediaSourceInfo
   */
  'DefaultSubtitleStreamIndex'?: number | null;
}