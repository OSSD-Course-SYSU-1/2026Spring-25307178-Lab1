import { window } from '@kit.ArkUI'
import { CommonConstants } from '../common/CommonConstants'
import { FavouriteListVewModel } from './FavouriteListVewModel'
import { GridRefreshView } from '@ohpg/fin-framework'
import { MediaItem } from '../../widget/media/MediaItem'
import { FavouriteListArgs } from './FavouriteListArgs'
import { ToolBar } from '@ohpg/fin-framework'
import { BreakpointSystem, FinItem, FinItemType } from '@ohpg/fin-core'
import { EpisodeItem } from '../../widget/media/EpisodeItem'
import { ResponsiveLayout } from '../../adaptive/ResponsiveLayout'

@Entry
@Component
struct FavouriteListPage {

  private args = this.getUIContext().getRouter().getParams() as FavouriteListArgs

  private viewModel = new FavouriteListVewModel(this.args, this.getUIContext().getHostContext()!)

  @StorageProp('currentAvoidArea') currentAvoidArea?: window.AvoidArea = undefined

  @StorageProp(BreakpointSystem.CURRENT_WIDTH_BREAKPOINT) currentWidthBreakpoint: WidthBreakpoint = WidthBreakpoint.WIDTH_SM

  @State gridScale: number = 1

  // Favourite detail follows the same breakpoint density and pinch scale as the main media grids.
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
    if ((info as FinItem).type === FinItemType.Episode) {
      EpisodeItem({item: info as FinItem, itemWidth: CommonConstants.FULL_PERCENT})
    } else {
      MediaItem({item: info as FinItem})
    }
  }

  build() {
    Column() {

      ToolBar({
        title: this.args.name
      })

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
