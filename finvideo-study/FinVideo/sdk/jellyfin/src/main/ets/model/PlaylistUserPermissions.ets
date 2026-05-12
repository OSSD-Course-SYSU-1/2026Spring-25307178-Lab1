/**
 * Class to hold data on user permissions for playlists.
 * @export
 * @interface PlaylistUserPermissions
 */
export interface PlaylistUserPermissions {
  /**
   * Gets or sets the user id.
   * @type {string}
   * @memberof PlaylistUserPermissions
   */
  'UserId'?: string;
  /**
   * Gets or sets a value indicating whether the user has edit permissions.
   * @type {boolean}
   * @memberof PlaylistUserPermissions
   */
  'CanEdit'?: boolean;
}