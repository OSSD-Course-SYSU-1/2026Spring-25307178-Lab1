/**
 * The update user password request body.
 * @export
 * @interface UpdateUserPassword
 */
export interface UpdateUserPassword {
  /**
   * Gets or sets the current sha1-hashed password.
   * @type {string}
   * @memberof UpdateUserPassword
   */
  'CurrentPassword'?: string | null;
  /**
   * Gets or sets the current plain text password.
   * @type {string}
   * @memberof UpdateUserPassword
   */
  'CurrentPw'?: string | null;
  /**
   * Gets or sets the new plain text password.
   * @type {string}
   * @memberof UpdateUserPassword
   */
  'NewPw'?: string | null;
  /**
   * Gets or sets a value indicating whether to reset the password.
   * @type {boolean}
   * @memberof UpdateUserPassword
   */
  'ResetPassword'?: boolean;
}