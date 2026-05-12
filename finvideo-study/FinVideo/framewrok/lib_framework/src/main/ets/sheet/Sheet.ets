import { ComponentContent, UIContext } from '@kit.ArkUI';

/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2024/11/23 19:04
 * @Version V1.0
 * @Description
 */
export abstract class Sheet {

  /**
   * ui context
   */
  public readonly uiContext: UIContext

  /**
   * dialog ui node
   */
  private uiNode?: ComponentContent<object>

  /**
   * cancelable
   */
  private cancelable: boolean = true

  /**
   * showing
   */
  private showing = false

  protected options: SheetOptions = {
    height: SheetSize.FIT_CONTENT,
    dragBar: true,
    maskColor: $r('sys.color.mask_secondary'),
    showClose: false,
    blurStyle: BlurStyle.BACKGROUND_THICK,
    preferType: SheetType.BOTTOM,
    onWillAppear: () => {
      this.onWillAppear()
    },
    onAppear: () => {
      this.onDidAppear()
    },
    onWillDismiss: (action: DismissDialogAction) => {
      if (!this.onWillDismiss(action.reason)) {
        action.dismiss()
        this.showing = false
      }
    },
    onWillDisappear: () => {

    },
    onDisappear: () => {
      this.onDidDisappear()
      this.uiNode?.dispose()
      // https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V5/errorcode-promptaction-V5#section103301-自定义弹窗内容节点错误
      this.uiNode = undefined
    }
  }

  constructor(context: UIContext) {
    this.uiContext = context
  }

  /**
   * set cancelable
   * @param cancelable
   */
  public setCancelable(cancelable: boolean) {
    this.cancelable = cancelable
  }

  /**
   * get cancelable
   * @returns
   */
  public isCancelable(): boolean {
    return this.cancelable
  }

  /**
   * on create dialog content
   * @returns
   */
  protected abstract onCreateContent(): ComponentContent<object>

  onDialogClick(value: number): void {

  }

  /**
   * show dialog
   */
  public async show(): Promise<void> {
    if (this.showing) {
      return
    }
    if (this.uiNode == undefined) {
      this.uiNode = this.onCreateContent()
    }
    this.uiContext.openBindSheet(this.uiNode, this.options)
    this.showing = true
  }

  /**
   * the dialog is show or not
   * @returns
   */
  public isShowing(): boolean {
    return this.showing
  }

  /**
   * dismiss dialog
   */
  public async dismiss(force?: boolean): Promise<void> {
    if (force == undefined) {
      force = false
    }
    if (!force && !this.showing) {
      return
    }
    if (this.uiNode) {
      await this.uiContext.closeBindSheet(this.uiNode)
    }
    this.showing = false
  }

  /**
   * on dialog will appear
   */
  protected onWillAppear() {

  }

  /**
   * on dialog already appear
   */
  protected onDidAppear() {

  }

  /**
   * on dialog will dismiss
   * @param reason reason
   * @returns true close，false other
   */
  protected onWillDismiss(reason: DismissReason): boolean {
    return !this.cancelable
  }

  /**
   * on dialog already disappear
   */
  protected onDidDisappear() {

  }

}