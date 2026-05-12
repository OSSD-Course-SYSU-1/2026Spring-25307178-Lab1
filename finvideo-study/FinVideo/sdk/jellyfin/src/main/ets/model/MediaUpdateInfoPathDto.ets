/**
 * The media update info path.
 * @export
 * @interface MediaUpdateInfoPathDto
 */
export interface MediaUpdateInfoPathDto {
  /**
   * Gets or sets media path.
   * @type {string}
   * @memberof MediaUpdateInfoPathDto
   */
  'Path'?: string | null;
  /**
   * Gets or sets media update type.  Created, Modified, Deleted.
   * @type {string}
   * @memberof MediaUpdateInfoPathDto
   */
  'UpdateType'?: string | null;
}