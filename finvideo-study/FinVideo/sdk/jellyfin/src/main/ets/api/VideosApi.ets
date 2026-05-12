import { Api } from "./Api"
import { BaseItemDtoQueryResult } from "../model/BaseItemDtoQueryResult"
import { EncodingContext } from "../model/EncodingContext"
import { SubtitleDeliveryMethod } from "../model/SubtitleDeliveryMethod"

/**
 * Request parameters for deleteAlternateSources operation in VideosApi.
 * @export
 * @interface VideosApiDeleteAlternateSourcesRequest
 */
export interface VideosApiDeleteAlternateSourcesRequest {
  /**
   * The item id.
   * @type {string}
   * @memberof VideosApiDeleteAlternateSources
   */
  readonly itemId: string
}

/**
 * Request parameters for getAdditionalPart operation in VideosApi.
 * @export
 * @interface VideosApiGetAdditionalPartRequest
 */
export interface VideosApiGetAdditionalPartRequest {
  /**
   * The item id.
   * @type {string}
   * @memberof VideosApiGetAdditionalPart
   */
  readonly itemId: string

  /**
   * Optional. Filter by user id, and attach user data.
   * @type {string}
   * @memberof VideosApiGetAdditionalPart
   */
  readonly userId?: string
}

/**
 * Request parameters for getVideoStream operation in VideosApi.
 * @export
 * @interface VideosApiGetVideoStreamRequest
 */
export interface VideosApiGetVideoStreamRequest {
  /**
   * The item id.
   * @type {string}
   * @memberof VideosApiGetVideoStream
   */
  readonly itemId: string

  /**
   * The video container. Possible values are: ts, webm, asf, wmv, ogv, mp4, m4v, mkv, mpeg, mpg, avi, 3gp, wmv, wtv, m2ts, mov, iso, flv.
   * @type {string}
   * @memberof VideosApiGetVideoStream
   */
  readonly container?: string

  /**
   * Optional. If true, the original file will be streamed statically without any encoding. Use either no url extension or the original file extension. true/false.
   * @type {boolean}
   * @memberof VideosApiGetVideoStream
   */
  readonly static?: boolean

  /**
   * The streaming parameters.
   * @type {string}
   * @memberof VideosApiGetVideoStream
   */
  readonly params?: string

  /**
   * The tag.
   * @type {string}
   * @memberof VideosApiGetVideoStream
   */
  readonly tag?: string

  /**
   * Optional. The dlna device profile id to utilize.
   * @type {string}
   * @memberof VideosApiGetVideoStream
   */
  readonly deviceProfileId?: string

  /**
   * The play session id.
   * @type {string}
   * @memberof VideosApiGetVideoStream
   */
  readonly playSessionId?: string

  /**
   * The segment container.
   * @type {string}
   * @memberof VideosApiGetVideoStream
   */
  readonly segmentContainer?: string

  /**
   * The segment length.
   * @type {number}
   * @memberof VideosApiGetVideoStream
   */
  readonly segmentLength?: number

  /**
   * The minimum number of segments.
   * @type {number}
   * @memberof VideosApiGetVideoStream
   */
  readonly minSegments?: number

  /**
   * The media version id, if playing an alternate version.
   * @type {string}
   * @memberof VideosApiGetVideoStream
   */
  readonly mediaSourceId?: string

  /**
   * The device id of the client requesting. Used to stop encoding processes when needed.
   * @type {string}
   * @memberof VideosApiGetVideoStream
   */
  readonly deviceId?: string

  /**
   * Optional. Specify a audio codec to encode to, e.g. mp3. If omitted the server will auto-select using the url\&#39;s extension. Options: aac, mp3, vorbis, wma.
   * @type {string}
   * @memberof VideosApiGetVideoStream
   */
  readonly audioCodec?: string

  /**
   * Whether or not to allow automatic stream copy if requested values match the original source. Defaults to true.
   * @type {boolean}
   * @memberof VideosApiGetVideoStream
   */
  readonly enableAutoStreamCopy?: boolean

  /**
   * Whether or not to allow copying of the video stream url.
   * @type {boolean}
   * @memberof VideosApiGetVideoStream
   */
  readonly allowVideoStreamCopy?: boolean

  /**
   * Whether or not to allow copying of the audio stream url.
   * @type {boolean}
   * @memberof VideosApiGetVideoStream
   */
  readonly allowAudioStreamCopy?: boolean

  /**
   * Optional. Whether to break on non key frames.
   * @type {boolean}
   * @memberof VideosApiGetVideoStream
   */
  readonly breakOnNonKeyFrames?: boolean

  /**
   * Optional. Specify a specific audio sample rate, e.g. 44100.
   * @type {number}
   * @memberof VideosApiGetVideoStream
   */
  readonly audioSampleRate?: number

  /**
   * Optional. The maximum audio bit depth.
   * @type {number}
   * @memberof VideosApiGetVideoStream
   */
  readonly maxAudioBitDepth?: number

  /**
   * Optional. Specify an audio bitrate to encode to, e.g. 128000. If omitted this will be left to encoder defaults.
   * @type {number}
   * @memberof VideosApiGetVideoStream
   */
  readonly audioBitRate?: number

  /**
   * Optional. Specify a specific number of audio channels to encode to, e.g. 2.
   * @type {number}
   * @memberof VideosApiGetVideoStream
   */
  readonly audioChannels?: number

  /**
   * Optional. Specify a maximum number of audio channels to encode to, e.g. 2.
   * @type {number}
   * @memberof VideosApiGetVideoStream
   */
  readonly maxAudioChannels?: number

  /**
   * Optional. Specify a specific an encoder profile (varies by encoder), e.g. main, baseline, high.
   * @type {string}
   * @memberof VideosApiGetVideoStream
   */
  readonly profile?: string

  /**
   * Optional. Specify a level for the encoder profile (varies by encoder), e.g. 3, 3.1.
   * @type {string}
   * @memberof VideosApiGetVideoStream
   */
  readonly level?: string

  /**
   * Optional. A specific video framerate to encode to, e.g. 23.976. Generally this should be omitted unless the device has specific requirements.
   * @type {number}
   * @memberof VideosApiGetVideoStream
   */
  readonly framerate?: number

  /**
   * Optional. A specific maximum video framerate to encode to, e.g. 23.976. Generally this should be omitted unless the device has specific requirements.
   * @type {number}
   * @memberof VideosApiGetVideoStream
   */
  readonly maxFramerate?: number

  /**
   * Whether or not to copy timestamps when transcoding with an offset. Defaults to false.
   * @type {boolean}
   * @memberof VideosApiGetVideoStream
   */
  readonly copyTimestamps?: boolean

  /**
   * Optional. Specify a starting offset, in ticks. 1 tick &#x3D; 10000 ms.
   * @type {number}
   * @memberof VideosApiGetVideoStream
   */
  readonly startTimeTicks?: number

  /**
   * Optional. The fixed horizontal resolution of the encoded video.
   * @type {number}
   * @memberof VideosApiGetVideoStream
   */
  readonly width?: number

  /**
   * Optional. The fixed vertical resolution of the encoded video.
   * @type {number}
   * @memberof VideosApiGetVideoStream
   */
  readonly height?: number

  /**
   * Optional. The maximum horizontal resolution of the encoded video.
   * @type {number}
   * @memberof VideosApiGetVideoStream
   */
  readonly maxWidth?: number

  /**
   * Optional. The maximum vertical resolution of the encoded video.
   * @type {number}
   * @memberof VideosApiGetVideoStream
   */
  readonly maxHeight?: number

  /**
   * Optional. Specify a video bitrate to encode to, e.g. 500000. If omitted this will be left to encoder defaults.
   * @type {number}
   * @memberof VideosApiGetVideoStream
   */
  readonly videoBitRate?: number

  /**
   * Optional. The index of the subtitle stream to use. If omitted no subtitles will be used.
   * @type {number}
   * @memberof VideosApiGetVideoStream
   */
  readonly subtitleStreamIndex?: number

  /**
   * Optional. Specify the subtitle delivery method.
   * @type {SubtitleDeliveryMethod}
   * @memberof VideosApiGetVideoStream
   */
  readonly subtitleMethod?: SubtitleDeliveryMethod

  /**
   * Optional.
   * @type {number}
   * @memberof VideosApiGetVideoStream
   */
  readonly maxRefFrames?: number

  /**
   * Optional. The maximum video bit depth.
   * @type {number}
   * @memberof VideosApiGetVideoStream
   */
  readonly maxVideoBitDepth?: number

  /**
   * Optional. Whether to require avc.
   * @type {boolean}
   * @memberof VideosApiGetVideoStream
   */
  readonly requireAvc?: boolean

  /**
   * Optional. Whether to deinterlace the video.
   * @type {boolean}
   * @memberof VideosApiGetVideoStream
   */
  readonly deInterlace?: boolean

  /**
   * Optional. Whether to require a non anamorphic stream.
   * @type {boolean}
   * @memberof VideosApiGetVideoStream
   */
  readonly requireNonAnamorphic?: boolean

  /**
   * Optional. The maximum number of audio channels to transcode.
   * @type {number}
   * @memberof VideosApiGetVideoStream
   */
  readonly transcodingMaxAudioChannels?: number

  /**
   * Optional. The limit of how many cpu cores to use.
   * @type {number}
   * @memberof VideosApiGetVideoStream
   */
  readonly cpuCoreLimit?: number

  /**
   * The live stream id.
   * @type {string}
   * @memberof VideosApiGetVideoStream
   */
  readonly liveStreamId?: string

  /**
   * Optional. Whether to enable the MpegtsM2Ts mode.
   * @type {boolean}
   * @memberof VideosApiGetVideoStream
   */
  readonly enableMpegtsM2TsMode?: boolean

  /**
   * Optional. Specify a video codec to encode to, e.g. h264. If omitted the server will auto-select using the url\&#39;s extension. Options: h265, h264, mpeg4, theora, vp8, vp9, vpx (deprecated), wmv.
   * @type {string}
   * @memberof VideosApiGetVideoStream
   */
  readonly videoCodec?: string

  /**
   * Optional. Specify a subtitle codec to encode to.
   * @type {string}
   * @memberof VideosApiGetVideoStream
   */
  readonly subtitleCodec?: string

  /**
   * Optional. The transcoding reason.
   * @type {string}
   * @memberof VideosApiGetVideoStream
   */
  readonly transcodeReasons?: string

  /**
   * Optional. The index of the audio stream to use. If omitted the first audio stream will be used.
   * @type {number}
   * @memberof VideosApiGetVideoStream
   */
  readonly audioStreamIndex?: number

  /**
   * Optional. The index of the video stream to use. If omitted the first video stream will be used.
   * @type {number}
   * @memberof VideosApiGetVideoStream
   */
  readonly videoStreamIndex?: number

  /**
   * Optional. The MediaBrowser.Model.Dlna.EncodingContext.
   * @type {EncodingContext}
   * @memberof VideosApiGetVideoStream
   */
  readonly context?: EncodingContext

  /**
   * Optional. The streaming options.
   * @type {{ [key: string]: string; }}
   * @memberof VideosApiGetVideoStream
   */
  readonly streamOptions?: Record<string, string>
}

/**
 * Request parameters for getVideoStreamByContainer operation in VideosApi.
 * @export
 * @interface VideosApiGetVideoStreamByContainerRequest
 */
export interface VideosApiGetVideoStreamByContainerRequest {
  /**
   * The item id.
   * @type {string}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly itemId: string

  /**
   * The video container. Possible values are: ts, webm, asf, wmv, ogv, mp4, m4v, mkv, mpeg, mpg, avi, 3gp, wmv, wtv, m2ts, mov, iso, flv.
   * @type {string}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly container: string

  /**
   * Optional. If true, the original file will be streamed statically without any encoding. Use either no url extension or the original file extension. true/false.
   * @type {boolean}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly _static?: boolean

  /**
   * The streaming parameters.
   * @type {string}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly params?: string

  /**
   * The tag.
   * @type {string}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly tag?: string

  /**
   * Optional. The dlna device profile id to utilize.
   * @type {string}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly deviceProfileId?: string

  /**
   * The play session id.
   * @type {string}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly playSessionId?: string

  /**
   * The segment container.
   * @type {string}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly segmentContainer?: string

  /**
   * The segment length.
   * @type {number}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly segmentLength?: number

  /**
   * The minimum number of segments.
   * @type {number}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly minSegments?: number

  /**
   * The media version id, if playing an alternate version.
   * @type {string}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly mediaSourceId?: string

  /**
   * The device id of the client requesting. Used to stop encoding processes when needed.
   * @type {string}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly deviceId?: string

  /**
   * Optional. Specify a audio codec to encode to, e.g. mp3. If omitted the server will auto-select using the url\&#39;s extension. Options: aac, mp3, vorbis, wma.
   * @type {string}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly audioCodec?: string

  /**
   * Whether or not to allow automatic stream copy if requested values match the original source. Defaults to true.
   * @type {boolean}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly enableAutoStreamCopy?: boolean

  /**
   * Whether or not to allow copying of the video stream url.
   * @type {boolean}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly allowVideoStreamCopy?: boolean

  /**
   * Whether or not to allow copying of the audio stream url.
   * @type {boolean}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly allowAudioStreamCopy?: boolean

  /**
   * Optional. Whether to break on non key frames.
   * @type {boolean}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly breakOnNonKeyFrames?: boolean

  /**
   * Optional. Specify a specific audio sample rate, e.g. 44100.
   * @type {number}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly audioSampleRate?: number

  /**
   * Optional. The maximum audio bit depth.
   * @type {number}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly maxAudioBitDepth?: number

  /**
   * Optional. Specify an audio bitrate to encode to, e.g. 128000. If omitted this will be left to encoder defaults.
   * @type {number}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly audioBitRate?: number

  /**
   * Optional. Specify a specific number of audio channels to encode to, e.g. 2.
   * @type {number}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly audioChannels?: number

  /**
   * Optional. Specify a maximum number of audio channels to encode to, e.g. 2.
   * @type {number}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly maxAudioChannels?: number

  /**
   * Optional. Specify a specific an encoder profile (varies by encoder), e.g. main, baseline, high.
   * @type {string}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly profile?: string

  /**
   * Optional. Specify a level for the encoder profile (varies by encoder), e.g. 3, 3.1.
   * @type {string}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly level?: string

  /**
   * Optional. A specific video framerate to encode to, e.g. 23.976. Generally this should be omitted unless the device has specific requirements.
   * @type {number}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly framerate?: number

  /**
   * Optional. A specific maximum video framerate to encode to, e.g. 23.976. Generally this should be omitted unless the device has specific requirements.
   * @type {number}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly maxFramerate?: number

  /**
   * Whether or not to copy timestamps when transcoding with an offset. Defaults to false.
   * @type {boolean}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly copyTimestamps?: boolean

  /**
   * Optional. Specify a starting offset, in ticks. 1 tick &#x3D; 10000 ms.
   * @type {number}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly startTimeTicks?: number

  /**
   * Optional. The fixed horizontal resolution of the encoded video.
   * @type {number}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly width?: number

  /**
   * Optional. The fixed vertical resolution of the encoded video.
   * @type {number}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly height?: number

  /**
   * Optional. The maximum horizontal resolution of the encoded video.
   * @type {number}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly maxWidth?: number

  /**
   * Optional. The maximum vertical resolution of the encoded video.
   * @type {number}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly maxHeight?: number

  /**
   * Optional. Specify a video bitrate to encode to, e.g. 500000. If omitted this will be left to encoder defaults.
   * @type {number}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly videoBitRate?: number

  /**
   * Optional. The index of the subtitle stream to use. If omitted no subtitles will be used.
   * @type {number}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly subtitleStreamIndex?: number

  /**
   * Optional. Specify the subtitle delivery method.
   * @type {SubtitleDeliveryMethod}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly subtitleMethod?: SubtitleDeliveryMethod

  /**
   * Optional.
   * @type {number}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly maxRefFrames?: number

  /**
   * Optional. The maximum video bit depth.
   * @type {number}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly maxVideoBitDepth?: number

  /**
   * Optional. Whether to require avc.
   * @type {boolean}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly requireAvc?: boolean

  /**
   * Optional. Whether to deinterlace the video.
   * @type {boolean}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly deInterlace?: boolean

  /**
   * Optional. Whether to require a non anamorphic stream.
   * @type {boolean}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly requireNonAnamorphic?: boolean

  /**
   * Optional. The maximum number of audio channels to transcode.
   * @type {number}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly transcodingMaxAudioChannels?: number

  /**
   * Optional. The limit of how many cpu cores to use.
   * @type {number}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly cpuCoreLimit?: number

  /**
   * The live stream id.
   * @type {string}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly liveStreamId?: string

  /**
   * Optional. Whether to enable the MpegtsM2Ts mode.
   * @type {boolean}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly enableMpegtsM2TsMode?: boolean

  /**
   * Optional. Specify a video codec to encode to, e.g. h264. If omitted the server will auto-select using the url\&#39;s extension. Options: h265, h264, mpeg4, theora, vp8, vp9, vpx (deprecated), wmv.
   * @type {string}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly videoCodec?: string

  /**
   * Optional. Specify a subtitle codec to encode to.
   * @type {string}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly subtitleCodec?: string

  /**
   * Optional. The transcoding reason.
   * @type {string}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly transcodeReasons?: string

  /**
   * Optional. The index of the audio stream to use. If omitted the first audio stream will be used.
   * @type {number}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly audioStreamIndex?: number

  /**
   * Optional. The index of the video stream to use. If omitted the first video stream will be used.
   * @type {number}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly videoStreamIndex?: number

  /**
   * Optional. The MediaBrowser.Model.Dlna.EncodingContext.
   * @type {EncodingContext}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly context?: EncodingContext

  /**
   * Optional. The streaming options.
   * @type {{ [key: string]: string; }}
   * @memberof VideosApiGetVideoStreamByContainer
   */
  readonly streamOptions?: Record<string, string>
}

/**
 * Request parameters for headVideoStream operation in VideosApi.
 * @export
 * @interface VideosApiHeadVideoStreamRequest
 */
export interface VideosApiHeadVideoStreamRequest {
  /**
   * The item id.
   * @type {string}
   * @memberof VideosApiHeadVideoStream
   */
  readonly itemId: string

  /**
   * The video container. Possible values are: ts, webm, asf, wmv, ogv, mp4, m4v, mkv, mpeg, mpg, avi, 3gp, wmv, wtv, m2ts, mov, iso, flv.
   * @type {string}
   * @memberof VideosApiHeadVideoStream
   */
  readonly container?: string

  /**
   * Optional. If true, the original file will be streamed statically without any encoding. Use either no url extension or the original file extension. true/false.
   * @type {boolean}
   * @memberof VideosApiHeadVideoStream
   */
  readonly _static?: boolean

  /**
   * The streaming parameters.
   * @type {string}
   * @memberof VideosApiHeadVideoStream
   */
  readonly params?: string

  /**
   * The tag.
   * @type {string}
   * @memberof VideosApiHeadVideoStream
   */
  readonly tag?: string

  /**
   * Optional. The dlna device profile id to utilize.
   * @type {string}
   * @memberof VideosApiHeadVideoStream
   */
  readonly deviceProfileId?: string

  /**
   * The play session id.
   * @type {string}
   * @memberof VideosApiHeadVideoStream
   */
  readonly playSessionId?: string

  /**
   * The segment container.
   * @type {string}
   * @memberof VideosApiHeadVideoStream
   */
  readonly segmentContainer?: string

  /**
   * The segment length.
   * @type {number}
   * @memberof VideosApiHeadVideoStream
   */
  readonly segmentLength?: number

  /**
   * The minimum number of segments.
   * @type {number}
   * @memberof VideosApiHeadVideoStream
   */
  readonly minSegments?: number

  /**
   * The media version id, if playing an alternate version.
   * @type {string}
   * @memberof VideosApiHeadVideoStream
   */
  readonly mediaSourceId?: string

  /**
   * The device id of the client requesting. Used to stop encoding processes when needed.
   * @type {string}
   * @memberof VideosApiHeadVideoStream
   */
  readonly deviceId?: string

  /**
   * Optional. Specify a audio codec to encode to, e.g. mp3. If omitted the server will auto-select using the url\&#39;s extension. Options: aac, mp3, vorbis, wma.
   * @type {string}
   * @memberof VideosApiHeadVideoStream
   */
  readonly audioCodec?: string

  /**
   * Whether or not to allow automatic stream copy if requested values match the original source. Defaults to true.
   * @type {boolean}
   * @memberof VideosApiHeadVideoStream
   */
  readonly enableAutoStreamCopy?: boolean

  /**
   * Whether or not to allow copying of the video stream url.
   * @type {boolean}
   * @memberof VideosApiHeadVideoStream
   */
  readonly allowVideoStreamCopy?: boolean

  /**
   * Whether or not to allow copying of the audio stream url.
   * @type {boolean}
   * @memberof VideosApiHeadVideoStream
   */
  readonly allowAudioStreamCopy?: boolean

  /**
   * Optional. Whether to break on non key frames.
   * @type {boolean}
   * @memberof VideosApiHeadVideoStream
   */
  readonly breakOnNonKeyFrames?: boolean

  /**
   * Optional. Specify a specific audio sample rate, e.g. 44100.
   * @type {number}
   * @memberof VideosApiHeadVideoStream
   */
  readonly audioSampleRate?: number

  /**
   * Optional. The maximum audio bit depth.
   * @type {number}
   * @memberof VideosApiHeadVideoStream
   */
  readonly maxAudioBitDepth?: number

  /**
   * Optional. Specify an audio bitrate to encode to, e.g. 128000. If omitted this will be left to encoder defaults.
   * @type {number}
   * @memberof VideosApiHeadVideoStream
   */
  readonly audioBitRate?: number

  /**
   * Optional. Specify a specific number of audio channels to encode to, e.g. 2.
   * @type {number}
   * @memberof VideosApiHeadVideoStream
   */
  readonly audioChannels?: number

  /**
   * Optional. Specify a maximum number of audio channels to encode to, e.g. 2.
   * @type {number}
   * @memberof VideosApiHeadVideoStream
   */
  readonly maxAudioChannels?: number

  /**
   * Optional. Specify a specific an encoder profile (varies by encoder), e.g. main, baseline, high.
   * @type {string}
   * @memberof VideosApiHeadVideoStream
   */
  readonly profile?: string

  /**
   * Optional. Specify a level for the encoder profile (varies by encoder), e.g. 3, 3.1.
   * @type {string}
   * @memberof VideosApiHeadVideoStream
   */
  readonly level?: string

  /**
   * Optional. A specific video framerate to encode to, e.g. 23.976. Generally this should be omitted unless the device has specific requirements.
   * @type {number}
   * @memberof VideosApiHeadVideoStream
   */
  readonly framerate?: number

  /**
   * Optional. A specific maximum video framerate to encode to, e.g. 23.976. Generally this should be omitted unless the device has specific requirements.
   * @type {number}
   * @memberof VideosApiHeadVideoStream
   */
  readonly maxFramerate?: number

  /**
   * Whether or not to copy timestamps when transcoding with an offset. Defaults to false.
   * @type {boolean}
   * @memberof VideosApiHeadVideoStream
   */
  readonly copyTimestamps?: boolean

  /**
   * Optional. Specify a starting offset, in ticks. 1 tick &#x3D; 10000 ms.
   * @type {number}
   * @memberof VideosApiHeadVideoStream
   */
  readonly startTimeTicks?: number

  /**
   * Optional. The fixed horizontal resolution of the encoded video.
   * @type {number}
   * @memberof VideosApiHeadVideoStream
   */
  readonly width?: number

  /**
   * Optional. The fixed vertical resolution of the encoded video.
   * @type {number}
   * @memberof VideosApiHeadVideoStream
   */
  readonly height?: number

  /**
   * Optional. The maximum horizontal resolution of the encoded video.
   * @type {number}
   * @memberof VideosApiHeadVideoStream
   */
  readonly maxWidth?: number

  /**
   * Optional. The maximum vertical resolution of the encoded video.
   * @type {number}
   * @memberof VideosApiHeadVideoStream
   */
  readonly maxHeight?: number

  /**
   * Optional. Specify a video bitrate to encode to, e.g. 500000. If omitted this will be left to encoder defaults.
   * @type {number}
   * @memberof VideosApiHeadVideoStream
   */
  readonly videoBitRate?: number

  /**
   * Optional. The index of the subtitle stream to use. If omitted no subtitles will be used.
   * @type {number}
   * @memberof VideosApiHeadVideoStream
   */
  readonly subtitleStreamIndex?: number

  /**
   * Optional. Specify the subtitle delivery method.
   * @type {SubtitleDeliveryMethod}
   * @memberof VideosApiHeadVideoStream
   */
  readonly subtitleMethod?: SubtitleDeliveryMethod

  /**
   * Optional.
   * @type {number}
   * @memberof VideosApiHeadVideoStream
   */
  readonly maxRefFrames?: number

  /**
   * Optional. The maximum video bit depth.
   * @type {number}
   * @memberof VideosApiHeadVideoStream
   */
  readonly maxVideoBitDepth?: number

  /**
   * Optional. Whether to require avc.
   * @type {boolean}
   * @memberof VideosApiHeadVideoStream
   */
  readonly requireAvc?: boolean

  /**
   * Optional. Whether to deinterlace the video.
   * @type {boolean}
   * @memberof VideosApiHeadVideoStream
   */
  readonly deInterlace?: boolean

  /**
   * Optional. Whether to require a non anamorphic stream.
   * @type {boolean}
   * @memberof VideosApiHeadVideoStream
   */
  readonly requireNonAnamorphic?: boolean

  /**
   * Optional. The maximum number of audio channels to transcode.
   * @type {number}
   * @memberof VideosApiHeadVideoStream
   */
  readonly transcodingMaxAudioChannels?: number

  /**
   * Optional. The limit of how many cpu cores to use.
   * @type {number}
   * @memberof VideosApiHeadVideoStream
   */
  readonly cpuCoreLimit?: number

  /**
   * The live stream id.
   * @type {string}
   * @memberof VideosApiHeadVideoStream
   */
  readonly liveStreamId?: string

  /**
   * Optional. Whether to enable the MpegtsM2Ts mode.
   * @type {boolean}
   * @memberof VideosApiHeadVideoStream
   */
  readonly enableMpegtsM2TsMode?: boolean

  /**
   * Optional. Specify a video codec to encode to, e.g. h264. If omitted the server will auto-select using the url\&#39;s extension. Options: h265, h264, mpeg4, theora, vp8, vp9, vpx (deprecated), wmv.
   * @type {string}
   * @memberof VideosApiHeadVideoStream
   */
  readonly videoCodec?: string

  /**
   * Optional. Specify a subtitle codec to encode to.
   * @type {string}
   * @memberof VideosApiHeadVideoStream
   */
  readonly subtitleCodec?: string

  /**
   * Optional. The transcoding reason.
   * @type {string}
   * @memberof VideosApiHeadVideoStream
   */
  readonly transcodeReasons?: string

  /**
   * Optional. The index of the audio stream to use. If omitted the first audio stream will be used.
   * @type {number}
   * @memberof VideosApiHeadVideoStream
   */
  readonly audioStreamIndex?: number

  /**
   * Optional. The index of the video stream to use. If omitted the first video stream will be used.
   * @type {number}
   * @memberof VideosApiHeadVideoStream
   */
  readonly videoStreamIndex?: number

  /**
   * Optional. The MediaBrowser.Model.Dlna.EncodingContext.
   * @type {EncodingContext}
   * @memberof VideosApiHeadVideoStream
   */
  readonly context?: EncodingContext

  /**
   * Optional. The streaming options.
   * @type {{ [key: string]: string; }}
   * @memberof VideosApiHeadVideoStream
   */
  readonly streamOptions?: Record<string, string>
}

/**
 * Request parameters for headVideoStreamByContainer operation in VideosApi.
 * @export
 * @interface VideosApiHeadVideoStreamByContainerRequest
 */
export interface VideosApiHeadVideoStreamByContainerRequest {
  /**
   * The item id.
   * @type {string}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly itemId: string

  /**
   * The video container. Possible values are: ts, webm, asf, wmv, ogv, mp4, m4v, mkv, mpeg, mpg, avi, 3gp, wmv, wtv, m2ts, mov, iso, flv.
   * @type {string}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly container: string

  /**
   * Optional. If true, the original file will be streamed statically without any encoding. Use either no url extension or the original file extension. true/false.
   * @type {boolean}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly _static?: boolean

  /**
   * The streaming parameters.
   * @type {string}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly params?: string

  /**
   * The tag.
   * @type {string}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly tag?: string

  /**
   * Optional. The dlna device profile id to utilize.
   * @type {string}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly deviceProfileId?: string

  /**
   * The play session id.
   * @type {string}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly playSessionId?: string

  /**
   * The segment container.
   * @type {string}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly segmentContainer?: string

  /**
   * The segment length.
   * @type {number}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly segmentLength?: number

  /**
   * The minimum number of segments.
   * @type {number}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly minSegments?: number

  /**
   * The media version id, if playing an alternate version.
   * @type {string}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly mediaSourceId?: string

  /**
   * The device id of the client requesting. Used to stop encoding processes when needed.
   * @type {string}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly deviceId?: string

  /**
   * Optional. Specify a audio codec to encode to, e.g. mp3. If omitted the server will auto-select using the url\&#39;s extension. Options: aac, mp3, vorbis, wma.
   * @type {string}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly audioCodec?: string

  /**
   * Whether or not to allow automatic stream copy if requested values match the original source. Defaults to true.
   * @type {boolean}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly enableAutoStreamCopy?: boolean

  /**
   * Whether or not to allow copying of the video stream url.
   * @type {boolean}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly allowVideoStreamCopy?: boolean

  /**
   * Whether or not to allow copying of the audio stream url.
   * @type {boolean}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly allowAudioStreamCopy?: boolean

  /**
   * Optional. Whether to break on non key frames.
   * @type {boolean}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly breakOnNonKeyFrames?: boolean

  /**
   * Optional. Specify a specific audio sample rate, e.g. 44100.
   * @type {number}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly audioSampleRate?: number

  /**
   * Optional. The maximum audio bit depth.
   * @type {number}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly maxAudioBitDepth?: number

  /**
   * Optional. Specify an audio bitrate to encode to, e.g. 128000. If omitted this will be left to encoder defaults.
   * @type {number}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly audioBitRate?: number

  /**
   * Optional. Specify a specific number of audio channels to encode to, e.g. 2.
   * @type {number}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly audioChannels?: number

  /**
   * Optional. Specify a maximum number of audio channels to encode to, e.g. 2.
   * @type {number}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly maxAudioChannels?: number

  /**
   * Optional. Specify a specific an encoder profile (varies by encoder), e.g. main, baseline, high.
   * @type {string}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly profile?: string

  /**
   * Optional. Specify a level for the encoder profile (varies by encoder), e.g. 3, 3.1.
   * @type {string}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly level?: string

  /**
   * Optional. A specific video framerate to encode to, e.g. 23.976. Generally this should be omitted unless the device has specific requirements.
   * @type {number}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly framerate?: number

  /**
   * Optional. A specific maximum video framerate to encode to, e.g. 23.976. Generally this should be omitted unless the device has specific requirements.
   * @type {number}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly maxFramerate?: number

  /**
   * Whether or not to copy timestamps when transcoding with an offset. Defaults to false.
   * @type {boolean}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly copyTimestamps?: boolean

  /**
   * Optional. Specify a starting offset, in ticks. 1 tick &#x3D; 10000 ms.
   * @type {number}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly startTimeTicks?: number

  /**
   * Optional. The fixed horizontal resolution of the encoded video.
   * @type {number}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly width?: number

  /**
   * Optional. The fixed vertical resolution of the encoded video.
   * @type {number}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly height?: number

  /**
   * Optional. The maximum horizontal resolution of the encoded video.
   * @type {number}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly maxWidth?: number

  /**
   * Optional. The maximum vertical resolution of the encoded video.
   * @type {number}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly maxHeight?: number

  /**
   * Optional. Specify a video bitrate to encode to, e.g. 500000. If omitted this will be left to encoder defaults.
   * @type {number}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly videoBitRate?: number

  /**
   * Optional. The index of the subtitle stream to use. If omitted no subtitles will be used.
   * @type {number}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly subtitleStreamIndex?: number

  /**
   * Optional. Specify the subtitle delivery method.
   * @type {SubtitleDeliveryMethod}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly subtitleMethod?: SubtitleDeliveryMethod

  /**
   * Optional.
   * @type {number}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly maxRefFrames?: number

  /**
   * Optional. The maximum video bit depth.
   * @type {number}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly maxVideoBitDepth?: number

  /**
   * Optional. Whether to require avc.
   * @type {boolean}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly requireAvc?: boolean

  /**
   * Optional. Whether to deinterlace the video.
   * @type {boolean}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly deInterlace?: boolean

  /**
   * Optional. Whether to require a non anamorphic stream.
   * @type {boolean}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly requireNonAnamorphic?: boolean

  /**
   * Optional. The maximum number of audio channels to transcode.
   * @type {number}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly transcodingMaxAudioChannels?: number

  /**
   * Optional. The limit of how many cpu cores to use.
   * @type {number}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly cpuCoreLimit?: number

  /**
   * The live stream id.
   * @type {string}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly liveStreamId?: string

  /**
   * Optional. Whether to enable the MpegtsM2Ts mode.
   * @type {boolean}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly enableMpegtsM2TsMode?: boolean

  /**
   * Optional. Specify a video codec to encode to, e.g. h264. If omitted the server will auto-select using the url\&#39;s extension. Options: h265, h264, mpeg4, theora, vp8, vp9, vpx (deprecated), wmv.
   * @type {string}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly videoCodec?: string

  /**
   * Optional. Specify a subtitle codec to encode to.
   * @type {string}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly subtitleCodec?: string

  /**
   * Optional. The transcoding reason.
   * @type {string}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly transcodeReasons?: string

  /**
   * Optional. The index of the audio stream to use. If omitted the first audio stream will be used.
   * @type {number}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly audioStreamIndex?: number

  /**
   * Optional. The index of the video stream to use. If omitted the first video stream will be used.
   * @type {number}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly videoStreamIndex?: number

  /**
   * Optional. The MediaBrowser.Model.Dlna.EncodingContext.
   * @type {EncodingContext}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly context?: EncodingContext

  /**
   * Optional. The streaming options.
   * @type {{ [key: string]: string; }}
   * @memberof VideosApiHeadVideoStreamByContainer
   */
  readonly streamOptions?: Record<string, string>
}

/**
 * Request parameters for mergeVersions operation in VideosApi.
 * @export
 * @interface VideosApiMergeVersionsRequest
 */
export interface VideosApiMergeVersionsRequest {
  /**
   * Item id list. This allows multiple, comma delimited.
   * @type {Array<string>}
   * @memberof VideosApiMergeVersions
   */
  readonly ids: Array<string>
}

/**
 * VideosApi - object-oriented interface
 * @export
 * @class VideosApi
 * @extends {BaseAPI}
 */
export class VideosApi extends Api {
  /**
   * deleteAlternateSources
   * @summary Removes alternate video sources.
   * @param {VideosApiDeleteAlternateSourcesRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof VideosApi
   */
  public async deleteAlternateSources(requestParameters: VideosApiDeleteAlternateSourcesRequest): Promise<void> {
    this.assertParam(requestParameters.itemId)
    return this.apiClient.delete({path: `/Videos/${requestParameters.itemId}/AlternateSources`, parameters: requestParameters})
  }

  /**
   * getAdditionalPart
   * @summary Gets additional parts for a video.
   * @param {VideosApiGetAdditionalPartRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof VideosApi
   */
  public async getAdditionalPart(requestParameters: VideosApiGetAdditionalPartRequest): Promise<BaseItemDtoQueryResult> {
    this.assertParam(requestParameters.itemId)
    return this.apiClient.get({path: `/Videos/${requestParameters.itemId}/AdditionalParts`, parameters: requestParameters})
  }

  /**
   * getVideoStream
   * @summary Gets a video stream.
   * @param {VideosApiGetVideoStreamRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof VideosApi
   */
  public async getVideoStreamUrl(requestParameters: VideosApiGetVideoStreamRequest): Promise<string> {
    this.assertParam(requestParameters.itemId)
    return this.apiClient.createUrl({ method: "GET", path: `/Videos/${requestParameters.itemId}/stream`, parameters: requestParameters})
  }

  /**
   * getVideoStreamByContainer
   * @summary Gets a video stream.
   * @param {VideosApiGetVideoStreamByContainerRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof VideosApi
   */
  public async getVideoStreamUrlByContainer(requestParameters: VideosApiGetVideoStreamByContainerRequest): Promise<string> {
    this.assertParam(requestParameters.itemId)
    this.assertParam(requestParameters.container)
    return this.apiClient.createUrl({ method: "GET", path: `/Videos/${requestParameters.itemId}/stream.${requestParameters.container}`, parameters: requestParameters})
  }

  /**
   * mergeVersions
   * @summary Merges videos into a single record.
   * @param {VideosApiMergeVersionsRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof VideosApi
   */
  public async mergeVersions(requestParameters: VideosApiMergeVersionsRequest): Promise<void> {
    return this.apiClient.get({path: "/Videos/MergeVersions", parameters: requestParameters})
  }
}
