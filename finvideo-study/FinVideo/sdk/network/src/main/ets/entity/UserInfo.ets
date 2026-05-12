/**
 * An interface representing a user info.
 */
export interface UserInfo {
  /**
   * User id
   */
  readonly id?: string | null;

  /**
   * User token
   */
  readonly token?: string | null;
}