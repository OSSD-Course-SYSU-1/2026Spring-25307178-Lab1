import { Api } from "./Api";
import { UserDto } from "../model/UserDto";
import { UserPolicy } from "../model/UserPolicy";
import { AuthenticationResult } from "../model/AuthenticationResult";
import { AuthenticateUserByName } from "../model/AuthenticateUserByName";
import { CreateUserByName } from "../model/CreateUserByName";
import { ForgotPasswordDto } from "../model/ForgotPasswordDto";
import { ForgotPasswordPinDto } from "../model/ForgotPasswordPinDto";
import { UserConfiguration } from "../model/UserConfiguration";
import { UpdateUserPassword } from "../model/UpdateUserPassword";
import { ForgotPasswordResult } from "../model/ForgotPasswordResult";
import { PinRedeemResult } from "../model/PinRedeemResult";
import { SortOrder } from "../model/SortOrder";

/**
 * Request parameters for authenticateUserByName operation in UserApi.
 * @export
 * @interface UserApiAuthenticateUserByNameRequest
 */
export interface UserApiAuthenticateUserByNameRequest {
  /**
   * The M:Jellyfin.Api.Controllers.UserController.AuthenticateUserByName(Jellyfin.Api.Models.UserDtos.AuthenticateUserByName) request.
   * @type {AuthenticateUserByName}
   * @memberof UserApiAuthenticateUserByName
   */
  readonly authenticateUserByName: AuthenticateUserByName
}

/**
 * Request parameters for createUserByName operation in UserApi.
 * @export
 * @interface UserApiCreateUserByNameRequest
 */
export interface UserApiCreateUserByNameRequest {
  /**
   * The create user by name request body.
   * @type {CreateUserByName}
   * @memberof UserApiCreateUserByName
   */
  readonly createUserByName: CreateUserByName
}

/**
 * Request parameters for deleteUser operation in UserApi.
 * @export
 * @interface UserApiDeleteUserRequest
 */
export interface UserApiDeleteUserRequest {
  /**
   * The user id.
   * @type {string}
   * @memberof UserApiDeleteUser
   */
  readonly userId: string
}

/**
 * Request parameters for forgotPassword operation in UserApi.
 * @export
 * @interface UserApiForgotPasswordRequest
 */
export interface UserApiForgotPasswordRequest {
  /**
   * The forgot password request containing the entered username.
   * @type {ForgotPasswordDto}
   * @memberof UserApiForgotPassword
   */
  readonly forgotPasswordDto: ForgotPasswordDto
}

/**
 * Request parameters for forgotPasswordPin operation in UserApi.
 * @export
 * @interface UserApiForgotPasswordPinRequest
 */
export interface UserApiForgotPasswordPinRequest {
  /**
   * The forgot password pin request containing the entered pin.
   * @type {ForgotPasswordPinDto}
   * @memberof UserApiForgotPasswordPin
   */
  readonly forgotPasswordPinDto: ForgotPasswordPinDto
}

/**
 * Request parameters for getUserById operation in UserApi.
 * @export
 * @interface UserApiGetUserByIdRequest
 */
export interface UserApiGetUserByIdRequest {
  /**
   * The user id.
   * @type {string}
   * @memberof UserApiGetUserById
   */
  readonly userId: string
}

/**
 * Request parameters for getUsers operation in UserApi.
 * @export
 * @interface UserApiGetUsersRequest
 */
export interface UserApiGetUsersRequest {
  /**
   * Optional filter by IsHidden&#x3D;true or false.
   * @type {boolean}
   * @memberof UserApiGetUsers
   */
  readonly isHidden?: boolean

  /**
   * Optional filter by IsDisabled&#x3D;true or false.
   * @type {boolean}
   * @memberof UserApiGetUsers
   */
  readonly isDisabled?: boolean

  readonly startIndex?: number

  readonly limit?: number

  readonly nameStartsWithOrGreater?: string

  readonly sortOrder?: SortOrder
}

/**
 * Request parameters for updateUser operation in UserApi.
 * @export
 * @interface UserApiUpdateUserRequest
 */
export interface UserApiUpdateUserRequest {
  /**
   * The updated user model.
   * @type {UserDto}
   * @memberof UserApiUpdateUser
   */
  readonly userDto: UserDto

  /**
   * The user id.
   * @type {string}
   * @memberof UserApiUpdateUser
   */
  readonly userId?: string
}

/**
 * Request parameters for updateUserConfiguration operation in UserApi.
 * @export
 * @interface UserApiUpdateUserConfigurationRequest
 */
export interface UserApiUpdateUserConfigurationRequest {
  /**
   * The new user configuration.
   * @type {UserConfiguration}
   * @memberof UserApiUpdateUserConfiguration
   */
  readonly userConfiguration: UserConfiguration

  /**
   * The user id.
   * @type {string}
   * @memberof UserApiUpdateUserConfiguration
   */
  readonly userId?: string
}

/**
 * Request parameters for updateUserPassword operation in UserApi.
 * @export
 * @interface UserApiUpdateUserPasswordRequest
 */
export interface UserApiUpdateUserPasswordRequest {
  /**
   * The M:Jellyfin.Api.Controllers.UserController.UpdateUserPassword(System.Nullable{System.Guid},Jellyfin.Api.Models.UserDtos.UpdateUserPassword) request.
   * @type {UpdateUserPassword}
   * @memberof UserApiUpdateUserPassword
   */
  readonly updateUserPassword: UpdateUserPassword

  /**
   * The user id.
   * @type {string}
   * @memberof UserApiUpdateUserPassword
   */
  readonly userId?: string
}

/**
 * Request parameters for updateUserPolicy operation in UserApi.
 * @export
 * @interface UserApiUpdateUserPolicyRequest
 */
export interface UserApiUpdateUserPolicyRequest {
  /**
   * The user id.
   * @type {string}
   * @memberof UserApiUpdateUserPolicy
   */
  readonly userId: string

  /**
   * The new user policy.
   * @type {UserPolicy}
   * @memberof UserApiUpdateUserPolicy
   */
  readonly userPolicy: UserPolicy
}

/**
 * UserApi - object-oriented interface
 * @export
 * @class UserApi
 * @extends {BaseAPI}
 */
export class UserApi extends Api {
  /**
   * authenticateUserByName
   * @summary Authenticates a user by name.
   * @param authenticateUserByName requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof UserApi
   */
  public async authenticateUserByName(authenticateUserByName: AuthenticateUserByName): Promise<AuthenticationResult> {
    return this.apiClient.post({ path: "/Users/AuthenticateByName", data: authenticateUserByName })
  }

  /**
   * createUserByName
   * @summary Creates a user.
   * @param createUserByName requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof UserApi
   */
  public async createUserByName(createUserByName: CreateUserByName): Promise<UserDto> {
    return this.apiClient.post({ path: "/Users/New", data: createUserByName })
  }

  /**
   * deleteUser
   * @summary Deletes a user.
   * @param userId requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof UserApi
   */
  public async deleteUser(userId: string): Promise<void> {
    return this.apiClient.post({ path: `/Users/${userId}/Delete` })
  }

  /**
   * forgotPassword
   * @summary Initiates the forgot password process for a local user.
   * @param forgotPasswordDto requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof UserApi
   */
  public async forgotPassword(forgotPasswordDto: ForgotPasswordDto): Promise<ForgotPasswordResult> {
    return this.apiClient.post({ path: "/Users/ForgotPassword", data: forgotPasswordDto })
  }

  /**
   * forgotPasswordPin
   * @summary Redeems a forgot password pin.
   * @param forgotPasswordPinDto requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof UserApi
   */
  public async forgotPasswordPin(forgotPasswordPinDto: ForgotPasswordPinDto): Promise<PinRedeemResult> {
    return this.apiClient.post({ path: "/Users/ForgotPassword/Pin", data: forgotPasswordPinDto })
  }

  /**
   * getPublicUsers
   * @summary Gets a list of publicly visible users for display on a login screen.
   * @throws {RequiredError}
   * @memberof UserApi
   */
  public async getPublicUsers(): Promise<Array<UserDto>> {
    return this.apiClient.get({ path: "/Users/Public" })
  }

  /**
   * getUserById
   * @summary Gets a user by Id.
   * @param userId requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof UserApi
   */
  public async getUserById(userId: string): Promise<UserDto> {
    return this.apiClient.get({ path: `/Users/${userId}` })
  }

  /**
   * getUsers
   * @summary Gets a list of users.
   * @param {UserApiGetUsersRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof UserApi
   */
  public async getUsers(requestParameters: UserApiGetUsersRequest = {}): Promise<Array<UserDto>> {
    return this.apiClient.get({ path: "/Users", parameters: requestParameters })
  }

  /**
   * updateUser
   * @summary Updates a user.
   * @param {UserApiUpdateUserRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof UserApi
   */
  public async updateUser(requestParameters: UserApiUpdateUserRequest): Promise<void> {
    let params: Record<string, string | undefined> = {
      "userId": requestParameters.userId
    }
    return this.apiClient.post({ path: "/Users", parameters: params, data: requestParameters.userDto })
  }

  /**
   * updateUserPassword
   * @summary Updates a user\'s password.
   * @param {UserApiUpdateUserPasswordRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof UserApi
   */
  public async updateUserPassword(requestParameters: UserApiUpdateUserPasswordRequest): Promise<void> {
    return this.apiClient.post({ path: `/Users/${requestParameters.userId}/Password`, data: requestParameters.updateUserPassword })
  }

  /**
   * updateUserPolicy
   * @summary Updates a user policy.
   * @param {UserApiUpdateUserPolicyRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof UserApi
   */
  public async updateUserPolicy(requestParameters: UserApiUpdateUserPolicyRequest): Promise<void> {
    this.assertParam(requestParameters.userId)
    return this.apiClient.post({ path: `/Users/${requestParameters.userId}/Policy`, data: requestParameters.userPolicy })
  }
}