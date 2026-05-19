import { CommonConstants } from '../../common/CommonConstants';
import { MainViewModel } from './MainViewModel';
import { ListRefreshView } from '@ohpg/fin-framework';
import { HomeToolBar } from '../../../widget/bar/HomeToolBar';
import { CategoryToolBar } from '../../../widget/bar/CategoryToolBar';
import { MediaItem } from '../../../widget/media/MediaItem';
import { EpisodeItem } from '../../../widget/media/EpisodeItem';
import { GroupInfo } from '../../../entity/GroupInfo';
import { BreakpointSystem, FinItem } from '@ohpg/fin-core';

/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2024/11/7 20:27
 * @Version V1.0
 * @Description Main
 */
@Component
export struct MainComponent {

  private viewModel = new MainViewModel(getContext())

  @Builder
  private mainGroup(groupInfo: GroupInfo, index: number) {
    MainNormalGroup({
      item: groupInfo
    })
  }

  build() {
    Column() {
      HomeToolBar({
        title: $r('app.string.home_main')
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
struct MainNormalGroup {

  @Require @State item?: GroupInfo = undefined

  @StorageProp(BreakpointSystem.CURRENT_WIDTH_BREAKPOINT) currentWidthBreakpoint: WidthBreakpoint = WidthBreakpoint.WIDTH_SM

  aboutToReuse(params: Record<string, object>): void {
    this.item = params['item'] as GroupInfo
  }

  // 小屏保持原始手机布局，中/大屏放大卡片，便于平板和宽屏窗口演示。
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
      CategoryToolBar({item: this.item})
      // list
      List({space: CommonConstants.SPACE_12}) {
        ForEach(this.item?.items, (item: FinItem) => {
          ListItem() {
            if (this.item?.type === "Normal" || this.item?.type === "Recent") {
              MediaItem({item: item, itemWidth: this.posterWidth()})
            } else {
              EpisodeItem({item: item, progress: this.item?.type === 'Continue', itemWidth: this.episodeWidth()})
            }
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

  aboutToRecycle(): void {

  }
}
