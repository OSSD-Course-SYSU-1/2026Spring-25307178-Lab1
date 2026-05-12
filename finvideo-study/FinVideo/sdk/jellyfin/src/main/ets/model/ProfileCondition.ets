import { ProfileConditionType } from "./ProfileConditionType";
import { ProfileConditionValue } from "./ProfileConditionValue";

/**
 *
 * @export
 * @interface ProfileCondition
 */
export interface ProfileCondition {
  /**
   *
   * @type {ProfileConditionType}
   * @memberof ProfileCondition
   */
  'Condition'?: ProfileConditionType;
  /**
   *
   * @type {ProfileConditionValue}
   * @memberof ProfileCondition
   */
  'Property'?: ProfileConditionValue;
  /**
   *
   * @type {string}
   * @memberof ProfileCondition
   */
  'Value'?: string | null;
  /**
   *
   * @type {boolean}
   * @memberof ProfileCondition
   */
  'IsRequired'?: boolean;
}