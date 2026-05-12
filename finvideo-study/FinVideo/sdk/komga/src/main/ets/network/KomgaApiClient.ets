import { ApiClient, UserInfo } from "@ohpg/network";
/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2025/11/2 13:11
 * @Version V1.0
 * @Description
 */
export class KomgaApiClient extends ApiClient {

  private userInfo?: UserInfo

  public updateUserInfo(userInfo: UserInfo) {
    this.userInfo = userInfo
  }

  public getAuthorization(): string {
    return this.userInfo?.token || "";
  }

}