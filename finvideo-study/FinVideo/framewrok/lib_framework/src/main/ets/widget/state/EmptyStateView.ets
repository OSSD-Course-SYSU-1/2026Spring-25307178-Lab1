import { CommonConstants } from "../../common/CommonConstants";

@Component
export struct EmptyStateView {

  build() {
    Stack() {
      Text("这里空空如也")
        .fontSize($r('sys.float.Title_M'))
    }
      .width(CommonConstants.FULL_PERCENT)
      .height(CommonConstants.FULL_PERCENT)

  }

}

@Builder
export function emptyStateViewBuilder() {
  EmptyStateView()
}