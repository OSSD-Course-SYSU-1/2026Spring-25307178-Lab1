import { LoadType } from "@ohpg/fin-core";

/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2024/11/27 22:21
 * @Version V1.0
 * @Description
 */
export interface SimpleRepository {

  loadData(type: LoadType): Promise<Object>

}