import { ActiveInfo, AddressInfo, LoadType } from '@ohpg/fin-core'
import { ToolBar } from '../../../widget/bar/ToolBar'
import { ListRefreshView } from '../../../widget/refresh/ListRefreshView'
import { CommonConstants } from '../../../common/CommonConstants'
import { EditAddressViewModel } from './EditAddressViewModel'
import { FinPages } from '../../FinPages'
import { FinRepository } from '../../../data/FinRepository'
import { AddAddressDialog } from './AddAddressDialog'

@Entry({routeName: FinPages.PAGE_FIN_EDIT_ADDRESS})
@Component
struct EditAddressPage {

  @StorageLink("Repository") repository?: FinRepository = undefined

  private viewModel = new EditAddressViewModel(getContext())

  @Provide activeAddressId?: string = undefined

  @Builder
  private itemView(addressInfo: Object, index: number) {
    AddressItem({item: addressInfo as AddressInfo})
  }

  aboutToAppear(): void {
    this.activeAddressId = this.repository?.getActiveInfo()?.addressInfo.addressId
  }

  build() {
    Column() {
      ToolBar({
        title: $r('app.string.page_address')
      }) {
        Image($r('sys.media.ohos_ic_public_add'))
          .fillColor($r('sys.color.ohos_id_color_primary'))
          .width(36)
          .height(36)
          .padding(5)
          .onClick(() => {
            this.onAddAddress()
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
        .width("100%")
        .layoutWeight(1)
    }
  }

  private onAddAddress() {
    let dialog = new AddAddressDialog(this.getUIContext())
    dialog.setDismissCallback(() => {
      this.viewModel.loadData()
    })
    dialog.show()
  }

}


@Component
@Reusable
struct AddressItem {

  @Require @State item?: AddressInfo = undefined

  @StorageLink("Repository") repository?: FinRepository = undefined

  @Consume activeAddressId?: string

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
          this.deleteAddress()
        })
    }
  }

  aboutToReuse(params: Record<string, object>): void {
    this.item = params['item'] as AddressInfo
  }

  build() {

    Row({space: CommonConstants.SPACE_12}) {
      SymbolGlyph($r('sys.symbol.worldclock'))
        .fontSize(24)
        .fontColor([$r('sys.color.ohos_id_color_text_primary')])
      Text(this.item?.address)
        .fontSize(18)
        .ellipsisMode(EllipsisMode.END)
        .textOverflow({overflow: TextOverflow.MARQUEE})
        .fontColor($r('sys.color.ohos_id_color_text_primary'))
        .layoutWeight(1)
      Toggle({type: ToggleType.Checkbox, isOn: this.activeAddressId === this.item?.addressId})
        .hitTestBehavior(HitTestMode.None)
    }
    .enabled(this.activeAddressId !== this.item?.addressId)
    .bindContextMenu(this.menuBuilder, ResponseType.LongPress)
    .width(CommonConstants.FULL_PERCENT)
    .height(48)
    .padding({
      left: CommonConstants.SPACE_16,
      right: CommonConstants.SPACE_16
    })
    .onClick(() => {
      this.selectAddress()
    })

  }

  private selectAddress() {
    if (!this.item) return
    this.repository?.selectAddress(this.item!)
      .then(() => {
        this.activeAddressId = this.item?.addressId
        this.promptAction.showToast({message: $r('app.string.address_changed')})
      })
      .catch((error: Error) => {
        this.promptAction.showToast({message: error.message})
      })
  }

  private deleteAddress() {
    if (!this.item) return
    this.repository?.deleteAddress(this.item!)
      .then(() => {
        this.promptAction.showToast({message: $r('app.string.address_delete_success')})
      })
      .catch((error: Error) => {
        this.promptAction.showToast({message: error.message})
      })
  }

}
