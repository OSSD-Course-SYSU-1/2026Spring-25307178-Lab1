import { BaseItemDtoQueryResult } from "../model/BaseItemDtoQueryResult";
import { CreatePlaylistDto } from "../model/CreatePlaylistDto";
import { ImageType } from "../model/ImageType";
import { ItemFields } from "../model/ItemFields";
import { MediaType } from "../model/MediaType";
import { PlaylistCreationResult } from "../model/PlaylistCreationResult";
import { PlaylistUserPermissions } from "../model/PlaylistUserPermissions";
import { UpdatePlaylistDto } from "../model/UpdatePlaylistDto";
import { Api } from "./Api";

/**
 * Request parameters for addItemToPlaylist operation in PlaylistsApi.
 * @export
 * @interface PlaylistsApiAddItemToPlaylistRequest
 */
export interface PlaylistsApiAddItemToPlaylistRequest {
  /**
   * The playlist id.
   * @type {string}
   * @memberof PlaylistsApiAddItemToPlaylist
   */
  readonly playlistId: string

  /**
   * Item id, comma delimited.
   * @type {Array<string>}
   * @memberof PlaylistsApiAddItemToPlaylist
   */
  readonly ids?: Array<string>

  /**
   * The userId.
   * @type {string}
   * @memberof PlaylistsApiAddItemToPlaylist
   */
  readonly userId?: string
}

/**
 * Request parameters for createPlaylist operation in PlaylistsApi.
 * @export
 * @interface PlaylistsApiCreatePlaylistRequest
 */
export interface PlaylistsApiCreatePlaylistRequest {
  /**
   * The playlist name.
   * @type {string}
   * @memberof PlaylistsApiCreatePlaylist
   */
  readonly name?: string

  /**
   * The item ids.
   * @type {Array<string>}
   * @memberof PlaylistsApiCreatePlaylist
   */
  readonly ids?: Array<string>

  /**
   * The user id.
   * @type {string}
   * @memberof PlaylistsApiCreatePlaylist
   */
  readonly userId?: string

  /**
   * The media type.
   * @type {MediaType}
   * @memberof PlaylistsApiCreatePlaylist
   */
  readonly mediaType?: MediaType

  /**
   * The create playlist payload.
   * @type {CreatePlaylistDto}
   * @memberof PlaylistsApiCreatePlaylist
   */
  readonly createPlaylistDto?: CreatePlaylistDto
}

/**
 * Request parameters for getPlaylistItems operation in PlaylistsApi.
 * @export
 * @interface PlaylistsApiGetPlaylistItemsRequest
 */
export interface PlaylistsApiGetPlaylistItemsRequest {
  /**
   * The playlist id.
   * @type {string}
   * @memberof PlaylistsApiGetPlaylistItems
   */
  readonly playlistId: string

  /**
   * User id.
   * @type {string}
   * @memberof PlaylistsApiGetPlaylistItems
   */
  readonly userId?: string

  /**
   * Optional. The record index to start at. All items with a lower index will be dropped from the results.
   * @type {number}
   * @memberof PlaylistsApiGetPlaylistItems
   */
  readonly startIndex?: number

  /**
   * Optional. The maximum number of records to return.
   * @type {number}
   * @memberof PlaylistsApiGetPlaylistItems
   */
  readonly limit?: number

  /**
   * Optional. Specify additional fields of information to return in the output.
   * @type {Array<ItemFields>}
   * @memberof PlaylistsApiGetPlaylistItems
   */
  readonly fields?: Array<ItemFields>

  /**
   * Optional. Include image information in output.
   * @type {boolean}
   * @memberof PlaylistsApiGetPlaylistItems
   */
  readonly enableImages?: boolean

  /**
   * Optional. Include user data.
   * @type {boolean}
   * @memberof PlaylistsApiGetPlaylistItems
   */
  readonly enableUserData?: boolean

  /**
   * Optional. The max number of images to return, per image type.
   * @type {number}
   * @memberof PlaylistsApiGetPlaylistItems
   */
  readonly imageTypeLimit?: number

  /**
   * Optional. The image types to include in the output.
   * @type {Array<ImageType>}
   * @memberof PlaylistsApiGetPlaylistItems
   */
  readonly enableImageTypes?: Array<ImageType>
}

/**
 * Request parameters for getPlaylistUser operation in PlaylistsApi.
 * @export
 * @interface PlaylistsApiGetPlaylistUserRequest
 */
export interface PlaylistsApiGetPlaylistUserRequest {
  /**
   * The playlist id.
   * @type {string}
   * @memberof PlaylistsApiGetPlaylistUser
   */
  readonly playlistId: string

  /**
   * The user id.
   * @type {string}
   * @memberof PlaylistsApiGetPlaylistUser
   */
  readonly userId: string
}

/**
 * Request parameters for getPlaylistUsers operation in PlaylistsApi.
 * @export
 * @interface PlaylistsApiGetPlaylistUsersRequest
 */
export interface PlaylistsApiGetPlaylistUsersRequest {
  /**
   * The playlist id.
   * @type {string}
   * @memberof PlaylistsApiGetPlaylistUsers
   */
  readonly playlistId: string
}

/**
 * Request parameters for moveItem operation in PlaylistsApi.
 * @export
 * @interface PlaylistsApiMoveItemRequest
 */
export interface PlaylistsApiMoveItemRequest {
  /**
   * The playlist id.
   * @type {string}
   * @memberof PlaylistsApiMoveItem
   */
  readonly playlistId: string

  /**
   * The item id.
   * @type {string}
   * @memberof PlaylistsApiMoveItem
   */
  readonly itemId: string

  /**
   * The new index.
   * @type {number}
   * @memberof PlaylistsApiMoveItem
   */
  readonly newIndex: number
}

/**
 * Request parameters for removeItemFromPlaylist operation in PlaylistsApi.
 * @export
 * @interface PlaylistsApiRemoveItemFromPlaylistRequest
 */
export interface PlaylistsApiRemoveItemFromPlaylistRequest {
  /**
   * The playlist id.
   * @type {string}
   * @memberof PlaylistsApiRemoveItemFromPlaylist
   */
  readonly playlistId: string

  /**
   * The item ids, comma delimited.
   * @type {Array<string>}
   * @memberof PlaylistsApiRemoveItemFromPlaylist
   */
  readonly entryIds?: Array<string>
}

/**
 * Request parameters for removeUserFromPlaylist operation in PlaylistsApi.
 * @export
 * @interface PlaylistsApiRemoveUserFromPlaylistRequest
 */
export interface PlaylistsApiRemoveUserFromPlaylistRequest {
  /**
   * The playlist id.
   * @type {string}
   * @memberof PlaylistsApiRemoveUserFromPlaylist
   */
  readonly playlistId: string

  /**
   * The user id.
   * @type {string}
   * @memberof PlaylistsApiRemoveUserFromPlaylist
   */
  readonly userId: string
}

/**
 * Request parameters for updatePlaylist operation in PlaylistsApi.
 * @export
 * @interface PlaylistsApiUpdatePlaylistRequest
 */
export interface PlaylistsApiUpdatePlaylistRequest {
  /**
   * The playlist id.
   * @type {string}
   * @memberof PlaylistsApiUpdatePlaylist
   */
  readonly playlistId: string

  /**
   * The Jellyfin.Api.Models.PlaylistDtos.UpdatePlaylistDto id.
   * @type {UpdatePlaylistDto}
   * @memberof PlaylistsApiUpdatePlaylist
   */
  readonly updatePlaylistDto: UpdatePlaylistDto
}

/**
 * Request parameters for updatePlaylistUser operation in PlaylistsApi.
 * @export
 * @interface PlaylistsApiUpdatePlaylistUserRequest
 */
export interface PlaylistsApiUpdatePlaylistUserRequest {
  /**
   * The playlist id.
   * @type {string}
   * @memberof PlaylistsApiUpdatePlaylistUser
   */
  readonly playlistId: string

  /**
   * The user id.
   * @type {string}
   * @memberof PlaylistsApiUpdatePlaylistUser
   */
  readonly userId: string

  /**
   * The Jellyfin.Api.Models.PlaylistDtos.UpdatePlaylistUserDto.
   * @type {UpdatePlaylistUserDto}
   * @memberof PlaylistsApiUpdatePlaylistUser
   */
  readonly updatePlaylistUserDto: UpdatePlaylistDto
}

/**
 * PlaylistsApi - object-oriented interface
 * @export
 * @class PlaylistsApi
 * @extends {Api}
 */
export class PlaylistsApi extends Api {
  /**
   *
   * @summary Adds items to a playlist.
   * @param {PlaylistsApiAddItemToPlaylistRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof PlaylistsApi
   */
  public addItemToPlaylist(requestParameters: PlaylistsApiAddItemToPlaylistRequest): Promise<void> {
    return this.apiClient.post({path: `/Playlists/${requestParameters.playlistId}/Items`, parameters: requestParameters})
  }

  /**
   * For backwards compatibility parameters can be sent via Query or Body, with Query having higher precedence.  Query parameters are obsolete.
   * @summary Creates a new playlist.
   * @param {PlaylistsApiCreatePlaylistRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof PlaylistsApi
   */
  public createPlaylist(requestParameters: PlaylistsApiCreatePlaylistRequest = {}): Promise<PlaylistCreationResult> {
    return this.apiClient.post({path: `/Playlists`, data: requestParameters})
  }

  /**
   *
   * @summary Gets the original items of a playlist.
   * @param {PlaylistsApiGetPlaylistItemsRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof PlaylistsApi
   */
  public getPlaylistItems(requestParameters: PlaylistsApiGetPlaylistItemsRequest): Promise<BaseItemDtoQueryResult> {
    return this.apiClient.get({path: `/Playlists/${requestParameters.playlistId}/Items`, parameters: requestParameters})
  }

  /**
   *
   * @summary Get a playlist user.
   * @param {PlaylistsApiGetPlaylistUserRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof PlaylistsApi
   */
  public getPlaylistUser(requestParameters: PlaylistsApiGetPlaylistUserRequest): Promise<PlaylistUserPermissions> {
    return this.apiClient.get({path: `/Playlists/${requestParameters.playlistId}/Users/${requestParameters.userId}`, parameters: requestParameters})
  }

  /**
   *
   * @summary Get a playlist\'s users.
   * @param {PlaylistsApiGetPlaylistUsersRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof PlaylistsApi
   */
  public getPlaylistUsers(requestParameters: PlaylistsApiGetPlaylistUsersRequest): Promise<Array<PlaylistUserPermissions>> {
    return this.apiClient.get({path: `/Playlists/${requestParameters.playlistId}/Users`, parameters: requestParameters})
  }

  /**
   *
   * @summary Moves a playlist item.
   * @param {PlaylistsApiMoveItemRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof PlaylistsApi
   */
  public moveItem(requestParameters: PlaylistsApiMoveItemRequest): Promise<void> {
    return this.apiClient.post({path: `/Playlists/${requestParameters.playlistId}/Items/${requestParameters.itemId}/Move/${requestParameters.newIndex}`})
  }

  /**
   *
   * @summary Removes items from a playlist.
   * @param {PlaylistsApiRemoveItemFromPlaylistRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof PlaylistsApi
   */
  public removeItemFromPlaylist(requestParameters: PlaylistsApiRemoveItemFromPlaylistRequest): Promise<void> {
    return this.apiClient.delete({path: `/Playlists/${requestParameters.playlistId}/Items`, parameters: requestParameters})
  }

  /**
   *
   * @summary Remove a user from a playlist\'s users.
   * @param {PlaylistsApiRemoveUserFromPlaylistRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof PlaylistsApi
   */
  public removeUserFromPlaylist(requestParameters: PlaylistsApiRemoveUserFromPlaylistRequest): Promise<void> {
    return this.apiClient.delete({path: `/Playlists/${requestParameters.playlistId}/Users/${requestParameters.userId}`})
  }

  /**
   *
   * @summary Updates a playlist.
   * @param {PlaylistsApiUpdatePlaylistRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof PlaylistsApi
   */
  public updatePlaylist(requestParameters: PlaylistsApiUpdatePlaylistRequest): Promise<void> {
    return this.apiClient.post({path: `/Playlists/${requestParameters.playlistId}`, data: requestParameters.updatePlaylistDto})
  }

  /**
   *
   * @summary Modify a user of a playlist\'s users.
   * @param {PlaylistsApiUpdatePlaylistUserRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof PlaylistsApi
   */
  public updatePlaylistUser(requestParameters: PlaylistsApiUpdatePlaylistUserRequest): Promise<void> {
    return this.apiClient.post({path: `/Playlists/${requestParameters.playlistId}/Users/${requestParameters.userId}`, data: requestParameters.updatePlaylistUserDto})
  }
}