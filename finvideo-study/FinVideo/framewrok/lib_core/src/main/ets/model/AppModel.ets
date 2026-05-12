import { LoadState, LoadType } from "./LoadState";

@Observed
export class AppModel {

  type: LoadType = 'Init'

  state: LoadState = 'Loading'

  init: boolean = false

  more?: boolean

}