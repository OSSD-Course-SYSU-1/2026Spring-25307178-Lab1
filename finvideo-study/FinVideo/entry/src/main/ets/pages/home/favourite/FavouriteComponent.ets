import { CommonConstants } from "../../common/CommonConstants"
import { FavouriteViewModel } from "./FavouriteViewModel"
import { ListRefreshView } from "@ohpg/fin-framework"
import { HomeToolBar } from "../../../widget/bar/HomeToolBar"
import { CategoryToolBar } from "../../../widget/bar/CategoryToolBar"
import { EpisodeItem } from "../../../widget/media/EpisodeItem"
import { MediaItem } from "../../../widget/media/MediaItem"
import { GroupInfo } from "../../../entity/GroupInfo"
import { BreakpointSystem, FinItem, FinItemType } from "@ohpg/fin-core"

/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2024/11/7 20:27
 * @Version V1.0
 * @Description Main
 */
@Component
export struct FavouriteComponent {

  private viewModel = new FavouriteViewModel(getContext())

  @Builder
  favouriteGroupBuilder(group: GroupInfo, index: number) {
    FavouriteGroup({item: group})
  }

  build() {
    Column() {

      HomeToolBar({
        title: $r('app.string.home_favourite')
      })

      ListRefreshView({
        source: this.viewModel,
        itemLayout: this.favouriteGroupBuilder,
        listAttribute: (attr) => {
          attr.divider = {
            color: Color.Transparent,
            strokeWidth: 16
          }
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

@Component
@Reusable
struct FavouriteGroup {

  @Require @State item?: GroupInfo = undefined

  @StorageProp(BreakpointSystem.CURRENT_WIDTH_BREAKPOINT) currentWidthBreakpoint: WidthBreakpoint = WidthBreakpoint.WIDTH_SM

  aboutToReuse(params: Record<string, object>): void {
    this.item = params['item'] as GroupInfo
  }

  // 收藏页和首页共用一套断点尺寸，切到大屏后列表不会显得过密。
  private posterWidth(): number {
    if (this.currentWidthBreakpoint === WidthBreakpoint.WIDTH_SM) {
      return 140
    }
    if (this.currentWidthBreakpoint === WidthBreakpoint.WIDTH_MD) {
      return 168
    }
    return 196
  }

  private episodeWidth(): number {
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
      // title
      CategoryToolBar({
        item: this.item
      })
      // list
      List({space: 8}) {
        ForEach(this.item?.items, (item: FinItem) => {
          ListItem() {
            if (item.type === FinItemType.Episode) {
              EpisodeItem({item: item, itemWidth: this.episodeWidth()})
            } else {
              MediaItem({item: item, itemWidth: this.posterWidth()})
            }
          }
        })
      }
      .contentStartOffset(this.contentOffset())
      .contentEndOffset(this.contentOffset())
      .width('100%')
      .scrollBar(BarState.Off)
      .listDirection(Axis.Horizontal)
    }
    .alignItems(HorizontalAlign.Start)
    .width('100%')
  }

  aboutToRecycle(): void {

  }

}
