import { UserInfo } from '@ohpg/fin-core'
import { ToolBar } from '../../../widget/bar/ToolBar'
import { ListRefreshView } from '../../../widget/refresh/ListRefreshView'
import { CommonConstants } from '../../../common/CommonConstants'
import { EditUserViewModel } from './EditUserViewModel'
import { FinPages } from '../../FinPages'
import { FinRepository } from '../../../data/FinRepository'
import { AddUserDialog } from './AddUserDialog'

@Preview
@Entry({routeName: FinPages.PAGE_FIN_EDIT_USER})
@Component
struct EditUserPage {

  @StorageLink("Repository") repository?: FinRepository = undefined

  private viewModel = new EditUserViewModel(getContext())

  @Provide activeUserId?: string = undefined

  @Builder
  private itemView(userInfo: Object, index: number) {
    UserItem({item: userInfo as UserInfo})
  }

  aboutToAppear(): void {
    this.activeUserId = this.repository?.getActiveInfo()?.userInfo.userId
  }

  build() {
    Column() {
      ToolBar({
        title: $r('app.string.page_user')
      }) {
        Image($r('sys.media.ohos_ic_public_add'))
          .fillColor($r('sys.color.ohos_id_color_primary'))
          .width(36)
          .height(36)
          .padding(5)
          .onClick(() => {
            this.onAddUser()
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

  private onAddUser() {
    let dialog = new AddUserDialog(this.getUIContext())
    dialog.setDismissCallback(() => {
      this.viewModel.loadData()
    })
    dialog.show()
  }

}

@Component
@Reusable
struct UserItem {

  @StorageLink("Repository") repository?: FinRepository = undefined

  @Require @State item?: UserInfo = undefined

  @Consume activeUserId?: string

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
          this.deleteUser()
        })
    }
  }

  aboutToReuse(params: Record<string, object>): void {
    this.item = params['item'] as UserInfo
  }

  build() {

    Row({space: CommonConstants.SPACE_12}) {
      SymbolGlyph($r('sys.symbol.person'))
        .fontSize(24)
        .fontColor([$r('sys.color.ohos_id_color_text_primary')])
      Text(this.item?.userName)
        .fontSize(18)
        .fontColor($r('sys.color.ohos_id_color_text_primary'))
      Blank()
      Toggle({type: ToggleType.Checkbox, isOn: this.activeUserId == this.item?.userId})
        .hitTestBehavior(HitTestMode.None)
    }
    .enabled(this.activeUserId !== this.item?.userId)
    .width(CommonConstants.FULL_PERCENT)
    .height(48)
    .padding({
      left: CommonConstants.SPACE_16,
      right: CommonConstants.SPACE_16
    })
    .bindContextMenu(this.menuBuilder, ResponseType.LongPress)
    .onClick(() => {
      this.selectUser()
    })

  }

  private selectUser() {
    if (!this.item) return
    this.repository?.selectUser(this.item!)
      .then(() => {
        this.activeUserId = this.item?.userId
        this.promptAction.showToast({message: $r('app.string.user_changed')})
      })
      .catch((error: Error) => {
        this.promptAction.showToast({message: error.message})
      })
  }

  private deleteUser() {
    if (!this.item) return
    this.repository?.deleteUser(this.item)
      .then(() => {
        this.promptAction.showToast({message: $r('app.string.user_delete_success')})
      })
      .catch((error: Error) => {
        this.promptAction.showToast({message: error.message})
      })
  }
}