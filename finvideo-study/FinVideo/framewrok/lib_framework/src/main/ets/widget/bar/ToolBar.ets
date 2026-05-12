import { router, window } from "@kit.ArkUI"
import { CommonConstants } from "../../common/CommonConstants";

@Component
export struct ToolBar {

  @Prop title: ResourceStr

  @Prop color: ResourceColor = $r('sys.color.font_primary')

  @Builder closerBuilder(){};

  @BuilderParam closer: () => void = this.closerBuilder;

  @StorageProp("currentAvoidArea") avoidArea?: window.AvoidArea = undefined

  build() {
    Column() {

      Column()
        .width('100%')
        .height(this.getUIContext().px2vp(this.avoidArea?.topRect.height))

      Row({space: CommonConstants.SPACE_16}) {
        Image($r('sys.media.ohos_ic_compnent_titlebar_back_filled'))
          .id("toolbar_icon")
          .fillColor(this.color)
          .width($r('sys.float.titlebar_icon_width'))
          .height($r('sys.float.titlebar_icon_width'))
          .onClick(() => {
            this.getUIContext().getRouter().back()
          })

        // 标题
        Text(this.title)
          .fontSize($r('sys.float.titlebar_title_secondary_size'))
          .fontColor(this.color)
          .fontWeight(FontWeight.Bold)
          .fontFamily(CommonConstants.HARMONY_HEITI_BOLD_FONT_FAMILY)
          .maxLines(1)
          .layoutWeight(1)
          .onClick(() => {
            this.getUIContext().getRouter().back()
          })

          // 自定义菜单
          this.closer()
      }
      .padding({
        left: $r('sys.float.ohos_id_default_padding_start'),
        right: $r('sys.float.ohos_id_default_padding_end')
      })
      .width('100%')
      .height($r('sys.float.ohos_id_navigation_bar_height'))

    }
  }
}