import { Dialog } from "./Dialog";
import { ComponentContent } from "@kit.ArkUI";

/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2024/11/7 21:50
 * @Version V1.0
 * @Description Progress dialog
 */
export class ProgressDialog extends Dialog {

  constructor(context: UIContext) {
    super(context);
    this.setCancelable(false)
  }

  protected onCreateContent(): ComponentContent<object> {
    return new ComponentContent(this.uiContext, wrapBuilder(ProgressDialogBuilder));
  }

}

@Builder
function ProgressDialogBuilder() {

  Column() {
    // https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-basic-components-loadingprogress-0000001427744812-V3
    LoadingProgress()
      .width($r('sys.float.ohos_id_progress_default_diameter'))
      .height($r('sys.float.ohos_id_progress_default_diameter'))
      .color($r('sys.color.brand'))
    Text($r('app.string.dialog_loading'))
      .fontSize($r('sys.float.ohos_id_text_size_dialog_tittle'))
      .fontColor($r('sys.color.font_primary'))
  }
  .hitTestBehavior(HitTestMode.Block)
  .justifyContent(FlexAlign.Center)
  .backgroundColor($r('sys.color.comp_background_secondary'))
  .width('100%')
  .height('100%')

}