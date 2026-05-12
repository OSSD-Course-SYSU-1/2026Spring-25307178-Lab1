import { StoreHelper } from "./StoreHelper";
import { relationalStore } from "@kit.ArkData";
import { ServerInfoTable } from "../table/ServerInfoTable";
import { AddressInfoTable } from "../table/AddressInfoTable";
import { UserInfoTable } from "../table/UserInfoTable";
import { ActiveInfoTable } from "../table/ActiveInfoTable";
import BuildProfile from "../../../../../BuildProfile";

/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2024/11/9 16:08
 * @Version V1.0
 * @Description
 */
export class AppStoreHelper extends StoreHelper{

  constructor(context: Context) {
    super(context,
      1, {
      name: "fin_store.db",
      securityLevel: relationalStore.SecurityLevel.S1,
      encrypt: !BuildProfile.DEBUG
    })
  }

  protected async onCreate(store: relationalStore.RdbStore): Promise<void> {
    try {
      await store.executeSql(ServerInfoTable.CREATE_SQL)
      await store.executeSql(AddressInfoTable.CREATE_SQL)
      await store.executeSql(UserInfoTable.CREATE_SQL)
      await store.executeSql(ActiveInfoTable.CREATE_SQL)
    } catch (e) {
      console.error("AppStoreHelper " + JSON.stringify(e))
    }
  }

  protected async onUpgrade(store: relationalStore.RdbStore, oldVersion: number, newVersion: number): Promise<void> {

  }

}