import { Jellyfin } from '@jellyfin/jellyfin'
import { UserInfo } from '../entity/UserInfo'

export const jellyfin = new Jellyfin({
  clientInfo: {
    name: "ArkFin",
    version: "0.0.1"
  },
  deviceInfo: {
    id: "12346789",
    name: "HarmonyOS"
  }
})

export const userInfo: UserInfo = {}