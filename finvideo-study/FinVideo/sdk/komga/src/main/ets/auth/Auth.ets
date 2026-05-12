import { AuthType } from "./AuthType"
import { util } from "@kit.ArkTS"

/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2025/8/7 22:52
 * @Version V1.0
 * @Description
 */
export class Auth {

  public readonly type?: AuthType

  public readonly name?: string

  public readonly psw?: string

  public readonly auth?: string

  constructor(authType?: AuthType,
    userName?: string,
    password?: string) {
    this.type = authType
    this.name = userName
    this.psw = password
    this.auth = this.generateAuth()
  }

  public validate() {
    if (this.type === AuthType.Basic || this.type === AuthType.Digest) {
      if (!this.name || !this.psw) {
        throw new Error("Name and psw not defined")
      }
    }
  }

  private generateAuth(): string | undefined {
    if (this.type === AuthType.Basic) {
      return this.basicAuth()
    } else if (this.type === AuthType.Digest) {
      return this.digestAuth()
    }
    return undefined
  }

  private basicAuth(): string {
    let textEncoder = new util.TextEncoder(/*"ISO_8859_1"*/);
    let nameAndPsw = this.name + ":" + this.psw
    let buffer = textEncoder.encodeInto(nameAndPsw)
    let base64 = new util.Base64Helper();
    return "Basic " + base64.encodeToStringSync(buffer)
  }

  private digestAuth(): string {
    throw new Error("Unsupported auth: " + this.type)
  }

}