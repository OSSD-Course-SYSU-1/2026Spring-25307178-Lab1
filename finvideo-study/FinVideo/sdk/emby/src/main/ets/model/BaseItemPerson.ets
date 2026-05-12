import { PersonKind } from "./PersonKind";

/**
 * This is used by the api to get information about a Person within a BaseItem.
 * @export
 * @interface BaseItemPerson
 */
export interface BaseItemPerson {
  /**
   * Gets or sets the name.
   * @type {string}
   * @memberof BaseItemPerson
   */
  'Name'?: string | null;
  /**
   * Gets or sets the identifier.
   * @type {string}
   * @memberof BaseItemPerson
   */
  'Id'?: string;
  /**
   * Gets or sets the role.
   * @type {string}
   * @memberof BaseItemPerson
   */
  'Role'?: string | null;
  /**
   *
   * @type {PersonKind}
   * @memberof BaseItemPerson
   */
  'Type'?: PersonKind;
  /**
   * Gets or sets the primary image tag.
   * @type {string}
   * @memberof BaseItemPerson
   */
  'PrimaryImageTag'?: string | null;
}