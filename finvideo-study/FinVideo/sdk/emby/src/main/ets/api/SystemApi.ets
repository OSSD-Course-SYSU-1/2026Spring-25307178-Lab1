import { Api } from "./Api";
import { SystemInfo } from "../model/SystemInfo";
import { EndPointInfo } from "../model/EndPointInfo";
import { PublicSystemInfo } from "../model/PublicSystemInfo";

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
   * getSystemInfo
   * @summary Gets information about the server.
   * @throws {RequiredError}
   * @memberof SystemApi
   */
  public async getSystemInfo(): Promise<SystemInfo> {
    return this.apiClient.get({ path: "/System/Info" })
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