import { Api } from "./Api"

/**
 * Request parameters for getTrickPlayHlsPlaylist operation in TrickPlayApi.
 * @export
 * @interface TrickPlayApiGetTrickPlayHlsPlaylistRequest
 */
export interface TrickPlayApiGetTrickPlayHlsPlaylistRequest {
  /**
   * The item id.
   * @type {string}
   * @memberof TrickPlayApiGetTrickPlayHlsPlaylist
   */
  readonly itemId: string

  /**
   * The width of a single tile.
   * @type {number}
   * @memberof TrickPlayApiGetTrickPlayHlsPlaylist
   */
  readonly width: number

  /**
   * The media version id, if using an alternate version.
   * @type {string}
   * @memberof TrickPlayApiGetTrickPlayHlsPlaylist
   */
  readonly mediaSourceId?: string
}

/**
 * Request parameters for getTrickPlayTileImage operation in TrickPlayApi.
 * @export
 * @interface TrickPlayApiGetTrickPlayTileImageRequest
 */
export interface TrickPlayApiGetTrickPlayTileImageRequest {
  /**
   * The item id.
   * @type {string}
   * @memberof TrickPlayApiGetTrickPlayTileImage
   */
  readonly itemId: string

  /**
   * The width of a single tile.
   * @type {number}
   * @memberof TrickPlayApiGetTrickPlayTileImage
   */
  readonly width: number

  /**
   * The index of the desired tile.
   * @type {number}
   * @memberof TrickPlayApiGetTrickPlayTileImage
   */
  readonly index: number

  /**
   * The media version id, if using an alternate version.
   * @type {string}
   * @memberof TrickPlayApiGetTrickPlayTileImage
   */
  readonly mediaSourceId?: string
}

/**
 * TrickPlayApi - object-oriented interface
 * @export
 * @class TrickPlayApi
 * @extends {BaseAPI}
 */
export class TrickPlayApi extends Api {
  /**
   * getTrickPlayHlsPlaylistUrl
   * @summary Gets an image tiles playlist for trickplay.
   * @param {TrickPlayApiGetTrickPlayHlsPlaylistRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof TrickPlayApi
   */
  public async getTrickPlayHlsPlaylistUrl(requestParameters: TrickPlayApiGetTrickPlayHlsPlaylistRequest): Promise<string> {
    this.assertParam(requestParameters.itemId)
    this.assertParam(requestParameters.width)
    return this.apiClient.createUrl({ path: `/Videos/${requestParameters.itemId}/Trickplay/${requestParameters.width}/tiles.m3u8`, parameters: requestParameters })
  }

  /**
   * getTrickPlayTileImageUrl
   * @summary Gets a trickplay tile image.
   * @param {TrickPlayApiGetTrickPlayTileImageRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof TrickPlayApi
   */
  public async getTrickPlayTileImageUrl(requestParameters: TrickPlayApiGetTrickPlayTileImageRequest): Promise<string> {
    this.assertParam(requestParameters.itemId)
    this.assertParam(requestParameters.width)
    this.assertParam(requestParameters.index)
    return this.apiClient.createUrl({ path: `/Videos/${requestParameters.itemId}/Trickplay/${requestParameters.width}/${requestParameters.index}.jpg`, parameters: requestParameters })
  }
}