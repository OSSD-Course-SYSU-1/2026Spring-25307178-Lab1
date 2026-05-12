import { Dialog } from "./Dialog";
import { ComponentContent } from "@kit.ArkUI";
import { CommonConstants } from "../common/CommonConstants";

/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2024/12/4 21:25
 * @Version V1.0
 * @Description
 */
export class OptionDialog extends Dialog {

  private option: Options = {}

  constructor(context: UIContext) {
    super(context)
    this.option.dialog = this
  }

  public setTitle(title: ResourceStr) {
    this.option.title = title
  }

  public setOptions(options: Array<Option>) {
    this.option.options = options
  }

  public setOptionCallback(callback?: Callback<number>) {
    this.option.callback = callback
  }

  protected onCreateContent(): ComponentContent<object> {
    return new ComponentContent(this.uiContext, wrapBuilder(OptionDialogBuilder), this.option);
  }

}

interface Options {

  title?: ResourceStr

  options?: Array<Option>

  callback?: Callback<number>

  dialog?: Dialog
}

export interface Option {

  title: ResourceStr

  checked?: boolean

}

@Builder
function OptionDialogBuilder(option: Options) {
  Stack() {
    Column({space: CommonConstants.SPACE_8}) {
      Text(option.title)
        .fontSize(18)
        .width('100%')

      List({space: CommonConstants.SPACE_8}) {
        ForEach(option.options, (item: Option, index) => {
          ListItem() {
            Row({space: 6}) {
              Text(item.title)
                .textOverflow({overflow: TextOverflow.Ellipsis})
                .ellipsisMode(EllipsisMode.END)
                .layoutWeight(1)
                .maxLines(1)
              Checkbox()
                .select(item.checked)
                .hitTestBehavior(HitTestMode.None)
            }
            .width('100%')
            .onClick(() => {
              option.callback?.(index)
              option.dialog?.dismiss(true)
            })
          }
        })
      }
      .height('auto')
      .width('100%')
      .constraintSize({
        maxHeight: '80%'
      })
    }
    .backgroundColor($r('sys.color.ohos_id_color_dialog_bg'))
    .border({
      radius: CommonConstants.SPACE_16
    })
    .padding(CommonConstants.SPACE_16)
    .width(360)
    .height('auto')
    .constraintSize({
      minWidth: 300,
      maxWidth: '80%'
    })
    // just block click event.
    .onClick(() => {})
  }
  .width('100%')
  .height('100%')
  .onClick(() => {
    option.dialog?.dismiss(true)
  })

}