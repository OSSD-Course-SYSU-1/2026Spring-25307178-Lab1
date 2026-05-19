import { window } from '@kit.ArkUI'
import { CommonConstants } from '../common/CommonConstants'
import { MediaListArgs } from './MediaListArgs'
import { MediaListVewModel } from './MediaListVewModel'
import { GridRefreshView } from '@ohpg/fin-framework'
import { ToolBar } from '@ohpg/fin-framework'
import { MediaItem } from '../../widget/media/MediaItem'
import { BreakpointSystem, FinItem } from '@ohpg/fin-core'
import { SortMenu } from '../../widget/menu/SortMenu'

@Entry
@Component
struct MediaListPage {

  private args = this.getUIContext().getRouter().getParams() as MediaListArgs

  private viewModel = new MediaListVewModel(this.args, this.getUIContext().getHostContext()!)

  @StorageProp('currentAvoidArea') currentAvoidArea?: window.AvoidArea = undefined

  @StorageProp(BreakpointSystem.CURRENT_WIDTH_BREAKPOINT) currentWidthBreakpoint: WidthBreakpoint = WidthBreakpoint.WIDTH_SM

  // 列表页使用和媒体库一致的断点列宽，避免从首页跳转后视觉密度突变。
  private gridItemWidth(): number {
    if (this.currentWidthBreakpoint === WidthBreakpoint.WIDTH_SM) {
      return 140
    }
    if (this.currentWidthBreakpoint === WidthBreakpoint.WIDTH_MD) {
      return 168
    }
    return 196
  }

  private gridPadding(): number {
    if (this.currentWidthBreakpoint === WidthBreakpoint.WIDTH_SM) {
      return CommonConstants.SPACE_16
    }
    if (this.currentWidthBreakpoint === WidthBreakpoint.WIDTH_MD) {
      return 24
    }
    return 32
  }

  private columnsTemplate(): string {
    return `repeat(auto-fit, ${this.gridItemWidth()})`
  }

  @Builder
  mediaListView(info: Object, index: number) {
    MediaItem({item: info as FinItem})
  }

  build() {
    Column() {

      ToolBar({
        title: this.args.name
      }) {
        SortMenu()
      }

      GridRefreshView({
        source: this.viewModel,
        gridAttribute: (attr) => {
          attr.padding = {
            left: this.gridPadding(),
            right: this.gridPadding(),
            bottom: px2vp(this.currentAvoidArea?.bottomRect.height)
          }
          attr.rowsGap = CommonConstants.SPACE_16
          attr.columnsGap = CommonConstants.SPACE_12
          attr.columnsTemplate = this.columnsTemplate()
          attr.width = CommonConstants.FULL_PERCENT
          attr.height = CommonConstants.FULL_PERCENT
        },
        itemLayout: this.mediaListView
      })
        .width(CommonConstants.FULL_PERCENT)
        .layoutWeight(1)
    }
  }

}
