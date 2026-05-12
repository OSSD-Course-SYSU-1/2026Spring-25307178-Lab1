import { common, Want } from "@kit.AbilityKit"

/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2024/12/8 21:43
 * @Version V1.0
 * @Description
 */
export class WebTool {

  public static openBrowser(context:  Context, url: string): Promise<common.AbilityResult> {
    let abilityContext = context as common.UIAbilityContext
    // https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs-V5/faqs-ability-58-V5
    let want: Want = {
      action: "ohos.want.action.viewData",
      entities: ['entity.system.browsable'],
      uri: url
    }
    return abilityContext.startAbilityForResult(want)
  }

}