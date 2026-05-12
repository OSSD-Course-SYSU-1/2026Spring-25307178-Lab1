import { ViewModel} from '@ohpg/fin-core'
import { FinRepository } from '../data/FinRepository'

/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2024/12/6 23:28
 * @Version V1.0
 * @Description
 */
export class FinViewModel<T extends FinRepository> extends ViewModel {

  public readonly repository: T = AppStorage.get(FinRepository.REPOSITORY)!

  constructor(context: Context) {
    super(context)
  }

}