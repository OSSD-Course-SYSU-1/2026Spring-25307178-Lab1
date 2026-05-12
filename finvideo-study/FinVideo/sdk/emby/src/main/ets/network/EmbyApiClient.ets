import { ApiClient, ApiRequest, UserInfo } from "@ohpg/network";

/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2025/7/5 21:27
 * @Version V1.0
 * @Description
 */
export class EmbyApiClient extends ApiClient {

  private userInfo?: UserInfo

  public updateUserInfo(userInfo: UserInfo) {
    this.userInfo = userInfo
  }

  protected getHeaders(request: ApiRequest): Record<string, string> {
    if (request.path.endsWith("/Users/AuthenticateByName")) {
      return this.getAuthHeader()
    } else {
      return this.getAuthHeader()
    }
  }

  private getAuthHeader(): Record<string, string> {
    let header: Record<string, string> = {
      'Content-Type': 'application/json',
      'Accept': 'application/json, application/octet-stream;q=0.9, */*;q=0.8',
      'Authorization': this.getAuthorization(),
      'User-Agent': `${this.clientInfo.name}/${this.clientInfo.version} (HarmonyOS)`
    }
    return header
  }

  private getNormalHeader(): Record<string, string> {
    return this.getAuthHeader()
  }

  protected getAuthorization(): string {
    // https://dev.emby.media/reference/RestAPI/UserService/postUsersAuthenticatebyname.html
    // https://github.com/mediabrowser/emby/wiki/User-Authentication
    return [
      // `Emby UserId="${encodeURIComponent(this.getSafeId())}"`,
      `Client="${encodeURIComponent(this.clientInfo.name)}"`,
      `Device="${encodeURIComponent(this.deviceInfo.name)}"`,
      `DeviceId="${encodeURIComponent(this.deviceInfo.id)}"`,
      `Version="${encodeURIComponent(this.clientInfo.version)}"`,
      `Token="${encodeURIComponent(this.getSafeToken())}"`
    ].join(', ');
  }

  private getSafeId(): string {
    if (this.userInfo && this.userInfo.id) {
      return this.userInfo.id
    }
    return ""
  }

  private getSafeToken(): string {
    if (this.userInfo && this.userInfo.token) {
      return this.userInfo.token
    }
    return ""
  }

}