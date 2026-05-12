import { ComponentContent, promptAction, UIContext } from '@kit.ArkUI';

/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2024/11/7 21:49
 * @Version V1.0
 * @Description
 */
export abstract class Dialog {

  /**
   * Negative
   */
  public static readonly BUTTON_NEGATIVE = 0

  /**
   * Positive
   */
  public static readonly BUTTON_POSITIVE = 1

  /**
   * Neutral
   */
  public static readonly BUTTON_NEUTRAL = -1

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

  /**
   * dismiss callback
   */
  private dismissCallback? : Callback<void>

  private options: promptAction.BaseDialogOptions = {
    autoCancel: false,
    isModal: true,
    onWillAppear: () => {
      this.onWillAppear()
    },
    onDidAppear: () => {
      this.onDidAppear()
    },
    onWillDismiss: (action: DismissDialogAction) => {
      if (!this.onWillDismiss(action.reason)) {
        action.dismiss()
        this.showing = false
      }
    },
    onDidDisappear: () => {
      this.onDidDisappear()
      this.uiNode?.dispose()
      // https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V5/errorcode-promptaction-V5#section103301-自定义弹窗内容节点错误
      this.uiNode = undefined
      this.dismissCallback?.()
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
   * set dismiss callback
   * @param callback
   */
  public setDismissCallback(callback?: Callback<void>) {
    this.dismissCallback = callback
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
    let promptAction = this.uiContext.getPromptAction()
    await promptAction.openCustomDialog(this.uiNode, this.options)
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
      let promptAction = this.uiContext.getPromptAction()
      await promptAction.closeCustomDialog(this.uiNode)
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