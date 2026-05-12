import { DeviceInfos } from "./DeviceInfos";

/**
 * DeviceInfoQueryResult
 * @export
 * @interface DeviceInfoQueryResult
 */
export interface DeviceInfoQueryResult {
  /**
   * Gets or sets the items.
   * @type {Array<DeviceInfo>}
   * @memberof DeviceInfoQueryResult
   */
  'Items'?: Array<DeviceInfos> | null;
  /**
   * Gets or sets the total number of records available.
   * @type {number}
   * @memberof DeviceInfoQueryResult
   */
  'TotalRecordCount'?: number;
  /**
   * Gets or sets the index of the first record in Items.
   * @type {number}
   * @memberof DeviceInfoQueryResult
   */
  'StartIndex'?: number;
}