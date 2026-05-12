import { ActiveInfo } from "../entity/ActiveInfo";
import { ServerType } from "../entity/ServerType";
import { FinAuthResult } from "../entity/item/FinAuthResult";
import { FinPublicSystemInfo } from "../entity/item/FinPublickSystemInfo";

/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2025/7/6 14:29
 * @Version V1.0
 * @Description Fin Api
 */
export interface CoreApi {

  /**
   * 获取当前接口类型
   * @returns
   */
  getApiType(): ServerType

  /**
   * 更新地址信息
   * @param address
   */
  updateAddress(address: string): void

  /**
   * 更新信息
   * @param activeInfo
   */
  updateActiveInfo(activeInfo: ActiveInfo): void

  /**
   * 获取服务器公开信息
   * @param url 服务器地址
   * @param name 服务器名称
   * @returns 服务器公开信息
   */
  getPublicSystemInfo(url: string, name?: string): Promise<FinPublicSystemInfo>

  /**
   * 获取服务器信息
   * @returns
   */
  getSystemInfo(url?: string): Promise<FinPublicSystemInfo>

  /**
   * 认证用户
   * @param name 用户名
   * @param psw 密码
   * @param url 地址
   * @returns 认证结果
   */
  auth(name: string, psw?: string, url?: string): Promise<FinAuthResult>

  /**
   * 收藏媒体文件
   * @param id 媒体id
   * @returns
   */
  markFavoriteItem(id: string): Promise<void>

  /**
   * 取消收藏媒体文件
   * @param id 媒体id
   * @returns
   */
  unmarkFavoriteItem(id: string): Promise<void>

  /**
   * 设置媒体已播放
   * @param id 媒体id
   * @returns
   */
  markPlayedItem(id: string): Promise<void>

  /**
   * 设置媒体未播放
   * @param id 媒体id
   * @returns
   */
  markUnplayedItem(id: string): Promise<void>

  /**
   * 释放资源
   * @returns
   */
  release(): Promise<void>

}
