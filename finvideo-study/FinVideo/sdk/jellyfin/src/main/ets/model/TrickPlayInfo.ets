/**
 * An entity representing the metadata for a group of trick play tiles.
 * @export
 * @interface TrickPlayInfo
 */
export interface TrickPlayInfo {
  /**
   * Gets or sets width of an individual thumbnail.
   * @type {number}
   * @memberof TrickPlayInfo
   */
  'Width'?: number;
  /**
   * Gets or sets height of an individual thumbnail.
   * @type {number}
   * @memberof TrickPlayInfo
   */
  'Height'?: number;
  /**
   * Gets or sets amount of thumbnails per row.
   * @type {number}
   * @memberof TrickPlayInfo
   */
  'TileWidth'?: number;
  /**
   * Gets or sets amount of thumbnails per column.
   * @type {number}
   * @memberof TrickPlayInfo
   */
  'TileHeight'?: number;
  /**
   * Gets or sets total amount of non-black thumbnails.
   * @type {number}
   * @memberof TrickPlayInfo
   */
  'ThumbnailCount'?: number;
  /**
   * Gets or sets interval in milliseconds between each trick play thumbnail.
   * @type {number}
   * @memberof TrickPlayInfo
   */
  'Interval'?: number;
  /**
   * Gets or sets peak bandwith usage in bits per second.
   * @type {number}
   * @memberof TrickPlayInfo
   */
  'Bandwidth'?: number;
}