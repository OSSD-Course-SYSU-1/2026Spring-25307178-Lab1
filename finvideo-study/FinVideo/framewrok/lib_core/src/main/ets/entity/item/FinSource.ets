import { FinStream } from "./FinStream";

/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2024/11/11 21:28
 * @Version V1.0
 * @Description fin source
 */
export interface FinSource {

  id: string

  name: string,

  path: string,

  size: number,

  streams: Array<FinStream>

}