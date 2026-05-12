import { url } from "@kit.ArkTS";

/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2025/5/27 21:04
 * @Version V1.0
 * @Description
 */
export class StringTool {

  public static isUrlValid(str: string): boolean {
    try {
      url.URL.parseURL(str);
      return true;
    } catch (error) {
      return false;
    }
  }

}