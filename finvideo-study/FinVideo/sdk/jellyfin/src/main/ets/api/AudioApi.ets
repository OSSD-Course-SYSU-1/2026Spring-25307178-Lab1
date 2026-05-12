import { EncodingContext } from "../model/EncodingContext"
import { SubtitleDeliveryMethod } from "../model/SubtitleDeliveryMethod"
import { Api } from "./Api"

/**
 * Request parameters for getAudioStream operation in AudioApi.
 * @export
 * @interface AudioApiGetAudioStreamRequest
 */
export interface AudioApiGetAudioStreamRequest {
  /**
   * The item id.
   * @type {string}
   * @memberof AudioApiGetAudioStream
   */
  readonly itemId: string

  /**
   * The audio container.
   * @type {string}
   * @memberof AudioApiGetAudioStream
   */
  readonly container?: string

  /**
   * Optional. If true, the original file will be streamed statically without any encoding. Use either no url extension or the original file extension. true/false.
   * @type {boolean}
   * @memberof AudioApiGetAudioStream
   */
  readonly static?: boolean

  /**
   * The streaming parameters.
   * @type {string}
   * @memberof AudioApiGetAudioStream
   */
  readonly params?: string

  /**
   * The tag.
   * @type {string}
   * @memberof AudioApiGetAudioStream
   */
  readonly tag?: string

  /**
   * Optional. The dlna device profile id to utilize.
   * @type {string}
   * @memberof AudioApiGetAudioStream
   */
  readonly deviceProfileId?: string

  /**
   * The play session id.
   * @type {string}
   * @memberof AudioApiGetAudioStream
   */
  readonly playSessionId?: string

  /**
   * The segment container.
   * @type {string}
   * @memberof AudioApiGetAudioStream
   */
  readonly segmentContainer?: string

  /**
   * The segment length.
   * @type {number}
   * @memberof AudioApiGetAudioStream
   */
  readonly segmentLength?: number

  /**
   * The minimum number of segments.
   * @type {number}
   * @memberof AudioApiGetAudioStream
   */
  readonly minSegments?: number

  /**
   * The media version id, if playing an alternate version.
   * @type {string}
   * @memberof AudioApiGetAudioStream
   */
  readonly mediaSourceId?: string

  /**
   * The device id of the client requesting. Used to stop encoding processes when needed.
   * @type {string}
   * @memberof AudioApiGetAudioStream
   */
  readonly deviceId?: string

  /**
   * Optional. Specify a audio codec to encode to, e.g. mp3. If omitted the server will auto-select using the url\&#39;s extension. Options: aac, mp3, vorbis, wma.
   * @type {string}
   * @memberof AudioApiGetAudioStream
   */
  readonly audioCodec?: string

  /**
   * Whether or not to allow automatic stream copy if requested values match the original source. Defaults to true.
   * @type {boolean}
   * @memberof AudioApiGetAudioStream
   */
  readonly enableAutoStreamCopy?: boolean

  /**
   * Whether or not to allow copying of the video stream url.
   * @type {boolean}
   * @memberof AudioApiGetAudioStream
   */
  readonly allowVideoStreamCopy?: boolean

  /**
   * Whether or not to allow copying of the audio stream url.
   * @type {boolean}
   * @memberof AudioApiGetAudioStream
   */
  readonly allowAudioStreamCopy?: boolean

  /**
   * Optional. Whether to break on non key frames.
   * @type {boolean}
   * @memberof AudioApiGetAudioStream
   */
  readonly breakOnNonKeyFrames?: boolean

  /**
   * Optional. Specify a specific audio sample rate, e.g. 44100.
   * @type {number}
   * @memberof AudioApiGetAudioStream
   */
  readonly audioSampleRate?: number

  /**
   * Optional. The maximum audio bit depth.
   * @type {number}
   * @memberof AudioApiGetAudioStream
   */
  readonly maxAudioBitDepth?: number

  /**
   * Optional. Specify an audio bitrate to encode to, e.g. 128000. If omitted this will be left to encoder defaults.
   * @type {number}
   * @memberof AudioApiGetAudioStream
   */
  readonly audioBitRate?: number

  /**
   * Optional. Specify a specific number of audio channels to encode to, e.g. 2.
   * @type {number}
   * @memberof AudioApiGetAudioStream
   */
  readonly audioChannels?: number

  /**
   * Optional. Specify a maximum number of audio channels to encode to, e.g. 2.
   * @type {number}
   * @memberof AudioApiGetAudioStream
   */
  readonly maxAudioChannels?: number

  /**
   * Optional. Specify a specific an encoder profile (varies by encoder), e.g. main, baseline, high.
   * @type {string}
   * @memberof AudioApiGetAudioStream
   */
  readonly profile?: string

  /**
   * Optional. Specify a level for the encoder profile (varies by encoder), e.g. 3, 3.1.
   * @type {string}
   * @memberof AudioApiGetAudioStream
   */
  readonly level?: string

  /**
   * Optional. A specific video framerate to encode to, e.g. 23.976. Generally this should be omitted unless the device has specific requirements.
   * @type {number}
   * @memberof AudioApiGetAudioStream
   */
  readonly framerate?: number

  /**
   * Optional. A specific maximum video framerate to encode to, e.g. 23.976. Generally this should be omitted unless the device has specific requirements.
   * @type {number}
   * @memberof AudioApiGetAudioStream
   */
  readonly maxFramerate?: number

  /**
   * Whether or not to copy timestamps when transcoding with an offset. Defaults to false.
   * @type {boolean}
   * @memberof AudioApiGetAudioStream
   */
  readonly copyTimestamps?: boolean

  /**
   * Optional. Specify a starting offset, in ticks. 1 tick &#x3D; 10000 ms.
   * @type {number}
   * @memberof AudioApiGetAudioStream
   */
  readonly startTimeTicks?: number

  /**
   * Optional. The fixed horizontal resolution of the encoded video.
   * @type {number}
   * @memberof AudioApiGetAudioStream
   */
  readonly width?: number

  /**
   * Optional. The fixed vertical resolution of the encoded video.
   * @type {number}
   * @memberof AudioApiGetAudioStream
   */
  readonly height?: number

  /**
   * Optional. Specify a video bitrate to encode to, e.g. 500000. If omitted this will be left to encoder defaults.
   * @type {number}
   * @memberof AudioApiGetAudioStream
   */
  readonly videoBitRate?: number

  /**
   * Optional. The index of the subtitle stream to use. If omitted no subtitles will be used.
   * @type {number}
   * @memberof AudioApiGetAudioStream
   */
  readonly subtitleStreamIndex?: number

  /**
   * Optional. Specify the subtitle delivery method.
   * @type {SubtitleDeliveryMethod}
   * @memberof AudioApiGetAudioStream
   */
  readonly subtitleMethod?: SubtitleDeliveryMethod

  /**
   * Optional.
   * @type {number}
   * @memberof AudioApiGetAudioStream
   */
  readonly maxRefFrames?: number

  /**
   * Optional. The maximum video bit depth.
   * @type {number}
   * @memberof AudioApiGetAudioStream
   */
  readonly maxVideoBitDepth?: number

  /**
   * Optional. Whether to require avc.
   * @type {boolean}
   * @memberof AudioApiGetAudioStream
   */
  readonly requireAvc?: boolean

  /**
   * Optional. Whether to deinterlace the video.
   * @type {boolean}
   * @memberof AudioApiGetAudioStream
   */
  readonly deInterlace?: boolean

  /**
   * Optional. Whether to require a non anamorphic stream.
   * @type {boolean}
   * @memberof AudioApiGetAudioStream
   */
  readonly requireNonAnamorphic?: boolean

  /**
   * Optional. The maximum number of audio channels to transcode.
   * @type {number}
   * @memberof AudioApiGetAudioStream
   */
  readonly transcodingMaxAudioChannels?: number

  /**
   * Optional. The limit of how many cpu cores to use.
   * @type {number}
   * @memberof AudioApiGetAudioStream
   */
  readonly cpuCoreLimit?: number

  /**
   * The live stream id.
   * @type {string}
   * @memberof AudioApiGetAudioStream
   */
  readonly liveStreamId?: string

  /**
   * Optional. Whether to enable the MpegtsM2Ts mode.
   * @type {boolean}
   * @memberof AudioApiGetAudioStream
   */
  readonly enableMpegtsM2TsMode?: boolean

  /**
   * Optional. Specify a video codec to encode to, e.g. h264. If omitted the server will auto-select using the url\&#39;s extension. Options: h265, h264, mpeg4, theora, vp8, vp9, vpx (deprecated), wmv.
   * @type {string}
   * @memberof AudioApiGetAudioStream
   */
  readonly videoCodec?: string

  /**
   * Optional. Specify a subtitle codec to encode to.
   * @type {string}
   * @memberof AudioApiGetAudioStream
   */
  readonly subtitleCodec?: string

  /**
   * Optional. The transcoding reason.
   * @type {string}
   * @memberof AudioApiGetAudioStream
   */
  readonly transcodeReasons?: string

  /**
   * Optional. The index of the audio stream to use. If omitted the first audio stream will be used.
   * @type {number}
   * @memberof AudioApiGetAudioStream
   */
  readonly audioStreamIndex?: number

  /**
   * Optional. The index of the video stream to use. If omitted the first video stream will be used.
   * @type {number}
   * @memberof AudioApiGetAudioStream
   */
  readonly videoStreamIndex?: number

  /**
   * Optional. The MediaBrowser.Model.Dlna.EncodingContext.
   * @type {EncodingContext}
   * @memberof AudioApiGetAudioStream
   */
  readonly context?: EncodingContext

  /**
   * Optional. The streaming options.
   * @type {{ [key: string]: string; }}
   * @memberof AudioApiGetAudioStream
   */
  readonly streamOptions?: Record<string, string>
}

/**
 * Request parameters for getAudioStreamByContainer operation in AudioApi.
 * @export
 * @interface AudioApiGetAudioStreamByContainerRequest
 */
export interface AudioApiGetAudioStreamByContainerRequest {
  /**
   * The item id.
   * @type {string}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly itemId: string

  /**
   * The audio container.
   * @type {string}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly container: string

  /**
   * Optional. If true, the original file will be streamed statically without any encoding. Use either no url extension or the original file extension. true/false.
   * @type {boolean}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly _static?: boolean

  /**
   * The streaming parameters.
   * @type {string}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly params?: string

  /**
   * The tag.
   * @type {string}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly tag?: string

  /**
   * Optional. The dlna device profile id to utilize.
   * @type {string}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly deviceProfileId?: string

  /**
   * The play session id.
   * @type {string}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly playSessionId?: string

  /**
   * The segment container.
   * @type {string}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly segmentContainer?: string

  /**
   * The segment length.
   * @type {number}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly segmentLength?: number

  /**
   * The minimum number of segments.
   * @type {number}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly minSegments?: number

  /**
   * The media version id, if playing an alternate version.
   * @type {string}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly mediaSourceId?: string

  /**
   * The device id of the client requesting. Used to stop encoding processes when needed.
   * @type {string}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly deviceId?: string

  /**
   * Optional. Specify a audio codec to encode to, e.g. mp3. If omitted the server will auto-select using the url\&#39;s extension. Options: aac, mp3, vorbis, wma.
   * @type {string}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly audioCodec?: string

  /**
   * Whether or not to allow automatic stream copy if requested values match the original source. Defaults to true.
   * @type {boolean}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly enableAutoStreamCopy?: boolean

  /**
   * Whether or not to allow copying of the video stream url.
   * @type {boolean}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly allowVideoStreamCopy?: boolean

  /**
   * Whether or not to allow copying of the audio stream url.
   * @type {boolean}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly allowAudioStreamCopy?: boolean

  /**
   * Optional. Whether to break on non key frames.
   * @type {boolean}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly breakOnNonKeyFrames?: boolean

  /**
   * Optional. Specify a specific audio sample rate, e.g. 44100.
   * @type {number}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly audioSampleRate?: number

  /**
   * Optional. The maximum audio bit depth.
   * @type {number}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly maxAudioBitDepth?: number

  /**
   * Optional. Specify an audio bitrate to encode to, e.g. 128000. If omitted this will be left to encoder defaults.
   * @type {number}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly audioBitRate?: number

  /**
   * Optional. Specify a specific number of audio channels to encode to, e.g. 2.
   * @type {number}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly audioChannels?: number

  /**
   * Optional. Specify a maximum number of audio channels to encode to, e.g. 2.
   * @type {number}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly maxAudioChannels?: number

  /**
   * Optional. Specify a specific an encoder profile (varies by encoder), e.g. main, baseline, high.
   * @type {string}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly profile?: string

  /**
   * Optional. Specify a level for the encoder profile (varies by encoder), e.g. 3, 3.1.
   * @type {string}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly level?: string

  /**
   * Optional. A specific video framerate to encode to, e.g. 23.976. Generally this should be omitted unless the device has specific requirements.
   * @type {number}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly framerate?: number

  /**
   * Optional. A specific maximum video framerate to encode to, e.g. 23.976. Generally this should be omitted unless the device has specific requirements.
   * @type {number}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly maxFramerate?: number

  /**
   * Whether or not to copy timestamps when transcoding with an offset. Defaults to false.
   * @type {boolean}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly copyTimestamps?: boolean

  /**
   * Optional. Specify a starting offset, in ticks. 1 tick &#x3D; 10000 ms.
   * @type {number}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly startTimeTicks?: number

  /**
   * Optional. The fixed horizontal resolution of the encoded video.
   * @type {number}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly width?: number

  /**
   * Optional. The fixed vertical resolution of the encoded video.
   * @type {number}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly height?: number

  /**
   * Optional. Specify a video bitrate to encode to, e.g. 500000. If omitted this will be left to encoder defaults.
   * @type {number}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly videoBitRate?: number

  /**
   * Optional. The index of the subtitle stream to use. If omitted no subtitles will be used.
   * @type {number}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly subtitleStreamIndex?: number

  /**
   * Optional. Specify the subtitle delivery method.
   * @type {SubtitleDeliveryMethod}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly subtitleMethod?: SubtitleDeliveryMethod

  /**
   * Optional.
   * @type {number}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly maxRefFrames?: number

  /**
   * Optional. The maximum video bit depth.
   * @type {number}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly maxVideoBitDepth?: number

  /**
   * Optional. Whether to require avc.
   * @type {boolean}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly requireAvc?: boolean

  /**
   * Optional. Whether to deinterlace the video.
   * @type {boolean}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly deInterlace?: boolean

  /**
   * Optional. Whether to require a non anamporphic stream.
   * @type {boolean}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly requireNonAnamorphic?: boolean

  /**
   * Optional. The maximum number of audio channels to transcode.
   * @type {number}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly transcodingMaxAudioChannels?: number

  /**
   * Optional. The limit of how many cpu cores to use.
   * @type {number}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly cpuCoreLimit?: number

  /**
   * The live stream id.
   * @type {string}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly liveStreamId?: string

  /**
   * Optional. Whether to enable the MpegtsM2Ts mode.
   * @type {boolean}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly enableMpegtsM2TsMode?: boolean

  /**
   * Optional. Specify a video codec to encode to, e.g. h264. If omitted the server will auto-select using the url\&#39;s extension. Options: h265, h264, mpeg4, theora, vp8, vp9, vpx (deprecated), wmv.
   * @type {string}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly videoCodec?: string

  /**
   * Optional. Specify a subtitle codec to encode to.
   * @type {string}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly subtitleCodec?: string

  /**
   * Optional. The transcoding reason.
   * @type {string}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly transcodeReasons?: string

  /**
   * Optional. The index of the audio stream to use. If omitted the first audio stream will be used.
   * @type {number}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly audioStreamIndex?: number

  /**
   * Optional. The index of the video stream to use. If omitted the first video stream will be used.
   * @type {number}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly videoStreamIndex?: number

  /**
   * Optional. The MediaBrowser.Model.Dlna.EncodingContext.
   * @type {EncodingContext}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly context?: EncodingContext

  /**
   * Optional. The streaming options.
   * @type {{ [key: string]: string; }}
   * @memberof AudioApiGetAudioStreamByContainer
   */
  readonly streamOptions?: Record<string, string>
}

/**
 * Request parameters for headAudioStream operation in AudioApi.
 * @export
 * @interface AudioApiHeadAudioStreamRequest
 */
export interface AudioApiHeadAudioStreamRequest {
  /**
   * The item id.
   * @type {string}
   * @memberof AudioApiHeadAudioStream
   */
  readonly itemId: string

  /**
   * The audio container.
   * @type {string}
   * @memberof AudioApiHeadAudioStream
   */
  readonly container?: string

  /**
   * Optional. If true, the original file will be streamed statically without any encoding. Use either no url extension or the original file extension. true/false.
   * @type {boolean}
   * @memberof AudioApiHeadAudioStream
   */
  readonly _static?: boolean

  /**
   * The streaming parameters.
   * @type {string}
   * @memberof AudioApiHeadAudioStream
   */
  readonly params?: string

  /**
   * The tag.
   * @type {string}
   * @memberof AudioApiHeadAudioStream
   */
  readonly tag?: string

  /**
   * Optional. The dlna device profile id to utilize.
   * @type {string}
   * @memberof AudioApiHeadAudioStream
   */
  readonly deviceProfileId?: string

  /**
   * The play session id.
   * @type {string}
   * @memberof AudioApiHeadAudioStream
   */
  readonly playSessionId?: string

  /**
   * The segment container.
   * @type {string}
   * @memberof AudioApiHeadAudioStream
   */
  readonly segmentContainer?: string

  /**
   * The segment length.
   * @type {number}
   * @memberof AudioApiHeadAudioStream
   */
  readonly segmentLength?: number

  /**
   * The minimum number of segments.
   * @type {number}
   * @memberof AudioApiHeadAudioStream
   */
  readonly minSegments?: number

  /**
   * The media version id, if playing an alternate version.
   * @type {string}
   * @memberof AudioApiHeadAudioStream
   */
  readonly mediaSourceId?: string

  /**
   * The device id of the client requesting. Used to stop encoding processes when needed.
   * @type {string}
   * @memberof AudioApiHeadAudioStream
   */
  readonly deviceId?: string

  /**
   * Optional. Specify a audio codec to encode to, e.g. mp3. If omitted the server will auto-select using the url\&#39;s extension. Options: aac, mp3, vorbis, wma.
   * @type {string}
   * @memberof AudioApiHeadAudioStream
   */
  readonly audioCodec?: string

  /**
   * Whether or not to allow automatic stream copy if requested values match the original source. Defaults to true.
   * @type {boolean}
   * @memberof AudioApiHeadAudioStream
   */
  readonly enableAutoStreamCopy?: boolean

  /**
   * Whether or not to allow copying of the video stream url.
   * @type {boolean}
   * @memberof AudioApiHeadAudioStream
   */
  readonly allowVideoStreamCopy?: boolean

  /**
   * Whether or not to allow copying of the audio stream url.
   * @type {boolean}
   * @memberof AudioApiHeadAudioStream
   */
  readonly allowAudioStreamCopy?: boolean

  /**
   * Optional. Whether to break on non key frames.
   * @type {boolean}
   * @memberof AudioApiHeadAudioStream
   */
  readonly breakOnNonKeyFrames?: boolean

  /**
   * Optional. Specify a specific audio sample rate, e.g. 44100.
   * @type {number}
   * @memberof AudioApiHeadAudioStream
   */
  readonly audioSampleRate?: number

  /**
   * Optional. The maximum audio bit depth.
   * @type {number}
   * @memberof AudioApiHeadAudioStream
   */
  readonly maxAudioBitDepth?: number

  /**
   * Optional. Specify an audio bitrate to encode to, e.g. 128000. If omitted this will be left to encoder defaults.
   * @type {number}
   * @memberof AudioApiHeadAudioStream
   */
  readonly audioBitRate?: number

  /**
   * Optional. Specify a specific number of audio channels to encode to, e.g. 2.
   * @type {number}
   * @memberof AudioApiHeadAudioStream
   */
  readonly audioChannels?: number

  /**
   * Optional. Specify a maximum number of audio channels to encode to, e.g. 2.
   * @type {number}
   * @memberof AudioApiHeadAudioStream
   */
  readonly maxAudioChannels?: number

  /**
   * Optional. Specify a specific an encoder profile (varies by encoder), e.g. main, baseline, high.
   * @type {string}
   * @memberof AudioApiHeadAudioStream
   */
  readonly profile?: string

  /**
   * Optional. Specify a level for the encoder profile (varies by encoder), e.g. 3, 3.1.
   * @type {string}
   * @memberof AudioApiHeadAudioStream
   */
  readonly level?: string

  /**
   * Optional. A specific video framerate to encode to, e.g. 23.976. Generally this should be omitted unless the device has specific requirements.
   * @type {number}
   * @memberof AudioApiHeadAudioStream
   */
  readonly framerate?: number

  /**
   * Optional. A specific maximum video framerate to encode to, e.g. 23.976. Generally this should be omitted unless the device has specific requirements.
   * @type {number}
   * @memberof AudioApiHeadAudioStream
   */
  readonly maxFramerate?: number

  /**
   * Whether or not to copy timestamps when transcoding with an offset. Defaults to false.
   * @type {boolean}
   * @memberof AudioApiHeadAudioStream
   */
  readonly copyTimestamps?: boolean

  /**
   * Optional. Specify a starting offset, in ticks. 1 tick &#x3D; 10000 ms.
   * @type {number}
   * @memberof AudioApiHeadAudioStream
   */
  readonly startTimeTicks?: number

  /**
   * Optional. The fixed horizontal resolution of the encoded video.
   * @type {number}
   * @memberof AudioApiHeadAudioStream
   */
  readonly width?: number

  /**
   * Optional. The fixed vertical resolution of the encoded video.
   * @type {number}
   * @memberof AudioApiHeadAudioStream
   */
  readonly height?: number

  /**
   * Optional. Specify a video bitrate to encode to, e.g. 500000. If omitted this will be left to encoder defaults.
   * @type {number}
   * @memberof AudioApiHeadAudioStream
   */
  readonly videoBitRate?: number

  /**
   * Optional. The index of the subtitle stream to use. If omitted no subtitles will be used.
   * @type {number}
   * @memberof AudioApiHeadAudioStream
   */
  readonly subtitleStreamIndex?: number

  /**
   * Optional. Specify the subtitle delivery method.
   * @type {SubtitleDeliveryMethod}
   * @memberof AudioApiHeadAudioStream
   */
  readonly subtitleMethod?: SubtitleDeliveryMethod

  /**
   * Optional.
   * @type {number}
   * @memberof AudioApiHeadAudioStream
   */
  readonly maxRefFrames?: number

  /**
   * Optional. The maximum video bit depth.
   * @type {number}
   * @memberof AudioApiHeadAudioStream
   */
  readonly maxVideoBitDepth?: number

  /**
   * Optional. Whether to require avc.
   * @type {boolean}
   * @memberof AudioApiHeadAudioStream
   */
  readonly requireAvc?: boolean

  /**
   * Optional. Whether to deinterlace the video.
   * @type {boolean}
   * @memberof AudioApiHeadAudioStream
   */
  readonly deInterlace?: boolean

  /**
   * Optional. Whether to require a non anamorphic stream.
   * @type {boolean}
   * @memberof AudioApiHeadAudioStream
   */
  readonly requireNonAnamorphic?: boolean

  /**
   * Optional. The maximum number of audio channels to transcode.
   * @type {number}
   * @memberof AudioApiHeadAudioStream
   */
  readonly transcodingMaxAudioChannels?: number

  /**
   * Optional. The limit of how many cpu cores to use.
   * @type {number}
   * @memberof AudioApiHeadAudioStream
   */
  readonly cpuCoreLimit?: number

  /**
   * The live stream id.
   * @type {string}
   * @memberof AudioApiHeadAudioStream
   */
  readonly liveStreamId?: string

  /**
   * Optional. Whether to enable the MpegtsM2Ts mode.
   * @type {boolean}
   * @memberof AudioApiHeadAudioStream
   */
  readonly enableMpegtsM2TsMode?: boolean

  /**
   * Optional. Specify a video codec to encode to, e.g. h264. If omitted the server will auto-select using the url\&#39;s extension. Options: h265, h264, mpeg4, theora, vp8, vp9, vpx (deprecated), wmv.
   * @type {string}
   * @memberof AudioApiHeadAudioStream
   */
  readonly videoCodec?: string

  /**
   * Optional. Specify a subtitle codec to encode to.
   * @type {string}
   * @memberof AudioApiHeadAudioStream
   */
  readonly subtitleCodec?: string

  /**
   * Optional. The transcoding reason.
   * @type {string}
   * @memberof AudioApiHeadAudioStream
   */
  readonly transcodeReasons?: string

  /**
   * Optional. The index of the audio stream to use. If omitted the first audio stream will be used.
   * @type {number}
   * @memberof AudioApiHeadAudioStream
   */
  readonly audioStreamIndex?: number

  /**
   * Optional. The index of the video stream to use. If omitted the first video stream will be used.
   * @type {number}
   * @memberof AudioApiHeadAudioStream
   */
  readonly videoStreamIndex?: number

  /**
   * Optional. The MediaBrowser.Model.Dlna.EncodingContext.
   * @type {EncodingContext}
   * @memberof AudioApiHeadAudioStream
   */
  readonly context?: EncodingContext

  /**
   * Optional. The streaming options.
   * @type {{ [key: string]: string; }}
   * @memberof AudioApiHeadAudioStream
   */
  readonly streamOptions?: Record<string, string>
}

/**
 * Request parameters for headAudioStreamByContainer operation in AudioApi.
 * @export
 * @interface AudioApiHeadAudioStreamByContainerRequest
 */
export interface AudioApiHeadAudioStreamByContainerRequest {
  /**
   * The item id.
   * @type {string}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly itemId: string

  /**
   * The audio container.
   * @type {string}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly container: string

  /**
   * Optional. If true, the original file will be streamed statically without any encoding. Use either no url extension or the original file extension. true/false.
   * @type {boolean}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly _static?: boolean

  /**
   * The streaming parameters.
   * @type {string}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly params?: string

  /**
   * The tag.
   * @type {string}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly tag?: string

  /**
   * Optional. The dlna device profile id to utilize.
   * @type {string}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly deviceProfileId?: string

  /**
   * The play session id.
   * @type {string}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly playSessionId?: string

  /**
   * The segment container.
   * @type {string}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly segmentContainer?: string

  /**
   * The segment length.
   * @type {number}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly segmentLength?: number

  /**
   * The minimum number of segments.
   * @type {number}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly minSegments?: number

  /**
   * The media version id, if playing an alternate version.
   * @type {string}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly mediaSourceId?: string

  /**
   * The device id of the client requesting. Used to stop encoding processes when needed.
   * @type {string}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly deviceId?: string

  /**
   * Optional. Specify a audio codec to encode to, e.g. mp3. If omitted the server will auto-select using the url\&#39;s extension. Options: aac, mp3, vorbis, wma.
   * @type {string}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly audioCodec?: string

  /**
   * Whether or not to allow automatic stream copy if requested values match the original source. Defaults to true.
   * @type {boolean}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly enableAutoStreamCopy?: boolean

  /**
   * Whether or not to allow copying of the video stream url.
   * @type {boolean}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly allowVideoStreamCopy?: boolean

  /**
   * Whether or not to allow copying of the audio stream url.
   * @type {boolean}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly allowAudioStreamCopy?: boolean

  /**
   * Optional. Whether to break on non key frames.
   * @type {boolean}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly breakOnNonKeyFrames?: boolean

  /**
   * Optional. Specify a specific audio sample rate, e.g. 44100.
   * @type {number}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly audioSampleRate?: number

  /**
   * Optional. The maximum audio bit depth.
   * @type {number}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly maxAudioBitDepth?: number

  /**
   * Optional. Specify an audio bitrate to encode to, e.g. 128000. If omitted this will be left to encoder defaults.
   * @type {number}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly audioBitRate?: number

  /**
   * Optional. Specify a specific number of audio channels to encode to, e.g. 2.
   * @type {number}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly audioChannels?: number

  /**
   * Optional. Specify a maximum number of audio channels to encode to, e.g. 2.
   * @type {number}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly maxAudioChannels?: number

  /**
   * Optional. Specify a specific an encoder profile (varies by encoder), e.g. main, baseline, high.
   * @type {string}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly profile?: string

  /**
   * Optional. Specify a level for the encoder profile (varies by encoder), e.g. 3, 3.1.
   * @type {string}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly level?: string

  /**
   * Optional. A specific video framerate to encode to, e.g. 23.976. Generally this should be omitted unless the device has specific requirements.
   * @type {number}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly framerate?: number

  /**
   * Optional. A specific maximum video framerate to encode to, e.g. 23.976. Generally this should be omitted unless the device has specific requirements.
   * @type {number}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly maxFramerate?: number

  /**
   * Whether or not to copy timestamps when transcoding with an offset. Defaults to false.
   * @type {boolean}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly copyTimestamps?: boolean

  /**
   * Optional. Specify a starting offset, in ticks. 1 tick &#x3D; 10000 ms.
   * @type {number}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly startTimeTicks?: number

  /**
   * Optional. The fixed horizontal resolution of the encoded video.
   * @type {number}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly width?: number

  /**
   * Optional. The fixed vertical resolution of the encoded video.
   * @type {number}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly height?: number

  /**
   * Optional. Specify a video bitrate to encode to, e.g. 500000. If omitted this will be left to encoder defaults.
   * @type {number}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly videoBitRate?: number

  /**
   * Optional. The index of the subtitle stream to use. If omitted no subtitles will be used.
   * @type {number}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly subtitleStreamIndex?: number

  /**
   * Optional. Specify the subtitle delivery method.
   * @type {SubtitleDeliveryMethod}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly subtitleMethod?: SubtitleDeliveryMethod

  /**
   * Optional.
   * @type {number}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly maxRefFrames?: number

  /**
   * Optional. The maximum video bit depth.
   * @type {number}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly maxVideoBitDepth?: number

  /**
   * Optional. Whether to require avc.
   * @type {boolean}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly requireAvc?: boolean

  /**
   * Optional. Whether to deinterlace the video.
   * @type {boolean}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly deInterlace?: boolean

  /**
   * Optional. Whether to require a non anamporphic stream.
   * @type {boolean}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly requireNonAnamorphic?: boolean

  /**
   * Optional. The maximum number of audio channels to transcode.
   * @type {number}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly transcodingMaxAudioChannels?: number

  /**
   * Optional. The limit of how many cpu cores to use.
   * @type {number}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly cpuCoreLimit?: number

  /**
   * The live stream id.
   * @type {string}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly liveStreamId?: string

  /**
   * Optional. Whether to enable the MpegtsM2Ts mode.
   * @type {boolean}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly enableMpegtsM2TsMode?: boolean

  /**
   * Optional. Specify a video codec to encode to, e.g. h264. If omitted the server will auto-select using the url\&#39;s extension. Options: h265, h264, mpeg4, theora, vp8, vp9, vpx (deprecated), wmv.
   * @type {string}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly videoCodec?: string

  /**
   * Optional. Specify a subtitle codec to encode to.
   * @type {string}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly subtitleCodec?: string

  /**
   * Optional. The transcoding reason.
   * @type {string}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly transcodeReasons?: string

  /**
   * Optional. The index of the audio stream to use. If omitted the first audio stream will be used.
   * @type {number}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly audioStreamIndex?: number

  /**
   * Optional. The index of the video stream to use. If omitted the first video stream will be used.
   * @type {number}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly videoStreamIndex?: number

  /**
   * Optional. The MediaBrowser.Model.Dlna.EncodingContext.
   * @type {EncodingContext}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly context?: EncodingContext

  /**
   * Optional. The streaming options.
   * @type {{ [key: string]: string; }}
   * @memberof AudioApiHeadAudioStreamByContainer
   */
  readonly streamOptions?: Record<string, string>
}

/**
 * AudioApi - object-oriented interface
 * @export
 * @class AudioApi
 * @extends {BaseAPI}
 */
export class AudioApi extends Api {
  /**
   *
   * @summary Gets an audio stream.
   * @param {AudioApiGetAudioStreamRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof AudioApi
   */
  public getAudioStream(requestParameters: AudioApiGetAudioStreamRequest) {
    this.assertParam(requestParameters.itemId)
    return this.apiClient.createUrl({ method: "GET", path: `/Audio/${requestParameters.itemId}/stream`, parameters: requestParameters})
  }

  /**
   *
   * @summary Gets an audio stream.
   * @param {AudioApiGetAudioStreamByContainerRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof AudioApi
   */
  public getAudioStreamByContainer(requestParameters: AudioApiGetAudioStreamByContainerRequest) {
    this.assertParam(requestParameters.itemId)
    this.assertParam(requestParameters.container)
    return this.apiClient.createUrl({ method: "GET", path: `/Audio/${requestParameters.itemId}/stream.${requestParameters.container}`, parameters: requestParameters})
  }

}