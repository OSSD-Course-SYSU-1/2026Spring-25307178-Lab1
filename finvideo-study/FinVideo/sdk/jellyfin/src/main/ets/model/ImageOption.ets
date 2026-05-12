import { ImageType } from "./ImageType";

/**
 *
 * @export
 * @interface ImageOption
 */
export interface ImageOption {
  /**
   *
   * @type {ImageType}
   * @memberof ImageOption
   */
  'Type'?: ImageType;
  /**
   * Gets or sets the limit.
   * @type {number}
   * @memberof ImageOption
   */
  'Limit'?: number;
  /**
   * Gets or sets the minimum width.
   * @type {number}
   * @memberof ImageOption
   */
  'MinWidth'?: number;
}