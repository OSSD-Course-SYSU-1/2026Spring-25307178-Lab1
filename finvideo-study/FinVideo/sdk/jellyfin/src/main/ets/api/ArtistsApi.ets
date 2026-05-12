import { BaseItemDto } from "../model/BaseItemDto"
import { BaseItemDtoQueryResult } from "../model/BaseItemDtoQueryResult"
import { BaseItemKind } from "../model/BaseItemKind"
import { ImageType } from "../model/ImageType"
import { ItemFields } from "../model/ItemFields"
import { ItemFilter } from "../model/ItemFilter"
import { ItemSortBy } from "../model/ItemSortBy"
import { MediaType } from "../model/MediaType"
import { SortOrder } from "../model/SortOrder"
import { Api } from "./Api"

/**
 * Request parameters for getAlbumArtists operation in ArtistsApi.
 * @export
 * @interface ArtistsApiGetAlbumArtistsRequest
 */
export interface ArtistsApiGetAlbumArtistsRequest {
  /**
   * Optional filter by minimum community rating.
   * @type {number}
   * @memberof ArtistsApiGetAlbumArtists
   */
  readonly minCommunityRating?: number

  /**
   * Optional. The record index to start at. All items with a lower index will be dropped from the results.
   * @type {number}
   * @memberof ArtistsApiGetAlbumArtists
   */
  readonly startIndex?: number

  /**
   * Optional. The maximum number of records to return.
   * @type {number}
   * @memberof ArtistsApiGetAlbumArtists
   */
  readonly limit?: number

  /**
   * Optional. Search term.
   * @type {string}
   * @memberof ArtistsApiGetAlbumArtists
   */
  readonly searchTerm?: string

  /**
   * Specify this to localize the search to a specific item or folder. Omit to use the root.
   * @type {string}
   * @memberof ArtistsApiGetAlbumArtists
   */
  readonly parentId?: string

  /**
   * Optional. Specify additional fields of information to return in the output.
   * @type {Array<ItemFields>}
   * @memberof ArtistsApiGetAlbumArtists
   */
  readonly fields?: Array<ItemFields>

  /**
   * Optional. If specified, results will be filtered out based on item type. This allows multiple, comma delimited.
   * @type {Array<BaseItemKind>}
   * @memberof ArtistsApiGetAlbumArtists
   */
  readonly excludeItemTypes?: Array<BaseItemKind>

  /**
   * Optional. If specified, results will be filtered based on item type. This allows multiple, comma delimited.
   * @type {Array<BaseItemKind>}
   * @memberof ArtistsApiGetAlbumArtists
   */
  readonly includeItemTypes?: Array<BaseItemKind>

  /**
   * Optional. Specify additional filters to apply.
   * @type {Array<ItemFilter>}
   * @memberof ArtistsApiGetAlbumArtists
   */
  readonly filters?: Array<ItemFilter>

  /**
   * Optional filter by items that are marked as favorite, or not.
   * @type {boolean}
   * @memberof ArtistsApiGetAlbumArtists
   */
  readonly isFavorite?: boolean

  /**
   * Optional filter by MediaType. Allows multiple, comma delimited.
   * @type {Array<MediaType>}
   * @memberof ArtistsApiGetAlbumArtists
   */
  readonly mediaTypes?: Array<MediaType>

  /**
   * Optional. If specified, results will be filtered based on genre. This allows multiple, pipe delimited.
   * @type {Array<string>}
   * @memberof ArtistsApiGetAlbumArtists
   */
  readonly genres?: Array<string>

  /**
   * Optional. If specified, results will be filtered based on genre id. This allows multiple, pipe delimited.
   * @type {Array<string>}
   * @memberof ArtistsApiGetAlbumArtists
   */
  readonly genreIds?: Array<string>

  /**
   * Optional. If specified, results will be filtered based on OfficialRating. This allows multiple, pipe delimited.
   * @type {Array<string>}
   * @memberof ArtistsApiGetAlbumArtists
   */
  readonly officialRatings?: Array<string>

  /**
   * Optional. If specified, results will be filtered based on tag. This allows multiple, pipe delimited.
   * @type {Array<string>}
   * @memberof ArtistsApiGetAlbumArtists
   */
  readonly tags?: Array<string>

  /**
   * Optional. If specified, results will be filtered based on production year. This allows multiple, comma delimited.
   * @type {Array<number>}
   * @memberof ArtistsApiGetAlbumArtists
   */
  readonly years?: Array<number>

  /**
   * Optional, include user data.
   * @type {boolean}
   * @memberof ArtistsApiGetAlbumArtists
   */
  readonly enableUserData?: boolean

  /**
   * Optional, the max number of images to return, per image type.
   * @type {number}
   * @memberof ArtistsApiGetAlbumArtists
   */
  readonly imageTypeLimit?: number

  /**
   * Optional. The image types to include in the output.
   * @type {Array<ImageType>}
   * @memberof ArtistsApiGetAlbumArtists
   */
  readonly enableImageTypes?: Array<ImageType>

  /**
   * Optional. If specified, results will be filtered to include only those containing the specified person.
   * @type {string}
   * @memberof ArtistsApiGetAlbumArtists
   */
  readonly person?: string

  /**
   * Optional. If specified, results will be filtered to include only those containing the specified person ids.
   * @type {Array<string>}
   * @memberof ArtistsApiGetAlbumArtists
   */
  readonly personIds?: Array<string>

  /**
   * Optional. If specified, along with Person, results will be filtered to include only those containing the specified person and PersonType. Allows multiple, comma-delimited.
   * @type {Array<string>}
   * @memberof ArtistsApiGetAlbumArtists
   */
  readonly personTypes?: Array<string>

  /**
   * Optional. If specified, results will be filtered based on studio. This allows multiple, pipe delimited.
   * @type {Array<string>}
   * @memberof ArtistsApiGetAlbumArtists
   */
  readonly studios?: Array<string>

  /**
   * Optional. If specified, results will be filtered based on studio id. This allows multiple, pipe delimited.
   * @type {Array<string>}
   * @memberof ArtistsApiGetAlbumArtists
   */
  readonly studioIds?: Array<string>

  /**
   * User id.
   * @type {string}
   * @memberof ArtistsApiGetAlbumArtists
   */
  readonly userId?: string

  /**
   * Optional filter by items whose name is sorted equally or greater than a given input string.
   * @type {string}
   * @memberof ArtistsApiGetAlbumArtists
   */
  readonly nameStartsWithOrGreater?: string

  /**
   * Optional filter by items whose name is sorted equally than a given input string.
   * @type {string}
   * @memberof ArtistsApiGetAlbumArtists
   */
  readonly nameStartsWith?: string

  /**
   * Optional filter by items whose name is equally or lesser than a given input string.
   * @type {string}
   * @memberof ArtistsApiGetAlbumArtists
   */
  readonly nameLessThan?: string

  /**
   * Optional. Specify one or more sort orders, comma delimited.
   * @type {Array<ItemSortBy>}
   * @memberof ArtistsApiGetAlbumArtists
   */
  readonly sortBy?: Array<ItemSortBy>

  /**
   * Sort Order - Ascending,Descending.
   * @type {Array<SortOrder>}
   * @memberof ArtistsApiGetAlbumArtists
   */
  readonly sortOrder?: Array<SortOrder>

  /**
   * Optional, include image information in output.
   * @type {boolean}
   * @memberof ArtistsApiGetAlbumArtists
   */
  readonly enableImages?: boolean

  /**
   * Total record count.
   * @type {boolean}
   * @memberof ArtistsApiGetAlbumArtists
   */
  readonly enableTotalRecordCount?: boolean
}

/**
 * Request parameters for getArtistByName operation in ArtistsApi.
 * @export
 * @interface ArtistsApiGetArtistByNameRequest
 */
export interface ArtistsApiGetArtistByNameRequest {
  /**
   * Studio name.
   * @type {string}
   * @memberof ArtistsApiGetArtistByName
   */
  readonly name: string

  /**
   * Optional. Filter by user id, and attach user data.
   * @type {string}
   * @memberof ArtistsApiGetArtistByName
   */
  readonly userId?: string
}

/**
 * Request parameters for getArtists operation in ArtistsApi.
 * @export
 * @interface ArtistsApiGetArtistsRequest
 */
export interface ArtistsApiGetArtistsRequest {
  /**
   * Optional filter by minimum community rating.
   * @type {number}
   * @memberof ArtistsApiGetArtists
   */
  readonly minCommunityRating?: number

  /**
   * Optional. The record index to start at. All items with a lower index will be dropped from the results.
   * @type {number}
   * @memberof ArtistsApiGetArtists
   */
  readonly startIndex?: number

  /**
   * Optional. The maximum number of records to return.
   * @type {number}
   * @memberof ArtistsApiGetArtists
   */
  readonly limit?: number

  /**
   * Optional. Search term.
   * @type {string}
   * @memberof ArtistsApiGetArtists
   */
  readonly searchTerm?: string

  /**
   * Specify this to localize the search to a specific item or folder. Omit to use the root.
   * @type {string}
   * @memberof ArtistsApiGetArtists
   */
  readonly parentId?: string

  /**
   * Optional. Specify additional fields of information to return in the output.
   * @type {Array<ItemFields>}
   * @memberof ArtistsApiGetArtists
   */
  readonly fields?: Array<ItemFields>

  /**
   * Optional. If specified, results will be filtered out based on item type. This allows multiple, comma delimited.
   * @type {Array<BaseItemKind>}
   * @memberof ArtistsApiGetArtists
   */
  readonly excludeItemTypes?: Array<BaseItemKind>

  /**
   * Optional. If specified, results will be filtered based on item type. This allows multiple, comma delimited.
   * @type {Array<BaseItemKind>}
   * @memberof ArtistsApiGetArtists
   */
  readonly includeItemTypes?: Array<BaseItemKind>

  /**
   * Optional. Specify additional filters to apply.
   * @type {Array<ItemFilter>}
   * @memberof ArtistsApiGetArtists
   */
  readonly filters?: Array<ItemFilter>

  /**
   * Optional filter by items that are marked as favorite, or not.
   * @type {boolean}
   * @memberof ArtistsApiGetArtists
   */
  readonly isFavorite?: boolean

  /**
   * Optional filter by MediaType. Allows multiple, comma delimited.
   * @type {Array<MediaType>}
   * @memberof ArtistsApiGetArtists
   */
  readonly mediaTypes?: Array<MediaType>

  /**
   * Optional. If specified, results will be filtered based on genre. This allows multiple, pipe delimited.
   * @type {Array<string>}
   * @memberof ArtistsApiGetArtists
   */
  readonly genres?: Array<string>

  /**
   * Optional. If specified, results will be filtered based on genre id. This allows multiple, pipe delimited.
   * @type {Array<string>}
   * @memberof ArtistsApiGetArtists
   */
  readonly genreIds?: Array<string>

  /**
   * Optional. If specified, results will be filtered based on OfficialRating. This allows multiple, pipe delimited.
   * @type {Array<string>}
   * @memberof ArtistsApiGetArtists
   */
  readonly officialRatings?: Array<string>

  /**
   * Optional. If specified, results will be filtered based on tag. This allows multiple, pipe delimited.
   * @type {Array<string>}
   * @memberof ArtistsApiGetArtists
   */
  readonly tags?: Array<string>

  /**
   * Optional. If specified, results will be filtered based on production year. This allows multiple, comma delimited.
   * @type {Array<number>}
   * @memberof ArtistsApiGetArtists
   */
  readonly years?: Array<number>

  /**
   * Optional, include user data.
   * @type {boolean}
   * @memberof ArtistsApiGetArtists
   */
  readonly enableUserData?: boolean

  /**
   * Optional, the max number of images to return, per image type.
   * @type {number}
   * @memberof ArtistsApiGetArtists
   */
  readonly imageTypeLimit?: number

  /**
   * Optional. The image types to include in the output.
   * @type {Array<ImageType>}
   * @memberof ArtistsApiGetArtists
   */
  readonly enableImageTypes?: Array<ImageType>

  /**
   * Optional. If specified, results will be filtered to include only those containing the specified person.
   * @type {string}
   * @memberof ArtistsApiGetArtists
   */
  readonly person?: string

  /**
   * Optional. If specified, results will be filtered to include only those containing the specified person ids.
   * @type {Array<string>}
   * @memberof ArtistsApiGetArtists
   */
  readonly personIds?: Array<string>

  /**
   * Optional. If specified, along with Person, results will be filtered to include only those containing the specified person and PersonType. Allows multiple, comma-delimited.
   * @type {Array<string>}
   * @memberof ArtistsApiGetArtists
   */
  readonly personTypes?: Array<string>

  /**
   * Optional. If specified, results will be filtered based on studio. This allows multiple, pipe delimited.
   * @type {Array<string>}
   * @memberof ArtistsApiGetArtists
   */
  readonly studios?: Array<string>

  /**
   * Optional. If specified, results will be filtered based on studio id. This allows multiple, pipe delimited.
   * @type {Array<string>}
   * @memberof ArtistsApiGetArtists
   */
  readonly studioIds?: Array<string>

  /**
   * User id.
   * @type {string}
   * @memberof ArtistsApiGetArtists
   */
  readonly userId?: string

  /**
   * Optional filter by items whose name is sorted equally or greater than a given input string.
   * @type {string}
   * @memberof ArtistsApiGetArtists
   */
  readonly nameStartsWithOrGreater?: string

  /**
   * Optional filter by items whose name is sorted equally than a given input string.
   * @type {string}
   * @memberof ArtistsApiGetArtists
   */
  readonly nameStartsWith?: string

  /**
   * Optional filter by items whose name is equally or lesser than a given input string.
   * @type {string}
   * @memberof ArtistsApiGetArtists
   */
  readonly nameLessThan?: string

  /**
   * Optional. Specify one or more sort orders, comma delimited.
   * @type {Array<ItemSortBy>}
   * @memberof ArtistsApiGetArtists
   */
  readonly sortBy?: Array<ItemSortBy>

  /**
   * Sort Order - Ascending,Descending.
   * @type {Array<SortOrder>}
   * @memberof ArtistsApiGetArtists
   */
  readonly sortOrder?: Array<SortOrder>

  /**
   * Optional, include image information in output.
   * @type {boolean}
   * @memberof ArtistsApiGetArtists
   */
  readonly enableImages?: boolean

  /**
   * Total record count.
   * @type {boolean}
   * @memberof ArtistsApiGetArtists
   */
  readonly enableTotalRecordCount?: boolean
}

/**
 * ArtistsApi - object-oriented interface
 * @export
 * @class ArtistsApi
 * @extends {BaseAPI}
 */
export class ArtistsApi extends Api {
  /**
   *
   * @summary Gets all album artists from a given item, folder, or the entire library.
   * @param {ArtistsApiGetAlbumArtistsRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof ArtistsApi
   */
  public getAlbumArtists(requestParameters: ArtistsApiGetAlbumArtistsRequest = {}): Promise<BaseItemDtoQueryResult> {
    return this.apiClient.get({path: "/Artists/AlbumArtists", parameters: requestParameters})
  }

  /**
   *
   * @summary Gets an artist by name.
   * @param {ArtistsApiGetArtistByNameRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof ArtistsApi
   */
  public getArtistByName(requestParameters: ArtistsApiGetArtistByNameRequest): Promise<BaseItemDto> {
    return this.apiClient.get({path: `/Artists/${requestParameters.name}`, parameters: requestParameters})
  }

  /**
   *
   * @summary Gets all artists from a given item, folder, or the entire library.
   * @param {ArtistsApiGetArtistsRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof ArtistsApi
   */
  public getArtists(requestParameters: ArtistsApiGetArtistsRequest = {}): Promise<BaseItemDtoQueryResult> {
    return this.apiClient.get({path: `/Artists`, parameters: requestParameters})
  }

}