/**
 * Gets or sets the blurhashes for the image tags.  Maps image type to dictionary mapping image tag to blurhash value.
 * @export
 * @interface BaseItemDtoImageBlurHashes
 */
export interface BaseItemDtoImageBlurHashes {
  /**
   *
   * @type {Record<string, string>}
   * @memberof BaseItemDtoImageBlurHashes
   */
  'Primary'?: Record<string, string>;
  /**
   *
   * @type {Record<string, string>}
   * @memberof BaseItemDtoImageBlurHashes
   */
  'Art'?: Record<string, string>;
  /**
   *
   * @type {Record<string, string>}
   * @memberof BaseItemDtoImageBlurHashes
   */
  'Backdrop'?: Record<string, string>;
  /**
   *
   * @type {Record<string, string>}
   * @memberof BaseItemDtoImageBlurHashes
   */
  'Banner'?: Record<string, string>;
  /**
   *
   * @type {Record<string, string>}
   * @memberof BaseItemDtoImageBlurHashes
   */
  'Logo'?: Record<string, string>;
  /**
   *
   * @type {Record<string, string>}
   * @memberof BaseItemDtoImageBlurHashes
   */
  'Thumb'?: Record<string, string>;
  /**
   *
   * @type {Record<string, string>}
   * @memberof BaseItemDtoImageBlurHashes
   */
  'Disc'?: Record<string, string>;
  /**
   *
   * @type {Record<string, string>}
   * @memberof BaseItemDtoImageBlurHashes
   */
  'Box'?: Record<string, string>;
  /**
   *
   * @type {Record<string, string>}
   * @memberof BaseItemDtoImageBlurHashes
   */
  'Screenshot'?: Record<string, string>;
  /**
   *
   * @type {Record<string, string>}
   * @memberof BaseItemDtoImageBlurHashes
   */
  'Menu'?: Record<string, string>;
  /**
   *
   * @type {Record<string, string>}
   * @memberof BaseItemDtoImageBlurHashes
   */
  'Chapter'?: Record<string, string>;
  /**
   *
   * @type {Record<string, string>}
   * @memberof BaseItemDtoImageBlurHashes
   */
  'BoxRear'?: Record<string, string>;
  /**
   *
   * @type {Record<string, string>}
   * @memberof BaseItemDtoImageBlurHashes
   */
  'Profile'?: Record<string, string>;
}