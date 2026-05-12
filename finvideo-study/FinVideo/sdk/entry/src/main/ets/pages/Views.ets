import { jellyfin, userInfo } from '../api/AppApi'

@Entry
@Component
struct Views {

  build() {

    Column() {
      Button("数据")
        .onClick(() => {
          this.getUserViews()
        })
    }

  }

  private async getUserViews() {
    let result = await jellyfin.getUserViewsApi().getUserViews({userId: userInfo.id})
    for(let item of result.Items!) {
      console.log("Media " + item.Name + ": " + JSON.stringify(item, undefined, 4))
      let mediaResult = await jellyfin.getUserLibraryApi().getLatestMedia({userId: userInfo.id, parentId: item.Id!, limit: 16})
      console.log("Media detail " + item.Name + ": " + JSON.stringify(mediaResult, undefined, 4))
    }
  }

}