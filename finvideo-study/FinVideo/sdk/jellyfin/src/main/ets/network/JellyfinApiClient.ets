import { ApiClient, UserInfo } from "@ohpg/network";

/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2025/7/5 18:21
 * @Version V1.0
 * @Description Jellyfin api client
 */
export class JellyfinApiClient extends ApiClient {

  private userInfo?: UserInfo

  public updateUserInfo(userInfo: UserInfo) {
    this.userInfo = userInfo
  }

  private getSafeToken(): string {
    if (this.userInfo && this.userInfo.token) {
      return this.userInfo.token
    }
    return ""
  }

  public getAuthorization(): string {
    return [
      `MediaBrowser Client="${encodeURIComponent(this.clientInfo.name)}"`,
      `Device="${encodeURIComponent(this.deviceInfo.name)}"`,
      `DeviceId="${encodeURIComponent(this.deviceInfo.id)}"`,
      `Version="${encodeURIComponent(this.clientInfo.version)}"`,
      `Token="${encodeURIComponent(this.getSafeToken())}"`
    ].join(', ');
  }

}