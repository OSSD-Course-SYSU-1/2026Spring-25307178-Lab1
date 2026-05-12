import { LoadType } from "@ohpg/fin-core"
import { RefreshDataSource } from "@abner/refresh"

/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2024/11/27 21:31
 * @Version V1.0
 * @Description
 */
export interface RefreshRepository {

  getDataSource(): RefreshDataSource

  hasMore(): boolean

  loadData(type: LoadType): Promise<void>

}