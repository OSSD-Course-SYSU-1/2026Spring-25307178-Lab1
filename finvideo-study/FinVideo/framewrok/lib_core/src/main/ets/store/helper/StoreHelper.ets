import { relationalStore } from '@kit.ArkData';
import { ArkTSUtils } from '@kit.ArkTS';
import BuildProfile from "../../../../../BuildProfile";

/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2024/11/9 16:05
 * @Version V1.0
 * @Description Store helper
 */
export abstract class StoreHelper {

  private context: Context

  private config: relationalStore.StoreConfig

  private newVersion: number

  private store?: relationalStore.RdbStore

  private storeLock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request("ThirdCreationLock");

  constructor(context: Context, version: number, config: relationalStore.StoreConfig) {
    this.context = context
    this.newVersion = version
    this.config = config
  }

  /**
   * 获取创建数据库时的配置
   * @returns
   */
  getStoreConfig(): relationalStore.StoreConfig {
    return this.config
  }

  /**
   * 获取可写数据库
   * @returns
   */
  public getWritableStore(): Promise<relationalStore.RdbStore> {
    return this.getStore(true)
  }

  /**
   * 获取只读数据库
   * @returns
   */
  public getReadableStore(): Promise<relationalStore.RdbStore> {
    return this.getStore(false)
  }

  private async getStore(writable: boolean): Promise<relationalStore.RdbStore> {
    return this.storeLock.lockAsync(async () => {
      if (this.store) {
        return this.store
      }
      this.store = await relationalStore.getRdbStore(this.context, this.config)
      let version = this.store.version
      if (version != this.newVersion) {
        if (version > this.newVersion) {
          throw new Error("The set new version cannot be less than old version");
        }
        try {
          this.store.beginTransaction()
          if (version == 0) {
            await this.onCreate(this.store)
            if (this.newVersion > 1) {
              await this.onUpgrade(this.store, 1, this.newVersion)
            }
          } else {
            await this.onUpgrade(this.store, version, this.newVersion)
          }
          this.store.version = this.newVersion
          this.store.commit()
        } catch (err) {
          if (BuildProfile.DEBUG) {
            console.error("Create or update db error: " + JSON.stringify(err))
          }
          this.store.rollBack()
        }
      }
      return this.store
    })
  }

  /**
   * on create store
   */
  protected abstract onCreate(store: relationalStore.RdbStore): Promise<void>

  /**
   * on store upgrade
   * @param oldVersion
   * @returns
   */
  protected abstract onUpgrade(store: relationalStore.RdbStore, oldVersion: number, newVersion: number): Promise<void>

  /**
   * close store
   */
  public async close(): Promise<void> {
    if (this.store) {
      await this.store.close()
    }
    return
  }

}