import { GridAttr } from "@abner/refresh";
import { MediaViewModel } from "./MediaViewModel";
import { CommonConstants } from "../../common/CommonConstants";
import { GridRefreshView } from "@ohpg/fin-framework";
import { HomeToolBar } from "../../../widget/bar/HomeToolBar";
import { MediaRouter } from "../../common/MediaRouter";
import { BreakpointSystem, FinItem } from "@ohpg/fin-core";

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

  // Grid 的 auto-fit 列宽随断点增长，使媒体库在大小屏上都保持合适密度。
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
