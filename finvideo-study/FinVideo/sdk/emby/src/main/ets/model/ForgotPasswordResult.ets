import { ForgotPasswordAction } from "./ForgotPasswordAction";

/**
 * ForgotPasswordResult
 * @export
 * @interface ForgotPasswordResult
 */
export interface ForgotPasswordResult {
  /**
   *
   * @type {ForgotPasswordAction}
   * @memberof ForgotPasswordResult
   */
  'Action'?: ForgotPasswordAction;
  /**
   * Gets or sets the pin file.
   * @type {string}
   * @memberof ForgotPasswordResult
   */
  'PinFile'?: string | null;
  /**
   * Gets or sets the pin expiration date.
   * @type {string}
   * @memberof ForgotPasswordResult
   */
  'PinExpirationDate'?: string | null;
}