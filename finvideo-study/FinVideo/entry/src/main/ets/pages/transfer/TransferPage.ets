import { promptAction, router } from '@kit.ArkUI'
import { pasteboard } from '@kit.BasicServicesKit'
import { ToolBar } from '@ohpg/fin-framework'
import { TimeTool } from '@ohpg/fin-core'
import { FinTransferSession } from '../../entity/FinTransferSession'
import { CommonConstants } from '../common/CommonConstants'
import { PlayerArgs } from '../player/PlayerArgs'
import { TransferSessionCodec } from './TransferSessionCodec'

@Entry
@Component
struct TransferPage {
  @State transferCode: string = ''
  @State session?: FinTransferSession = undefined

  private updateTransferCode(code: string): void {
    this.transferCode = code.trim()
    this.refreshPreview()
  }

  private refreshPreview(): void {
    try {
      this.session = TransferSessionCodec.decode(this.transferCode)
    } catch (_) {
      this.session = undefined
    }
  }

  private async readFromClipboard(): Promise<void> {
    try {
      let data = await pasteboard.getSystemPasteboard().getData()
      this.updateTransferCode(data.getPrimaryText())
      promptAction.showToast({ message: '已读取剪贴板续播码' })
    } catch (error) {
      promptAction.showToast({ message: '读取剪贴板失败，请手动粘贴续播码' })
    }
  }

  private openTransferSession(): void {
    try {
      let nextSession = TransferSessionCodec.decode(this.transferCode)
      let args: PlayerArgs = {
        id: nextSession.id,
        name: nextSession.name,
        type: nextSession.type,
        startPosition: nextSession.position
      }
      router.pushUrl({ url: 'pages/player/PlayerPage', params: args })
    } catch (error) {
      promptAction.showToast({ message: '续播码无效，请重新复制' })
    }
  }

  build() {
    Column() {
      ToolBar({ title: '跨设备续播' })

      Column({ space: CommonConstants.SPACE_16 }) {
        TextArea({ text: this.transferCode, placeholder: '粘贴播放器复制出来的 FinVideo 续播码' })
          .width(CommonConstants.FULL_PERCENT)
          .height(140)
          .fontSize(14)
          .onChange((value: string) => {
            this.updateTransferCode(value)
          })

        Row({ space: CommonConstants.SPACE_12 }) {
          PasteButton({ icon: PasteIconStyle.LINES, text: PasteDescription.PASTE, buttonType: ButtonType.Capsule })
            .height(40)
            .onClick((_event, result, error) => {
              if (result === PasteButtonOnClickResult.SUCCESS) {
                this.readFromClipboard()
              } else {
                promptAction.showToast({ message: '请授权读取剪贴板后重试' })
              }
            })

          Button('打开续播')
            .height(40)
            .layoutWeight(1)
            .enabled(this.transferCode.length > 0)
            .onClick(() => {
              this.openTransferSession()
            })
        }
        .width(CommonConstants.FULL_PERCENT)

        if (this.session) {
          Column({ space: CommonConstants.SPACE_8 }) {
            Text(this.session.name)
              .fontSize(18)
              .fontWeight(FontWeight.Medium)
              .width(CommonConstants.FULL_PERCENT)
              .maxLines(2)

            Text('续播进度：' + TimeTool.formatMillionSecondsToHMS(this.session.position)
              + ' / ' + TimeTool.formatMillionSecondsToHMS(this.session.duration))
              .fontSize(14)
              .fontColor($r('sys.color.ohos_id_color_text_secondary'))
              .width(CommonConstants.FULL_PERCENT)
          }
          .width(CommonConstants.FULL_PERCENT)
          .padding(CommonConstants.SPACE_16)
          .backgroundColor($r('sys.color.ohos_id_color_button_normal'))
          .borderRadius($r('app.float.lg_border_radius'))
          .alignItems(HorizontalAlign.Start)
        }
      }
      .width(CommonConstants.FULL_PERCENT)
      .layoutWeight(1)
      .padding(CommonConstants.SPACE_16)
    }
    .width(CommonConstants.FULL_PERCENT)
    .height(CommonConstants.FULL_PERCENT)
  }
}
