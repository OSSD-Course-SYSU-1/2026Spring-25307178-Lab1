import { window } from '@kit.ArkUI'
import { DetailArgs } from '../DetailArgs'
import { MovieViewModel } from './MovieViewModel'
import { CommonConstants } from '../../common/CommonConstants'
import { DetailCover, DetailFooter, DetailHeader } from '../DetailComponent'
import { ScrollRefreshView } from '@ohpg/fin-framework'
import { BreakpointSystem, FinItem } from '@ohpg/fin-core'
import { ToolBar } from '@ohpg/fin-framework'
import { ResponsiveLayout } from '../../../adaptive/ResponsiveLayout'

let movieStorage: LocalStorage = new LocalStorage();
@Entry(movieStorage)
@Component
struct MoviePage {

  @StorageProp("currentAvoidArea") avoidArea?: window.AvoidArea = undefined

  @StorageProp(BreakpointSystem.CURRENT_WIDTH_BREAKPOINT) currentWidthBreakpoint: WidthBreakpoint = WidthBreakpoint.WIDTH_SM

  @StorageProp(BreakpointSystem.CURRENT_HEIGHT_BREAKPOINT) currentHeightBreakpoint: HeightBreakpoint = HeightBreakpoint.HEIGHT_SM

  private args = this.getUIContext().getRouter().getParams() as DetailArgs

  private viewModel = new MovieViewModel(getContext(), this.args)

  aboutToAppear(): void {
    movieStorage.setOrCreate("viewModel", this.viewModel)
  }

  @Builder
  movieScrollView(item?: FinItem) {
    Column({space: CommonConstants.SPACE_12}) {
      DetailCover({itemDto: item})
      if (ResponsiveLayout.isCompact(this.currentWidthBreakpoint)) {
        DetailHeader({itemDto: item})
        if (item && item.person && item.person.length > 0) {
          DetailFooter({itemDto: item})
        }
      } else {
        Row({space: ResponsiveLayout.detailGap(this.currentWidthBreakpoint)}) {
          DetailHeader({itemDto: item})
            .width(item && item.person && item.person.length > 0 ? '58%' : '100%')
          if (item && item.person && item.person.length > 0) {
            DetailFooter({itemDto: item})
              .width('42%')
          }
        }
        .width(CommonConstants.FULL_PERCENT)
        .alignItems(VerticalAlign.Top)
      }
    }
    .padding({
      bottom: px2vp(this.avoidArea?.bottomRect.height)
    })
    .alignItems(HorizontalAlign.Start)
    .width(ResponsiveLayout.detailMaxWidth(this.currentWidthBreakpoint))
    .alignSelf(ItemAlign.Center)
  }

  build() {
    Stack() {
      ScrollRefreshView({
        source: this.viewModel,
        itemLayout: (info: ESObject) => {
          this.movieScrollView(info)
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

}
