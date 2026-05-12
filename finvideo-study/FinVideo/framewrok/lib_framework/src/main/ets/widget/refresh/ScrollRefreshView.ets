import { AppEventHub, AppEvents, AppModel } from "@ohpg/fin-core";
import { LoadType } from "@ohpg/fin-core";
import { RefreshController, RefreshLayout } from "@abner/refresh"
import { emptyStateViewBuilder } from "../state/EmptyStateView";
import { ErrorStateView } from "../state/ErrorStateView";
import { loadStateBuilder } from "../state/LoadStateView";
import { SimpleRepository } from "./SimpleRepository";

@Component
export struct ScrollRefreshView {

  private controller = new RefreshController()

  private data?: Object

  @Require source?: SimpleRepository

  @State refreshEnable: boolean = true

  @BuilderParam
  itemLayout?: (item?: ESObject) => void;

  @State model: AppModel = new AppModel()

  private activeInfoChanged = () => {
    this.loadData('Refresh')
  }

  aboutToAppear(): void {
    this.loadData()
    AppEventHub.on(AppEvents.EVENT_ACTIVE_INFO_CHANGED, this.activeInfoChanged)
  }

  @Builder
  private errorStateBuilder() {
    ErrorStateView({
      callback: () => {
        this.loadData()
      }
    })
  }

  @Builder
  innerItemLayout() {
    this.itemLayout?.(this.data)
  }

  build() {
    RefreshLayout({
      controller: this.controller,
      itemLayout: () => this.innerItemLayout(),
      enableRefresh: this.refreshEnable,
      enableLoadMore: false,
      showErrorLayout: this.model.type === 'Init' && this.model.state === 'Fail',
      showLoadingLayout: this.model.type === 'Init' && this.model.state === 'Loading',
      loadingLayout: loadStateBuilder,
      emptyLayout: emptyStateViewBuilder,
      errorLayout: () => {
        this.errorStateBuilder()
      },
      onRefresh: () => this.loadData('Refresh'),
    })
  }

  private loadData(type: LoadType = "Init") {
    this.model.type = type
    this.model.state = 'Loading'
    this.source?.loadData(type)
      .then((data) => {
        this.data = data
        this.model.state = 'Success'
        this.controller.finishRefresh()
      })
      .catch((error: Error) => {
        this.model.state = 'Fail'
        this.controller.finishRefresh()
      })
  }

  aboutToDisappear(): void {
    AppEventHub.off(AppEvents.EVENT_ACTIVE_INFO_CHANGED)
  }

}