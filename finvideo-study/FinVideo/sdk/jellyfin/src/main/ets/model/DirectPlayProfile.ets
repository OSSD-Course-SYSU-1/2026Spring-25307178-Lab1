import { DlnaProfileType } from "./DlnaProfileType";

/**
 *
 * @export
 * @interface DirectPlayProfile
 */
export interface DirectPlayProfile {
  /**
   *
   * @type {string}
   * @memberof DirectPlayProfile
   */
  'Container'?: string | null;
  /**
   *
   * @type {string}
   * @memberof DirectPlayProfile
   */
  'AudioCodec'?: string | null;
  /**
   *
   * @type {string}
   * @memberof DirectPlayProfile
   */
  'VideoCodec'?: string | null;
  /**
   *
   * @type {DlnaProfileType}
   * @memberof DirectPlayProfile
   */
  'Type'?: DlnaProfileType;
}