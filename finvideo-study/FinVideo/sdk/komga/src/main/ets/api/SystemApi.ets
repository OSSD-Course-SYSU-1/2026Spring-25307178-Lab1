import { Api } from "./Api";
import { ActuatorInfo } from "../model/ActuatorInfo";

/**
 * SystemApi - object-oriented interface
 * @export
 * @class SystemApi
 * @extends {Api}
 */
export class SystemApi extends Api {

  /**
   * getActuatorInfo
   * @summary Gets information about the server.
   * @throws {RequiredError}
   * @memberof SystemApi
   */
  public async getActuatorInfo(): Promise<ActuatorInfo> {
    return this.apiClient.get({ path: "/actuator/info" })
  }

}