import { ActivityLogEntryQueryResult } from "../model/ActivityLogEntryQueryResult";
import { Api } from "./Api";

/**
 * Request parameters for getLogEntries operation in ActivityLogApi.
 * @export
 * @interface ActivityLogApiGetLogEntriesRequest
 */
export interface ActivityLogApiGetLogEntriesRequest {
  /**
   * Optional. The record index to start at. All items with a lower index will be dropped from the results.
   * @type {number}
   * @memberof ActivityLogApiGetLogEntries
   */
  readonly startIndex?: number

  /**
   * Optional. The maximum number of records to return.
   * @type {number}
   * @memberof ActivityLogApiGetLogEntries
   */
  readonly limit?: number

  /**
   * Optional. The minimum date. Format &#x3D; ISO.
   * @type {string}
   * @memberof ActivityLogApiGetLogEntries
   */
  readonly minDate?: string

  /**
   * Optional. Filter log entries if it has user id, or not.
   * @type {boolean}
   * @memberof ActivityLogApiGetLogEntries
   */
  readonly hasUserId?: boolean
}

/**
 * ActivityLogApi - object-oriented interface
 * @export
 * @class ActivityLogApi
 * @extends {BaseAPI}
 */
export class ActivityLogApi extends Api {
  /**
   *
   * @summary Gets activity log entries.
   * @param {ActivityLogApiGetLogEntriesRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof ActivityLogApi
   */
  public getLogEntries(requestParameters: ActivityLogApiGetLogEntriesRequest = {}): Promise<ActivityLogEntryQueryResult> {
    return this.apiClient.get({path: "/System/ActivityLog/Entries", parameters: requestParameters})
  }
}
