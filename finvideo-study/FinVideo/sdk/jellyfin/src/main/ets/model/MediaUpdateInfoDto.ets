import { MediaUpdateInfoPathDto } from "./MediaUpdateInfoPathDto";

/**
 * Media Update Info Dto.
 * @export
 * @interface MediaUpdateInfoDto
 */
export interface MediaUpdateInfoDto {
  /**
   * Gets or sets the list of updates.
   * @type {Array<MediaUpdateInfoPathDto>}
   * @memberof MediaUpdateInfoDto
   */
  'Updates'?: Array<MediaUpdateInfoPathDto>;
}
