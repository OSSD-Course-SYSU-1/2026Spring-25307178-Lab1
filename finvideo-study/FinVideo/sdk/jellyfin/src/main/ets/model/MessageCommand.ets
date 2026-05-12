/**
 *
 * @export
 * @interface MessageCommand
 */
export interface MessageCommand {
  /**
   *
   * @type {string}
   * @memberof MessageCommand
   */
  'Header'?: string | null;
  /**
   *
   * @type {string}
   * @memberof MessageCommand
   */
  'Text': string;
  /**
   *
   * @type {number}
   * @memberof MessageCommand
   */
  'TimeoutMs'?: number | null;
}
