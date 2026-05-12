import { Dialog } from "../../../dialog/Dialog";
import { ComponentContent, promptAction } from "@kit.ArkUI";
import { FinRepository } from "../../../data/FinRepository";
import { StringTool } from '@ohpg/fin-core'
/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2025/4/12 19:11
 * @Version V1.0
 * @Description Add address
 */
export class AddAddressDialog extends Dialog {

  private callback: Callback<void> = () => {
    this.dismiss(true)
  }

  protected onCreateContent(): ComponentContent<object> {
    return new ComponentContent(this.uiContext, wrapBuilder(addAddressBuilder), this.callback)
  }

}

@Builder
function addAddressBuilder(callback: Callback<void>) {
  addAddressComponent({
    callback: callback
  })
    .align(Alignment.Center)
    .onClick(() => {})
    .backgroundColor($r('sys.color.comp_background_secondary'))
    .width('100%')
    .height('100%')
}

@Component
struct addAddressComponent {

  callback?: Callback<void>

  @StorageLink("Repository") repository?: FinRepository = undefined

  @State verifying: boolean = false

  private url?: string

  aboutToAppear(): void {

  }

  build() {

    Column({space: 12}) {
      Text($r('app.string.address_add'))
        .fontSize(22)

      TextInput()
        .type(InputType.URL)
        .onChange((value) => {
          this.url = value
        })

      Button({type: ButtonType.Capsule, stateEffect: true}) {
        Row() {
          if (this.verifying) {
          LoadingProgress()
            .width(32)
            .height(32)
            .margin({ left: 12 })
          }
          Text(this.verifying ? $r('app.string.dialog_loading') : $r('app.string.server_connect'))
            .fontSize(18)
            .fontColor($r('sys.color.font_on_primary'))
            .margin({ left: 5, right: 12 })
        }.alignItems(VerticalAlign.Center)
      }
      .enabled(!this.verifying)
      .height(42)
      .width(160)
      .onClick(() => {
        this.verifyAddress()
      })
    }
    .align(Alignment.Center)
    .padding(16)
    .border({
      radius: 16
    })
    .backgroundColor($r('sys.color.ohos_id_color_dialog_bg'))
    .size({
      width: 300
    })

  }

  aboutToDisappear(): void {

  }

  private verifyAddress() {
    if (!this.url || this.url.length <= 0) {
      promptAction.showToast({message: $r('app.string.error_url_empty')})
      return
    }
    if (!this.url.startsWith('http')) {
      promptAction.showToast({message: $r('app.string.error_url_not_start_with_http')})
      return
    }
    if (!StringTool.isUrlValid(this.url)) {
      promptAction.showToast({message: $r('app.string.error_url_not_validate')})
      return
    }
    this.verifying = true
    this.repository!.addAddressByUrl(this.url)
      .then(() => {
        this.verifying = false
        this.callback?.()
      })
      .catch((error: Error) => {
        this.verifying = false
        promptAction.showToast({message: error.message})
      })
  }

}