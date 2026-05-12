import { DlnaProfileType } from "./DlnaProfileType";
import { ProfileCondition } from "./ProfileCondition";

/**
 *
 * @export
 * @interface ContainerProfile
 */
export interface ContainerProfile {
  /**
   *
   * @type {DlnaProfileType}
   * @memberof ContainerProfile
   */
  'Type'?: DlnaProfileType;
  /**
   *
   * @type {Array<ProfileCondition>}
   * @memberof ContainerProfile
   */
  'Conditions'?: Array<ProfileCondition>;
  /**
   *
   * @type {string}
   * @memberof ContainerProfile
   */
  'Container'?: string;
}