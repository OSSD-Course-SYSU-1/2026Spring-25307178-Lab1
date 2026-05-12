import { Api } from "./Api";
import { LogFile } from "../model/LogFile";
import { SystemInfo } from "../model/SystemInfo";
import { EndPointInfo } from "../model/EndPointInfo";
import { PublicSystemInfo } from "../model/PublicSystemInfo";
import { WakeOnLanInfo } from "../model/WakeOnLanInfo";

/**
 * Request parameters for getLogFile operation in SystemApi.
 * @export
 * @interface SystemApiGetLogFileRequest
 */
export interface SystemApiGetLogFileRequest {
  /**
   * The name of the log file to get.
   * @type {string}
   * @memberof SystemApiGetLogFile
   */
  readonly name: string
}

/**
 * SystemApi - object-oriented interface
 * @export
 * @class SystemApi
 * @extends {Api}
 */
export class SystemApi extends Api {

  /**
   * getEndpointInfo
   * @summary Gets information about the request endpoint.
   * @throws {RequiredError}
   * @memberof SystemApi
   */
  public async getEndpointInfo(): Promise<EndPointInfo> {
    return this.apiClient.get({ path: "/System/Endpoint" })
  }

  /**
   * getLogFile
   * @summary Gets a log file.
   * @param {SystemApiGetLogFileRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof SystemApi
   */
  public async getLogFile(requestParameters: SystemApiGetLogFileRequest): Promise<string> {
    return this.apiClient.get({ path: "/System/Logs/Log", parameters: requestParameters })
  }

  /**
   * getPingSystem
   * @summary Pings the system.
   * @throws {RequiredError}
   * @memberof SystemApi
   */
  public async getPingSystem(): Promise<string> {
    return this.apiClient.get({ path: "/System/Ping" })
  }

  /**
   * getPublicSystemInfo
   * @summary Gets public information about the server.
   * @throws {RequiredError}
   * @memberof SystemApi
   */
  public async getPublicSystemInfo(): Promise<PublicSystemInfo> {
    return this.apiClient.get({ path: "/System/Info/Public" })
  }

  /**
   * getServerLogs
   * @summary Gets a list of available server log files.
   * @throws {RequiredError}
   * @memberof SystemApi
   */
  public async getServerLogs(): Promise<Array<LogFile>> {
    return this.apiClient.get({ path: "/System/Logs" })
  }

  /**
   * getSystemInfo
   * @summary Gets information about the server.
   * @throws {RequiredError}
   * @memberof SystemApi
   */
  public async getSystemInfo(): Promise<SystemInfo> {
    return this.apiClient.get({ path: "/System/Info" })
  }

  /**
   * getWakeOnLanInfo
   * @summary Gets wake on lan information.
   * @deprecated
   * @throws {RequiredError}
   * @memberof SystemApi
   */
  public async getWakeOnLanInfo(): Promise<Array<WakeOnLanInfo>> {
    return this.apiClient.get({ path: "/System/WakeOnLanInfo" })
  }

  /**
   * postPingSystem
   * @summary Pings the system.
   * @throws {RequiredError}
   * @memberof SystemApi
   */
  public async postPingSystem(): Promise<string> {
    return this.apiClient.post({ path: "/System/Ping" })
  }

  /**
   * restartApplication
   * @summary Restarts the application.
   * @throws {RequiredError}
   * @memberof SystemApi
   */
  public async restartApplication(): Promise<void> {
    return this.apiClient.post({ path: "/System/Restart" })
  }

  /**
   * shutdownApplication
   * @summary Shuts down the application.
   * @throws {RequiredError}
   * @memberof SystemApi
   */
  public async shutdownApplication(): Promise<void> {
    return this.apiClient.post({ path: "/System/Shutdown" })
  }

}