/**
 * An entity representing custom options for a device.
 * @export
 * @interface DeviceOptions
 */
export interface DeviceOptions {
  /**
   * Gets the id.
   * @type {number}
   * @memberof DeviceOptions
   */
  'Id'?: number;
  /**
   * Gets the device id.
   * @type {string}
   * @memberof DeviceOptions
   */
  'DeviceId'?: string;
  /**
   * Gets or sets the custom name.
   * @type {string}
   * @memberof DeviceOptions
   */
  'CustomName'?: string | null;
}