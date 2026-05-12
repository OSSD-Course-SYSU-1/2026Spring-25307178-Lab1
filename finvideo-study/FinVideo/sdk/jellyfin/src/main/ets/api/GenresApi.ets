import { BaseItemDto } from "../model/BaseItemDto"
import { BaseItemDtoQueryResult } from "../model/BaseItemDtoQueryResult"
import { BaseItemKind } from "../model/BaseItemKind"
import { ImageType } from "../model/ImageType"
import { ItemFields } from "../model/ItemFields"
import { ItemSortBy } from "../model/ItemSortBy"
import { SortOrder } from "../model/SortOrder"
import { Api } from "./Api"

/**
 * Request parameters for getGenre operation in GenresApi.
 * @export
 * @interface GenresApiGetGenreRequest
 */
export interface GenresApiGetGenreRequest {
  /**
   * The genre name.
   * @type {string}
   * @memberof GenresApiGetGenre
   */
  readonly genreName: string

  /**
   * The user id.
   * @type {string}
   * @memberof GenresApiGetGenre
   */
  readonly userId?: string
}

/**
 * Request parameters for getGenres operation in GenresApi.
 * @export
 * @interface GenresApiGetGenresRequest
 */
export interface GenresApiGetGenresRequest {
  /**
   * Optional. The record index to start at. All items with a lower index will be dropped from the results.
   * @type {number}
   * @memberof GenresApiGetGenres
   */
  readonly startIndex?: number

  /**
   * Optional. The maximum number of records to return.
   * @type {number}
   * @memberof GenresApiGetGenres
   */
  readonly limit?: number

  /**
   * The search term.
   * @type {string}
   * @memberof GenresApiGetGenres
   */
  readonly searchTerm?: string

  /**
   * Specify this to localize the search to a specific item or folder. Omit to use the root.
   * @type {string}
   * @memberof GenresApiGetGenres
   */
  readonly parentId?: string

  /**
   * Optional. Specify additional fields of information to return in the output.
   * @type {Array<ItemFields>}
   * @memberof GenresApiGetGenres
   */
  readonly fields?: Array<ItemFields>

  /**
   * Optional. If specified, results will be filtered out based on item type. This allows multiple, comma delimited.
   * @type {Array<BaseItemKind>}
   * @memberof GenresApiGetGenres
   */
  readonly excludeItemTypes?: Array<BaseItemKind>

  /**
   * Optional. If specified, results will be filtered in based on item type. This allows multiple, comma delimited.
   * @type {Array<BaseItemKind>}
   * @memberof GenresApiGetGenres
   */
  readonly includeItemTypes?: Array<BaseItemKind>

  /**
   * Optional filter by items that are marked as favorite, or not.
   * @type {boolean}
   * @memberof GenresApiGetGenres
   */
  readonly isFavorite?: boolean

  /**
   * Optional, the max number of images to return, per image type.
   * @type {number}
   * @memberof GenresApiGetGenres
   */
  readonly imageTypeLimit?: number

  /**
   * Optional. The image types to include in the output.
   * @type {Array<ImageType>}
   * @memberof GenresApiGetGenres
   */
  readonly enableImageTypes?: Array<ImageType>

  /**
   * User id.
   * @type {string}
   * @memberof GenresApiGetGenres
   */
  readonly userId?: string

  /**
   * Optional filter by items whose name is sorted equally or greater than a given input string.
   * @type {string}
   * @memberof GenresApiGetGenres
   */
  readonly nameStartsWithOrGreater?: string

  /**
   * Optional filter by items whose name is sorted equally than a given input string.
   * @type {string}
   * @memberof GenresApiGetGenres
   */
  readonly nameStartsWith?: string

  /**
   * Optional filter by items whose name is equally or lesser than a given input string.
   * @type {string}
   * @memberof GenresApiGetGenres
   */
  readonly nameLessThan?: string

  /**
   * Optional. Specify one or more sort orders, comma delimited.
   * @type {Array<ItemSortBy>}
   * @memberof GenresApiGetGenres
   */
  readonly sortBy?: Array<ItemSortBy>

  /**
   * Sort Order - Ascending,Descending.
   * @type {Array<SortOrder>}
   * @memberof GenresApiGetGenres
   */
  readonly sortOrder?: Array<SortOrder>

  /**
   * Optional, include image information in output.
   * @type {boolean}
   * @memberof GenresApiGetGenres
   */
  readonly enableImages?: boolean

  /**
   * Optional. Include total record count.
   * @type {boolean}
   * @memberof GenresApiGetGenres
   */
  readonly enableTotalRecordCount?: boolean

  readonly recursive?: boolean
}

/**
 * GenresApi - object-oriented interface
 * @export
 * @class GenresApi
 * @extends {BaseAPI}
 */
export class GenresApi extends Api {
  /**
   * Gets a genre, by name.
   * @summary Gets a genre, by name.
   * @param {GenresApiGetGenreRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof GenresApi
   */
  public getGenre(requestParameters: GenresApiGetGenreRequest): Promise<BaseItemDto> {
    return this.apiClient.get({path: `/Genres/${requestParameters.genreName}`, parameters: requestParameters})
  }

  /**
   * Gets all genres from a given item, folder, or the entire library.
   * @summary Gets all genres from a given item, folder, or the entire library.
   * @param {GenresApiGetGenresRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof GenresApi
   */
  public getGenres(requestParameters: GenresApiGetGenresRequest = {}): Promise<BaseItemDtoQueryResult> {
    return this.apiClient.get({path: `/Genres`, parameters: requestParameters})
  }
}
