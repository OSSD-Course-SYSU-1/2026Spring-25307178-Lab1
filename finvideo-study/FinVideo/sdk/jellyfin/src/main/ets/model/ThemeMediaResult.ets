import { BaseItemDto } from "./BaseItemDto";

/**
 * Class ThemeMediaResult.
 * @export
 * @interface ThemeMediaResult
 */
export interface ThemeMediaResult {
  /**
   * Gets or sets the items.
   * @type {Array<BaseItemDto>}
   * @memberof ThemeMediaResult
   */
  'Items'?: Array<BaseItemDto> | null;
  /**
   * Gets or sets the total number of records available.
   * @type {number}
   * @memberof ThemeMediaResult
   */
  'TotalRecordCount'?: number;
  /**
   * Gets or sets the index of the first record in Items.
   * @type {number}
   * @memberof ThemeMediaResult
   */
  'StartIndex'?: number;
  /**
   * Gets or sets the owner id.
   * @type {string}
   * @memberof ThemeMediaResult
   */
  'OwnerId'?: string;
}