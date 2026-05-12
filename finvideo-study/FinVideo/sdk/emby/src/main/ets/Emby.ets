import { ApiClient, ClientInfo } from "@ohpg/network";
import { DeviceInfo } from "@ohpg/network";
import { SystemApi } from "./api/SystemApi";
import { UserApi } from "./api/UserApi";
import { EmbyApiClient } from "./network/EmbyApiClient";


/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2025/7/5 21:07
 * @Version V1.0
 * @Description Emby
 */
export class Emby {

  readonly clientInfo: ClientInfo;

  readonly deviceInfo: DeviceInfo;

  readonly apiClient: ApiClient

  private systemApi?: SystemApi

  private userApi?: UserApi

  constructor(clientInfo: ClientInfo, deviceInfo: DeviceInfo) {
    this.deviceInfo = deviceInfo
    this.clientInfo = clientInfo
    this.apiClient = new EmbyApiClient(clientInfo, deviceInfo)
  }

  public getSystemApi(): SystemApi {
    if (!this.systemApi) {
      this.systemApi = new SystemApi(this.apiClient)
    }
    return this.systemApi
  }

  public getUserApi(): UserApi {
    if (!this.userApi) {
      this.userApi = new UserApi(this.apiClient)
    }
    return this.userApi
  }

}