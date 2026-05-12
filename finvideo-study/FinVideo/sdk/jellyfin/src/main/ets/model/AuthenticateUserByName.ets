/**
 * The authenticate user by name request body.
 * @export
 * @interface AuthenticateUserByName
 */
export interface AuthenticateUserByName {
  /**
   * Gets or sets the username.
   * @type {string}
   * @memberof AuthenticateUserByName
   */
  'Username'?: string | null;
  /**
   * Gets or sets the plain text password.
   * @type {string}
   * @memberof AuthenticateUserByName
   */
  'Pw'?: string | null;
}