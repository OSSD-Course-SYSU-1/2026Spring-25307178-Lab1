import { CommonConstants } from "../../pages/common/CommonConstants"
import { SearchArgs } from "../../pages/search/SearchArgs"
import { ResponsiveLayout } from "../../adaptive/ResponsiveLayout"
import { BreakpointSystem } from "@ohpg/fin-core"

@Component
export struct HomeToolBar {

  @Require @Prop title: ResourceStr

  @StorageProp(BreakpointSystem.CURRENT_WIDTH_BREAKPOINT) currentWidthBreakpoint: WidthBreakpoint = WidthBreakpoint.WIDTH_SM

  build() {
    GridRow({
      columns: { sm: 4, md: 8, lg: 12 },
      gutter: { x: CommonConstants.SPACE_12, y: CommonConstants.SPACE_8 }
    }) {
      GridCol({
        span: { sm: 4, md: 4, lg: 7 },
        order: { sm: 0, md: 0, lg: 0 }
      }) {
        Text(this.title)
          .fontSize($r('app.float.header_font_size'))
          .fontColor($r('sys.color.ohos_id_color_text_primary'))
          .fontWeight(FontWeight.Bold)
          .textAlign(TextAlign.Start)
          .fontFamily(CommonConstants.HARMONY_HEITI_BOLD_FONT_FAMILY)
          .maxLines(1)
          .width(CommonConstants.FULL_PERCENT)
      }

      GridCol({
        span: { sm: 4, md: 4, lg: 5 },
        order: { sm: 1, md: 1, lg: 1 }
      }) {
        Search({ placeholder: $r('app.string.search_title') })
          .fontColor($r('sys.color.ohos_id_color_text_primary'))
          .textFont({ size: $r('app.float.large_text_size') })
          .width(CommonConstants.FULL_PERCENT)
          .height($r('app.float.search_height'))
          .onSubmit((word: string) => {
            this.getUIContext().getFocusController().clearFocus()
            let searchArgs: SearchArgs = {
              word: word
            }
            this.getUIContext().getRouter().pushUrl({
              url: "pages/search/SearchPage", params: searchArgs
            })
          })
      }
    }
    .padding({
      left: ResponsiveLayout.pagePadding(this.currentWidthBreakpoint),
      right: ResponsiveLayout.pagePadding(this.currentWidthBreakpoint),
    })
    .width(CommonConstants.FULL_PERCENT)
    .height(ResponsiveLayout.homeToolbarHeight(this.currentWidthBreakpoint))
  }

}
