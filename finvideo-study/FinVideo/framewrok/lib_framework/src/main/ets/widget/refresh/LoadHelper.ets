import { RefreshController } from "@abner/refresh";
import { AppEventHub, AppEvents, AppModel, LoadType } from "@ohpg/fin-core";
import { RefreshRepository } from "./RefreshRepository";

export class LoadHelper {

  private readonly controller: RefreshController

  private readonly model: AppModel

  private readonly source: RefreshRepository

  private activeInfoChanged = () => {
    this.load('Refresh')
  }

  constructor(model: AppModel, source: RefreshRepository, controller: RefreshController) {
    this.model = model
    this.source = source
    this.controller = controller
    AppEventHub.on(AppEvents.EVENT_ACTIVE_INFO_CHANGED, this.activeInfoChanged)
  }

  public load(type: LoadType = "Init") {
    this.model.type = type
    this.model.state = 'Loading'
    this.source?.loadData(type)
      .then(() => {
        if (!this.model.init) {
          this.model.init = true
        }
        this.model.state = 'Success'
        if (type !== "More") {
          this.controller.finishRefresh()
        } else {
          this.controller.finishLoadMore()
        }
        this.model.more = this.source.hasMore()
      })
      .catch((error: Error) => {
        this.model.state = 'Fail'
        if (type !== "More") {
          this.controller.finishRefresh()
        } else {
          this.controller.finishLoadMore()
        }
      })
  }

  public clear() {
    AppEventHub.off(AppEvents.EVENT_ACTIVE_INFO_CHANGED, this.activeInfoChanged)
  }

}