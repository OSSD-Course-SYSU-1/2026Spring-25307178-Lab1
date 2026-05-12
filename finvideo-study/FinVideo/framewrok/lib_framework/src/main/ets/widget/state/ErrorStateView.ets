import { CommonConstants } from "../../common/CommonConstants"

@Component
export struct ErrorStateView {

  callback?: Callback<void>

  build() {

    Stack() {

      Column({space: CommonConstants.SPACE_12}) {
        Text("加载出错了")
          .fontSize($r('sys.float.Title_S'))
        Button("点击重试")
          .onClick(() => {
            this.callback?.()
          })
      }

    }
    .width(CommonConstants.FULL_PERCENT)
    .height(CommonConstants.FULL_PERCENT)

  }

}

@Builder
export function errorStateBuilder(callback?: string) {
  ErrorStateView({
  })
}