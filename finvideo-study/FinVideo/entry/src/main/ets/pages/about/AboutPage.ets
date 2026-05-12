import { window } from '@kit.ArkUI'
import { WebTool } from '@ohpg/fin-core'
import { CommonConstants, ToolBar } from '@ohpg/fin-framework'
import { pasteboard } from '@kit.BasicServicesKit'

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

      // 课程移植信息用于在应用内直接确认本次作业所选版本、来源和验证结果，
      // 便于老师或同学复现时快速对照仓库报告与本地运行状态。
      Column({ space: CommonConstants.SPACE_8 }) {
        Text('课程移植信息')
          .fontSize(16)
          .fontColor($r('sys.color.ohos_id_color_text_primary'))
          .fontWeight(FontWeight.Medium)
          .width(CommonConstants.FULL_PERCENT)

        this.studyInfoRow('选用版本', 'FinVideo v0.3.3')
        this.studyInfoRow('上游提交', 'd76959b')
        this.studyInfoRow('构建验证', 'hvigor assembleHap 通过')
        this.studyInfoRow('运行验证', 'HarmonyOS 模拟器启动成功')
      }
      .width(CommonConstants.FULL_PERCENT)
      .padding({
        left: CommonConstants.SPACE_16,
        right: CommonConstants.SPACE_16,
        top: CommonConstants.SPACE_8,
        bottom: CommonConstants.SPACE_8
      })

      Blank()

      Row({space: CommonConstants.SPACE_4}) {
        Text($r('app.string.prefer_about_qq_group'))
        .fontSize(16)
        .fontColor($r('sys.color.ohos_id_color_text_secondary'))

        Text($r('app.string.prefer_about_qq_group_value'))
          .fontSize(16)
          .fontColor($r('sys.color.ohos_id_color_component_activated'))
          .onClick(() => {
            let text = getContext().resourceManager
              .getStringSync($r('app.string.prefer_about_qq_group_value'))
            const pasteboardData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, text);
            const systemPasteboard = pasteboard.getSystemPasteboard();
            systemPasteboard.setData(pasteboardData);
            this.getUIContext().getPromptAction().showToast({message: $r('app.string.prefer_about_qq_group_copied')})
          })
      }

      Row({space: CommonConstants.SPACE_4}) {
        Text($r('app.string.prefer_about_official_web'))
        .fontSize(16)
        .fontColor($r('sys.color.ohos_id_color_text_secondary'))

        Text($r('app.string.prefer_about_official_web_value'))
        .fontSize(16)
        .fontColor($r('sys.color.ohos_id_color_component_activated'))
          .onClick(() => {
            WebTool.openBrowser(getContext()
              , getContext().resourceManager
                .getStringSync($r('app.string.prefer_about_official_web_value')))
          })
      }

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
