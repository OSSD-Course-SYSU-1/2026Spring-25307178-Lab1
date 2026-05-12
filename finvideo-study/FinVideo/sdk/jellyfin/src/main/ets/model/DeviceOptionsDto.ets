/**
 * A dto representing custom options for a device.
 * @export
 * @interface DeviceOptionsDto
 */
export interface DeviceOptionsDto {
  /**
   * Gets or sets the id.
   * @type {number}
   * @memberof DeviceOptionsDto
   */
  'Id'?: number;
  /**
   * Gets or sets the device id.
   * @type {string}
   * @memberof DeviceOptionsDto
   */
  'DeviceId'?: string | null;
  /**
   * Gets or sets the custom name.
   * @type {string}
   * @memberof DeviceOptionsDto
   */
  'CustomName'?: string | null;
}