import { ImageOption } from "./ImageOption";
import { ImageType } from "./ImageType";
import { LibraryOptionInfoDto } from "./LibraryOptionInfoDto";

/**
 * Library type options dto.
 * @export
 * @interface LibraryTypeOptionsDto
 */
export interface LibraryTypeOptionsDto {
  /**
   * Gets or sets the type.
   * @type {string}
   * @memberof LibraryTypeOptionsDto
   */
  'Type'?: string | null;
  /**
   * Gets or sets the metadata fetchers.
   * @type {Array<LibraryOptionInfoDto>}
   * @memberof LibraryTypeOptionsDto
   */
  'MetadataFetchers'?: Array<LibraryOptionInfoDto>;
  /**
   * Gets or sets the image fetchers.
   * @type {Array<LibraryOptionInfoDto>}
   * @memberof LibraryTypeOptionsDto
   */
  'ImageFetchers'?: Array<LibraryOptionInfoDto>;
  /**
   * Gets or sets the supported image types.
   * @type {Array<ImageType>}
   * @memberof LibraryTypeOptionsDto
   */
  'SupportedImageTypes'?: Array<ImageType>;
  /**
   * Gets or sets the default image options.
   * @type {Array<ImageOption>}
   * @memberof LibraryTypeOptionsDto
   */
  'DefaultImageOptions'?: Array<ImageOption>;
}