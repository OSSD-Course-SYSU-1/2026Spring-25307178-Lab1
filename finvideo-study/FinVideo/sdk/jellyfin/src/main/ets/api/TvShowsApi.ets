import { BaseItemDtoQueryResult } from "../model/BaseItemDtoQueryResult"
import { ImageType } from "../model/ImageType"
import { ItemFields } from "../model/ItemFields"
import { ItemSortBy } from "../model/ItemSortBy"
import { Api } from "./Api"

/**
 * Request parameters for getEpisodes operation in TvShowsApi.
 * @export
 * @interface TvShowsApiGetEpisodesRequest
 */
export interface TvShowsApiGetEpisodesRequest {
  /**
   * The series id.
   * @type {string}
   * @memberof TvShowsApiGetEpisodes
   */
  readonly seriesId: string

  /**
   * The user id.
   * @type {string}
   * @memberof TvShowsApiGetEpisodes
   */
  readonly userId?: string

  /**
   * Optional. Specify additional fields of information to return in the output. This allows multiple, comma delimited. Options: Budget, Chapters, DateCreated, Genres, HomePageUrl, IndexOptions, MediaStreams, Overview, ParentId, Path, People, ProviderIds, PrimaryImageAspectRatio, Revenue, SortName, Studios, Taglines, TrailerUrls.
   * @type {Array<ItemFields>}
   * @memberof TvShowsApiGetEpisodes
   */
  readonly fields?: Array<ItemFields>

  /**
   * Optional filter by season number.
   * @type {number}
   * @memberof TvShowsApiGetEpisodes
   */
  readonly season?: number

  /**
   * Optional. Filter by season id.
   * @type {string}
   * @memberof TvShowsApiGetEpisodes
   */
  readonly seasonId?: string

  /**
   * Optional. Filter by items that are missing episodes or not.
   * @type {boolean}
   * @memberof TvShowsApiGetEpisodes
   */
  readonly isMissing?: boolean

  /**
   * Optional. Return items that are siblings of a supplied item.
   * @type {string}
   * @memberof TvShowsApiGetEpisodes
   */
  readonly adjacentTo?: string

  /**
   * Optional. Skip through the list until a given item is found.
   * @type {string}
   * @memberof TvShowsApiGetEpisodes
   */
  readonly startItemId?: string

  /**
   * Optional. The record index to start at. All items with a lower index will be dropped from the results.
   * @type {number}
   * @memberof TvShowsApiGetEpisodes
   */
  readonly startIndex?: number

  /**
   * Optional. The maximum number of records to return.
   * @type {number}
   * @memberof TvShowsApiGetEpisodes
   */
  readonly limit?: number

  /**
   * Optional, include image information in output.
   * @type {boolean}
   * @memberof TvShowsApiGetEpisodes
   */
  readonly enableImages?: boolean

  /**
   * Optional, the max number of images to return, per image type.
   * @type {number}
   * @memberof TvShowsApiGetEpisodes
   */
  readonly imageTypeLimit?: number

  /**
   * Optional. The image types to include in the output.
   * @type {Array<ImageType>}
   * @memberof TvShowsApiGetEpisodes
   */
  readonly enableImageTypes?: Array<ImageType>

  /**
   * Optional. Include user data.
   * @type {boolean}
   * @memberof TvShowsApiGetEpisodes
   */
  readonly enableUserData?: boolean

  /**
   * Optional. Specify one or more sort orders, comma delimited. Options: Album, AlbumArtist, Artist, Budget, CommunityRating, CriticRating, DateCreated, DatePlayed, PlayCount, PremiereDate, ProductionYear, SortName, Random, Revenue, Runtime.
   * @type {ItemSortBy}
   * @memberof TvShowsApiGetEpisodes
   */
  readonly sortBy?: ItemSortBy
}

/**
 * Request parameters for getNextUp operation in TvShowsApi.
 * @export
 * @interface TvShowsApiGetNextUpRequest
 */
export interface TvShowsApiGetNextUpRequest {
  /**
   * The user id of the user to get the next up episodes for.
   * @type {string}
   * @memberof TvShowsApiGetNextUp
   */
  readonly userId?: string

  /**
   * Optional. The record index to start at. All items with a lower index will be dropped from the results.
   * @type {number}
   * @memberof TvShowsApiGetNextUp
   */
  readonly startIndex?: number

  /**
   * Optional. The maximum number of records to return.
   * @type {number}
   * @memberof TvShowsApiGetNextUp
   */
  readonly limit?: number

  /**
   * Optional. Specify additional fields of information to return in the output.
   * @type {Array<ItemFields>}
   * @memberof TvShowsApiGetNextUp
   */
  readonly fields?: Array<ItemFields>

  /**
   * Optional. Filter by series id.
   * @type {string}
   * @memberof TvShowsApiGetNextUp
   */
  readonly seriesId?: string

  /**
   * Optional. Specify this to localize the search to a specific item or folder. Omit to use the root.
   * @type {string}
   * @memberof TvShowsApiGetNextUp
   */
  readonly parentId?: string

  /**
   * Optional. Include image information in output.
   * @type {boolean}
   * @memberof TvShowsApiGetNextUp
   */
  readonly enableImages?: boolean

  /**
   * Optional. The max number of images to return, per image type.
   * @type {number}
   * @memberof TvShowsApiGetNextUp
   */
  readonly imageTypeLimit?: number

  /**
   * Optional. The image types to include in the output.
   * @type {Array<ImageType>}
   * @memberof TvShowsApiGetNextUp
   */
  readonly enableImageTypes?: Array<ImageType>

  /**
   * Optional. Include user data.
   * @type {boolean}
   * @memberof TvShowsApiGetNextUp
   */
  readonly enableUserData?: boolean

  /**
   * Optional. Starting date of shows to show in Next Up section.
   * @type {string}
   * @memberof TvShowsApiGetNextUp
   */
  readonly nextUpDateCutoff?: string

  /**
   * Whether to enable the total records count. Defaults to true.
   * @type {boolean}
   * @memberof TvShowsApiGetNextUp
   */
  readonly enableTotalRecordCount?: boolean

  /**
   * Whether to disable sending the first episode in a series as next up.
   * @type {boolean}
   * @memberof TvShowsApiGetNextUp
   */
  readonly disableFirstEpisode?: boolean

  /**
   * Whether to include resumable episodes in next up results.
   * @type {boolean}
   * @memberof TvShowsApiGetNextUp
   */
  readonly enableResumable?: boolean

  /**
   * Whether to include watched episodes in next up results.
   * @type {boolean}
   * @memberof TvShowsApiGetNextUp
   */
  readonly enableRewatching?: boolean
}

/**
 * Request parameters for getSeasons operation in TvShowsApi.
 * @export
 * @interface TvShowsApiGetSeasonsRequest
 */
export interface TvShowsApiGetSeasonsRequest {
  /**
   * The series id.
   * @type {string}
   * @memberof TvShowsApiGetSeasons
   */
  readonly seriesId: string

  /**
   * The user id.
   * @type {string}
   * @memberof TvShowsApiGetSeasons
   */
  readonly userId?: string

  /**
   * Optional. Specify additional fields of information to return in the output. This allows multiple, comma delimited. Options: Budget, Chapters, DateCreated, Genres, HomePageUrl, IndexOptions, MediaStreams, Overview, ParentId, Path, People, ProviderIds, PrimaryImageAspectRatio, Revenue, SortName, Studios, Taglines, TrailerUrls.
   * @type {Array<ItemFields>}
   * @memberof TvShowsApiGetSeasons
   */
  readonly fields?: Array<ItemFields>

  /**
   * Optional. Filter by special season.
   * @type {boolean}
   * @memberof TvShowsApiGetSeasons
   */
  readonly isSpecialSeason?: boolean

  /**
   * Optional. Filter by items that are missing episodes or not.
   * @type {boolean}
   * @memberof TvShowsApiGetSeasons
   */
  readonly isMissing?: boolean

  /**
   * Optional. Return items that are siblings of a supplied item.
   * @type {string}
   * @memberof TvShowsApiGetSeasons
   */
  readonly adjacentTo?: string

  /**
   * Optional. Include image information in output.
   * @type {boolean}
   * @memberof TvShowsApiGetSeasons
   */
  readonly enableImages?: boolean

  /**
   * Optional. The max number of images to return, per image type.
   * @type {number}
   * @memberof TvShowsApiGetSeasons
   */
  readonly imageTypeLimit?: number

  /**
   * Optional. The image types to include in the output.
   * @type {Array<ImageType>}
   * @memberof TvShowsApiGetSeasons
   */
  readonly enableImageTypes?: Array<ImageType>

  /**
   * Optional. Include user data.
   * @type {boolean}
   * @memberof TvShowsApiGetSeasons
   */
  readonly enableUserData?: boolean
}

/**
 * Request parameters for getUpcomingEpisodes operation in TvShowsApi.
 * @export
 * @interface TvShowsApiGetUpcomingEpisodesRequest
 */
export interface TvShowsApiGetUpcomingEpisodesRequest {
  /**
   * The user id of the user to get the upcoming episodes for.
   * @type {string}
   * @memberof TvShowsApiGetUpcomingEpisodes
   */
  readonly userId?: string

  /**
   * Optional. The record index to start at. All items with a lower index will be dropped from the results.
   * @type {number}
   * @memberof TvShowsApiGetUpcomingEpisodes
   */
  readonly startIndex?: number

  /**
   * Optional. The maximum number of records to return.
   * @type {number}
   * @memberof TvShowsApiGetUpcomingEpisodes
   */
  readonly limit?: number

  /**
   * Optional. Specify additional fields of information to return in the output.
   * @type {Array<ItemFields>}
   * @memberof TvShowsApiGetUpcomingEpisodes
   */
  readonly fields?: Array<ItemFields>

  /**
   * Optional. Specify this to localize the search to a specific item or folder. Omit to use the root.
   * @type {string}
   * @memberof TvShowsApiGetUpcomingEpisodes
   */
  readonly parentId?: string

  /**
   * Optional. Include image information in output.
   * @type {boolean}
   * @memberof TvShowsApiGetUpcomingEpisodes
   */
  readonly enableImages?: boolean

  /**
   * Optional. The max number of images to return, per image type.
   * @type {number}
   * @memberof TvShowsApiGetUpcomingEpisodes
   */
  readonly imageTypeLimit?: number

  /**
   * Optional. The image types to include in the output.
   * @type {Array<ImageType>}
   * @memberof TvShowsApiGetUpcomingEpisodes
   */
  readonly enableImageTypes?: Array<ImageType>

  /**
   * Optional. Include user data.
   * @type {boolean}
   * @memberof TvShowsApiGetUpcomingEpisodes
   */
  readonly enableUserData?: boolean
}

/**
 * TvShowsApi - object-oriented interface
 * @export
 * @class TvShowsApi
 * @extends {BaseAPI}
 */
export class TvShowsApi extends Api {
  /**
   * getEpisodes
   * @summary Gets episodes for a tv season.
   * @param {TvShowsApiGetEpisodesRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof TvShowsApi
   */
  public async getEpisodes(requestParameters: TvShowsApiGetEpisodesRequest): Promise<BaseItemDtoQueryResult> {
    this.assertParam(requestParameters.seriesId)
    return this.apiClient.get({path: `/Shows/${requestParameters.seriesId}/Episodes`, parameters: requestParameters})
  }

  /**
   * getNextUp
   * @summary Gets a list of next up episodes.
   * @param {TvShowsApiGetNextUpRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof TvShowsApi
   */
  public async getNextUp(requestParameters: TvShowsApiGetNextUpRequest = {}): Promise<BaseItemDtoQueryResult> {
    return this.apiClient.get({path: "/Shows/NextUp", parameters: requestParameters})
  }

  /**
   * getSeasons
   * @summary Gets seasons for a tv series.
   * @param {TvShowsApiGetSeasonsRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof TvShowsApi
   */
  public async getSeasons(requestParameters: TvShowsApiGetSeasonsRequest): Promise<BaseItemDtoQueryResult> {
    this.assertParam(requestParameters.seriesId)
    return this.apiClient.get({path: `/Shows/${requestParameters.seriesId}/Seasons`, parameters: requestParameters})
  }

  /**
   * getUpcomingEpisodes
   * @summary Gets a list of upcoming episodes.
   * @param {TvShowsApiGetUpcomingEpisodesRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof TvShowsApi
   */
  public async getUpcomingEpisodes(requestParameters: TvShowsApiGetUpcomingEpisodesRequest = {}): Promise<BaseItemDtoQueryResult> {
    return this.apiClient.get({path: "/Shows/Upcoming", parameters: requestParameters})
  }
}