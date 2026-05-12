import { ServerInfo } from '@ohpg/fin-core'
import { ToolBar } from '../../../widget/bar/ToolBar'
import { ListRefreshView } from '../../../widget/refresh/ListRefreshView'
import { CommonConstants } from '../../../common/CommonConstants'
import { EditServerViewModel } from './EditServerViewModel'
import { FinRepository } from '../../../data/FinRepository'
import { FinPages } from '../../FinPages'
import { FinRouter } from '../../FinRouter'

@Preview
@Entry({routeName: FinPages.PAGE_FIN_EDIT_SERVER})
@Component
struct EditServerPage {

  @StorageLink("Repository") repository?: FinRepository = undefined

  private viewModel = new EditServerViewModel(getContext())

  @Provide activeServerId?: string = undefined

  @Builder
  private itemView(serverInfo: Object, index: number) {
    ServerItem({item: serverInfo as ServerInfo})
  }

  aboutToAppear(): void {
    this.activeServerId = this.repository?.getActiveInfo()?.serverInfo.serverId
  }

  build() {
    Column() {
      ToolBar({
        title: $r('app.string.page_server')
      }) {
        Image($r('sys.media.ohos_ic_public_add'))
          .fillColor($r('sys.color.ohos_id_color_primary'))
          .width(36)
          .height(36)
          .padding(5)
          .onClick(() => {
            this.onAddServer()
          })
      }
      ListRefreshView({
        source: this.viewModel,
        itemLayout: this.itemView,
        listAttribute: (attr) => {
          attr.divider = {
            color: Color.Transparent,
            strokeWidth: CommonConstants.SPACE_12
          }
          attr.width = CommonConstants.FULL_PERCENT
          attr.height = CommonConstants.FULL_PERCENT
        },
      })
        .width(CommonConstants.FULL_PERCENT)
        .layoutWeight(1)
    }
  }

  private onAddServer() {
    FinRouter.auth(this.getUIContext())
  }
}


@Component
@Reusable
struct ServerItem {

  @Require @State item?: ServerInfo = undefined

  @StorageLink("Repository") repository?: FinRepository = undefined

  @Consume activeServerId?: string

  private readonly promptAction = this.getUIContext().getPromptAction()

  @Builder
  menuBuilder() {
    // https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-popup-and-menu-components-menu
    Menu() {
      MenuItem({
        startIcon: $r('sys.media.ohos_ic_public_remove'),
        content: $r('app.string.menu_delete')
      })
        .onClick(() => {
          this.deleteServer()
        })
    }
  }

  aboutToReuse(params: Record<string, object>): void {
    this.item = params['item'] as ServerInfo
  }

  build() {

    Row({space: CommonConstants.SPACE_12}) {
      SymbolGlyph($r('sys.symbol.externaldrive'))
        .fontSize(24)
        .fontColor([$r('sys.color.ohos_id_color_text_primary')])
      Text(this.item?.serverName)
        .fontSize(18)
        .fontColor($r('sys.color.ohos_id_color_text_primary'))
      Blank()
      Toggle({type: ToggleType.Checkbox, isOn: this.activeServerId === this.item?.serverId})
        .hitTestBehavior(HitTestMode.None)
    }
    .enabled(this.activeServerId !== this.item?.serverId)
    .bindContextMenu(this.menuBuilder, ResponseType.LongPress)
    .width(CommonConstants.FULL_PERCENT)
    .height(48)
    .padding({
      left: CommonConstants.SPACE_16,
      right: CommonConstants.SPACE_16
    })
    .onClick(() => {
      this.selectServer()
    })

  }

  private selectServer() {
    if (!this.item) return
    this.repository?.selectServer(this.item)
      .then(() => {
        this.activeServerId = this.item?.serverId
        this.promptAction.showToast({message: $r('app.string.address_changed')})
      })
      .catch((error: Error) => {
        this.promptAction.showToast({message: error.message})
      })
  }

  private deleteServer() {
    if (!this.item) return
    this.repository?.deleteServer(this.item!)
      .then(() => {
        this.promptAction.showToast({message: $r('app.string.address_delete_success')})
      })
      .catch((error: Error) => {
        this.promptAction.showToast({message: error.message})
      })
  }

}