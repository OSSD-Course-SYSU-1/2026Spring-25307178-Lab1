import { CommonConstants } from "../../common/CommonConstants"

@Component
export struct LoadStateView {
  build() {
    Stack() {

      Column() {
        LoadingProgress()
          .width($r('sys.float.ohos_id_progress_default_diameter'))
          .height($r('sys.float.ohos_id_progress_default_diameter'))
          .color($r('sys.color.brand'))
        Text("加载中")
          .fontSize($r('sys.float.Title_M'))
      }

    }
    .width(CommonConstants.FULL_PERCENT)
    .height(CommonConstants.FULL_PERCENT)
  }
}

@Builder
export function loadStateBuilder() {
  LoadStateView()
}