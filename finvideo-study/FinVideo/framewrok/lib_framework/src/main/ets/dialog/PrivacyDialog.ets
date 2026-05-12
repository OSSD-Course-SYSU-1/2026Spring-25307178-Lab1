import { Dialog } from "./Dialog";
import { ComponentContent } from "@kit.ArkUI";
import { PrivacyView } from "../widget/dialog/PrivacyView";

/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2024/12/11 23:58
 * @Version V1.0
 * @Description Privacy
 */
export class PrivacyDialog extends Dialog {

  private privacyOptions: PrivacyOptions = {}

  constructor(context: UIContext) {
    super(context)
    this.setCancelable(false)
  }

  public setAppInfo(privacy: string) {
    this.privacyOptions.privacy = privacy
  }

  public setPrivacyCallback(callback: Callback<void>) {
    this.privacyOptions.callback = callback
  }

  protected onCreateContent(): ComponentContent<object> {
    return new ComponentContent(this.uiContext, wrapBuilder(PrivacyDialogBuilder), this.privacyOptions);
  }

}

export interface PrivacyOptions {

  privacy?: string

  callback?: Callback<void>

}

@Builder
function PrivacyDialogBuilder(options: PrivacyOptions) {
  PrivacyView({
    options: options
  })
}