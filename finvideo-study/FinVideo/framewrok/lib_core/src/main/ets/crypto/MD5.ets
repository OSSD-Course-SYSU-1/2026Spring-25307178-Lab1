import { Cipher } from "./Cipher"
import { cryptoFramework } from "@kit.CryptoArchitectureKit"

/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2024/11/9 18:28
 * @Version V1.0
 * @Description
 */
export class MD5 extends Cipher{

  /**
   * MD5
   * @param str
   * @returns byte hex
   */
  public static async digest(str: string): Promise<string> {
    let md = cryptoFramework.createMd("MD5")
    await md.update({data: MD5.stringToUint8Array(str)})
    let bytes = (await md.digest()).data
    return MD5.uint8ArrayToHexString(bytes)
  }

  /**
   * MD5摘要
   * @param str
   * @returns byte hex
   */
  public static digestSync(str: string): string {
    let md = cryptoFramework.createMd("MD5")
    md.updateSync({data: MD5.stringToUint8Array(str)})
    let bytes = md.digestSync().data
    return MD5.uint8ArrayToHexString(bytes)
  }

}