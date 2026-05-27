import { window } from '@kit.ArkUI'
import { CommonConstants } from '../common/CommonConstants'
import { MediaListArgs } from './MediaListArgs'
import { MediaListVewModel } from './MediaListVewModel'
import { GridRefreshView } from '@ohpg/fin-framework'
import { ToolBar } from '@ohpg/fin-framework'
import { MediaItem } from '../../widget/media/MediaItem'
import { BreakpointSystem, FinItem } from '@ohpg/fin-core'
import { SortMenu } from '../../widget/menu/SortMenu'
import { ResponsiveLayout } from '../../adaptive/ResponsiveLayout'

@Entry
@Component
struct MediaListPage {

  private args = this.getUIContext().getRouter().getParams() as MediaListArgs

  private viewModel = new MediaListVewModel(this.args, this.getUIContext().getHostContext()!)

  @StorageProp('currentAvoidArea') currentAvoidArea?: window.AvoidArea = undefined

  @StorageProp(BreakpointSystem.CURRENT_WIDTH_BREAKPOINT) currentWidthBreakpoint: WidthBreakpoint = WidthBreakpoint.WIDTH_SM

  @State gridScale: number = 1

  // Keep the list density aligned with the media library, and allow pinch zoom for classroom demos.
  private gridItemWidth(): number {
    return ResponsiveLayout.gridCardWidth(this.currentWidthBreakpoint, this.gridScale)
  }

  private gridPadding(): number {
    return ResponsiveLayout.pagePadding(this.currentWidthBreakpoint)
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
        .gesture(PinchGesture({ fingers: 2 })
          .onActionUpdate((event: GestureEvent) => {
            if (event.scale > 1.05) {
              this.gridScale = ResponsiveLayout.clampGridScale(this.gridScale + 0.02)
            } else if (event.scale < 0.95) {
              this.gridScale = ResponsiveLayout.clampGridScale(this.gridScale - 0.02)
            }
          }))
    }
  }

}
