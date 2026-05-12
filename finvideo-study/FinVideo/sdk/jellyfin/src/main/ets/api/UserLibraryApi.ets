import { Api } from "./Api";
import { ImageType } from "../model/ImageType";
import { ItemFields } from "../model/ItemFields";
import { BaseItemDto } from "../model/BaseItemDto";
import { BaseItemKind } from "../model/BaseItemKind";
import { UserItemDataDto } from "../model/UserItemDataDto";
import { BaseItemDtoQueryResult } from "../model/BaseItemDtoQueryResult";

/**
 * Request parameters for deleteUserItemRating operation in UserLibraryApi.
 * @export
 * @interface UserLibraryApiDeleteUserItemRatingRequest
 */
export interface UserLibraryApiDeleteUserItemRatingRequest {
  /**
   * Item id.
   * @type {string}
   * @memberof UserLibraryApiDeleteUserItemRating
   */
  readonly itemId: string

  /**
   * User id.
   * @type {string}
   * @memberof UserLibraryApiDeleteUserItemRating
   */
  readonly userId?: string
}

/**
 * Request parameters for getIntros operation in UserLibraryApi.
 * @export
 * @interface UserLibraryApiGetIntrosRequest
 */
export interface UserLibraryApiGetIntrosRequest {
  /**
   * Item id.
   * @type {string}
   * @memberof UserLibraryApiGetIntros
   */
  readonly itemId: string

  /**
   * User id.
   * @type {string}
   * @memberof UserLibraryApiGetIntros
   */
  readonly userId?: string
}

/**
 * Request parameters for getItem operation in UserLibraryApi.
 * @export
 * @interface UserLibraryApiGetItemRequest
 */
export interface UserLibraryApiGetItemRequest {
  /**
   * Item id.
   * @type {string}
   * @memberof UserLibraryApiGetItem
   */
  readonly itemId: string

  /**
   * User id.
   * @type {string}
   * @memberof UserLibraryApiGetItem
   */
  readonly userId?: string
}

/**
 * Request parameters for getLatestMedia operation in UserLibraryApi.
 * @export
 * @interface UserLibraryApiGetLatestMediaRequest
 */
export interface UserLibraryApiGetLatestMediaRequest {
  /**
   * User id.
   * @type {string}
   * @memberof UserLibraryApiGetLatestMedia
   */
  readonly userId?: string

  /**
   * Specify this to localize the search to a specific item or folder. Omit to use the root.
   * @type {string}
   * @memberof UserLibraryApiGetLatestMedia
   */
  readonly parentId?: string

  /**
   * Optional. Specify additional fields of information to return in the output.
   * @type {Array<ItemFields>}
   * @memberof UserLibraryApiGetLatestMedia
   */
  readonly fields?: Array<ItemFields>

  /**
   * Optional. If specified, results will be filtered based on item type. This allows multiple, comma delimited.
   * @type {Array<BaseItemKind>}
   * @memberof UserLibraryApiGetLatestMedia
   */
  readonly includeItemTypes?: Array<BaseItemKind>

  /**
   * Filter by items that are played, or not.
   * @type {boolean}
   * @memberof UserLibraryApiGetLatestMedia
   */
  readonly isPlayed?: boolean

  /**
   * Optional. include image information in output.
   * @type {boolean}
   * @memberof UserLibraryApiGetLatestMedia
   */
  readonly enableImages?: boolean

  /**
   * Optional. the max number of images to return, per image type.
   * @type {number}
   * @memberof UserLibraryApiGetLatestMedia
   */
  readonly imageTypeLimit?: number

  /**
   * Optional. The image types to include in the output.
   * @type {Array<ImageType>}
   * @memberof UserLibraryApiGetLatestMedia
   */
  readonly enableImageTypes?: Array<ImageType>

  /**
   * Optional. include user data.
   * @type {boolean}
   * @memberof UserLibraryApiGetLatestMedia
   */
  readonly enableUserData?: boolean

  /**
   * Return item limit.
   * @type {number}
   * @memberof UserLibraryApiGetLatestMedia
   */
  readonly limit?: number

  /**
   * Whether or not to group items into a parent container.
   * @type {boolean}
   * @memberof UserLibraryApiGetLatestMedia
   */
  readonly groupItems?: boolean
}

/**
 * Request parameters for getLocalTrailers operation in UserLibraryApi.
 * @export
 * @interface UserLibraryApiGetLocalTrailersRequest
 */
export interface UserLibraryApiGetLocalTrailersRequest {
  /**
   * Item id.
   * @type {string}
   * @memberof UserLibraryApiGetLocalTrailers
   */
  readonly itemId: string

  /**
   * User id.
   * @type {string}
   * @memberof UserLibraryApiGetLocalTrailers
   */
  readonly userId?: string
}

/**
 * Request parameters for getRootFolder operation in UserLibraryApi.
 * @export
 * @interface UserLibraryApiGetRootFolderRequest
 */
export interface UserLibraryApiGetRootFolderRequest {
  /**
   * User id.
   * @type {string}
   * @memberof UserLibraryApiGetRootFolder
   */
  readonly userId?: string
}

/**
 * Request parameters for getSpecialFeatures operation in UserLibraryApi.
 * @export
 * @interface UserLibraryApiGetSpecialFeaturesRequest
 */
export interface UserLibraryApiGetSpecialFeaturesRequest {
  /**
   * Item id.
   * @type {string}
   * @memberof UserLibraryApiGetSpecialFeatures
   */
  readonly itemId: string

  /**
   * User id.
   * @type {string}
   * @memberof UserLibraryApiGetSpecialFeatures
   */
  readonly userId?: string
}

/**
 * Request parameters for markFavoriteItem operation in UserLibraryApi.
 * @export
 * @interface UserLibraryApiMarkFavoriteItemRequest
 */
export interface UserLibraryApiMarkFavoriteItemRequest {
  /**
   * Item id.
   * @type {string}
   * @memberof UserLibraryApiMarkFavoriteItem
   */
  readonly itemId: string

  /**
   * User id.
   * @type {string}
   * @memberof UserLibraryApiMarkFavoriteItem
   */
  readonly userId?: string
}

/**
 * Request parameters for unmarkFavoriteItem operation in UserLibraryApi.
 * @export
 * @interface UserLibraryApiUnmarkFavoriteItemRequest
 */
export interface UserLibraryApiUnmarkFavoriteItemRequest {
  /**
   * Item id.
   * @type {string}
   * @memberof UserLibraryApiUnmarkFavoriteItem
   */
  readonly itemId: string

  /**
   * User id.
   * @type {string}
   * @memberof UserLibraryApiUnmarkFavoriteItem
   */
  readonly userId?: string
}

/**
 * Request parameters for updateUserItemRating operation in UserLibraryApi.
 * @export
 * @interface UserLibraryApiUpdateUserItemRatingRequest
 */
export interface UserLibraryApiUpdateUserItemRatingRequest {
  /**
   * Item id.
   * @type {string}
   * @memberof UserLibraryApiUpdateUserItemRating
   */
  readonly itemId: string

  /**
   * User id.
   * @type {string}
   * @memberof UserLibraryApiUpdateUserItemRating
   */
  readonly userId?: string

  /**
   * Whether this M:Jellyfin.Api.Controllers.UserLibraryController.UpdateUserItemRating(System.Nullable{System.Guid},System.Guid,System.Nullable{System.Boolean}) is likes.
   * @type {boolean}
   * @memberof UserLibraryApiUpdateUserItemRating
   */
  readonly likes?: boolean
}

/**
 * UserLibraryApi - object-oriented interface
 * @export
 * @class UserLibraryApi
 * @extends {BaseAPI}
 */
export class UserLibraryApi extends Api {
  /**
   * deleteUserItemRating
   * @summary Deletes a user\'s saved personal rating for an item.
   * @param {UserLibraryApiDeleteUserItemRatingRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof UserLibraryApi
   */
  public async deleteUserItemRating(requestParameters: UserLibraryApiDeleteUserItemRatingRequest): Promise<UserItemDataDto> {
    this.assertParam(requestParameters.itemId)
    return this.apiClient.delete({path: `/UserItems/${requestParameters.itemId}/Rating`, parameters: requestParameters})
  }

  /**
   * getIntros
   * @summary Gets intros to play before the main media item plays.
   * @param {UserLibraryApiGetIntrosRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof UserLibraryApi
   */
  public async getIntros(requestParameters: UserLibraryApiGetIntrosRequest): Promise<BaseItemDtoQueryResult> {
    this.assertParam(requestParameters.itemId)
    return this.apiClient.get({path: `/Items/${requestParameters.itemId}/Intros`, parameters: requestParameters})
  }

  /**
   * Gets an item from a user's library.
   * @summary Gets an item from a user\'s library.
   * @param {UserLibraryApiGetItemRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof UserLibraryApi
   */
  public async getItem(requestParameters: UserLibraryApiGetItemRequest): Promise<BaseItemDto> {
    this.assertParam(requestParameters.itemId)
    return this.apiClient.get({path: `/Items/${requestParameters.itemId}`, parameters: requestParameters})
  }

  /**
   * Gets latest media.
   * @summary Gets latest media.
   * @param {UserLibraryApiGetLatestMediaRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof UserLibraryApi
   */
  public async getLatestMedia(requestParameters: UserLibraryApiGetLatestMediaRequest = {}): Promise<Array<BaseItemDto>> {
    return this.apiClient.get({path: "/Items/Latest", parameters: requestParameters})
  }

  /**
   * Gets local trailers for an item.
   * @summary Gets local trailers for an item.
   * @param {UserLibraryApiGetLocalTrailersRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof UserLibraryApi
   */
  public async getLocalTrailers(requestParameters: UserLibraryApiGetLocalTrailersRequest): Promise<Array<BaseItemDto>> {
    this.assertParam(requestParameters.itemId)
    return this.apiClient.get({path: `/Items/${requestParameters.itemId}/LocalTrailers`, parameters: requestParameters})
  }

  /**
   * Gets the root folder from a user's library.
   * @summary Gets the root folder from a user\'s library.
   * @param {UserLibraryApiGetRootFolderRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof UserLibraryApi
   */
  public async getRootFolder(requestParameters: UserLibraryApiGetRootFolderRequest = {}): Promise<BaseItemDto> {
    return this.apiClient.get({path: "/Items/Root", parameters: requestParameters})
  }

  /**
   * Gets special features for an item.
   * @summary Gets special features for an item.
   * @param {UserLibraryApiGetSpecialFeaturesRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof UserLibraryApi
   */
  public async getSpecialFeatures(requestParameters: UserLibraryApiGetSpecialFeaturesRequest): Promise<BaseItemDto> {
    this.assertParam(requestParameters.itemId)
    return this.apiClient.get({path: `/Items/${requestParameters.itemId}/SpecialFeatures`, parameters: requestParameters})
  }

  /**
   * Marks an item as a favorite.
   * @summary Marks an item as a favorite.
   * @param {UserLibraryApiMarkFavoriteItemRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof UserLibraryApi
   */
  public async markFavoriteItem(requestParameters: UserLibraryApiMarkFavoriteItemRequest): Promise<UserItemDataDto> {
    this.assertParam(requestParameters.itemId)
    return this.apiClient.post({path: `/UserFavoriteItems/${requestParameters.itemId}`, parameters: requestParameters})
  }

  /**
   * Unmarks item as a favorite.
   * @summary Unmarks item as a favorite.
   * @param {UserLibraryApiUnmarkFavoriteItemRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof UserLibraryApi
   */
  public async unmarkFavoriteItem(requestParameters: UserLibraryApiUnmarkFavoriteItemRequest): Promise<UserItemDataDto> {
    this.assertParam(requestParameters.itemId)
    return this.apiClient.delete({path: `/UserFavoriteItems/${requestParameters.itemId}`, parameters: requestParameters})
  }

  /**
   * Updates a user\'s rating for an item.
   * @summary Updates a user\'s rating for an item.
   * @param {UserLibraryApiUpdateUserItemRatingRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof UserLibraryApi
   */
  public async updateUserItemRating(requestParameters: UserLibraryApiUpdateUserItemRatingRequest): Promise<UserItemDataDto> {
    this.assertParam(requestParameters.itemId)
    return this.apiClient.post({path: `/UserItems/${requestParameters.itemId}/Rating`, parameters: requestParameters})
  }
}