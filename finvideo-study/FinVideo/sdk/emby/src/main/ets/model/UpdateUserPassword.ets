/**
 * The update user password request body.
 * @export
 * @interface UpdateUserPassword
 */
export interface UpdateUserPassword {
  /**
   * user id
   * @type {string}
   * @memberof UpdateUserPassword
   */
  'Id'?: string | null;
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