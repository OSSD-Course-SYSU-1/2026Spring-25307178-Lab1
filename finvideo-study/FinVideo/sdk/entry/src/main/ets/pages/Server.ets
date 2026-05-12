import { jellyfin, userInfo } from '../api/AppApi'
import router from '@ohos.router'

@Entry
@Component
struct Server {
  // private address: string = "https://demo.jellyfin.org"
  private address: string = "http://192.168.0.254:8096"

  aboutToAppear(): void {
  }

  build() {
    Column() {
      TextInput({text: this.address})
        .onChange((text) => {
          this.address = text
        })
        .fontWeight(FontWeight.Bold)

      Button("Choose")
        .onClick(() => {
          jellyfin.selectServer({address: this.address})
        })

      Button("PublicSystemInfo")
        .onClick(() => {
          jellyfin.getSystemApi().getPublicSystemInfo()
            .then((info) => {
              console.info("getPublicSystemInfo info: " + JSON.stringify(info, undefined, 4))
            })
            .catch((error: Error) => {
              console.error("getPublicSystemInfo error: " + JSON.stringify(error, undefined, 4))
            })
        })

      Button("SystemInfo")
        .onClick(() => {
          jellyfin.getSystemApi().getSystemInfo()
            .then((info) => {
              console.info("getSystemInfo info: " + JSON.stringify(info, undefined, 4))
            })
            .catch((error: Error) => {
              console.error("getSystemInfo error: " + JSON.stringify(error, undefined, 4))
            })
        })

      Button("Auth")
        .onClick(() => {
          jellyfin.getUserApi().authenticateUserByName({authenticateUserByName: {Username: "wzm", Pw: "-WZMWSS1314love"} })
            .then((obj) => {
              jellyfin.apiClient.updateUserInfo({id: obj.User?.Id, token: obj.AccessToken})
              userInfo.id = obj.User?.Id
              userInfo.token = obj.AccessToken!
              console.log("Auth success: " + JSON.stringify(obj, undefined, 4))
              router.pushUrl({url: "pages/Views"})
            })
            .catch((error: Error) => {
              console.error("Auth fail: " + JSON.stringify(error, undefined, 4))
            })
        })

    }
    .height('100%')
    .width('100%')
  }

  aboutToDisappear(): void {

  }

}