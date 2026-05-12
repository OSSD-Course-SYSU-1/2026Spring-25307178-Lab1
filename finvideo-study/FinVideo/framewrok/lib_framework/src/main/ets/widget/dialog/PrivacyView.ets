import { WebTool } from "@ohpg/fin-core"
import { bundleManager, common } from "@kit.AbilityKit"
import { PrivacyOptions } from "../../dialog/PrivacyDialog"

@Component
export struct PrivacyView {

  options?: PrivacyOptions

  @State appName?: string = undefined

  aboutToAppear(): void {
    let bundleInfo = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION)
    let resourceManager = getContext().resourceManager
    this.appName = resourceManager.getStringSync(bundleInfo.appInfo.labelResource)
  }

  build() {
    Stack() {
      Column({ space: 12 }) {
        Text($r('app.string.privacy_dialog_title'))
          .fontSize(24)
        Text() {
          Span("欢迎来到")
          Span(this.appName)
          Span("\n")
          Span("根据法律法规，我们发布了")
          Span("《隐私声明》")
            .fontColor($r('sys.color.ohos_id_color_activated'))
            .onClick(() => {
              WebTool.openBrowser(getContext(), this.options!.privacy!)
            })
          Span("点击\“同意\”，表示您同意此声明。")
        }

        Row() {
          Button("不同意")
            .padding({
              left: 16,
              right: 16
            })
            .onClick(() => {
              (getContext() as common.UIAbilityContext).terminateSelf()
            })
          Button("同意")
            .padding({
              left: 16,
              right: 16
            })
            .onClick(() => {
              this.options?.callback?.()
            })
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceAround)
      }
      .padding(16)
      .border({
        radius: 16
      })
      .backgroundColor($r('sys.color.ohos_id_color_dialog_bg'))
      .size({
        width: 300
      })
    }
    .onClick(() => {})
    .backgroundColor($r('sys.color.comp_background_secondary'))
    .width('100%')
    .height('100%')
  }

}