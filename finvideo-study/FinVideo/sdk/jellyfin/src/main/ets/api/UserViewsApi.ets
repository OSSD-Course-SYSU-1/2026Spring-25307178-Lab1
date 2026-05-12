import { Api } from "./Api";
import { CollectionType } from "../model/CollectionType";
import { BaseItemDtoQueryResult } from "../model/BaseItemDtoQueryResult";
import { SpecialViewOptionDto } from "../model/SpecialViewOptionDto";

/**
 * Request parameters for getGroupingOptions operation in UserViewsApi.
 * @export
 * @interface UserViewsApiGetGroupingOptionsRequest
 */
export interface UserViewsApiGetGroupingOptionsRequest {
  /**
   * User id.
   * @type {string}
   * @memberof UserViewsApiGetGroupingOptions
   */
  readonly userId?: string
}

/**
 * Request parameters for getUserViews operation in UserViewsApi.
 * @export
 * @interface UserViewsApiGetUserViewsRequest
 */
export interface UserViewsApiGetUserViewsRequest {
  /**
   * User id.
   * @type {string}
   * @memberof UserViewsApiGetUserViews
   */
  readonly userId?: string

  /**
   * Whether or not to include external views such as channels or live tv.
   * @type {boolean}
   * @memberof UserViewsApiGetUserViews
   */
  readonly includeExternalContent?: boolean

  /**
   * Preset views.
   * @type {Array<CollectionType>}
   * @memberof UserViewsApiGetUserViews
   */
  readonly presetViews?: Array<CollectionType>

  /**
   * Whether or not to include hidden content.
   * @type {boolean}
   * @memberof UserViewsApiGetUserViews
   */
  readonly includeHidden?: boolean
}

/**
 * UserViewsApi - object-oriented interface
 * @export
 * @class UserViewsApi
 * @extends {BaseAPI}
 */
export class UserViewsApi extends Api {
  /**
   *
   * @summary Get user view grouping options.
   * @param {UserViewsApiGetGroupingOptionsRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof UserViewsApi
   */
  public getGroupingOptions(requestParameters: UserViewsApiGetGroupingOptionsRequest = {}): Promise<Array<SpecialViewOptionDto>> {
    return this.apiClient.get({
      path: "/UserViews/GroupingOptions",
      parameters: requestParameters
    })
  }

  /**
   *
   * @summary Get user views.
   * @param {UserViewsApiGetUserViewsRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof UserViewsApi
   */
  public getUserViews(requestParameters: UserViewsApiGetUserViewsRequest = {}): Promise<BaseItemDtoQueryResult> {
    return this.apiClient.get({
      path: "/UserViews",
      parameters: requestParameters
    })
  }
}