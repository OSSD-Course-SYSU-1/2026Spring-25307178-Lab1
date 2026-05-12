import { DynamicDayOfWeek } from "./DynamicDayOfWeek";

/**
 * An entity representing a user\'s access schedule.
 * @export
 * @interface AccessSchedule
 */
export interface AccessSchedule {
  /**
   * Gets the id of this instance.
   * @type {number}
   * @memberof AccessSchedule
   */
  'Id'?: number;
  /**
   * Gets the id of the associated user.
   * @type {string}
   * @memberof AccessSchedule
   */
  'UserId'?: string;
  /**
   *
   * @type {DynamicDayOfWeek}
   * @memberof AccessSchedule
   */
  'DayOfWeek'?: DynamicDayOfWeek;
  /**
   * Gets or sets the start hour.
   * @type {number}
   * @memberof AccessSchedule
   */
  'StartHour'?: number;
  /**
   * Gets or sets the end hour.
   * @type {number}
   * @memberof AccessSchedule
   */
  'EndHour'?: number;
}