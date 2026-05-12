import { Api } from "./Api"
import { MediaType } from "../model/MediaType"
import { NameIdPair } from "../model/NameIdPair"
import { PlayCommand } from "../model/PlayCommand"
import { SessionInfo } from "../model/SessionInfo"
import { BaseItemKind } from "../model/BaseItemKind"
import { GeneralCommand } from "../model/GeneralCommand"
import { ClientCapabilitiesDto } from "../model/ClientCapabilitiesDto"
import { GeneralCommandType } from "../model/GeneralCommandType"
import { MessageCommand } from "../model/MessageCommand"
import { PlaystateCommand } from "../model/PlaystateCommand"

/**
 * Request parameters for addUserToSession operation in SessionApi.
 * @export
 * @interface SessionApiAddUserToSessionRequest
 */
export interface SessionApiAddUserToSessionRequest {
  /**
   * The session id.
   * @type {string}
   * @memberof SessionApiAddUserToSession
   */
  readonly sessionId: string

  /**
   * The user id.
   * @type {string}
   * @memberof SessionApiAddUserToSession
   */
  readonly userId: string
}

/**
 * Request parameters for displayContent operation in SessionApi.
 * @export
 * @interface SessionApiDisplayContentRequest
 */
export interface SessionApiDisplayContentRequest {
  /**
   * The session Id.
   * @type {string}
   * @memberof SessionApiDisplayContent
   */
  readonly sessionId: string

  /**
   * The type of item to browse to.
   * @type {BaseItemKind}
   * @memberof SessionApiDisplayContent
   */
  readonly itemType: BaseItemKind

  /**
   * The Id of the item.
   * @type {string}
   * @memberof SessionApiDisplayContent
   */
  readonly itemId: string

  /**
   * The name of the item.
   * @type {string}
   * @memberof SessionApiDisplayContent
   */
  readonly itemName: string
}

/**
 * Request parameters for getSessions operation in SessionApi.
 * @export
 * @interface SessionApiGetSessionsRequest
 */
export interface SessionApiGetSessionsRequest {
  /**
   * Filter by sessions that a given user is allowed to remote control.
   * @type {string}
   * @memberof SessionApiGetSessions
   */
  readonly controllableByUserId?: string

  /**
   * Filter by device Id.
   * @type {string}
   * @memberof SessionApiGetSessions
   */
  readonly deviceId?: string

  /**
   * Optional. Filter by sessions that were active in the last n seconds.
   * @type {number}
   * @memberof SessionApiGetSessions
   */
  readonly activeWithinSeconds?: number
}

/**
 * Request parameters for play operation in SessionApi.
 * @export
 * @interface SessionApiPlayRequest
 */
export interface SessionApiPlayRequest {
  /**
   * The session id.
   * @type {string}
   * @memberof SessionApiPlay
   */
  readonly sessionId: string

  /**
   * The type of play command to issue (PlayNow, PlayNext, PlayLast). Clients who have not yet implemented play next and play last may play now.
   * @type {PlayCommand}
   * @memberof SessionApiPlay
   */
  readonly playCommand: PlayCommand

  /**
   * The ids of the items to play, comma delimited.
   * @type {Array<string>}
   * @memberof SessionApiPlay
   */
  readonly itemIds: Array<string>

  /**
   * The starting position of the first item.
   * @type {number}
   * @memberof SessionApiPlay
   */
  readonly startPositionTicks?: number

  /**
   * Optional. The media source id.
   * @type {string}
   * @memberof SessionApiPlay
   */
  readonly mediaSourceId?: string

  /**
   * Optional. The index of the audio stream to play.
   * @type {number}
   * @memberof SessionApiPlay
   */
  readonly audioStreamIndex?: number

  /**
   * Optional. The index of the subtitle stream to play.
   * @type {number}
   * @memberof SessionApiPlay
   */
  readonly subtitleStreamIndex?: number

  /**
   * Optional. The start index.
   * @type {number}
   * @memberof SessionApiPlay
   */
  readonly startIndex?: number
}

/**
 * Request parameters for postCapabilities operation in SessionApi.
 * @export
 * @interface SessionApiPostCapabilitiesRequest
 */
export interface SessionApiPostCapabilitiesRequest {
  /**
   * The session id.
   * @type {string}
   * @memberof SessionApiPostCapabilities
   */
  readonly id?: string

  /**
   * A list of playable media types, comma delimited. Audio, Video, Book, Photo.
   * @type {Array<MediaType>}
   * @memberof SessionApiPostCapabilities
   */
  readonly playableMediaTypes?: Array<MediaType>

  /**
   * A list of supported remote control commands, comma delimited.
   * @type {Array<GeneralCommandType>}
   * @memberof SessionApiPostCapabilities
   */
  readonly supportedCommands?: Array<GeneralCommandType>

  /**
   * Determines whether media can be played remotely..
   * @type {boolean}
   * @memberof SessionApiPostCapabilities
   */
  readonly supportsMediaControl?: boolean

  /**
   * Determines whether the device supports a unique identifier.
   * @type {boolean}
   * @memberof SessionApiPostCapabilities
   */
  readonly supportsPersistentIdentifier?: boolean
}

/**
 * Request parameters for postFullCapabilities operation in SessionApi.
 * @export
 * @interface SessionApiPostFullCapabilitiesRequest
 */
export interface SessionApiPostFullCapabilitiesRequest {
  /**
   * The MediaBrowser.Model.Session.ClientCapabilities.
   * @type {ClientCapabilitiesDto}
   * @memberof SessionApiPostFullCapabilities
   */
  readonly clientCapabilitiesDto: ClientCapabilitiesDto

  /**
   * The session id.
   * @type {string}
   * @memberof SessionApiPostFullCapabilities
   */
  readonly id?: string
}

/**
 * Request parameters for removeUserFromSession operation in SessionApi.
 * @export
 * @interface SessionApiRemoveUserFromSessionRequest
 */
export interface SessionApiRemoveUserFromSessionRequest {
  /**
   * The session id.
   * @type {string}
   * @memberof SessionApiRemoveUserFromSession
   */
  readonly sessionId: string

  /**
   * The user id.
   * @type {string}
   * @memberof SessionApiRemoveUserFromSession
   */
  readonly userId: string
}

/**
 * Request parameters for reportViewing operation in SessionApi.
 * @export
 * @interface SessionApiReportViewingRequest
 */
export interface SessionApiReportViewingRequest {
  /**
   * The item id.
   * @type {string}
   * @memberof SessionApiReportViewing
   */
  readonly itemId: string

  /**
   * The session id.
   * @type {string}
   * @memberof SessionApiReportViewing
   */
  readonly sessionId?: string
}

/**
 * Request parameters for sendFullGeneralCommand operation in SessionApi.
 * @export
 * @interface SessionApiSendFullGeneralCommandRequest
 */
export interface SessionApiSendFullGeneralCommandRequest {
  /**
   * The session id.
   * @type {string}
   * @memberof SessionApiSendFullGeneralCommand
   */
  readonly sessionId: string

  /**
   * The MediaBrowser.Model.Session.GeneralCommand.
   * @type {GeneralCommand}
   * @memberof SessionApiSendFullGeneralCommand
   */
  readonly generalCommand: GeneralCommand
}

/**
 * Request parameters for sendGeneralCommand operation in SessionApi.
 * @export
 * @interface SessionApiSendGeneralCommandRequest
 */
export interface SessionApiSendGeneralCommandRequest {
  /**
   * The session id.
   * @type {string}
   * @memberof SessionApiSendGeneralCommand
   */
  readonly sessionId: string

  /**
   * The command to send.
   * @type {GeneralCommandType}
   * @memberof SessionApiSendGeneralCommand
   */
  readonly command: GeneralCommandType
}

/**
 * Request parameters for sendMessageCommand operation in SessionApi.
 * @export
 * @interface SessionApiSendMessageCommandRequest
 */
export interface SessionApiSendMessageCommandRequest {
  /**
   * The session id.
   * @type {string}
   * @memberof SessionApiSendMessageCommand
   */
  readonly sessionId: string

  /**
   * The MediaBrowser.Model.Session.MessageCommand object containing Header, Message Text, and TimeoutMs.
   * @type {MessageCommand}
   * @memberof SessionApiSendMessageCommand
   */
  readonly messageCommand: MessageCommand
}

/**
 * Request parameters for sendPlaystateCommand operation in SessionApi.
 * @export
 * @interface SessionApiSendPlaystateCommandRequest
 */
export interface SessionApiSendPlaystateCommandRequest {
  /**
   * The session id.
   * @type {string}
   * @memberof SessionApiSendPlaystateCommand
   */
  readonly sessionId: string

  /**
   * The MediaBrowser.Model.Session.PlaystateCommand.
   * @type {PlaystateCommand}
   * @memberof SessionApiSendPlaystateCommand
   */
  readonly command: PlaystateCommand

  /**
   * The optional position ticks.
   * @type {number}
   * @memberof SessionApiSendPlaystateCommand
   */
  readonly seekPositionTicks?: number

  /**
   * The optional controlling user id.
   * @type {string}
   * @memberof SessionApiSendPlaystateCommand
   */
  readonly controllingUserId?: string
}

/**
 * Request parameters for sendSystemCommand operation in SessionApi.
 * @export
 * @interface SessionApiSendSystemCommandRequest
 */
export interface SessionApiSendSystemCommandRequest {
  /**
   * The session id.
   * @type {string}
   * @memberof SessionApiSendSystemCommand
   */
  readonly sessionId: string

  /**
   * The command to send.
   * @type {GeneralCommandType}
   * @memberof SessionApiSendSystemCommand
   */
  readonly command: GeneralCommandType
}

/**
 * SessionApi - object-oriented interface
 * @export
 * @class SessionApi
 * @extends {BaseAPI}
 */
export class SessionApi extends Api {
  /**
   * addUserToSession
   * @summary Adds an additional user to a session.
   * @param {SessionApiAddUserToSessionRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof SessionApi
   */
  public async addUserToSession(requestParameters: SessionApiAddUserToSessionRequest): Promise<void> {
    this.assertParam(requestParameters.sessionId)
    this.assertParam(requestParameters.userId)
    return this.apiClient.post({path: `/Sessions/${requestParameters.sessionId}/User/${requestParameters.userId}`, parameters: requestParameters})
  }

  /**
   * displayContent
   * @summary Instructs a session to browse to an item or view.
   * @param {SessionApiDisplayContentRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof SessionApi
   */
  public async displayContent(requestParameters: SessionApiDisplayContentRequest): Promise<void> {
    this.assertParam(requestParameters.sessionId)
    return this.apiClient.post({path: `/Sessions/${requestParameters.sessionId}/Viewing`, parameters: requestParameters})
  }

  /**
   * getAuthProviders
   * @summary Get all auth providers.
   * @throws {RequiredError}
   * @memberof SessionApi
   */
  public async getAuthProviders(): Promise<Array<NameIdPair>> {
    return this.apiClient.get({path: "/Auth/Providers"})
  }

  /**
   * getPasswordResetProviders
   * @summary Get all password reset providers.
   * @throws {RequiredError}
   * @memberof SessionApi
   */
  public async getPasswordResetProviders(): Promise<NameIdPair> {
    return this.apiClient.get({path: "/Auth/PasswordResetProviders"})
  }

  /**
   * getSessions
   * @summary Gets a list of sessions.
   * @param {SessionApiGetSessionsRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof SessionApi
   */
  public async getSessions(requestParameters: SessionApiGetSessionsRequest = {}): Promise<Array<SessionInfo>> {
    return this.apiClient.get({path: "/Sessions", parameters: requestParameters})
  }

  /**
   * play
   * @summary Instructs a session to play an item.
   * @param {SessionApiPlayRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof SessionApi
   */
  public async play(requestParameters: SessionApiPlayRequest): Promise<void> {
    this.assertParam(requestParameters.sessionId)
    return this.apiClient.post({path: `/Sessions/${requestParameters.sessionId}/Playing`, parameters: requestParameters})
  }

  /**
   * postCapabilities
   * @summary Updates capabilities for a device.
   * @param {SessionApiPostCapabilitiesRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof SessionApi
   */
  public async postCapabilities(requestParameters: SessionApiPostCapabilitiesRequest = {}): Promise<void> {
    return this.apiClient.post({path: "/Sessions/Capabilities", parameters: requestParameters})
  }

  /**
   * postFullCapabilities
   * @summary Updates capabilities for a device.
   * @param {SessionApiPostFullCapabilitiesRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof SessionApi
   */
  public async postFullCapabilities(requestParameters: SessionApiPostFullCapabilitiesRequest): Promise<void> {
    let params: Record<string, string | undefined> = {
      "id": requestParameters.id
    }
    return this.apiClient.post({path: "/Sessions/Capabilities/Full", parameters: params, data: requestParameters.clientCapabilitiesDto})
  }

  /**
   * removeUserFromSession
   * @summary Removes an additional user from a session.
   * @param {SessionApiRemoveUserFromSessionRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof SessionApi
   */
  public async removeUserFromSession(requestParameters: SessionApiRemoveUserFromSessionRequest): Promise<void> {
    this.assertParam(requestParameters.sessionId)
    this.assertParam(requestParameters.userId)
    return this.apiClient.delete({path: `/Sessions/${requestParameters.sessionId}/User/${requestParameters.userId}`, parameters: requestParameters})
  }

  /**
   * reportSessionEnded
   * @summary Reports that a session has ended.
   * @throws {RequiredError}
   * @memberof SessionApi
   */
  public async reportSessionEnded(): Promise<void> {
    return this.apiClient.post({path: "/Sessions/Logout"})
  }

  /**
   * reportViewing
   * @summary Reports that a session is viewing an item.
   * @param {SessionApiReportViewingRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof SessionApi
   */
  public async reportViewing(requestParameters: SessionApiReportViewingRequest): Promise<void> {
    return this.apiClient.post({path: "/Sessions/Viewing", parameters: requestParameters})
  }

  /**
   * sendFullGeneralCommand
   * @summary Issues a full general command to a client.
   * @param {SessionApiSendFullGeneralCommandRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof SessionApi
   */
  public async sendFullGeneralCommand(requestParameters: SessionApiSendFullGeneralCommandRequest): Promise<void> {
    this.assertParam(requestParameters.sessionId)
    return this.apiClient.post({path: `/Sessions/${requestParameters.sessionId}/Command`, data: requestParameters.generalCommand})
  }

  /**
   * sendGeneralCommand
   * @summary Issues a general command to a client.
   * @param {SessionApiSendGeneralCommandRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof SessionApi
   */
  public async sendGeneralCommand(requestParameters: SessionApiSendGeneralCommandRequest): Promise<void> {
    this.assertParam(requestParameters.sessionId)
    this.assertParam(requestParameters.command)
    return this.apiClient.post({path: `/Sessions/${requestParameters.sessionId}/Command/${requestParameters.command}`})
  }

  /**
   * sendMessageCommand
   * @summary Issues a command to a client to display a message to the user.
   * @param {SessionApiSendMessageCommandRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof SessionApi
   */
  public async sendMessageCommand(requestParameters: SessionApiSendMessageCommandRequest): Promise<void> {
    this.assertParam(requestParameters.sessionId)
    return this.apiClient.post({path: `/Sessions/${requestParameters.sessionId}/Message`, data: requestParameters.messageCommand})
  }

  /**
   * sendPlaystateCommand
   * @summary Issues a playstate command to a client.
   * @param {SessionApiSendPlaystateCommandRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof SessionApi
   */
  public async sendPlaystateCommand(requestParameters: SessionApiSendPlaystateCommandRequest): Promise<void> {
    this.assertParam(requestParameters.sessionId)
    this.assertParam(requestParameters.command)
    return this.apiClient.post({path: `/Sessions/${requestParameters.sessionId}/Playing/${requestParameters.command}`, parameters: requestParameters})
  }

  /**
   * sendSystemCommand
   * @summary Issues a system command to a client.
   * @param {SessionApiSendSystemCommandRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof SessionApi
   */
  public async sendSystemCommand(requestParameters: SessionApiSendSystemCommandRequest): Promise<void> {
    this.assertParam(requestParameters.sessionId)
    this.assertParam(requestParameters.command)
    return this.apiClient.post({path: `/Sessions/${requestParameters.sessionId}/System/${requestParameters.command}`})
  }
}