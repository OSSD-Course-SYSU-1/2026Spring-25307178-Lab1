import { CommonConstants } from '../../common/CommonConstants'
import { DetailArgs } from '../DetailArgs'
import { DetailCover, DetailFooter, DetailHeader } from '../DetailComponent'
import { ShowViewModel } from './ShowViewModel'
import { window } from '@kit.ArkUI'
import { ShowInfo } from './ShowInfo'
import { ShowNextUp, ShowSeasons } from './ShowComponent'
import { ScrollRefreshView } from '@ohpg/fin-framework'
import { ToolBar } from '@ohpg/fin-framework'
import { BreakpointSystem } from '@ohpg/fin-core'
import { ResponsiveLayout } from '../../../adaptive/ResponsiveLayout'

let showStorage: LocalStorage = new LocalStorage();
@Entry(showStorage)
@Component
struct ShowPage {

  @StorageProp("currentAvoidArea") avoidArea?: window.AvoidArea = undefined

  @StorageProp(BreakpointSystem.CURRENT_WIDTH_BREAKPOINT) currentWidthBreakpoint: WidthBreakpoint = WidthBreakpoint.WIDTH_SM

  @StorageProp(BreakpointSystem.CURRENT_HEIGHT_BREAKPOINT) currentHeightBreakpoint: HeightBreakpoint = HeightBreakpoint.HEIGHT_SM

  private args = this.getUIContext().getRouter().getParams() as DetailArgs

  private viewModel = new ShowViewModel(getContext(), this.args)

  aboutToAppear(): void {
    showStorage.setOrCreate("viewModel", this.viewModel)
  }

  @Builder
  showScrollView(info?: ShowInfo) {
    Column({space: CommonConstants.SPACE_12}) {
      DetailCover({itemDto: info?.show})
      if (ResponsiveLayout.isCompact(this.currentWidthBreakpoint)) {
        DetailHeader({itemDto: info?.show})
        // Compact screens keep a single reading column.
        if (info?.nextUp) {
          ShowNextUp({
            nextDto: info.nextUp
          })
        }
      } else {
        Row({space: ResponsiveLayout.detailGap(this.currentWidthBreakpoint)}) {
          // Expanded screens use a two-column detail area.
          DetailHeader({itemDto: info?.show})
            .width(info?.nextUp ? '58%' : '100%')
            .height('auto')
          if (info?.nextUp) {
            ShowNextUp({
              nextDto: info.nextUp
            })
              .width('42%')
              .height('auto')
          }
        }
        .width('100%')
        .alignItems(VerticalAlign.Top)
        .justifyContent(FlexAlign.Start)
      }
      if (info?.seasons) {
        ShowSeasons({
          args: this.args,
          seasonDto: info.seasons
        })
      }
      if (info?.show && info.show.person && info.show.person.length > 0) {
        DetailFooter({itemDto: info?.show})
      }
    }
    .padding({
      bottom: px2vp(this.avoidArea?.bottomRect.height)
    })
    .width(ResponsiveLayout.detailMaxWidth(this.currentWidthBreakpoint))
    .alignSelf(ItemAlign.Center)
  }

  build() {
    Stack() {
      ScrollRefreshView({
        source: this.viewModel,
        itemLayout: (info: ESObject) => {
          this.showScrollView(info)
        }
      })
      ToolBar({
        color: $r('sys.color.font_on_primary')
      })
    }
    .alignContent(Alignment.Top)
    .width(CommonConstants.FULL_PERCENT)
    .height(CommonConstants.FULL_PERCENT)
  }

  aboutToDisappear(): void {
  }

}
