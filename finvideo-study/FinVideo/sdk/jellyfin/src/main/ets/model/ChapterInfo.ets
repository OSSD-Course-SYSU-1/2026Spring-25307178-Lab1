/**
 * Class ChapterInfo.
 * @export
 * @interface ChapterInfo
 */
export interface ChapterInfo {
  /**
   * Gets or sets the start position ticks.
   * @type {number}
   * @memberof ChapterInfo
   */
  'StartPositionTicks'?: number;
  /**
   * Gets or sets the name.
   * @type {string}
   * @memberof ChapterInfo
   */
  'Name'?: string | null;
  /**
   * Gets or sets the image path.
   * @type {string}
   * @memberof ChapterInfo
   */
  'ImagePath'?: string | null;
  /**
   *
   * @type {string}
   * @memberof ChapterInfo
   */
  'ImageDateModified'?: string;
  /**
   *
   * @type {string}
   * @memberof ChapterInfo
   */
  'ImageTag'?: string | null;
}