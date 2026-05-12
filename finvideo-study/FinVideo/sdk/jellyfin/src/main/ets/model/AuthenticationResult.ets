import { UserDto } from "./UserDto";
import { SessionInfo } from "./SessionInfo";

/**
 *
 * @export
 * @interface AuthenticationResult
 */
export interface AuthenticationResult {
  /**
   *
   * @type {UserDto}
   * @memberof AuthenticationResult
   */
  'User'?: UserDto;
  /**
   *
   * @type {SessionInfo}
   * @memberof AuthenticationResult
   */
  'SessionInfo'?: SessionInfo;
  /**
   *
   * @type {string}
   * @memberof AuthenticationResult
   */
  'AccessToken'?: string | null;
  /**
   *
   * @type {string}
   * @memberof AuthenticationResult
   */
  'ServerId'?: string | null;
}
