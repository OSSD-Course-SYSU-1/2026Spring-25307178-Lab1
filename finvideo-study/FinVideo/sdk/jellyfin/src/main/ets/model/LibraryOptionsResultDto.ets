import { LibraryOptionInfoDto } from "./LibraryOptionInfoDto";
import { LibraryTypeOptionsDto } from "./LibraryTypeOptionsDto";

/**
 * Library options result dto.
 * @export
 * @interface LibraryOptionsResultDto
 */
export interface LibraryOptionsResultDto {
  /**
   * Gets or sets the metadata savers.
   * @type {Array<LibraryOptionInfoDto>}
   * @memberof LibraryOptionsResultDto
   */
  'MetadataSavers'?: Array<LibraryOptionInfoDto>;
  /**
   * Gets or sets the metadata readers.
   * @type {Array<LibraryOptionInfoDto>}
   * @memberof LibraryOptionsResultDto
   */
  'MetadataReaders'?: Array<LibraryOptionInfoDto>;
  /**
   * Gets or sets the subtitle fetchers.
   * @type {Array<LibraryOptionInfoDto>}
   * @memberof LibraryOptionsResultDto
   */
  'SubtitleFetchers'?: Array<LibraryOptionInfoDto>;
  /**
   * Gets or sets the type options.
   * @type {Array<LibraryTypeOptionsDto>}
   * @memberof LibraryOptionsResultDto
   */
  'TypeOptions'?: Array<LibraryTypeOptionsDto>;
}