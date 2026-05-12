import { Api } from "./Api"
import { PlaybackInfoDto } from "../model/PlaybackInfoDto"
import { OpenLiveStreamDto } from "../model/OpenLiveStreamDto"
import { LiveStreamResponse } from "../model/LiveStreamResponse"
import { PlaybackInfoResponse } from "../model/PlaybackInfoResponse"

/**
 * Request parameters for closeLiveStream operation in MediaInfoApi.
 * @export
 * @interface MediaInfoApiCloseLiveStreamRequest
 */
export interface MediaInfoApiCloseLiveStreamRequest {
  /**
   * The livestream id.
   * @type {string}
   * @memberof MediaInfoApiCloseLiveStream
   */
  readonly liveStreamId: string
}

/**
 * Request parameters for getBitrateTestBytes operation in MediaInfoApi.
 * @export
 * @interface MediaInfoApiGetBitrateTestBytesRequest
 */
export interface MediaInfoApiGetBitrateTestBytesRequest {
  /**
   * The bitrate. Defaults to 102400.
   * @type {number}
   * @memberof MediaInfoApiGetBitrateTestBytes
   */
  readonly size?: number
}

/**
 * Request parameters for getPlaybackInfo operation in MediaInfoApi.
 * @export
 * @interface MediaInfoApiGetPlaybackInfoRequest
 */
export interface MediaInfoApiGetPlaybackInfoRequest {
  /**
   * The item id.
   * @type {string}
   * @memberof MediaInfoApiGetPlaybackInfo
   */
  readonly itemId: string

  /**
   * The user id.
   * @type {string}
   * @memberof MediaInfoApiGetPlaybackInfo
   */
  readonly userId?: string
}

/**
 * Request parameters for getPostedPlaybackInfo operation in MediaInfoApi.
 * @export
 * @interface MediaInfoApiGetPostedPlaybackInfoRequest
 */
export interface MediaInfoApiGetPostedPlaybackInfoRequest {
  /**
   * The item id.
   * @type {string}
   * @memberof MediaInfoApiGetPostedPlaybackInfo
   */
  readonly itemId: string

  /**
   * The user id.
   * @type {string}
   * @memberof MediaInfoApiGetPostedPlaybackInfo
   */
  readonly userId?: string

  /**
   * The maximum streaming bitrate.
   * @type {number}
   * @memberof MediaInfoApiGetPostedPlaybackInfo
   */
  readonly maxStreamingBitrate?: number

  /**
   * The start time in ticks.
   * @type {number}
   * @memberof MediaInfoApiGetPostedPlaybackInfo
   */
  readonly startTimeTicks?: number

  /**
   * The audio stream index.
   * @type {number}
   * @memberof MediaInfoApiGetPostedPlaybackInfo
   */
  readonly audioStreamIndex?: number

  /**
   * The subtitle stream index.
   * @type {number}
   * @memberof MediaInfoApiGetPostedPlaybackInfo
   */
  readonly subtitleStreamIndex?: number

  /**
   * The maximum number of audio channels.
   * @type {number}
   * @memberof MediaInfoApiGetPostedPlaybackInfo
   */
  readonly maxAudioChannels?: number

  /**
   * The media source id.
   * @type {string}
   * @memberof MediaInfoApiGetPostedPlaybackInfo
   */
  readonly mediaSourceId?: string

  /**
   * The livestream id.
   * @type {string}
   * @memberof MediaInfoApiGetPostedPlaybackInfo
   */
  readonly liveStreamId?: string

  /**
   * Whether to auto open the livestream.
   * @type {boolean}
   * @memberof MediaInfoApiGetPostedPlaybackInfo
   */
  readonly autoOpenLiveStream?: boolean

  /**
   * Whether to enable direct play. Default: true.
   * @type {boolean}
   * @memberof MediaInfoApiGetPostedPlaybackInfo
   */
  readonly enableDirectPlay?: boolean

  /**
   * Whether to enable direct stream. Default: true.
   * @type {boolean}
   * @memberof MediaInfoApiGetPostedPlaybackInfo
   */
  readonly enableDirectStream?: boolean

  /**
   * Whether to enable transcoding. Default: true.
   * @type {boolean}
   * @memberof MediaInfoApiGetPostedPlaybackInfo
   */
  readonly enableTranscoding?: boolean

  /**
   * Whether to allow to copy the video stream. Default: true.
   * @type {boolean}
   * @memberof MediaInfoApiGetPostedPlaybackInfo
   */
  readonly allowVideoStreamCopy?: boolean

  /**
   * Whether to allow to copy the audio stream. Default: true.
   * @type {boolean}
   * @memberof MediaInfoApiGetPostedPlaybackInfo
   */
  readonly allowAudioStreamCopy?: boolean

  /**
   * The playback info.
   * @type {PlaybackInfoDto}
   * @memberof MediaInfoApiGetPostedPlaybackInfo
   */
  readonly playbackInfoDto?: PlaybackInfoDto
}

/**
 * Request parameters for openLiveStream operation in MediaInfoApi.
 * @export
 * @interface MediaInfoApiOpenLiveStreamRequest
 */
export interface MediaInfoApiOpenLiveStreamRequest {
  /**
   * The open token.
   * @type {string}
   * @memberof MediaInfoApiOpenLiveStream
   */
  readonly openToken?: string

  /**
   * The user id.
   * @type {string}
   * @memberof MediaInfoApiOpenLiveStream
   */
  readonly userId?: string

  /**
   * The play session id.
   * @type {string}
   * @memberof MediaInfoApiOpenLiveStream
   */
  readonly playSessionId?: string

  /**
   * The maximum streaming bitrate.
   * @type {number}
   * @memberof MediaInfoApiOpenLiveStream
   */
  readonly maxStreamingBitrate?: number

  /**
   * The start time in ticks.
   * @type {number}
   * @memberof MediaInfoApiOpenLiveStream
   */
  readonly startTimeTicks?: number

  /**
   * The audio stream index.
   * @type {number}
   * @memberof MediaInfoApiOpenLiveStream
   */
  readonly audioStreamIndex?: number

  /**
   * The subtitle stream index.
   * @type {number}
   * @memberof MediaInfoApiOpenLiveStream
   */
  readonly subtitleStreamIndex?: number

  /**
   * The maximum number of audio channels.
   * @type {number}
   * @memberof MediaInfoApiOpenLiveStream
   */
  readonly maxAudioChannels?: number

  /**
   * The item id.
   * @type {string}
   * @memberof MediaInfoApiOpenLiveStream
   */
  readonly itemId?: string

  /**
   * Whether to enable direct play. Default: true.
   * @type {boolean}
   * @memberof MediaInfoApiOpenLiveStream
   */
  readonly enableDirectPlay?: boolean

  /**
   * Whether to enable direct stream. Default: true.
   * @type {boolean}
   * @memberof MediaInfoApiOpenLiveStream
   */
  readonly enableDirectStream?: boolean

  /**
   * The open live stream dto.
   * @type {OpenLiveStreamDto}
   * @memberof MediaInfoApiOpenLiveStream
   */
  readonly openLiveStreamDto?: OpenLiveStreamDto
}

/**
 * MediaInfoApi - object-oriented interface
 * @export
 * @class MediaInfoApi
 * @extends {BaseAPI}
 */
export class MediaInfoApi extends Api {
  /**
   * closeLiveStream
   * @summary Closes a media source.
   * @param {MediaInfoApiCloseLiveStreamRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof MediaInfoApi
   */
  public async closeLiveStream(requestParameters: MediaInfoApiCloseLiveStreamRequest): Promise<void> {
    return this.apiClient.post({path: "/LiveStreams/Close", parameters: requestParameters})
  }

  /**
   * getBitrateTestBytes
   * @summary Tests the network with a request with the size of the bitrate.
   * @param {MediaInfoApiGetBitrateTestBytesRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof MediaInfoApi
   */
  public async getBitrateTestBytesUrl(requestParameters: MediaInfoApiGetBitrateTestBytesRequest = {}): Promise<string> {
    return this.apiClient.createUrl({ method: "GET", path: "/Playback/BitrateTest", parameters: requestParameters})
  }

  /**
   * getPlaybackInfo
   * @summary Gets live playback media info for an item.
   * @param {MediaInfoApiGetPlaybackInfoRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof MediaInfoApi
   */
  public async getPlaybackInfo(requestParameters: MediaInfoApiGetPlaybackInfoRequest): Promise<PlaybackInfoResponse> {
    this.assertParam(requestParameters.itemId)
    return this.apiClient.get({path: `/Items/${requestParameters.itemId}/PlaybackInfo`, parameters: requestParameters})
  }

  /**
   * For backwards compatibility parameters can be sent via Query or Body, with Query having higher precedence.  Query parameters are obsolete.
   * @summary Gets live playback media info for an item.
   * @param {MediaInfoApiGetPostedPlaybackInfoRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof MediaInfoApi
   */
  public async getPostedPlaybackInfo(requestParameters: MediaInfoApiGetPostedPlaybackInfoRequest): Promise<PlaybackInfoResponse> {
    this.assertParam(requestParameters.itemId)
    return this.apiClient.post({path: `/Items/${requestParameters.itemId}/PlaybackInfo`, data: requestParameters.playbackInfoDto})
  }

  /**
   * openLiveStream
   * @summary Opens a media source.
   * @param {MediaInfoApiOpenLiveStreamRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof MediaInfoApi
   */
  public async openLiveStream(requestParameters: MediaInfoApiOpenLiveStreamRequest = {}): Promise<LiveStreamResponse> {
    return this.apiClient.post({path: "/LiveStreams/Open", parameters: requestParameters, data: requestParameters.openLiveStreamDto})
  }
}