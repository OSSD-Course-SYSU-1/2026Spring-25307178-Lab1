import { BaseItemDtoQueryResult } from "../model/BaseItemDtoQueryResult"
import { CollectionType } from "../model/CollectionType"
import { ItemFields } from "../model/ItemFields"
import { MediaUpdateInfoDto } from "../model/MediaUpdateInfoDto"
import { Api } from "./Api"
import { buffer } from "@kit.ArkTS"
import { ItemCounts } from "../model/ItemCounts"
import { LibraryOptionsResultDto } from "../model/LibraryOptionsResultDto"
import { BaseItemDto } from "../model/BaseItemDto"
import { AllThemeMediaResult } from "../model/AllThemeMediaResult"
import { ThemeMediaResult } from "../model/ThemeMediaResult"

/**
 * Request parameters for deleteItem operation in LibraryApi.
 * @export
 * @interface LibraryApiDeleteItemRequest
 */
export interface LibraryApiDeleteItemRequest {
  /**
   * The item id.
   * @type {string}
   * @memberof LibraryApiDeleteItem
   */
  readonly itemId: string
}

/**
 * Request parameters for deleteItems operation in LibraryApi.
 * @export
 * @interface LibraryApiDeleteItemsRequest
 */
export interface LibraryApiDeleteItemsRequest {
  /**
   * The item ids.
   * @type {Array<string>}
   * @memberof LibraryApiDeleteItems
   */
  readonly ids?: Array<string>
}

/**
 * Request parameters for getAncestors operation in LibraryApi.
 * @export
 * @interface LibraryApiGetAncestorsRequest
 */
export interface LibraryApiGetAncestorsRequest {
  /**
   * The item id.
   * @type {string}
   * @memberof LibraryApiGetAncestors
   */
  readonly itemId: string

  /**
   * Optional. Filter by user id, and attach user data.
   * @type {string}
   * @memberof LibraryApiGetAncestors
   */
  readonly userId?: string
}

/**
 * Request parameters for getCriticReviews operation in LibraryApi.
 * @export
 * @interface LibraryApiGetCriticReviewsRequest
 */
export interface LibraryApiGetCriticReviewsRequest {
  /**
   *
   * @type {string}
   * @memberof LibraryApiGetCriticReviews
   */
  readonly itemId: string
}

/**
 * Request parameters for getDownload operation in LibraryApi.
 * @export
 * @interface LibraryApiGetDownloadRequest
 */
export interface LibraryApiGetDownloadRequest {
  /**
   * The item id.
   * @type {string}
   * @memberof LibraryApiGetDownload
   */
  readonly itemId: string
}

/**
 * Request parameters for getFile operation in LibraryApi.
 * @export
 * @interface LibraryApiGetFileRequest
 */
export interface LibraryApiGetFileRequest {
  /**
   * The item id.
   * @type {string}
   * @memberof LibraryApiGetFile
   */
  readonly itemId: string
}

/**
 * Request parameters for getItemCounts operation in LibraryApi.
 * @export
 * @interface LibraryApiGetItemCountsRequest
 */
export interface LibraryApiGetItemCountsRequest {
  /**
   * Optional. Get counts from a specific user\&#39;s library.
   * @type {string}
   * @memberof LibraryApiGetItemCounts
   */
  readonly userId?: string

  /**
   * Optional. Get counts of favorite items.
   * @type {boolean}
   * @memberof LibraryApiGetItemCounts
   */
  readonly isFavorite?: boolean
}

/**
 * Request parameters for getLibraryOptionsInfo operation in LibraryApi.
 * @export
 * @interface LibraryApiGetLibraryOptionsInfoRequest
 */
export interface LibraryApiGetLibraryOptionsInfoRequest {
  /**
   * Library content type.
   * @type {CollectionType}
   * @memberof LibraryApiGetLibraryOptionsInfo
   */
  readonly libraryContentType?: CollectionType

  /**
   * Whether this is a new library.
   * @type {boolean}
   * @memberof LibraryApiGetLibraryOptionsInfo
   */
  readonly isNewLibrary?: boolean
}

/**
 * Request parameters for getMediaFolders operation in LibraryApi.
 * @export
 * @interface LibraryApiGetMediaFoldersRequest
 */
export interface LibraryApiGetMediaFoldersRequest {
  /**
   * Optional. Filter by folders that are marked hidden, or not.
   * @type {boolean}
   * @memberof LibraryApiGetMediaFolders
   */
  readonly isHidden?: boolean
}

/**
 * Request parameters for getSimilarAlbums operation in LibraryApi.
 * @export
 * @interface LibraryApiGetSimilarAlbumsRequest
 */
export interface LibraryApiGetSimilarAlbumsRequest {
  /**
   * The item id.
   * @type {string}
   * @memberof LibraryApiGetSimilarAlbums
   */
  readonly itemId: string

  /**
   * Exclude artist ids.
   * @type {Array<string>}
   * @memberof LibraryApiGetSimilarAlbums
   */
  readonly excludeArtistIds?: Array<string>

  /**
   * Optional. Filter by user id, and attach user data.
   * @type {string}
   * @memberof LibraryApiGetSimilarAlbums
   */
  readonly userId?: string

  /**
   * Optional. The maximum number of records to return.
   * @type {number}
   * @memberof LibraryApiGetSimilarAlbums
   */
  readonly limit?: number

  /**
   * Optional. Specify additional fields of information to return in the output. This allows multiple, comma delimited. Options: Budget, Chapters, DateCreated, Genres, HomePageUrl, IndexOptions, MediaStreams, Overview, ParentId, Path, People, ProviderIds, PrimaryImageAspectRatio, Revenue, SortName, Studios, Taglines, TrailerUrls.
   * @type {Array<ItemFields>}
   * @memberof LibraryApiGetSimilarAlbums
   */
  readonly fields?: Array<ItemFields>
}

/**
 * Request parameters for getSimilarArtists operation in LibraryApi.
 * @export
 * @interface LibraryApiGetSimilarArtistsRequest
 */
export interface LibraryApiGetSimilarArtistsRequest {
  /**
   * The item id.
   * @type {string}
   * @memberof LibraryApiGetSimilarArtists
   */
  readonly itemId: string

  /**
   * Exclude artist ids.
   * @type {Array<string>}
   * @memberof LibraryApiGetSimilarArtists
   */
  readonly excludeArtistIds?: Array<string>

  /**
   * Optional. Filter by user id, and attach user data.
   * @type {string}
   * @memberof LibraryApiGetSimilarArtists
   */
  readonly userId?: string

  /**
   * Optional. The maximum number of records to return.
   * @type {number}
   * @memberof LibraryApiGetSimilarArtists
   */
  readonly limit?: number

  /**
   * Optional. Specify additional fields of information to return in the output. This allows multiple, comma delimited. Options: Budget, Chapters, DateCreated, Genres, HomePageUrl, IndexOptions, MediaStreams, Overview, ParentId, Path, People, ProviderIds, PrimaryImageAspectRatio, Revenue, SortName, Studios, Taglines, TrailerUrls.
   * @type {Array<ItemFields>}
   * @memberof LibraryApiGetSimilarArtists
   */
  readonly fields?: Array<ItemFields>
}

/**
 * Request parameters for getSimilarItems operation in LibraryApi.
 * @export
 * @interface LibraryApiGetSimilarItemsRequest
 */
export interface LibraryApiGetSimilarItemsRequest {
  /**
   * The item id.
   * @type {string}
   * @memberof LibraryApiGetSimilarItems
   */
  readonly itemId: string

  /**
   * Exclude artist ids.
   * @type {Array<string>}
   * @memberof LibraryApiGetSimilarItems
   */
  readonly excludeArtistIds?: Array<string>

  /**
   * Optional. Filter by user id, and attach user data.
   * @type {string}
   * @memberof LibraryApiGetSimilarItems
   */
  readonly userId?: string

  /**
   * Optional. The maximum number of records to return.
   * @type {number}
   * @memberof LibraryApiGetSimilarItems
   */
  readonly limit?: number

  /**
   * Optional. Specify additional fields of information to return in the output. This allows multiple, comma delimited. Options: Budget, Chapters, DateCreated, Genres, HomePageUrl, IndexOptions, MediaStreams, Overview, ParentId, Path, People, ProviderIds, PrimaryImageAspectRatio, Revenue, SortName, Studios, Taglines, TrailerUrls.
   * @type {Array<ItemFields>}
   * @memberof LibraryApiGetSimilarItems
   */
  readonly fields?: Array<ItemFields>
}

/**
 * Request parameters for getSimilarMovies operation in LibraryApi.
 * @export
 * @interface LibraryApiGetSimilarMoviesRequest
 */
export interface LibraryApiGetSimilarMoviesRequest {
  /**
   * The item id.
   * @type {string}
   * @memberof LibraryApiGetSimilarMovies
   */
  readonly itemId: string

  /**
   * Exclude artist ids.
   * @type {Array<string>}
   * @memberof LibraryApiGetSimilarMovies
   */
  readonly excludeArtistIds?: Array<string>

  /**
   * Optional. Filter by user id, and attach user data.
   * @type {string}
   * @memberof LibraryApiGetSimilarMovies
   */
  readonly userId?: string

  /**
   * Optional. The maximum number of records to return.
   * @type {number}
   * @memberof LibraryApiGetSimilarMovies
   */
  readonly limit?: number

  /**
   * Optional. Specify additional fields of information to return in the output. This allows multiple, comma delimited. Options: Budget, Chapters, DateCreated, Genres, HomePageUrl, IndexOptions, MediaStreams, Overview, ParentId, Path, People, ProviderIds, PrimaryImageAspectRatio, Revenue, SortName, Studios, Taglines, TrailerUrls.
   * @type {Array<ItemFields>}
   * @memberof LibraryApiGetSimilarMovies
   */
  readonly fields?: Array<ItemFields>
}

/**
 * Request parameters for getSimilarShows operation in LibraryApi.
 * @export
 * @interface LibraryApiGetSimilarShowsRequest
 */
export interface LibraryApiGetSimilarShowsRequest {
  /**
   * The item id.
   * @type {string}
   * @memberof LibraryApiGetSimilarShows
   */
  readonly itemId: string

  /**
   * Exclude artist ids.
   * @type {Array<string>}
   * @memberof LibraryApiGetSimilarShows
   */
  readonly excludeArtistIds?: Array<string>

  /**
   * Optional. Filter by user id, and attach user data.
   * @type {string}
   * @memberof LibraryApiGetSimilarShows
   */
  readonly userId?: string

  /**
   * Optional. The maximum number of records to return.
   * @type {number}
   * @memberof LibraryApiGetSimilarShows
   */
  readonly limit?: number

  /**
   * Optional. Specify additional fields of information to return in the output. This allows multiple, comma delimited. Options: Budget, Chapters, DateCreated, Genres, HomePageUrl, IndexOptions, MediaStreams, Overview, ParentId, Path, People, ProviderIds, PrimaryImageAspectRatio, Revenue, SortName, Studios, Taglines, TrailerUrls.
   * @type {Array<ItemFields>}
   * @memberof LibraryApiGetSimilarShows
   */
  readonly fields?: Array<ItemFields>
}

/**
 * Request parameters for getSimilarTrailers operation in LibraryApi.
 * @export
 * @interface LibraryApiGetSimilarTrailersRequest
 */
export interface LibraryApiGetSimilarTrailersRequest {
  /**
   * The item id.
   * @type {string}
   * @memberof LibraryApiGetSimilarTrailers
   */
  readonly itemId: string

  /**
   * Exclude artist ids.
   * @type {Array<string>}
   * @memberof LibraryApiGetSimilarTrailers
   */
  readonly excludeArtistIds?: Array<string>

  /**
   * Optional. Filter by user id, and attach user data.
   * @type {string}
   * @memberof LibraryApiGetSimilarTrailers
   */
  readonly userId?: string

  /**
   * Optional. The maximum number of records to return.
   * @type {number}
   * @memberof LibraryApiGetSimilarTrailers
   */
  readonly limit?: number

  /**
   * Optional. Specify additional fields of information to return in the output. This allows multiple, comma delimited. Options: Budget, Chapters, DateCreated, Genres, HomePageUrl, IndexOptions, MediaStreams, Overview, ParentId, Path, People, ProviderIds, PrimaryImageAspectRatio, Revenue, SortName, Studios, Taglines, TrailerUrls.
   * @type {Array<ItemFields>}
   * @memberof LibraryApiGetSimilarTrailers
   */
  readonly fields?: Array<ItemFields>
}

/**
 * Request parameters for getThemeMedia operation in LibraryApi.
 * @export
 * @interface LibraryApiGetThemeMediaRequest
 */
export interface LibraryApiGetThemeMediaRequest {
  /**
   * The item id.
   * @type {string}
   * @memberof LibraryApiGetThemeMedia
   */
  readonly itemId: string

  /**
   * Optional. Filter by user id, and attach user data.
   * @type {string}
   * @memberof LibraryApiGetThemeMedia
   */
  readonly userId?: string

  /**
   * Optional. Determines whether or not parent items should be searched for theme media.
   * @type {boolean}
   * @memberof LibraryApiGetThemeMedia
   */
  readonly inheritFromParent?: boolean
}

/**
 * Request parameters for getThemeSongs operation in LibraryApi.
 * @export
 * @interface LibraryApiGetThemeSongsRequest
 */
export interface LibraryApiGetThemeSongsRequest {
  /**
   * The item id.
   * @type {string}
   * @memberof LibraryApiGetThemeSongs
   */
  readonly itemId: string

  /**
   * Optional. Filter by user id, and attach user data.
   * @type {string}
   * @memberof LibraryApiGetThemeSongs
   */
  readonly userId?: string

  /**
   * Optional. Determines whether or not parent items should be searched for theme media.
   * @type {boolean}
   * @memberof LibraryApiGetThemeSongs
   */
  readonly inheritFromParent?: boolean
}

/**
 * Request parameters for getThemeVideos operation in LibraryApi.
 * @export
 * @interface LibraryApiGetThemeVideosRequest
 */
export interface LibraryApiGetThemeVideosRequest {
  /**
   * The item id.
   * @type {string}
   * @memberof LibraryApiGetThemeVideos
   */
  readonly itemId: string

  /**
   * Optional. Filter by user id, and attach user data.
   * @type {string}
   * @memberof LibraryApiGetThemeVideos
   */
  readonly userId?: string

  /**
   * Optional. Determines whether or not parent items should be searched for theme media.
   * @type {boolean}
   * @memberof LibraryApiGetThemeVideos
   */
  readonly inheritFromParent?: boolean
}

/**
 * Request parameters for postAddedMovies operation in LibraryApi.
 * @export
 * @interface LibraryApiPostAddedMoviesRequest
 */
export interface LibraryApiPostAddedMoviesRequest {
  /**
   * The tmdbId.
   * @type {string}
   * @memberof LibraryApiPostAddedMovies
   */
  readonly tmdbId?: string

  /**
   * The imdbId.
   * @type {string}
   * @memberof LibraryApiPostAddedMovies
   */
  readonly imdbId?: string
}

/**
 * Request parameters for postAddedSeries operation in LibraryApi.
 * @export
 * @interface LibraryApiPostAddedSeriesRequest
 */
export interface LibraryApiPostAddedSeriesRequest {
  /**
   * The tvdbId.
   * @type {string}
   * @memberof LibraryApiPostAddedSeries
   */
  readonly tvdbId?: string
}

/**
 * Request parameters for postUpdatedMedia operation in LibraryApi.
 * @export
 * @interface LibraryApiPostUpdatedMediaRequest
 */
export interface LibraryApiPostUpdatedMediaRequest {
  /**
   * The update paths.
   * @type {MediaUpdateInfoDto}
   * @memberof LibraryApiPostUpdatedMedia
   */
  readonly mediaUpdateInfoDto: MediaUpdateInfoDto
}

/**
 * Request parameters for postUpdatedMovies operation in LibraryApi.
 * @export
 * @interface LibraryApiPostUpdatedMoviesRequest
 */
export interface LibraryApiPostUpdatedMoviesRequest {
  /**
   * The tmdbId.
   * @type {string}
   * @memberof LibraryApiPostUpdatedMovies
   */
  readonly tmdbId?: string

  /**
   * The imdbId.
   * @type {string}
   * @memberof LibraryApiPostUpdatedMovies
   */
  readonly imdbId?: string
}

/**
 * Request parameters for postUpdatedSeries operation in LibraryApi.
 * @export
 * @interface LibraryApiPostUpdatedSeriesRequest
 */
export interface LibraryApiPostUpdatedSeriesRequest {
  /**
   * The tvdbId.
   * @type {string}
   * @memberof LibraryApiPostUpdatedSeries
   */
  readonly tvdbId?: string
}

/**
 * LibraryApi - object-oriented interface
 * @export
 * @class LibraryApi
 * @extends {BaseAPI}
 */
export class LibraryApi extends Api {
  /**
   *
   * @summary Deletes an item from the library and filesystem.
   * @param {LibraryApiDeleteItemRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof LibraryApi
   */
  public async deleteItem(requestParameters: LibraryApiDeleteItemRequest): Promise<void> {
    this.assertParam(requestParameters.itemId)
    return this.apiClient.delete({path: `/Items/${requestParameters.itemId}`, parameters: requestParameters})
  }

  /**
   *
   * @summary Deletes items from the library and filesystem.
   * @param {LibraryApiDeleteItemsRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof LibraryApi
   */
  public async deleteItems(requestParameters: LibraryApiDeleteItemsRequest = {}): Promise<void> {
    return this.apiClient.delete({path: `/Items`, parameters: requestParameters})
  }

  /**
   *
   * @summary Gets all parents of an item.
   * @param {LibraryApiGetAncestorsRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof LibraryApi
   */
  public async getAncestors(requestParameters: LibraryApiGetAncestorsRequest): Promise<Array<BaseItemDto>> {
    this.assertParam(requestParameters.itemId)
    this.assertParam(requestParameters.userId)
    return this.apiClient.get({path: `/Items/${requestParameters.itemId}/Ancestors`, parameters: requestParameters})
  }

  /**
   *
   * @summary Gets critic review for an item.
   * @param {LibraryApiGetCriticReviewsRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @deprecated
   * @throws {RequiredError}
   * @memberof LibraryApi
   */
  public getCriticReviews(requestParameters: LibraryApiGetCriticReviewsRequest): Promise<BaseItemDtoQueryResult> {
    this.assertParam(requestParameters.itemId)
    return this.apiClient.get({path: `/Items/${requestParameters.itemId}/CriticReviews`, parameters: requestParameters})
  }

  /**
   *
   * @summary Downloads item media.
   * @param {LibraryApiGetDownloadRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof LibraryApi
   */
  public getDownload(requestParameters: LibraryApiGetDownloadRequest): Promise<string> {
    this.assertParam(requestParameters.itemId)
    return this.apiClient.createUrl({path: `/Items/${requestParameters.itemId}/Download`, parameters: requestParameters})
  }

  /**
   *
   * @summary Get the original file of an item.
   * @param {LibraryApiGetFileRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof LibraryApi
   */
  public getFile(requestParameters: LibraryApiGetFileRequest): Promise<string> {
    this.assertParam(requestParameters.itemId)
    return this.apiClient.createUrl({path: `/Items/${requestParameters.itemId}/File`, parameters: requestParameters})
  }

  /**
   *
   * @summary Get item counts.
   * @param {LibraryApiGetItemCountsRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof LibraryApi
   */
  public getItemCounts(requestParameters: LibraryApiGetItemCountsRequest = {}): Promise<ItemCounts> {
    return this.apiClient.get({path: `/Items/Counts`, parameters: requestParameters})
  }

  /**
   *
   * @summary Gets the library options info.
   * @param {LibraryApiGetLibraryOptionsInfoRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof LibraryApi
   */
  public getLibraryOptionsInfo(requestParameters: LibraryApiGetLibraryOptionsInfoRequest = {}): Promise<LibraryOptionsResultDto> {
    return this.apiClient.get({path: `/Libraries/AvailableOptions`, parameters: requestParameters})
  }

  /**
   *
   * @summary Gets all user media folders.
   * @param {LibraryApiGetMediaFoldersRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof LibraryApi
   */
  public getMediaFolders(requestParameters: LibraryApiGetMediaFoldersRequest = {}): Promise<BaseItemDtoQueryResult> {
    return this.apiClient.get({path: `/Libraries/MediaFolders`, parameters: requestParameters})
  }

  /**
   *
   * @summary Gets a list of physical paths from virtual folders.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof LibraryApi
   */
  public getPhysicalPaths(): Promise<Array<string>> {
    return this.apiClient.get({path: `/Libraries/PhysicalPaths`})
  }

  /**
   *
   * @summary Gets similar items.
   * @param {LibraryApiGetSimilarAlbumsRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof LibraryApi
   */
  public async getSimilarAlbums(requestParameters: LibraryApiGetSimilarAlbumsRequest): Promise<BaseItemDtoQueryResult> {
    this.assertParam(requestParameters.itemId)
    return this.apiClient.get({path: `/Albums/${requestParameters.itemId}/Similar`, parameters: requestParameters})
  }

  /**
   *
   * @summary Gets similar items.
   * @param {LibraryApiGetSimilarArtistsRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof LibraryApi
   */
  public async getSimilarArtists(requestParameters: LibraryApiGetSimilarArtistsRequest): Promise<BaseItemDtoQueryResult> {
    this.assertParam(requestParameters.itemId)
    return this.apiClient.get({path: `/Artists/${requestParameters.itemId}/Similar`, parameters: requestParameters})
  }

  /**
   *
   * @summary Gets similar items.
   * @param {LibraryApiGetSimilarItemsRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof LibraryApi
   */
  public async getSimilarItems(requestParameters: LibraryApiGetSimilarItemsRequest): Promise<BaseItemDtoQueryResult> {
    this.assertParam(requestParameters.itemId)
    return this.apiClient.get({path: `/Items/${requestParameters.itemId}/Similar`, parameters: requestParameters})
  }

  /**
   *
   * @summary Gets similar items.
   * @param {LibraryApiGetSimilarMoviesRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof LibraryApi
   */
  public async getSimilarMovies(requestParameters: LibraryApiGetSimilarMoviesRequest): Promise<BaseItemDtoQueryResult> {
    this.assertParam(requestParameters.itemId)
    return this.apiClient.get({path: `/Movies/${requestParameters.itemId}/Similar`, parameters: requestParameters})
  }

  /**
   *
   * @summary Gets similar items.
   * @param {LibraryApiGetSimilarShowsRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof LibraryApi
   */
  public async getSimilarShows(requestParameters: LibraryApiGetSimilarShowsRequest): Promise<BaseItemDtoQueryResult> {
    this.assertParam(requestParameters.itemId)
    return this.apiClient.get({path: `/Shows/${requestParameters.itemId}/Similar`, parameters: requestParameters})
  }

  /**
   *
   * @summary Gets similar items.
   * @param {LibraryApiGetSimilarTrailersRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof LibraryApi
   */
  public async getSimilarTrailers(requestParameters: LibraryApiGetSimilarTrailersRequest): Promise<BaseItemDtoQueryResult> {
    this.assertParam(requestParameters.itemId)
    return this.apiClient.get({path: `/Trailers/${requestParameters.itemId}/Similar`, parameters: requestParameters})
  }

  /**
   *
   * @summary Get theme songs and videos for an item.
   * @param {LibraryApiGetThemeMediaRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof LibraryApi
   */
  public async getThemeMedia(requestParameters: LibraryApiGetThemeMediaRequest): Promise<AllThemeMediaResult> {
    this.assertParam(requestParameters.itemId)
    return this.apiClient.get({path: `/Items/${requestParameters.itemId}/ThemeMedia`, parameters: requestParameters})
  }

  /**
   *
   * @summary Get theme songs for an item.
   * @param {LibraryApiGetThemeSongsRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof LibraryApi
   */
  public async getThemeSongs(requestParameters: LibraryApiGetThemeSongsRequest): Promise<ThemeMediaResult> {
    this.assertParam(requestParameters.itemId)
    return this.apiClient.get({path: `/Items/${requestParameters.itemId}/ThemeSongs`, parameters: requestParameters})
  }

  /**
   *
   * @summary Get theme videos for an item.
   * @param {LibraryApiGetThemeVideosRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof LibraryApi
   */
  public async getThemeVideos(requestParameters: LibraryApiGetThemeVideosRequest): Promise<ThemeMediaResult> {
    this.assertParam(requestParameters.itemId)
    return this.apiClient.get({path: `/Items/${requestParameters.itemId}/ThemeVideos`, parameters: requestParameters})
  }

  /**
   *
   * @summary Reports that new movies have been added by an external source.
   * @param {LibraryApiPostAddedMoviesRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof LibraryApi
   */
  public postAddedMovies(requestParameters: LibraryApiPostAddedMoviesRequest = {}): Promise<void> {
    return this.apiClient.post({path: `/Library/Movies/Added`, parameters: requestParameters})
  }

  /**
   *
   * @summary Reports that new episodes of a series have been added by an external source.
   * @param {LibraryApiPostAddedSeriesRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof LibraryApi
   */
  public postAddedSeries(requestParameters: LibraryApiPostAddedSeriesRequest = {}): Promise<void> {
    return this.apiClient.post({path: `/Library/Series/Added`, parameters: requestParameters})
  }

  /**
   *
   * @summary Reports that new movies have been added by an external source.
   * @param {LibraryApiPostUpdatedMediaRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof LibraryApi
   */
  public postUpdatedMedia(requestParameters: LibraryApiPostUpdatedMediaRequest): Promise<void> {
    return this.apiClient.post({path: `/Library/Media/Updated`, data: requestParameters.mediaUpdateInfoDto})
  }

  /**
   *
   * @summary Reports that new movies have been added by an external source.
   * @param {LibraryApiPostUpdatedMoviesRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof LibraryApi
   */
  public postUpdatedMovies(requestParameters: LibraryApiPostUpdatedMoviesRequest = {}): Promise<void> {
    return this.apiClient.post({path: `/Library/Movies/Updated`, parameters: requestParameters})
  }

  /**
   *
   * @summary Reports that new episodes of a series have been added by an external source.
   * @param {LibraryApiPostUpdatedSeriesRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof LibraryApi
   */
  public postUpdatedSeries(requestParameters: LibraryApiPostUpdatedSeriesRequest = {}): Promise<void> {
    return this.apiClient.post({path: `/Library/Series/Updated`, parameters: requestParameters})
  }

  /**
   *
   * @summary Starts a library scan.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof LibraryApi
   */
  public refreshLibrary(): Promise<void> {
    return this.apiClient.post({path: `/Library/Refresh`})
  }
}