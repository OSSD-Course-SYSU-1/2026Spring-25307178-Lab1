import { Api } from "./Api";
import { BaseItemKind } from "../model/BaseItemKind";
import { ImageType } from "../model/ImageType";
import { ItemFields } from "../model/ItemFields";
import { ItemFilter } from "../model/ItemFilter";
import { ItemSortBy } from "../model/ItemSortBy";
import { LocationType } from "../model/LocationType";
import { MediaType } from "../model/MediaType";
import { SeriesStatus } from "../model/SeriesStatus";
import { SortOrder } from "../model/SortOrder";
import { VideoType } from "../model/VideoType";
import { UpdateUserItemDataDto } from "../model/UpdateUserItemDataDto";
import { UserItemDataDto } from "../model/UserItemDataDto";
import { BaseItemDtoQueryResult } from "../model/BaseItemDtoQueryResult";

/**
 * Request parameters for getItemUserData operation in ItemsApi.
 * @export
 * @interface ItemsApiGetItemUserDataRequest
 */
export interface ItemsApiGetItemUserDataRequest {
  /**
   * The item id.
   * @type {string}
   * @memberof ItemsApiGetItemUserData
   */
  readonly itemId: string

  /**
   * The user id.
   * @type {string}
   * @memberof ItemsApiGetItemUserData
   */
  readonly userId?: string
}

/**
 * Request parameters for getItems operation in ItemsApi.
 * @export
 * @interface ItemsApiGetItemsRequest
 */
export interface ItemsApiGetItemsRequest {
  /**
   * The user id supplied as query parameter; this is required when not using an API key.
   * @type {string}
   * @memberof ItemsApiGetItems
   */
  readonly userId?: string

  /**
   * Optional filter by maximum official rating (PG, PG-13, TV-MA, etc).
   * @type {string}
   * @memberof ItemsApiGetItems
   */
  readonly maxOfficialRating?: string

  /**
   * Optional filter by items with theme songs.
   * @type {boolean}
   * @memberof ItemsApiGetItems
   */
  readonly hasThemeSong?: boolean

  /**
   * Optional filter by items with theme videos.
   * @type {boolean}
   * @memberof ItemsApiGetItems
   */
  readonly hasThemeVideo?: boolean

  /**
   * Optional filter by items with subtitles.
   * @type {boolean}
   * @memberof ItemsApiGetItems
   */
  readonly hasSubtitles?: boolean

  /**
   * Optional filter by items with special features.
   * @type {boolean}
   * @memberof ItemsApiGetItems
   */
  readonly hasSpecialFeature?: boolean

  /**
   * Optional filter by items with trailers.
   * @type {boolean}
   * @memberof ItemsApiGetItems
   */
  readonly hasTrailer?: boolean

  /**
   * Optional. Return items that are siblings of a supplied item.
   * @type {string}
   * @memberof ItemsApiGetItems
   */
  readonly adjacentTo?: string

  /**
   * Optional filter by parent index number.
   * @type {number}
   * @memberof ItemsApiGetItems
   */
  readonly parentIndexNumber?: number

  /**
   * Optional filter by items that have or do not have a parental rating.
   * @type {boolean}
   * @memberof ItemsApiGetItems
   */
  readonly hasParentalRating?: boolean

  /**
   * Optional filter by items that are HD or not.
   * @type {boolean}
   * @memberof ItemsApiGetItems
   */
  readonly isHd?: boolean

  /**
   * Optional filter by items that are 4K or not.
   * @type {boolean}
   * @memberof ItemsApiGetItems
   */
  readonly is4K?: boolean

  /**
   * Optional. If specified, results will be filtered based on LocationType. This allows multiple, comma delimited.
   * @type {Array<LocationType>}
   * @memberof ItemsApiGetItems
   */
  readonly locationTypes?: Array<LocationType>

  /**
   * Optional. If specified, results will be filtered based on the LocationType. This allows multiple, comma delimited.
   * @type {Array<LocationType>}
   * @memberof ItemsApiGetItems
   */
  readonly excludeLocationTypes?: Array<LocationType>

  /**
   * Optional filter by items that are missing episodes or not.
   * @type {boolean}
   * @memberof ItemsApiGetItems
   */
  readonly isMissing?: boolean

  /**
   * Optional filter by items that are unaired episodes or not.
   * @type {boolean}
   * @memberof ItemsApiGetItems
   */
  readonly isUnaired?: boolean

  /**
   * Optional filter by minimum community rating.
   * @type {number}
   * @memberof ItemsApiGetItems
   */
  readonly minCommunityRating?: number

  /**
   * Optional filter by minimum critic rating.
   * @type {number}
   * @memberof ItemsApiGetItems
   */
  readonly minCriticRating?: number

  /**
   * Optional. The minimum premiere date. Format &#x3D; ISO.
   * @type {string}
   * @memberof ItemsApiGetItems
   */
  readonly minPremiereDate?: string

  /**
   * Optional. The minimum last saved date. Format &#x3D; ISO.
   * @type {string}
   * @memberof ItemsApiGetItems
   */
  readonly minDateLastSaved?: string

  /**
   * Optional. The minimum last saved date for the current user. Format &#x3D; ISO.
   * @type {string}
   * @memberof ItemsApiGetItems
   */
  readonly minDateLastSavedForUser?: string

  /**
   * Optional. The maximum premiere date. Format &#x3D; ISO.
   * @type {string}
   * @memberof ItemsApiGetItems
   */
  readonly maxPremiereDate?: string

  /**
   * Optional filter by items that have an overview or not.
   * @type {boolean}
   * @memberof ItemsApiGetItems
   */
  readonly hasOverview?: boolean

  /**
   * Optional filter by items that have an IMDb id or not.
   * @type {boolean}
   * @memberof ItemsApiGetItems
   */
  readonly hasImdbId?: boolean

  /**
   * Optional filter by items that have a TMDb id or not.
   * @type {boolean}
   * @memberof ItemsApiGetItems
   */
  readonly hasTmdbId?: boolean

  /**
   * Optional filter by items that have a TVDb id or not.
   * @type {boolean}
   * @memberof ItemsApiGetItems
   */
  readonly hasTvdbId?: boolean

  /**
   * Optional filter for live tv movies.
   * @type {boolean}
   * @memberof ItemsApiGetItems
   */
  readonly isMovie?: boolean

  /**
   * Optional filter for live tv series.
   * @type {boolean}
   * @memberof ItemsApiGetItems
   */
  readonly isSeries?: boolean

  /**
   * Optional filter for live tv news.
   * @type {boolean}
   * @memberof ItemsApiGetItems
   */
  readonly isNews?: boolean

  /**
   * Optional filter for live tv kids.
   * @type {boolean}
   * @memberof ItemsApiGetItems
   */
  readonly isKids?: boolean

  /**
   * Optional filter for live tv sports.
   * @type {boolean}
   * @memberof ItemsApiGetItems
   */
  readonly isSports?: boolean

  /**
   * Optional. If specified, results will be filtered by excluding item ids. This allows multiple, comma delimited.
   * @type {Array<string>}
   * @memberof ItemsApiGetItems
   */
  readonly excludeItemIds?: Array<string>

  /**
   * Optional. The record index to start at. All items with a lower index will be dropped from the results.
   * @type {number}
   * @memberof ItemsApiGetItems
   */
  readonly startIndex?: number

  /**
   * Optional. The maximum number of records to return.
   * @type {number}
   * @memberof ItemsApiGetItems
   */
  readonly limit?: number

  /**
   * When searching within folders, this determines whether or not the search will be recursive. true/false.
   * @type {boolean}
   * @memberof ItemsApiGetItems
   */
  readonly recursive?: boolean

  /**
   * Optional. Filter based on a search term.
   * @type {string}
   * @memberof ItemsApiGetItems
   */
  readonly searchTerm?: string

  /**
   * Sort Order - Ascending, Descending.
   * @type {Array<SortOrder>}
   * @memberof ItemsApiGetItems
   */
  readonly sortOrder?: Array<SortOrder>

  /**
   * Specify this to localize the search to a specific item or folder. Omit to use the root.
   * @type {string}
   * @memberof ItemsApiGetItems
   */
  readonly parentId?: string

  /**
   * Optional. Specify additional fields of information to return in the output. This allows multiple, comma delimited. Options: Budget, Chapters, DateCreated, Genres, HomePageUrl, IndexOptions, MediaStreams, Overview, ParentId, Path, People, ProviderIds, PrimaryImageAspectRatio, Revenue, SortName, Studios, Taglines.
   * @type {Array<ItemFields>}
   * @memberof ItemsApiGetItems
   */
  readonly fields?: Array<ItemFields>

  /**
   * Optional. If specified, results will be filtered based on item type. This allows multiple, comma delimited.
   * @type {Array<BaseItemKind>}
   * @memberof ItemsApiGetItems
   */
  readonly excludeItemTypes?: Array<BaseItemKind>

  /**
   * Optional. If specified, results will be filtered based on the item type. This allows multiple, comma delimited.
   * @type {Array<BaseItemKind>}
   * @memberof ItemsApiGetItems
   */
  readonly includeItemTypes?: Array<BaseItemKind>

  /**
   * Optional. Specify additional filters to apply. This allows multiple, comma delimited. Options: IsFolder, IsNotFolder, IsUnplayed, IsPlayed, IsFavorite, IsResumable, Likes, Dislikes.
   * @type {Array<ItemFilter>}
   * @memberof ItemsApiGetItems
   */
  readonly filters?: Array<ItemFilter>

  /**
   * Optional filter by items that are marked as favorite, or not.
   * @type {boolean}
   * @memberof ItemsApiGetItems
   */
  readonly isFavorite?: boolean

  /**
   * Optional filter by MediaType. Allows multiple, comma delimited.
   * @type {Array<MediaType>}
   * @memberof ItemsApiGetItems
   */
  readonly mediaTypes?: Array<MediaType>

  /**
   * Optional. If specified, results will be filtered based on those containing image types. This allows multiple, comma delimited.
   * @type {Array<ImageType>}
   * @memberof ItemsApiGetItems
   */
  readonly imageTypes?: Array<ImageType>

  /**
   * Optional. Specify one or more sort orders, comma delimited. Options: Album, AlbumArtist, Artist, Budget, CommunityRating, CriticRating, DateCreated, DatePlayed, PlayCount, PremiereDate, ProductionYear, SortName, Random, Revenue, Runtime.
   * @type {Array<ItemSortBy>}
   * @memberof ItemsApiGetItems
   */
  readonly sortBy?: Array<ItemSortBy>

  /**
   * Optional filter by items that are played, or not.
   * @type {boolean}
   * @memberof ItemsApiGetItems
   */
  readonly isPlayed?: boolean

  /**
   * Optional. If specified, results will be filtered based on genre. This allows multiple, pipe delimited.
   * @type {Array<string>}
   * @memberof ItemsApiGetItems
   */
  readonly genres?: Array<string>

  /**
   * Optional. If specified, results will be filtered based on OfficialRating. This allows multiple, pipe delimited.
   * @type {Array<string>}
   * @memberof ItemsApiGetItems
   */
  readonly officialRatings?: Array<string>

  /**
   * Optional. If specified, results will be filtered based on tag. This allows multiple, pipe delimited.
   * @type {Array<string>}
   * @memberof ItemsApiGetItems
   */
  readonly tags?: Array<string>

  /**
   * Optional. If specified, results will be filtered based on production year. This allows multiple, comma delimited.
   * @type {Array<number>}
   * @memberof ItemsApiGetItems
   */
  readonly years?: Array<number>

  /**
   * Optional, include user data.
   * @type {boolean}
   * @memberof ItemsApiGetItems
   */
  readonly enableUserData?: boolean

  /**
   * Optional, the max number of images to return, per image type.
   * @type {number}
   * @memberof ItemsApiGetItems
   */
  readonly imageTypeLimit?: number

  /**
   * Optional. The image types to include in the output.
   * @type {Array<ImageType>}
   * @memberof ItemsApiGetItems
   */
  readonly enableImageTypes?: Array<ImageType>

  /**
   * Optional. If specified, results will be filtered to include only those containing the specified person.
   * @type {string}
   * @memberof ItemsApiGetItems
   */
  readonly person?: string

  /**
   * Optional. If specified, results will be filtered to include only those containing the specified person id.
   * @type {Array<string>}
   * @memberof ItemsApiGetItems
   */
  readonly personIds?: Array<string>

  /**
   * Optional. If specified, along with Person, results will be filtered to include only those containing the specified person and PersonType. Allows multiple, comma-delimited.
   * @type {Array<string>}
   * @memberof ItemsApiGetItems
   */
  readonly personTypes?: Array<string>

  /**
   * Optional. If specified, results will be filtered based on studio. This allows multiple, pipe delimited.
   * @type {Array<string>}
   * @memberof ItemsApiGetItems
   */
  readonly studios?: Array<string>

  /**
   * Optional. If specified, results will be filtered based on artists. This allows multiple, pipe delimited.
   * @type {Array<string>}
   * @memberof ItemsApiGetItems
   */
  readonly artists?: Array<string>

  /**
   * Optional. If specified, results will be filtered based on artist id. This allows multiple, pipe delimited.
   * @type {Array<string>}
   * @memberof ItemsApiGetItems
   */
  readonly excludeArtistIds?: Array<string>

  /**
   * Optional. If specified, results will be filtered to include only those containing the specified artist id.
   * @type {Array<string>}
   * @memberof ItemsApiGetItems
   */
  readonly artistIds?: Array<string>

  /**
   * Optional. If specified, results will be filtered to include only those containing the specified album artist id.
   * @type {Array<string>}
   * @memberof ItemsApiGetItems
   */
  readonly albumArtistIds?: Array<string>

  /**
   * Optional. If specified, results will be filtered to include only those containing the specified contributing artist id.
   * @type {Array<string>}
   * @memberof ItemsApiGetItems
   */
  readonly contributingArtistIds?: Array<string>

  /**
   * Optional. If specified, results will be filtered based on album. This allows multiple, pipe delimited.
   * @type {Array<string>}
   * @memberof ItemsApiGetItems
   */
  readonly albums?: Array<string>

  /**
   * Optional. If specified, results will be filtered based on album id. This allows multiple, pipe delimited.
   * @type {Array<string>}
   * @memberof ItemsApiGetItems
   */
  readonly albumIds?: Array<string>

  /**
   * Optional. If specific items are needed, specify a list of item id\&#39;s to retrieve. This allows multiple, comma delimited.
   * @type {Array<string>}
   * @memberof ItemsApiGetItems
   */
  readonly ids?: Array<string>

  /**
   * Optional filter by VideoType (videofile, dvd, bluray, iso). Allows multiple, comma delimited.
   * @type {Array<VideoType>}
   * @memberof ItemsApiGetItems
   */
  readonly videoTypes?: Array<VideoType>

  /**
   * Optional filter by minimum official rating (PG, PG-13, TV-MA, etc).
   * @type {string}
   * @memberof ItemsApiGetItems
   */
  readonly minOfficialRating?: string

  /**
   * Optional filter by items that are locked.
   * @type {boolean}
   * @memberof ItemsApiGetItems
   */
  readonly isLocked?: boolean

  /**
   * Optional filter by items that are placeholders.
   * @type {boolean}
   * @memberof ItemsApiGetItems
   */
  readonly isPlaceHolder?: boolean

  /**
   * Optional filter by items that have official ratings.
   * @type {boolean}
   * @memberof ItemsApiGetItems
   */
  readonly hasOfficialRating?: boolean

  /**
   * Whether or not to hide items behind their boxsets.
   * @type {boolean}
   * @memberof ItemsApiGetItems
   */
  readonly collapseBoxSetItems?: boolean

  /**
   * Optional. Filter by the minimum width of the item.
   * @type {number}
   * @memberof ItemsApiGetItems
   */
  readonly minWidth?: number

  /**
   * Optional. Filter by the minimum height of the item.
   * @type {number}
   * @memberof ItemsApiGetItems
   */
  readonly minHeight?: number

  /**
   * Optional. Filter by the maximum width of the item.
   * @type {number}
   * @memberof ItemsApiGetItems
   */
  readonly maxWidth?: number

  /**
   * Optional. Filter by the maximum height of the item.
   * @type {number}
   * @memberof ItemsApiGetItems
   */
  readonly maxHeight?: number

  /**
   * Optional filter by items that are 3D, or not.
   * @type {boolean}
   * @memberof ItemsApiGetItems
   */
  readonly is3D?: boolean

  /**
   * Optional filter by Series Status. Allows multiple, comma delimited.
   * @type {Array<SeriesStatus>}
   * @memberof ItemsApiGetItems
   */
  readonly seriesStatus?: Array<SeriesStatus>

  /**
   * Optional filter by items whose name is sorted equally or greater than a given input string.
   * @type {string}
   * @memberof ItemsApiGetItems
   */
  readonly nameStartsWithOrGreater?: string

  /**
   * Optional filter by items whose name is sorted equally than a given input string.
   * @type {string}
   * @memberof ItemsApiGetItems
   */
  readonly nameStartsWith?: string

  /**
   * Optional filter by items whose name is equally or lesser than a given input string.
   * @type {string}
   * @memberof ItemsApiGetItems
   */
  readonly nameLessThan?: string

  /**
   * Optional. If specified, results will be filtered based on studio id. This allows multiple, pipe delimited.
   * @type {Array<string>}
   * @memberof ItemsApiGetItems
   */
  readonly studioIds?: Array<string>

  /**
   * Optional. If specified, results will be filtered based on genre id. This allows multiple, pipe delimited.
   * @type {Array<string>}
   * @memberof ItemsApiGetItems
   */
  readonly genreIds?: Array<string>

  /**
   * Optional. Enable the total record count.
   * @type {boolean}
   * @memberof ItemsApiGetItems
   */
  readonly enableTotalRecordCount?: boolean

  /**
   * Optional, include image information in output.
   * @type {boolean}
   * @memberof ItemsApiGetItems
   */
  readonly enableImages?: boolean
}

/**
 * Request parameters for getResumeItems operation in ItemsApi.
 * @export
 * @interface ItemsApiGetResumeItemsRequest
 */
export interface ItemsApiGetResumeItemsRequest {
  /**
   * The user id.
   * @type {string}
   * @memberof ItemsApiGetResumeItems
   */
  readonly userId?: string

  /**
   * The start index.
   * @type {number}
   * @memberof ItemsApiGetResumeItems
   */
  readonly startIndex?: number

  /**
   * The item limit.
   * @type {number}
   * @memberof ItemsApiGetResumeItems
   */
  readonly limit?: number

  /**
   * The search term.
   * @type {string}
   * @memberof ItemsApiGetResumeItems
   */
  readonly searchTerm?: string

  /**
   * Specify this to localize the search to a specific item or folder. Omit to use the root.
   * @type {string}
   * @memberof ItemsApiGetResumeItems
   */
  readonly parentId?: string

  /**
   * Optional. Specify additional fields of information to return in the output. This allows multiple, comma delimited. Options: Budget, Chapters, DateCreated, Genres, HomePageUrl, IndexOptions, MediaStreams, Overview, ParentId, Path, People, ProviderIds, PrimaryImageAspectRatio, Revenue, SortName, Studios, Taglines.
   * @type {Array<ItemFields>}
   * @memberof ItemsApiGetResumeItems
   */
  readonly fields?: Array<ItemFields>

  /**
   * Optional. Filter by MediaType. Allows multiple, comma delimited.
   * @type {Array<MediaType>}
   * @memberof ItemsApiGetResumeItems
   */
  readonly mediaTypes?: Array<MediaType>

  /**
   * Optional. Include user data.
   * @type {boolean}
   * @memberof ItemsApiGetResumeItems
   */
  readonly enableUserData?: boolean

  /**
   * Optional. The max number of images to return, per image type.
   * @type {number}
   * @memberof ItemsApiGetResumeItems
   */
  readonly imageTypeLimit?: number

  /**
   * Optional. The image types to include in the output.
   * @type {Array<ImageType>}
   * @memberof ItemsApiGetResumeItems
   */
  readonly enableImageTypes?: Array<ImageType>

  /**
   * Optional. If specified, results will be filtered based on item type. This allows multiple, comma delimited.
   * @type {Array<BaseItemKind>}
   * @memberof ItemsApiGetResumeItems
   */
  readonly excludeItemTypes?: Array<BaseItemKind>

  /**
   * Optional. If specified, results will be filtered based on the item type. This allows multiple, comma delimited.
   * @type {Array<BaseItemKind>}
   * @memberof ItemsApiGetResumeItems
   */
  readonly includeItemTypes?: Array<BaseItemKind>

  /**
   * Optional. Enable the total record count.
   * @type {boolean}
   * @memberof ItemsApiGetResumeItems
   */
  readonly enableTotalRecordCount?: boolean

  /**
   * Optional. Include image information in output.
   * @type {boolean}
   * @memberof ItemsApiGetResumeItems
   */
  readonly enableImages?: boolean

  /**
   * Optional. Whether to exclude the currently active sessions.
   * @type {boolean}
   * @memberof ItemsApiGetResumeItems
   */
  readonly excludeActiveSessions?: boolean
}

/**
 * Request parameters for updateItemUserData operation in ItemsApi.
 * @export
 * @interface ItemsApiUpdateItemUserDataRequest
 */
export interface ItemsApiUpdateItemUserDataRequest {
  /**
   * The item id.
   * @type {string}
   * @memberof ItemsApiUpdateItemUserData
   */
  readonly itemId: string

  /**
   * New user data object.
   * @type {UpdateUserItemDataDto}
   * @memberof ItemsApiUpdateItemUserData
   */
  readonly updateUserItemDataDto: UpdateUserItemDataDto

  /**
   * The user id.
   * @type {string}
   * @memberof ItemsApiUpdateItemUserData
   */
  readonly userId?: string
}

/**
 * ItemsApi - object-oriented interface
 * @export
 * @class ItemsApi
 * @extends {BaseAPI}
 */
export class ItemsApi extends Api {
  /**
   * getItemUserData
   * @summary Get Item User Data.
   * @param {ItemsApiGetItemUserDataRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof ItemsApi
   */
  public async getItemUserData(requestParameters: ItemsApiGetItemUserDataRequest): Promise<UserItemDataDto> {
    this.assertParam(requestParameters.itemId)
    return this.apiClient.get({path: `/UserItems/${requestParameters.itemId}/UserData`, parameters: requestParameters})
  }

  /**
   * getItems
   * @summary Gets items based on a query.
   * @param {ItemsApiGetItemsRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof ItemsApi
   */
  public async getItems(requestParameters: ItemsApiGetItemsRequest = {}): Promise<BaseItemDtoQueryResult> {
    return this.apiClient.get({path: "/Items", parameters: requestParameters})
  }

  /**
   * getResumeItems
   * @summary Gets items based on a query.
   * @param {ItemsApiGetResumeItemsRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof ItemsApi
   */
  public async getResumeItems(requestParameters: ItemsApiGetResumeItemsRequest = {}): Promise<BaseItemDtoQueryResult> {
    return this.apiClient.get({path: "/UserItems/Resume", parameters: requestParameters})
  }

  /**
   * updateItemUserData
   * @summary Update Item User Data.
   * @param {ItemsApiUpdateItemUserDataRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof ItemsApi
   */
  public async updateItemUserData(requestParameters: ItemsApiUpdateItemUserDataRequest): Promise<UserItemDataDto> {
    this.assertParam(requestParameters.itemId)
    let params: Record<string, string | undefined> = {
      "userId": requestParameters.userId
    }
    return this.apiClient.post({path: `/UserItems/${requestParameters.itemId}/UserData`, parameters: params, data: requestParameters.updateUserItemDataDto})
  }
}