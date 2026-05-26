import { window } from '@kit.ArkUI'
import { CommonConstants, ToolBar } from '@ohpg/fin-framework'

@Entry
@Component
struct AboutPage {

  @StorageProp("currentAvoidArea") avoidArea?: window.AvoidArea = undefined

  @Builder
  private studyInfoRow(label: string, value: string) {
    Row({ space: CommonConstants.SPACE_8 }) {
      Text(label)
        .fontSize(14)
        .fontColor($r('sys.color.ohos_id_color_text_secondary'))
      Blank()
      Text(value)
        .fontSize(14)
        .fontColor($r('sys.color.ohos_id_color_text_primary'))
        .textAlign(TextAlign.End)
        .maxLines(2)
    }
    .width(CommonConstants.FULL_PERCENT)
  }

  build() {

    Column({space: CommonConstants.SPACE_8}) {
      ToolBar({
        title: $r('app.string.prefer_about')
      })

      Text($r('app.string.prefer_about_desc'))
        .fontSize(16)
        .textAlign(TextAlign.Start)
        .fontColor($r('sys.color.ohos_id_color_text_secondary'))
        .width(CommonConstants.FULL_PERCENT)
        .padding({
          left: CommonConstants.SPACE_16,
          right: CommonConstants.SPACE_16
        })

      // 上架版本需要向用户说明应用身份、基础项目和开源许可证，
      // 避免继续暴露上游官方联系方式或课程调试信息。
      Column({ space: CommonConstants.SPACE_8 }) {
        Text('应用信息')
          .fontSize(16)
          .fontColor($r('sys.color.ohos_id_color_text_primary'))
          .fontWeight(FontWeight.Medium)
          .width(CommonConstants.FULL_PERCENT)

        this.studyInfoRow('应用名称', 'MediaHub')
        this.studyInfoRow('当前版本', '1.0.0')
        this.studyInfoRow('基础项目', 'FinVideo v0.3.3')
        this.studyInfoRow('上游提交', 'OHPG/FinVideo d76959b')
        this.studyInfoRow('构建验证', 'hvigor assembleHap 通过')
        this.studyInfoRow('运行设备', '手机 / 平板 / 2in1')
        this.studyInfoRow('许可协议', 'GPL-3.0')
      }
      .width(CommonConstants.FULL_PERCENT)
      .padding({
        left: CommonConstants.SPACE_16,
        right: CommonConstants.SPACE_16,
        top: CommonConstants.SPACE_8,
        bottom: CommonConstants.SPACE_8
      })

      Blank()

      Stack()
        .width(CommonConstants.FULL_PERCENT)
        .height(48)

    }
    .padding({
      bottom: px2vp(this.avoidArea?.bottomRect.height)
    })
    .width(CommonConstants.FULL_PERCENT)
    .height(CommonConstants.FULL_PERCENT)

  }

}
