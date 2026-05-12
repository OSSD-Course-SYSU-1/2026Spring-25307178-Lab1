/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2025/6/17 23:14
 * @Version V1.0
 * @Description
 */
export class VersionTool {

  /**
   * 判断版本号是否匹配
   * @param version
   * @param majorReq
   * @param minorReq
   * @returns
   */
  public static isVersionAtLeast(version: string, majorReq: number, minorReq: number): boolean {
    const versions = version.split('.').map(Number);
    if (versions[0] > majorReq) return true;
    if (versions[0] === majorReq && versions[1] >= minorReq) return true;
    return false;
  }

}