import { GeneralCommandType } from "./GeneralCommandType";

/**
 *
 * @export
 * @interface GeneralCommand
 */
export interface GeneralCommand {
  /**
   *
   * @type {GeneralCommandType}
   * @memberof GeneralCommand
   */
  'Name'?: GeneralCommandType;
  /**
   *
   * @type {string}
   * @memberof GeneralCommand
   */
  'ControllingUserId'?: string;
  /**
   *
   * @type {{ [key: string]: string | null; }}
   * @memberof GeneralCommand
   */
  'Arguments'?: Record<string, string | null>;
}