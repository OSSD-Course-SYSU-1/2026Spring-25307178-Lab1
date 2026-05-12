import { CodecType } from "./CodecType";
import { ProfileCondition } from "./ProfileCondition";

/**
 *
 * @export
 * @interface CodecProfile
 */
export interface CodecProfile {
  /**
   *
   * @type {CodecType}
   * @memberof CodecProfile
   */
  'Type'?: CodecType;
  /**
   *
   * @type {Array<ProfileCondition>}
   * @memberof CodecProfile
   */
  'Conditions'?: Array<ProfileCondition> | null;
  /**
   *
   * @type {Array<ProfileCondition>}
   * @memberof CodecProfile
   */
  'ApplyConditions'?: Array<ProfileCondition> | null;
  /**
   *
   * @type {string}
   * @memberof CodecProfile
   */
  'Codec'?: string | null;
  /**
   *
   * @type {string}
   * @memberof CodecProfile
   */
  'Container'?: string | null;
}