import { GridAttr } from "@abner/refresh";
import { MediaViewModel } from "./MediaViewModel";
import { CommonConstants } from "../../common/CommonConstants";
import { GridRefreshView } from "@ohpg/fin-framework";
import { HomeToolBar } from "../../../widget/bar/HomeToolBar";
import { MediaRouter } from "../../common/MediaRouter";
import { BreakpointSystem, FinItem } from "@ohpg/fin-core";
import { ResponsiveLayout } from "../../../adaptive/ResponsiveLayout";

/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2024/11/7 20:27
 * @Version V1.0
 * @Description Main
 */
@Component
export struct MediaComponent {

  private viewModel = new MediaViewModel(getContext())

  @StorageProp(BreakpointSystem.CURRENT_WIDTH_BREAKPOINT) currentWidthBreakpoint: WidthBreakpoint = WidthBreakpoint.WIDTH_SM

  @State gridScale: number = 1

  // Grid uses breakpoint width plus pinch scale, matching the PPT's responsive grid and unified gestures.
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
  mediaLibraryItem(item: Object, index: number) {
    MediaLibraryItem({
      item: item as FinItem
    })
  }

  build() {
    Column() {
      HomeToolBar({
        title: $r('app.string.home_media')
      })

      GridRefreshView({
        source: this.viewModel,
        itemLayout: this.mediaLibraryItem,
        gridAttribute: (attr: GridAttr) => {
          attr.padding = {
            left: this.gridPadding(),
            right: this.gridPadding()
          }
          attr.rowsGap = CommonConstants.SPACE_12
          attr.columnsGap = CommonConstants.SPACE_12
          attr.columnsTemplate = this.columnsTemplate()
          attr.width = CommonConstants.FULL_PERCENT
          attr.height = CommonConstants.FULL_PERCENT
        },
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

  aboutToDisappear(): void {
    this.viewModel.onClear()
  }

}

@Reusable
@Component
struct MediaLibraryItem {

  @Require @State item?: FinItem = undefined

  aboutToReuse(params: Record<string, object>): void {
    this.item = params['item'] as FinItem
  }

  build() {
    Column({space: CommonConstants.SPACE_8}) {
      Image(this.item?.image?.primary)
        .alt($r('app.media.alt'))
        .autoResize(true)
        .objectFit(ImageFit.Cover)
        .borderRadius($r('app.float.lg_border_radius'))
        .width('100%')
        .aspectRatio(1.5)

      Text(this.item?.name)
        .width('100%')
        .maxLines(1)
    }
    .onClick(() => {
      MediaRouter.openDetail(this.item!)
    })
  }

}
