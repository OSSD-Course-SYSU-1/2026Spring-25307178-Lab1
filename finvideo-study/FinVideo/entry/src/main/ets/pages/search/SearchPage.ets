import router from '@ohos.router'
import { window } from '@kit.ArkUI'
import { ListRefreshView, ToolBar } from '@ohpg/fin-framework'
import { CommonConstants } from '../common/CommonConstants'
import { SearchArgs } from './SearchArgs'
import { SearchViewModel } from './SearchViewModel'
import { SectionInfo } from '../../entity/SectionInfo'
import { SectionToolBar } from '../../widget/bar/SectionToolBar'
import LazyDataSource from '../common/LazyDataSource'
import { MediaItem } from '../../widget/media/MediaItem'
import { EpisodeItem } from '../../widget/media/EpisodeItem'
import { BreakpointSystem, FinItem, FinItemType } from '@ohpg/fin-core'

@Entry
@Component
struct SearchPage {

  @StorageProp("currentAvoidArea") avoidArea?: window.AvoidArea = undefined

  private args: SearchArgs = router.getParams() as SearchArgs

  private viewModel = new SearchViewModel(getContext(), this.args.word)

  @State keyword: string = ''

  @State pageTitle: string = ''

  aboutToAppear(): void {
    this.keyword = this.args.word
    this.pageTitle = this.args.word
  }

  private async submitSearch(word: string): Promise<void> {
    let nextKeyword = word.trim()
    this.keyword = nextKeyword
    this.pageTitle = nextKeyword.length > 0 ? nextKeyword : '搜索'
    this.getUIContext().getFocusController().clearFocus()
    await this.viewModel.search(nextKeyword)
  }

  private clearKeyword(): void {
    this.keyword = ''
    this.pageTitle = '搜索'
    this.getUIContext().getFocusController().clearFocus()
    this.viewModel.clearResult()
  }

  @Builder
  private mainGroup(sectionInfo: SectionInfo, index: number) {
    if (sectionInfo.type === FinItemType.Episode) {
      SectionLand({item: sectionInfo})
    } else {
      SectionPo({item: sectionInfo})
    }
  }

  build() {
    Column() {
      ToolBar({
        title: this.pageTitle
      })

      // 搜索结果页增加就地修改和清空入口，避免用户为了换关键词反复返回主页。
      Row({ space: CommonConstants.SPACE_8 }) {
        Search({ value: this.keyword, placeholder: $r('app.string.search_title') })
          .fontColor($r('sys.color.ohos_id_color_text_primary'))
          .height(40)
          .layoutWeight(1)
          .onChange((value: string) => {
            this.keyword = value
          })
          .onSubmit((word: string) => {
            this.submitSearch(word)
          })

        if (this.keyword.length > 0) {
          Button('清空')
            .height(40)
            .fontSize(14)
            .onClick(() => {
              this.clearKeyword()
            })
        }
      }
      .width(CommonConstants.FULL_PERCENT)
      .padding({
        left: CommonConstants.SPACE_16,
        right: CommonConstants.SPACE_16,
        bottom: CommonConstants.SPACE_8
      })

      ListRefreshView({
        source: this.viewModel,
        itemLayout: this.mainGroup,
        listAttribute: (attr) => {
          attr.divider = {
            color: Color.Transparent,
            strokeWidth: CommonConstants.SPACE_12
          }
          attr.width = CommonConstants.FULL_PERCENT
          attr.height = CommonConstants.FULL_PERCENT
          attr.contentEndOffset = px2vp(this.avoidArea?.bottomRect.height)
        },
      })
        .width(CommonConstants.FULL_PERCENT)
        .layoutWeight(1)
    }
    .width(CommonConstants.FULL_PERCENT)
    .height(CommonConstants.FULL_PERCENT)
  }

}

@Component
struct SectionPo {

  @Require @State item?: SectionInfo = undefined

  @StorageProp(BreakpointSystem.CURRENT_WIDTH_BREAKPOINT) currentWidthBreakpoint: WidthBreakpoint = WidthBreakpoint.WIDTH_SM

  private itemData = new LazyDataSource<FinItem>()

  aboutToAppear(): void {
    this.itemData.dataArray = this.item?.items!
  }

  // 搜索结果横向海报列表随断点增宽，方便在大屏上展示更多封面细节。
  private itemWidth(): number {
    if (this.currentWidthBreakpoint === WidthBreakpoint.WIDTH_SM) {
      return 140
    }
    if (this.currentWidthBreakpoint === WidthBreakpoint.WIDTH_MD) {
      return 168
    }
    return 196
  }

  private contentOffset(): number {
    if (this.currentWidthBreakpoint === WidthBreakpoint.WIDTH_SM) {
      return CommonConstants.SPACE_16
    }
    if (this.currentWidthBreakpoint === WidthBreakpoint.WIDTH_MD) {
      return 24
    }
    return 32
  }

  build() {
    Column() {
      SectionToolBar({item: this.item})
      List({space: CommonConstants.SPACE_12}) {
        LazyForEach(this.itemData, (item: FinItem) => {
            ListItem() {
              MediaItem({item: item, itemWidth: this.itemWidth()})
            }
        })
      }
      .contentStartOffset(this.contentOffset())
      .contentEndOffset(this.contentOffset())
      .width(CommonConstants.FULL_PERCENT)
      .scrollBar(BarState.Off)
      .listDirection(Axis.Horizontal)
    }
    .width(CommonConstants.FULL_PERCENT)
  }

}

@Component
struct SectionLand {

  @Require @State item?: SectionInfo = undefined

  @StorageProp(BreakpointSystem.CURRENT_WIDTH_BREAKPOINT) currentWidthBreakpoint: WidthBreakpoint = WidthBreakpoint.WIDTH_SM

  private itemData = new LazyDataSource<FinItem>()

  aboutToAppear(): void {
    this.itemData.dataArray = this.item?.items!
  }

  // 剧集横卡比海报更宽，宽屏下同步放大以保留标题可读性。
  private itemWidth(): number {
    if (this.currentWidthBreakpoint === WidthBreakpoint.WIDTH_SM) {
      return 200
    }
    if (this.currentWidthBreakpoint === WidthBreakpoint.WIDTH_MD) {
      return 260
    }
    return 320
  }

  private contentOffset(): number {
    if (this.currentWidthBreakpoint === WidthBreakpoint.WIDTH_SM) {
      return CommonConstants.SPACE_16
    }
    if (this.currentWidthBreakpoint === WidthBreakpoint.WIDTH_MD) {
      return 24
    }
    return 32
  }

  build() {
    Column() {
      SectionToolBar({item: this.item})
      List({space: CommonConstants.SPACE_12}) {
        LazyForEach(this.itemData, (item: FinItem) => {
          ListItem() {
            EpisodeItem({item: item, itemWidth: this.itemWidth()})
          }
        })
      }
      .contentStartOffset(this.contentOffset())
      .contentEndOffset(this.contentOffset())
      .width(CommonConstants.FULL_PERCENT)
      .scrollBar(BarState.Off)
      .listDirection(Axis.Horizontal)
    }
    .width(CommonConstants.FULL_PERCENT)
  }

}
