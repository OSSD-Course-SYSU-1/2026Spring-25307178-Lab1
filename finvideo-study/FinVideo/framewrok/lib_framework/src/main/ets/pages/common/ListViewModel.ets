import { RefreshDataSource } from "@abner/refresh";
import { LoadType } from "@ohpg/fin-core";
import { RefreshRepository } from "../../widget/refresh/RefreshRepository";
import { FinViewModel } from '../../model/FinViewModel'
import { FinRepository } from "../../data/FinRepository";

/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2024/11/27 21:36
 * @Version V1.0
 * @Description
 */
export abstract class ListViewModel extends FinViewModel<FinRepository> implements RefreshRepository {

  protected readonly dataSource = new RefreshDataSource();

  getDataSource(): RefreshDataSource {
    return this.dataSource
  }

  hasMore(): boolean {
    return false
  }

  abstract loadData(type: LoadType): Promise<void>

}