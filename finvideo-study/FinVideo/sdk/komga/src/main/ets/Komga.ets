import { ApiClient } from "@ohpg/network";
import { SystemApi } from "./api/SystemApi";
import { ClientInfo, DeviceInfo } from "@ohpg/network";
import { ServerInfo, UserInfo } from "@ohpg/network";
import { KomgaApiClient } from "./network/KomgaApiClient";
import { UserApi } from "./api/UserApi";
import { LibraryApi } from "./api/LibraryApi";
import { ItemsApi } from "./api/ItemsApi";

/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2025/11/2 12:50
 * @Version V1.0
 * @Description
 */
export class Komga {

  readonly clientInfo: ClientInfo;

  readonly deviceInfo: DeviceInfo;

  readonly apiClient: ApiClient

  private systemApi?: SystemApi

  private userApi?: UserApi

  private libraryApi?: LibraryApi

  private itemsApi?: ItemsApi

  constructor(clientInfo: ClientInfo,
    deviceInfo: DeviceInfo) {
    this.clientInfo = clientInfo;
    this.deviceInfo = deviceInfo;
    this.apiClient = new KomgaApiClient(this.clientInfo, this.deviceInfo)
  }

  public selectServer(serverInfo: ServerInfo) {
    this.apiClient.updateServer(serverInfo)
  }

  public selectUser(userInfo: UserInfo) {
    (this.apiClient as KomgaApiClient).updateUserInfo(userInfo)
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

  public getLibraryApi(): LibraryApi {
    if (!this.libraryApi) {
      this.libraryApi = new LibraryApi(this.apiClient)
    }
    return this.libraryApi
  }

  public getItemsApi(): ItemsApi {
    if (!this.itemsApi) {
      this.itemsApi = new ItemsApi(this.apiClient)
    }
    return this.itemsApi
  }
}