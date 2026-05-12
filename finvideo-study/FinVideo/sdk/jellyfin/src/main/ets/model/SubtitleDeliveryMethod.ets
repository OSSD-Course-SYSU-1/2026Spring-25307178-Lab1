/**
 * Delivery method to use during playback of a specific subtitle format.
 * @export
 * @enum {string}
 */
export enum SubtitleDeliveryMethod {
  Encode = 'Encode',
  Embed = 'Embed',
  External = 'External',
  Hls = 'Hls',
  Drop = 'Drop'
}