import { BaseItemDto } from "./BaseItemDto";

/**
 *
 * @export
 * @interface BaseItemDtoQueryResult
 */
export interface BaseItemDtoQueryResult {
  /**
   * Gets or sets the items.
   * @type {Array<BaseItemDto>}
   * @memberof BaseItemDtoQueryResult
   */
  'Items'?: Array<BaseItemDto> | null;
  /**
   * Gets or sets the total number of records available.
   * @type {number}
   * @memberof BaseItemDtoQueryResult
   */
  'TotalRecordCount'?: number;
  /**
   * Gets or sets the index of the first record in Items.
   * @type {number}
   * @memberof BaseItemDtoQueryResult
   */
  'StartIndex'?: number;
}