/**
 * Provides the MAC address and port for wake-on-LAN functionality.
 * @export
 * @interface WakeOnLanInfo
 */
export interface WakeOnLanInfo {
  /**
   * Gets the MAC address of the device.
   * @type {string}
   * @memberof WakeOnLanInfo
   */
  'MacAddress'?: string | null;

  'BroadcastAddress'?: string | null;

  /**
   * Gets or sets the wake-on-LAN port.
   * @type {number}
   * @memberof WakeOnLanInfo
   */
  'Port'?: number;
}