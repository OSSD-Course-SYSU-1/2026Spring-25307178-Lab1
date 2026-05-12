import { BaseItemPerson } from "@ohpg/jellyfin";
import { FinItem } from "./FinItem";

/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2024/11/11 22:04
 * @Version V1.0
 * @Description fin movie
 */
export interface FinMovie extends FinItem {

  premiereDate: string

  person?: Array<BaseItemPerson>

  genres?: Array<String>

  communityRating?: number

  officialRating?: String,

  status: String,

  productionYear?: number

  endDate?: string

  trailer?: string
}