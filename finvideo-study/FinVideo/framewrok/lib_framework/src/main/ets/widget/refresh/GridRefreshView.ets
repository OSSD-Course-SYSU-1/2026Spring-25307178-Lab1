import { AppEvents, AppModel } from "@ohpg/fin-core"
import { GridAttr, GridView, RefreshController } from '@abner/refresh';
import { CommonConstants } from "../../common/CommonConstants"
import { emptyStateViewBuilder } from "../state/EmptyStateView"
import { ErrorStateView } from "../state/ErrorStateView"
import { loadStateBuilder } from "../state/LoadStateView"
import { RefreshRepository } from "./RefreshRepository"
import { LoadHelper } from "./LoadHelper";

@Component
export struct GridRefreshView {

  private controller = new RefreshController()

  @State model: AppModel = new AppModel()

  @Require source?: RefreshRepository

  @BuilderParam
  itemLayout?: (item: Object, index: number) => void;

  gridAttribute?: (attribute: GridAttr) => void;

  private loader?: LoadHelper

  private loadCallback: Callback<void> = () => {
    this.loader?.load('Refresh')
  }

  aboutToAppear(): void {
    this.getUIContext().getHostContext()?.eventHub.on(AppEvents.EVENT_SORT_INFO_CHANGED, this.loadCallback)
    this.loader= new LoadHelper(this.model, this.source!, this.controller)
    this.loader.load()
  }

  @Builder
  private errorStateBuilder() {
    ErrorStateView({
      callback: () => {
        this.loader?.load('Init')
      }
    })
  }

  build() {
    GridView({
      lazyDataSource: this.source?.getDataSource(),
      controller: this.controller,
      enableRefresh: this.model.init,
      enableLoadMore: this.model.more,
      autoShowEmptyLayout: true,
      showErrorLayout: this.model.type === 'Init' && this.model.state === 'Fail',
      showLoadingLayout: this.model.type === 'Init' && this.model.state === 'Loading',
      loadingLayout: loadStateBuilder,
      emptyLayout: emptyStateViewBuilder,
      errorLayout: () => {
        this.errorStateBuilder()
      },
      gridAttribute: this.gridAttribute,
      itemLayout: this.itemLayout,
      onRefresh: () => this.loader?.load('Refresh'),
      onLoadMore: () => this.loader?.load("More")
    })
      .width(CommonConstants.FULL_PERCENT)
  }

  aboutToDisappear(): void {
    this.loader?.clear()
    this.getUIContext().getHostContext()?.eventHub.off(AppEvents.EVENT_SORT_INFO_CHANGED, this.loadCallback)
  }

}