import { MediaType } from "./MediaType";
import { PlaylistUserPermissions } from "./PlaylistUserPermissions";

/**
 * Create new playlist dto.
 * @export
 * @interface CreatePlaylistDto
 */
export interface CreatePlaylistDto {
  /**
   * Gets or sets the name of the new playlist.
   * @type {string}
   * @memberof CreatePlaylistDto
   */
  'Name'?: string;
  /**
   * Gets or sets item ids to add to the playlist.
   * @type {Array<string>}
   * @memberof CreatePlaylistDto
   */
  'Ids'?: Array<string>;
  /**
   * Gets or sets the user id.
   * @type {string}
   * @memberof CreatePlaylistDto
   */
  'UserId'?: string | null;
  /**
   *
   * @type {MediaType}
   * @memberof CreatePlaylistDto
   */
  'MediaType'?: MediaType;
  /**
   * Gets or sets the playlist users.
   * @type {Array<PlaylistUserPermissions>}
   * @memberof CreatePlaylistDto
   */
  'Users'?: Array<PlaylistUserPermissions>;
  /**
   * Gets or sets a value indicating whether the playlist is public.
   * @type {boolean}
   * @memberof CreatePlaylistDto
   */
  'IsPublic'?: boolean;
}