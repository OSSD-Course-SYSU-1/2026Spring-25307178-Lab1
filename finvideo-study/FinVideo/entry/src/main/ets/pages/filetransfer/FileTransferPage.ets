import { promptAction } from '@kit.ArkUI'
import { ToolBar } from '@ohpg/fin-framework'
import { CommonConstants } from '../common/CommonConstants'
import { WirelessFileTransferStore, WirelessTransferFile } from './WirelessFileTransferStore'

@Entry
@Component
struct FileTransferPage {
  @State files: WirelessTransferFile[] = []
  @State busy: boolean = false
  @State statusText: string = '选择文件发送后，另一台同账号 HarmonyOS 设备打开本页并刷新即可接收。'

  aboutToAppear(): void {
    this.refreshFiles()
  }

  private getContext(): Context {
    return this.getUIContext().getHostContext()!
  }

  private refreshFiles(): void {
    this.files = WirelessFileTransferStore.listFiles(this.getContext())
    this.statusText = this.files.length > 0
      ? `已发现 ${this.files.length} 个可流转文件`
      : '暂无文件。可先在发送端选择文件，或生成一个演示文件。'
  }

  private async sendPickedFiles(): Promise<void> {
    if (this.busy) {
      return
    }
    this.busy = true
    try {
      let sentFiles = await WirelessFileTransferStore.pickAndSend(this.getContext())
      this.refreshFiles()
      if (sentFiles.length > 0) {
        promptAction.showToast({ message: `已发送 ${sentFiles.length} 个文件` })
      } else {
        promptAction.showToast({ message: '未选择文件或发送失败' })
      }
    } catch (_) {
      promptAction.showToast({ message: '选择文件失败，请重试' })
    } finally {
      this.busy = false
    }
  }

  private createDemoFile(): void {
    let file = WirelessFileTransferStore.createDemoFile(this.getContext())
    this.refreshFiles()
    if (file) {
      promptAction.showToast({ message: '已生成演示文件' })
    } else {
      promptAction.showToast({ message: '生成演示文件失败' })
    }
  }

  private async saveFile(file: WirelessTransferFile): Promise<void> {
    if (this.busy) {
      return
    }
    this.busy = true
    try {
      let saved = await WirelessFileTransferStore.saveToUserSelectedPath(this.getContext(), file)
      promptAction.showToast({ message: saved ? '已保存到本机' : '保存已取消或失败' })
    } finally {
      this.busy = false
    }
  }

  private formatSize(size: number): string {
    if (size >= 1024 * 1024) {
      return (size / 1024 / 1024).toFixed(2) + ' MB'
    }
    if (size >= 1024) {
      return (size / 1024).toFixed(1) + ' KB'
    }
    return size + ' B'
  }

  private formatTime(time: number): string {
    return new Date(time).toLocaleString()
  }

  @Builder
  private fileItemBuilder(file: WirelessTransferFile) {
    Column({ space: CommonConstants.SPACE_8 }) {
      Row({ space: CommonConstants.SPACE_12 }) {
        SymbolGlyph($r('sys.symbol.doc_plaintext'))
          .fontSize(26)
          .fontColor([$r('sys.color.ohos_id_color_text_primary')])
        Column({ space: CommonConstants.SPACE_4 }) {
          Text(file.fileName)
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .fontColor($r('sys.color.ohos_id_color_text_primary'))
            .maxLines(2)
            .width(CommonConstants.FULL_PERCENT)
          Text(`${this.formatSize(file.size)} · ${this.formatTime(file.createdAt)}`)
            .fontSize(12)
            .fontColor($r('sys.color.ohos_id_color_text_secondary'))
            .maxLines(1)
        }
        .layoutWeight(1)

        Button('保存')
          .height(34)
          .enabled(!this.busy)
          .onClick(() => {
            this.saveFile(file)
          })
      }
      .width(CommonConstants.FULL_PERCENT)

      Text(file.relativePath)
        .fontSize(12)
        .fontColor($r('sys.color.ohos_id_color_text_secondary'))
        .maxLines(1)
        .width(CommonConstants.FULL_PERCENT)
    }
    .width(CommonConstants.FULL_PERCENT)
    .padding(CommonConstants.SPACE_16)
    .backgroundColor($r('sys.color.ohos_id_color_button_normal'))
    .borderRadius($r('app.float.lg_border_radius'))
    .alignItems(HorizontalAlign.Start)
  }

  build() {
    Column() {
      ToolBar({ title: '跨设备文件流转' })

      Column({ space: CommonConstants.SPACE_16 }) {
        Column({ space: CommonConstants.SPACE_8 }) {
          Text('无线互传文件')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .width(CommonConstants.FULL_PERCENT)
          Text(this.statusText)
            .fontSize(14)
            .fontColor($r('sys.color.ohos_id_color_text_secondary'))
            .width(CommonConstants.FULL_PERCENT)
        }
        .width(CommonConstants.FULL_PERCENT)
        .alignItems(HorizontalAlign.Start)

        Row({ space: CommonConstants.SPACE_12 }) {
          Button('选择文件发送')
            .height(40)
            .layoutWeight(1)
            .enabled(!this.busy)
            .onClick(() => {
              this.sendPickedFiles()
            })

          Button('生成演示文件')
            .height(40)
            .layoutWeight(1)
            .enabled(!this.busy)
            .onClick(() => {
              this.createDemoFile()
            })
        }
        .width(CommonConstants.FULL_PERCENT)

        Button('刷新接收列表')
          .height(40)
          .width(CommonConstants.FULL_PERCENT)
          .enabled(!this.busy)
          .onClick(() => {
            this.refreshFiles()
            promptAction.showToast({ message: '已刷新' })
          })

        Column({ space: CommonConstants.SPACE_8 }) {
          Text('演示步骤')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .width(CommonConstants.FULL_PERCENT)
          Text('1. 手机端点击“选择文件发送”或“生成演示文件”。\n2. 平板端打开同一页面，点击“刷新接收列表”。\n3. 看到文件后点击“保存”，即可另存到接收设备。')
            .fontSize(13)
            .fontColor($r('sys.color.ohos_id_color_text_secondary'))
            .width(CommonConstants.FULL_PERCENT)
        }
        .width(CommonConstants.FULL_PERCENT)
        .padding(CommonConstants.SPACE_16)
        .backgroundColor($r('sys.color.ohos_id_color_button_normal'))
        .borderRadius($r('app.float.lg_border_radius'))
        .alignItems(HorizontalAlign.Start)

        List({ space: CommonConstants.SPACE_12 }) {
          ForEach(this.files, (file: WirelessTransferFile) => {
            ListItem() {
              this.fileItemBuilder(file)
            }
          }, (file: WirelessTransferFile) => file.id)
        }
        .layoutWeight(1)
        .width(CommonConstants.FULL_PERCENT)
      }
      .width(CommonConstants.FULL_PERCENT)
      .layoutWeight(1)
      .padding(CommonConstants.SPACE_16)
    }
    .width(CommonConstants.FULL_PERCENT)
    .height(CommonConstants.FULL_PERCENT)
  }
}
