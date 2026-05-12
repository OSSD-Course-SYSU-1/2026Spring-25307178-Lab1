import { SubtitleDeliveryMethod } from "./SubtitleDeliveryMethod";

/**
 *
 * @export
 * @interface SubtitleProfile
 */
export interface SubtitleProfile {
  /**
   *
   * @type {string}
   * @memberof SubtitleProfile
   */
  'Format'?: string | null;
  /**
   *
   * @type {SubtitleDeliveryMethod}
   * @memberof SubtitleProfile
   */
  'Method'?: SubtitleDeliveryMethod;
  /**
   *
   * @type {string}
   * @memberof SubtitleProfile
   */
  'DidlMode'?: string | null;
  /**
   *
   * @type {string}
   * @memberof SubtitleProfile
   */
  'Language'?: string | null;
  /**
   *
   * @type {string}
   * @memberof SubtitleProfile
   */
  'Container'?: string | null;
}