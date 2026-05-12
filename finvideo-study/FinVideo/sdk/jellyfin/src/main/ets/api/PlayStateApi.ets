import { Api } from "./Api"
import { PlayMethod } from "../model/PlayMethod"
import { PlaybackProgressInfo } from "../model/PlaybackProgressInfo"
import { PlaybackStartInfo } from "../model/PlaybackStartInfo"
import { PlaybackStopInfo } from "../model/PlaybackStopInfo"
import { UserItemDataDto } from "../model/UserItemDataDto"

/**
 * Request parameters for markPlayedItem operation in PlayStateApi.
 * @export
 * @interface PlayStateApiMarkPlayedItemRequest
 */
export interface PlayStateApiMarkPlayedItemRequest {
  /**
   * Item id.
   * @type {string}
   * @memberof PlayStateApiMarkPlayedItem
   */
  readonly itemId: string

  /**
   * User id.
   * @type {string}
   * @memberof PlayStateApiMarkPlayedItem
   */
  readonly userId?: string

  /**
   * Optional. The date the item was played.
   * @type {string}
   * @memberof PlayStateApiMarkPlayedItem
   */
  readonly datePlayed?: string
}

/**
 * Request parameters for markUnplayedItem operation in PlayStateApi.
 * @export
 * @interface PlayStateApiMarkUnplayedItemRequest
 */
export interface PlayStateApiMarkUnplayedItemRequest {
  /**
   * Item id.
   * @type {string}
   * @memberof PlayStateApiMarkUnplayedItem
   */
  readonly itemId: string

  /**
   * User id.
   * @type {string}
   * @memberof PlayStateApiMarkUnplayedItem
   */
  readonly userId?: string
}

/**
 * Request parameters for onPlaybackProgress operation in PlayStateApi.
 * @export
 * @interface PlayStateApiOnPlaybackProgressRequest
 */
export interface PlayStateApiOnPlaybackProgressRequest {
  /**
   * Item id.
   * @type {string}
   * @memberof PlayStateApiOnPlaybackProgress
   */
  readonly itemId: string

  /**
   * The id of the MediaSource.
   * @type {string}
   * @memberof PlayStateApiOnPlaybackProgress
   */
  readonly mediaSourceId?: string

  /**
   * Optional. The current position, in ticks. 1 tick &#x3D; 10000 ms.
   * @type {number}
   * @memberof PlayStateApiOnPlaybackProgress
   */
  readonly positionTicks?: number

  /**
   * The audio stream index.
   * @type {number}
   * @memberof PlayStateApiOnPlaybackProgress
   */
  readonly audioStreamIndex?: number

  /**
   * The subtitle stream index.
   * @type {number}
   * @memberof PlayStateApiOnPlaybackProgress
   */
  readonly subtitleStreamIndex?: number

  /**
   * Scale of 0-100.
   * @type {number}
   * @memberof PlayStateApiOnPlaybackProgress
   */
  readonly volumeLevel?: number

  /**
   * The play method.
   * @type {PlayMethod}
   * @memberof PlayStateApiOnPlaybackProgress
   */
  readonly playMethod?: PlayMethod

  /**
   * The live stream id.
   * @type {string}
   * @memberof PlayStateApiOnPlaybackProgress
   */
  readonly liveStreamId?: string

  /**
   * The play session id.
   * @type {string}
   * @memberof PlayStateApiOnPlaybackProgress
   */
  readonly playSessionId?: string

  /**
   * The repeat mode.
   * @type {RepeatMode}
   * @memberof PlayStateApiOnPlaybackProgress
   */
  readonly repeatMode?: RepeatMode

  /**
   * Indicates if the player is paused.
   * @type {boolean}
   * @memberof PlayStateApiOnPlaybackProgress
   */
  readonly isPaused?: boolean

  /**
   * Indicates if the player is muted.
   * @type {boolean}
   * @memberof PlayStateApiOnPlaybackProgress
   */
  readonly isMuted?: boolean
}

/**
 * Request parameters for onPlaybackStart operation in PlayStateApi.
 * @export
 * @interface PlayStateApiOnPlaybackStartRequest
 */
export interface PlayStateApiOnPlaybackStartRequest {
  /**
   * Item id.
   * @type {string}
   * @memberof PlayStateApiOnPlaybackStart
   */
  readonly itemId: string

  /**
   * The id of the MediaSource.
   * @type {string}
   * @memberof PlayStateApiOnPlaybackStart
   */
  readonly mediaSourceId?: string

  /**
   * The audio stream index.
   * @type {number}
   * @memberof PlayStateApiOnPlaybackStart
   */
  readonly audioStreamIndex?: number

  /**
   * The subtitle stream index.
   * @type {number}
   * @memberof PlayStateApiOnPlaybackStart
   */
  readonly subtitleStreamIndex?: number

  /**
   * The play method.
   * @type {PlayMethod}
   * @memberof PlayStateApiOnPlaybackStart
   */
  readonly playMethod?: PlayMethod

  /**
   * The live stream id.
   * @type {string}
   * @memberof PlayStateApiOnPlaybackStart
   */
  readonly liveStreamId?: string

  /**
   * The play session id.
   * @type {string}
   * @memberof PlayStateApiOnPlaybackStart
   */
  readonly playSessionId?: string

  /**
   * Indicates if the client can seek.
   * @type {boolean}
   * @memberof PlayStateApiOnPlaybackStart
   */
  readonly canSeek?: boolean
}

/**
 * Request parameters for onPlaybackStopped operation in PlayStateApi.
 * @export
 * @interface PlayStateApiOnPlaybackStoppedRequest
 */
export interface PlayStateApiOnPlaybackStoppedRequest {
  /**
   * Item id.
   * @type {string}
   * @memberof PlayStateApiOnPlaybackStopped
   */
  readonly itemId: string

  /**
   * The id of the MediaSource.
   * @type {string}
   * @memberof PlayStateApiOnPlaybackStopped
   */
  readonly mediaSourceId?: string

  /**
   * The next media type that will play.
   * @type {string}
   * @memberof PlayStateApiOnPlaybackStopped
   */
  readonly nextMediaType?: string

  /**
   * Optional. The position, in ticks, where playback stopped. 1 tick &#x3D; 10000 ms.
   * @type {number}
   * @memberof PlayStateApiOnPlaybackStopped
   */
  readonly positionTicks?: number

  /**
   * The live stream id.
   * @type {string}
   * @memberof PlayStateApiOnPlaybackStopped
   */
  readonly liveStreamId?: string

  /**
   * The play session id.
   * @type {string}
   * @memberof PlayStateApiOnPlaybackStopped
   */
  readonly playSessionId?: string
}

/**
 * Request parameters for pingPlaybackSession operation in PlayStateApi.
 * @export
 * @interface PlayStateApiPingPlaybackSessionRequest
 */
export interface PlayStateApiPingPlaybackSessionRequest {
  /**
   * Playback session id.
   * @type {string}
   * @memberof PlayStateApiPingPlaybackSession
   */
  readonly playSessionId: string
}

/**
 * Request parameters for reportPlaybackProgress operation in PlayStateApi.
 * @export
 * @interface PlayStateApiReportPlaybackProgressRequest
 */
export interface PlayStateApiReportPlaybackProgressRequest {
  /**
   * The playback progress info.
   * @type {PlaybackProgressInfo}
   * @memberof PlayStateApiReportPlaybackProgress
   */
  readonly playbackProgressInfo?: PlaybackProgressInfo
}

/**
 * Request parameters for reportPlaybackStart operation in PlayStateApi.
 * @export
 * @interface PlayStateApiReportPlaybackStartRequest
 */
export interface PlayStateApiReportPlaybackStartRequest {
  /**
   * The playback start info.
   * @type {PlaybackStartInfo}
   * @memberof PlayStateApiReportPlaybackStart
   */
  readonly playbackStartInfo?: PlaybackStartInfo
}

/**
 * Request parameters for reportPlaybackStopped operation in PlayStateApi.
 * @export
 * @interface PlayStateApiReportPlaybackStoppedRequest
 */
export interface PlayStateApiReportPlaybackStoppedRequest {
  /**
   * The playback stop info.
   * @type {PlaybackStopInfo}
   * @memberof PlayStateApiReportPlaybackStopped
   */
  readonly playbackStopInfo?: PlaybackStopInfo
}

/**
 * PlayStateApi - object-oriented interface
 * @export
 * @class PlayStateApi
 * @extends {BaseAPI}
 */
export class PlayStateApi extends Api {
  /**
   * markPlayedItem
   * @summary Marks an item as played for user.
   * @param {PlayStateApiMarkPlayedItemRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof PlayStateApi
   */
  public async markPlayedItem(requestParameters: PlayStateApiMarkPlayedItemRequest): Promise<UserItemDataDto> {
    this.assertParam(requestParameters.itemId)
    return this.apiClient.post({path: `/UserPlayedItems/${requestParameters.itemId}`, parameters: requestParameters})
  }

  /**
   * markUnplayedItem
   * @summary Marks an item as unplayed for user.
   * @param {PlayStateApiMarkUnplayedItemRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof PlayStateApi
   */
  public async markUnplayedItem(requestParameters: PlayStateApiMarkUnplayedItemRequest): Promise<UserItemDataDto> {
    this.assertParam(requestParameters.itemId)
    return this.apiClient.delete({path: `/UserPlayedItems/${requestParameters.itemId}`, parameters: requestParameters})
  }

  /**
   * onPlaybackProgress
   * @summary Reports a session\'s playback progress.
   * @param {PlayStateApiOnPlaybackProgressRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof PlayStateApi
   */
  public async onPlaybackProgress(requestParameters: PlayStateApiOnPlaybackProgressRequest): Promise<void> {
    this.assertParam(requestParameters.itemId)
    return this.apiClient.post({path: `/PlayingItems/${requestParameters.itemId}/Progress`, parameters: requestParameters})
  }

  /**
   * onPlaybackStart
   * @summary Reports that a session has begun playing an item.
   * @param {PlayStateApiOnPlaybackStartRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof PlayStateApi
   */
  public async onPlaybackStart(requestParameters: PlayStateApiOnPlaybackStartRequest): Promise<void> {
    this.assertParam(requestParameters.itemId)
    return this.apiClient.post({path: `/PlayingItems/${requestParameters.itemId}`, parameters: requestParameters})
  }

  /**
   * onPlaybackStopped
   * @summary Reports that a session has stopped playing an item.
   * @param {PlayStateApiOnPlaybackStoppedRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof PlayStateApi
   */
  public async onPlaybackStopped(requestParameters: PlayStateApiOnPlaybackStoppedRequest): Promise<void> {
    this.assertParam(requestParameters.itemId)
    return this.apiClient.delete({path: `/PlayingItems/${requestParameters.itemId}`, parameters: requestParameters})
  }

  /**
   * pingPlaybackSession
   * @summary Pings a playback session.
   * @param {PlayStateApiPingPlaybackSessionRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof PlayStateApi
   */
  public async pingPlaybackSession(requestParameters: PlayStateApiPingPlaybackSessionRequest): Promise<void> {
    return this.apiClient.post({path: "/Sessions/Playing/Ping", parameters: requestParameters})
  }

  /**
   * reportPlaybackProgress
   * @summary Reports playback progress within a session.
   * @param {PlayStateApiReportPlaybackProgressRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof PlayStateApi
   */
  public async reportPlaybackProgress(requestParameters: PlayStateApiReportPlaybackProgressRequest = {}): Promise<void> {
    return this.apiClient.post({path: "/Sessions/Playing/Progress", data: requestParameters.playbackProgressInfo})
  }

  /**
   * reportPlaybackStart
   * @summary Reports playback has started within a session.
   * @param {PlayStateApiReportPlaybackStartRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof PlayStateApi
   */
  public async reportPlaybackStart(requestParameters: PlayStateApiReportPlaybackStartRequest = {}): Promise<void> {
    return this.apiClient.post({path: "/Sessions/Playing", data: requestParameters.playbackStartInfo})
  }

  /**
   * reportPlaybackStopped
   * @summary Reports playback has stopped within a session.
   * @param {PlayStateApiReportPlaybackStoppedRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof PlayStateApi
   */
  public async reportPlaybackStopped(requestParameters: PlayStateApiReportPlaybackStoppedRequest = {}): Promise<void> {
    return this.apiClient.post({path: "/Sessions/Playing/Stopped", data: requestParameters.playbackStopInfo})
  }
}