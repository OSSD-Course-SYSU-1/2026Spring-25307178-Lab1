import { LoadType } from "@ohpg/fin-core";
import { ListViewModel } from "../../common/ListViewModel";
/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2024/12/5 20:51
 * @Version V1.0
 * @Description
 */
export class EditUserViewModel extends ListViewModel {

  loadData(type?: LoadType): Promise<void> {
    return this.repository.getUsers()
      .then((users) => {
        this.dataSource.initData(users)
      })
  }

}