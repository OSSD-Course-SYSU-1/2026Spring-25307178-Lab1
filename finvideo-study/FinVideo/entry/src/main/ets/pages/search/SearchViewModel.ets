import { FinItem, FinItemType, LoadType } from "@ohpg/fin-core";
import { SectionInfo } from "../../entity/SectionInfo";
import { ListViewModel } from "../common/ListViewModel";

/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2024/11/28 21:14
 * @Version V1.0
 * @Description
 */
export class SearchViewModel extends ListViewModel {

  private word: string

  constructor(context: Context, word: string) {
    super(context)
    this.word = word
  }

  /**
   * 结果页支持二次输入搜索词，因此这里保留一个显式入口来更新关键词并重新拉取数据。
   * 空关键词只清空本地数据源，避免向媒体服务器发送无意义的搜索请求。
   */
  async search(word: string): Promise<void> {
    this.word = word.trim()
    await this.loadData("Refresh")
  }

  /**
   * 一键清空时同步清理 ViewModel 数据源，让页面立即回到空结果状态。
   */
  clearResult(): void {
    this.word = ""
    this.dataSource.initData(new Array<SectionInfo>())
  }

  async loadData(type: LoadType): Promise<void> {
    if (this.word.length === 0) {
      this.dataSource.initData(new Array<SectionInfo>())
      return
    }

    let items = await this.repository.searchMedia(this.word)
    let sectionList = new Array<SectionInfo>()
    let movieList = new Array<FinItem>()
    let seriesList = new Array<FinItem>()
    let episodeList = new Array<FinItem>()
    for (const item of items) {
      if (item.type === FinItemType.Movie) {
        movieList.push(item)
      } else if (item.type === FinItemType.Series) {
        seriesList.push(item)
      } else if (item.type === FinItemType.Episode) {
        episodeList.push(item)
      }
    }

    if (movieList.length > 0) {
      sectionList.push({
        type: FinItemType.Movie,
        items: movieList
      })
    }
    if (seriesList.length > 0) {
      sectionList.push({
        type: FinItemType.Series,
        items: seriesList
      })
    }
    if (episodeList.length > 0) {
      sectionList.push({
        type: FinItemType.Episode,
        items: episodeList
      })
    }

    this.dataSource.initData(sectionList)

  }

}
