import { FinApi } from "../api/FinApi";
import { CoreRepository } from "@ohpg/fin-core";

/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2025/3/19 21:36
 * @Version V1.0
 * @Description
 */
export abstract class FinRepository extends CoreRepository {

  protected requireApi(): FinApi {
    return super.requireApi()
  }

  /**
   * 收藏媒体文件
   * @param id 媒体id
   * @returns
   */
  markFavoriteItem(id: string): Promise<void> {
    return this.requireApi().markFavoriteItem(id)
  }

  /**
   * 取消收藏媒体文件
   * @param id 媒体id
   * @returns
   */
  unmarkFavoriteItem(id: string): Promise<void> {
    return this.requireApi().unmarkFavoriteItem(id)
  }

  /**
   * 设置媒体已播放
   * @param id 媒体id
   * @returns
   */
  markPlayedItem(id: string): Promise<void> {
    return this.requireApi().markPlayedItem(id)
  }

  /**
   * 设置媒体未播放
   * @param id 媒体id
   * @returns
   */
  markUnplayedItem(id: string): Promise<void> {
    return this.requireApi().markUnplayedItem(id)
  }

}