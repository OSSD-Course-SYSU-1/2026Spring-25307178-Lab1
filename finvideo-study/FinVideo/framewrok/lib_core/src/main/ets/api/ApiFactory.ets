import { MD5 } from "../crypto/MD5";
import { CoreApi } from "./CoreApi";
import { ServerType } from "../entity/ServerType";
import { bundleManager } from "@kit.AbilityKit";
import { deviceInfo } from "@kit.BasicServicesKit";
import { ClientInfo, DeviceInfo } from "@ohpg/network";

/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2025/9/27 19:54
 * @Version V1.0
 * @Description
 */
export abstract class ApiFactory {

  /**
   * Context info
   */
  protected readonly context: Context

  /**
   * Client info
   */
  protected readonly clientInfo: ClientInfo

  /**
   * Device info
   */
  protected readonly deviceInfo: DeviceInfo

  constructor(context: Context, module: string) {
    this.context = context
    let info = bundleManager.getBundleInfoForSelfSync(bundleManager
      .BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION)
    this.clientInfo = {
      name: module,
      version: info.versionName
    }
    this.deviceInfo = {
      // Same developer has same odid.
      id: MD5.digestSync(deviceInfo.ODID + "-" + module),
      name: deviceInfo.marketName
    }
  }

  protected abstract onCreateApi<T extends CoreApi>(serverType: ServerType): T;

  public createApi<T extends CoreApi>(type: ServerType): T {
    return this.onCreateApi(type) as T
  }

}