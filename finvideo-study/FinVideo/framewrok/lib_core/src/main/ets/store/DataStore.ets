import { relationalStore } from "@kit.ArkData";
import { AddressInfo } from "../entity/AddressInfo";
import { ServerInfo } from "../entity/ServerInfo";
import { UserInfo } from "../entity/UserInfo";
import { StoreHelper } from "./helper/StoreHelper";
import { AppStoreHelper } from "./helper/AppStoreHelper";
import { ServerInfoTable } from "./table/ServerInfoTable";
import { AddressInfoTable } from "./table/AddressInfoTable";
import { UserInfoTable } from "./table/UserInfoTable";
import { ActiveInfo } from "../entity/ActiveInfo";
import { ActiveInfoTable } from "./table/ActiveInfoTable";
import { ServerType } from "../entity/ServerType";

/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2024/11/9 11:44
 * @Version V1.0
 * @Description
 */
export class DataStore {

  private readonly context: Context

  private readonly storeHelper: StoreHelper

  constructor(context: Context) {
    this.context = context
    this.storeHelper = new AppStoreHelper(context)
  }

  /**
   * query active info
   * @returns
   */
  public async queryActive(): Promise<ActiveInfo | undefined> {
    let store = await this.storeHelper.getWritableStore()
    let rdbPredicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(ActiveInfoTable.TABLE_NAME)
    let resultSet = await store.query(rdbPredicates)
    if (resultSet.rowCount <= 0 || !resultSet.goToFirstRow()) {
      return undefined
    }
    let serverIdIndex = resultSet.getColumnIndex(ActiveInfoTable.SERVER_ID)
    let addressIdIndex = resultSet.getColumnIndex(ActiveInfoTable.ADDRESS_ID)
    let userIdIndex = resultSet.getColumnIndex(ActiveInfoTable.USER_ID)
    let serverId = resultSet.getString(serverIdIndex)
    let addressId = resultSet.getString(addressIdIndex)
    let userId = resultSet.getString(userIdIndex)
    let serverInfo = await this.queryServer(serverId)
    if (serverInfo == undefined) {
      return undefined
    }
    let addressInfo = await this.queryAddress(serverId, addressId)
    if (addressInfo == undefined) {
      return undefined
    }
    let userInfo = await this.queryUser(serverId, userId)
    if (userInfo == undefined) {
      return undefined
    }
    return { serverInfo: serverInfo, addressInfo: addressInfo, userInfo: userInfo }
  }

  /**
   * insert active
   * @param activeInfo
   * @returns
   */
  public async insertActive(activeInfo: ActiveInfo): Promise<void> {
    await this.insertServer(activeInfo.serverInfo)
    await this.insertAddress(activeInfo.addressInfo)
    await this.insertUser(activeInfo.userInfo)
    await this.deleteActive()
    let store = await this.storeHelper.getWritableStore()
    let vb: relationalStore.ValuesBucket = {}
    vb[ActiveInfoTable.SERVER_ID] = activeInfo.serverInfo.serverId
    vb[ActiveInfoTable.ADDRESS_ID] = activeInfo.addressInfo.addressId
    vb[ActiveInfoTable.USER_ID] = activeInfo.userInfo.userId
    await store.insert(ActiveInfoTable.TABLE_NAME, vb)
  }

  /**
   * update active
   * @param activeInfo
   * @returns
   */
  public async updateActive(activeInfo: ActiveInfo): Promise<void> {
    await this.updateServer(activeInfo.serverInfo)
    await this.updateAddress(activeInfo.addressInfo)
    await this.updateUser(activeInfo.userInfo)
    let store = await this.storeHelper.getWritableStore()
    let vb: relationalStore.ValuesBucket = {}
    vb[ActiveInfoTable.SERVER_ID] = activeInfo.serverInfo.serverId
    vb[ActiveInfoTable.ADDRESS_ID] = activeInfo.addressInfo.addressId
    vb[ActiveInfoTable.USER_ID] = activeInfo.userInfo.userId
    let rdbPredicates = new relationalStore.RdbPredicates(ActiveInfoTable.TABLE_NAME)
    await store.update(vb, rdbPredicates)
  }

  /**
   * delete active
   * @returns
   */
  public async deleteActive(): Promise<void> {
    let store = await this.storeHelper.getWritableStore()
    let rdbPredicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(ActiveInfoTable.TABLE_NAME)
    await store.delete(rdbPredicates)
  }

  /**
   * query all server
   * @returns
   */
  public async queryAllServer(): Promise<Array<ServerInfo>> {
    let store = await this.storeHelper.getWritableStore()
    let rdbPredicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(ServerInfoTable.TABLE_NAME)
    rdbPredicates.isNotNull(ServerInfoTable.SERVER_ID)
    let resultSet = await store.query(rdbPredicates)
    let serverInfoArray = new Array<ServerInfo>()
    if (resultSet.rowCount <= 0) {
      return serverInfoArray
    }
    let serverIdIndex = resultSet.getColumnIndex(ServerInfoTable.SERVER_ID)
    let serverNameIndex = resultSet.getColumnIndex(ServerInfoTable.SERVER_NAME)
    let serverTypeIndex = resultSet.getColumnIndex(ServerInfoTable.SERVER_TYPE)
    while (resultSet.goToNextRow()) {
      serverInfoArray.push({
        serverId: resultSet.getString(serverIdIndex),
        serverName: resultSet.getString(serverNameIndex),
        serverType: resultSet.getString(serverTypeIndex) as ServerType
      })
    }
    return serverInfoArray
  }

  /**
   * query server info
   * @param serverId
   * @returns
   */
  public async queryServer(serverId: string): Promise<ServerInfo | undefined> {
    let store = await this.storeHelper.getWritableStore()
    let rdbPredicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(ServerInfoTable.TABLE_NAME)
    rdbPredicates.equalTo(ServerInfoTable.SERVER_ID, serverId)
    let resultSet = await store.query(rdbPredicates)
    if (resultSet.rowCount <= 0 || !resultSet.goToFirstRow()) {
      return undefined
    }
    let serverIdIndex = resultSet.getColumnIndex(ServerInfoTable.SERVER_ID)
    let serverNameIndex = resultSet.getColumnIndex(ServerInfoTable.SERVER_NAME)
    let serverTypeIndex = resultSet.getColumnIndex(ServerInfoTable.SERVER_TYPE)
    return {
      serverId: resultSet.getString(serverIdIndex),
      serverName: resultSet.getString(serverNameIndex),
      serverType: resultSet.getString(serverTypeIndex) as ServerType
    }
  }

  /**
   * insert server info
   * @param serverInfo
   * @returns
   */
  public async insertServer(serverInfo: ServerInfo): Promise<void> {
    let preServerInfo = await this.queryServer(serverInfo.serverId)
    if (preServerInfo) {
      return this.updateServer(serverInfo)
    }
    let store = await this.storeHelper.getWritableStore()
    let vb: relationalStore.ValuesBucket = {}
    vb[ServerInfoTable.SERVER_ID] = serverInfo.serverId
    vb[ServerInfoTable.SERVER_NAME] = serverInfo.serverName
    vb[ServerInfoTable.SERVER_TYPE] = serverInfo.serverType
    await store.insert(ServerInfoTable.TABLE_NAME, vb)
  }

  /**
   * update server info
   * @param serverInfo
   * @returns
   */
  public async updateServer(serverInfo: ServerInfo): Promise<void> {
    let store = await this.storeHelper.getWritableStore()
    let vb: relationalStore.ValuesBucket = {}
    vb[ServerInfoTable.SERVER_NAME] = serverInfo.serverName
    vb[ServerInfoTable.SERVER_TYPE] = serverInfo.serverType
    let rdbPredicates = new relationalStore.RdbPredicates(ServerInfoTable.TABLE_NAME)
    rdbPredicates.equalTo(ServerInfoTable.SERVER_ID, serverInfo.serverId)
    await store.update(vb, rdbPredicates)
  }

  /**
   * delete server
   * @param serverId
   * @returns
   */
  public async deleteServer(serverId?: string): Promise<void> {
    let store = await this.storeHelper.getWritableStore()
    let rdbPredicates = new relationalStore.RdbPredicates(ServerInfoTable.TABLE_NAME)
    if (serverId) {
      rdbPredicates.equalTo(ServerInfoTable.SERVER_ID, serverId)
    }
    await store.delete(rdbPredicates)
  }

  /**
   * query all address
   * @returns
   */
  public async queryAllAddress(serverId?: string): Promise<Array<AddressInfo>> {
    let store = await this.storeHelper.getWritableStore()
    let rdbPredicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(AddressInfoTable.TABLE_NAME)
    if (serverId) {
      rdbPredicates.equalTo(AddressInfoTable.SERVER_ID, serverId)
    }
    let resultSet = await store.query(rdbPredicates)
    let addressInfoArray = new Array<AddressInfo>()
    if (resultSet.rowCount <= 0) {
      return addressInfoArray
    }
    let addressIdIndex = resultSet.getColumnIndex(AddressInfoTable.ADDRESS_ID)
    let addressUrlIndex = resultSet.getColumnIndex(AddressInfoTable.ADDRESS_URL)
    let serverIdIndex = resultSet.getColumnIndex(AddressInfoTable.SERVER_ID)
    while (resultSet.goToNextRow()) {
      addressInfoArray.push({
        addressId: resultSet.getString(addressIdIndex),
        address: resultSet.getString(addressUrlIndex),
        serverId: resultSet.getString(serverIdIndex)
      })
    }
    return addressInfoArray
  }

  /**
   * query address info
   * @param addressId
   * @returns
   */
  public async queryAddress(serverId: string, addressId: string): Promise<AddressInfo | undefined> {
    let store = await this.storeHelper.getWritableStore()
    let rdbPredicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(AddressInfoTable.TABLE_NAME)
    rdbPredicates.equalTo(AddressInfoTable.SERVER_ID, serverId)
    rdbPredicates.equalTo(AddressInfoTable.ADDRESS_ID, addressId)
    let resultSet = await store.query(rdbPredicates)
    if (resultSet.rowCount <= 0 || !resultSet.goToFirstRow()) {
      return undefined
    }
    let addressUrlIndex = resultSet.getColumnIndex(AddressInfoTable.ADDRESS_URL)
    let serverIdIndex = resultSet.getColumnIndex(AddressInfoTable.SERVER_ID)
    return {
      addressId: addressId,
      address: resultSet.getString(addressUrlIndex),
      serverId: resultSet.getString(serverIdIndex)
    }
  }

  /**
   * insert address info
   * @param addressInfo
   * @returns
   */
  public async insertAddress(addressInfo: AddressInfo): Promise<void> {
    let preServerInfo = await this.queryAddress(addressInfo.serverId, addressInfo.addressId)
    if (preServerInfo) {
      return this.updateAddress(addressInfo)
    }
    let store = await this.storeHelper.getWritableStore()
    let vb: relationalStore.ValuesBucket = {}
    vb[AddressInfoTable.ADDRESS_ID] = addressInfo.addressId
    vb[AddressInfoTable.ADDRESS_URL] = addressInfo.address
    vb[AddressInfoTable.SERVER_ID] = addressInfo.serverId
    await store.insert(AddressInfoTable.TABLE_NAME, vb)
  }

  /**
   * update address info
   * @param addressInfo
   * @returns
   */
  public async updateAddress(addressInfo: AddressInfo): Promise<void> {
    let store = await this.storeHelper.getWritableStore()
    let vb: relationalStore.ValuesBucket = {}
    vb[AddressInfoTable.ADDRESS_URL] = addressInfo.address
    vb[AddressInfoTable.SERVER_ID] = addressInfo.serverId
    let rdbPredicates = new relationalStore.RdbPredicates(AddressInfoTable.TABLE_NAME)
    rdbPredicates.equalTo(AddressInfoTable.ADDRESS_ID, addressInfo.addressId)
    await store.update(vb, rdbPredicates)
  }

  /**
   * delete address
   * @param serverId
   * @returns
   */
  public async deleteAddress(addressInfo: AddressInfo): Promise<void> {
    let store = await this.storeHelper.getWritableStore()
    let rdbPredicates = new relationalStore.RdbPredicates(AddressInfoTable.TABLE_NAME)
    rdbPredicates.equalTo(AddressInfoTable.ADDRESS_ID, addressInfo.addressId)
    await store.delete(rdbPredicates)
  }

  /**
   * delete address by server id
   * @param serverId
   * @returns
   */
  public async deleteAddressByServerId(serverId: string): Promise<void> {
    let store = await this.storeHelper.getWritableStore()
    let rdbPredicates = new relationalStore.RdbPredicates(AddressInfoTable.TABLE_NAME)
    rdbPredicates.equalTo(AddressInfoTable.SERVER_ID, serverId)
    await store.delete(rdbPredicates)
  }

  /**
   * query all user
   * @returns
   */
  public async queryAllUser(serverId?: string): Promise<Array<UserInfo>> {
    let store = await this.storeHelper.getWritableStore()
    let rdbPredicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(UserInfoTable.TABLE_NAME)
    if (serverId) {
      rdbPredicates.equalTo(UserInfoTable.SERVER_ID, serverId)
    }
    let resultSet = await store.query(rdbPredicates)
    let userInfoArray = new Array<UserInfo>()
    if (resultSet.rowCount <= 0) {
      return userInfoArray
    }
    let userIdIndex = resultSet.getColumnIndex(UserInfoTable.USER_ID)
    let userNameIndex = resultSet.getColumnIndex(UserInfoTable.USER_NAME)
    let accessTokenIndex = resultSet.getColumnIndex(UserInfoTable.ACCESS_TOKEN)
    let serverIdIndex = resultSet.getColumnIndex(UserInfoTable.SERVER_ID)
    while (resultSet.goToNextRow()) {
      userInfoArray.push({
        userId: resultSet.getString(userIdIndex),
        userName: resultSet.getString(userNameIndex),
        accessToken: resultSet.getString(accessTokenIndex),
        serverId: resultSet.getString(serverIdIndex)
      })
    }
    return userInfoArray
  }

  /**
   * query user info
   * @param userId
   * @returns
   */
  public async queryUser(serverId: string, userId: string): Promise<UserInfo | undefined> {
    let store = await this.storeHelper.getWritableStore()
    let rdbPredicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(UserInfoTable.TABLE_NAME)
    rdbPredicates.equalTo(UserInfoTable.SERVER_ID, serverId)
    rdbPredicates.equalTo(UserInfoTable.USER_ID, userId)
    let resultSet = await store.query(rdbPredicates)
    if (resultSet.rowCount <= 0 || !resultSet.goToFirstRow()) {
      return undefined
    }
    let userIdIndex = resultSet.getColumnIndex(UserInfoTable.USER_ID)
    let userNameIndex = resultSet.getColumnIndex(UserInfoTable.USER_NAME)
    let accessTokenIndex = resultSet.getColumnIndex(UserInfoTable.ACCESS_TOKEN)
    let serverIdIndex = resultSet.getColumnIndex(UserInfoTable.SERVER_ID)
    return {
      userId: resultSet.getString(userIdIndex),
      userName: resultSet.getString(userNameIndex),
      accessToken: resultSet.getString(accessTokenIndex),
      serverId: resultSet.getString(serverIdIndex)
    }
  }

  /**
   * insert user info
   * @param userInfo
   * @returns
   */
  public async insertUser(userInfo: UserInfo): Promise<void> {
    let preUserInfo = await this.queryUser(userInfo.serverId, userInfo.userId)
    if (preUserInfo) {
      return this.updateUser(userInfo)
    }
    let store = await this.storeHelper.getWritableStore()
    let vb: relationalStore.ValuesBucket = {}
    vb[UserInfoTable.USER_ID] = userInfo.userId
    vb[UserInfoTable.USER_NAME] = userInfo.userName
    vb[UserInfoTable.ACCESS_TOKEN] = userInfo.accessToken
    vb[UserInfoTable.SERVER_ID] = userInfo.serverId
    await store.insert(UserInfoTable.TABLE_NAME, vb)
  }

  /**
   * update user info
   * @param userInfo
   * @returns
   */
  public async updateUser(userInfo: UserInfo): Promise<void> {
    let store = await this.storeHelper.getWritableStore()
    let vb: relationalStore.ValuesBucket = {}
    vb[UserInfoTable.USER_NAME] = userInfo.userName
    vb[UserInfoTable.ACCESS_TOKEN] = userInfo.accessToken
    vb[UserInfoTable.SERVER_ID] = userInfo.serverId
    let rdbPredicates = new relationalStore.RdbPredicates(UserInfoTable.TABLE_NAME)
    rdbPredicates.equalTo(UserInfoTable.USER_ID, userInfo.userId)
    await store.update(vb, rdbPredicates)
  }

  /**
   * delete user
   * @param userInfo
   * @returns
   */
  public async deleteUser(userInfo: UserInfo): Promise<void> {
    let store = await this.storeHelper.getWritableStore()
    let rdbPredicates = new relationalStore.RdbPredicates(UserInfoTable.TABLE_NAME)
    rdbPredicates.equalTo(UserInfoTable.USER_ID, userInfo.userId)
    await store.delete(rdbPredicates)
  }

  /**
   * delete user by server id
   * @param serverId
   * @returns
   */
  public async deleteUserByServerId(serverId: string): Promise<void> {
    let store = await this.storeHelper.getWritableStore()
    let rdbPredicates = new relationalStore.RdbPredicates(UserInfoTable.TABLE_NAME)
    rdbPredicates.equalTo(UserInfoTable.SERVER_ID, serverId)
    await store.delete(rdbPredicates)
  }

}