import { LoadType } from "@ohpg/fin-core";
import { GroupInfo } from "../../../entity/GroupInfo";
import { ListViewModel } from "../../common/ListViewModel";

/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2024/11/12 21:42
 * @Version V1.0
 * @Description
 */
export class MainViewModel extends ListViewModel {

  constructor(context: Context) {
    super(context)
  }

  async loadData(type: LoadType): Promise<void> {
    let groupArray = new Array<GroupInfo>()
    // 最近播放放在首页顶部，方便演示时快速回到刚打开过的视频。
    let recentItems = this.repository.getRecentPlaybackItems()
    if (recentItems && recentItems.length > 0) {
      groupArray.push({
        type: "Recent",
        group: {
          id: "",
          name: "最近播放"
        },
        items: recentItems
      })
    }
    let resumeItems = await this.repository.getResumeItems()
    if (resumeItems && resumeItems.length > 0) {
      groupArray.push({
        type: "Continue",
        group: {
          id: "",
          name: "继续观看"
        },
        items: resumeItems
      })
    }
    let nextUpItems = await this.repository.getNextUp()
    if (nextUpItems && nextUpItems.length > 0) {
      groupArray.push({
        type: "Next",
        group: {
          id: "",
          name: "接下来"
        },
        items: nextUpItems
      })
    }
    let normalItems = await this.repository.getLibraryList()
    if (normalItems) {
      for (let item of normalItems) {
        let items = await this.repository.getLibraryLatestMedia(item.id)
        if (items && items.length > 0) {
          groupArray.push({
            type: "Normal",
            group: item,
            items: items
          })
        }
      }
    }
    this.dataSource.initData(groupArray)
  }

  onClear(): void {

  }

}
