import { Api } from "./Api";
import { UserDto } from "../model/UserDto";

/**
 * UserApi - object-oriented interface
 * @export
 * @class UserApi
 * @extends {BaseAPI}
 */
export class UserApi extends Api {

  /**
   * getCurrentUser
   * @summary Gets the user based on auth token.
   * @throws {RequiredError}
   * @memberof UserApi
   */
  public async getCurrentUser(): Promise<UserDto> {
    return this.apiClient.get({ path: "/api/v2/users/me" })
  }

}