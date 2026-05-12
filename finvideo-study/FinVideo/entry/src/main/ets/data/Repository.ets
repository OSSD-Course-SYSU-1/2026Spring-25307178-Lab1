import { preferences } from "@kit.ArkData";
import { AppEventHub, AppEvents, FinItem, FinItemData, FinItemType, FinPage, ServerType } from "@ohpg/fin-core";
import { FinRepository } from "@ohpg/fin-framework";
import { FinVideoApi } from "../api/FinVideoApi";
import { FinVideoApiFactory } from "../api/FinVideoApiFactory";
import { FinItemSource } from "../entity/FinItemSource";

/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2024/11/9 11:50
 * @Version V1.0
 * @Description Repository
 */
export class Repository extends FinRepository {

  private static readonly RECENT_PLAYBACK_LIMIT = 8

  private static readonly KEY_RECENT_PLAYBACK = "recent_playback_items"

  private readonly recentPreference: preferences.Preferences

  constructor(context: Context) {
    super(context, new FinVideoApiFactory(context))
    this.recentPreference = preferences.getPreferencesSync(context, { name: "recent_playback" })
  }

  public getSupportServer(): ServerType {
    return ServerType.JELLYFIN
  }

  protected requireApi(): FinVideoApi {
    return super.requireApi() as FinVideoApi
  }

  /**
   * 获取恢复播放媒体列表
   * @returns
   */
  public getResumeItems(): Promise<Array<FinItem>> {
    return this.requireApi().getResumeItems()
  }

  /**
   * 获取接下来播放的媒体列表
   * 注：主页和剧集中用
   * @param seriesId
   * @returns
   */
  public getNextUp(): Promise<Array<FinItem>> {
    return this.requireApi().getNextUp()
  }

  /**
   * 获取媒体库列表
   * @returns
   */
  public getLibraryList(): Promise<Array<FinItem>> {
    return this.requireApi().getLibraryList()
  }

  /**
   * 获取媒体库最近媒体
   * @param id
   * @returns
   */
  public getLibraryLatestMedia(id?: string): Promise<Array<FinItem>> {
    return this.requireApi().getLatestItems(id)
  }

  /**
   * 获取指定媒体库中的媒体列表
   * @param id 媒体库id
   * @param types 媒体类型
   * @param recursive 是否递归
   * @returns
   */
  public getLibraryMediaList(id: string, types: Array<FinItemType>, recursive: boolean, index?: number): Promise<FinPage> {
    return this.requireApi().getItemList(id, types, recursive, index)
  }

  /**
   * 获取电影信息
   * @param id 电影id
   * @returns
   */
  public getMovie(id: string): Promise<FinItem> {
    return this.requireApi().getMovie(id)
  }

  /**
   * 获取剧集信息
   * @param id 剧集id
   * @returns
   */
  public getShow(id: string): Promise<FinItem> {
    return this.requireApi().getShow(id)
  }

  /**
   * 获取剧集接下来播放的媒体列表
   * @param seriesId 剧集id
   * @returns
   */
  public getShowNextUp(id: string): Promise<Array<FinItem>> {
    return this.requireApi().getNextUp(id)
  }

  /**
   * 获取剧集的分季列表
   * @param seriesId 剧集id
   * @returns
   */
  public getSeasons(seriesId: string): Promise<Array<FinItem>> {
    return this.requireApi().getSeasons(seriesId)
  }

  /**
   * 获取剧集分集列表
   * @param seriesId
   * @param seasonId
   * @returns
   */
  public getEpisodes(seriesId: string, seasonId: string): Promise<Array<FinItem>> {
    return this.requireApi().getEpisodes(seriesId, seasonId)
  }

  /**
   * 获取分集信息
   * @param id 分集id
   * @returns
   */
  public getEpisode(id: string): Promise<FinItem> {
    return this.requireApi().getEpisode(id)
  }

  /**
   * 获取收藏列表
   * @param includeItemTypes
   * @returns
   */
  public getFavourite(includeItemTypes?: Array<FinItemType>): Promise<Array<FinItem>> {
    return this.requireApi().getFavourite(includeItemTypes)
  }

  /**
   * 获取媒体数据源
   * @param id
   * @returns
   */
  public getMediaSource(id: string): Promise<FinItemSource> {
    return this.requireApi().getItemSource(id)
  }

  /**
   * 读取本地最近播放记录；存储键按服务器和用户隔离，避免多账号记录混在一起。
   */
  public getRecentPlaybackItems(): Array<FinItem> {
    let raw = this.recentPreference.getSync(this.getRecentPlaybackKey(), "") as string
    if (raw.length <= 0) {
      return []
    }
    try {
      return JSON.parse(raw) as Array<FinItem>
    } catch (error) {
      return []
    }
  }

  /**
   * 记录本次打开的媒体，并通知首页刷新“最近播放”分组。
   */
  public recordRecentPlayback(item: FinItem): void {
    if (!item || !item.id) {
      return
    }
    let items = this.getRecentPlaybackItems()
    let recentItems = items.filter((value: FinItem) => value.id !== item.id)
    recentItems.unshift(JSON.parse(JSON.stringify(item)) as FinItem)
    if (recentItems.length > Repository.RECENT_PLAYBACK_LIMIT) {
      recentItems = recentItems.slice(0, Repository.RECENT_PLAYBACK_LIMIT)
    }
    this.recentPreference.putSync(this.getRecentPlaybackKey(), JSON.stringify(recentItems))
    this.recentPreference.flush()
    AppEventHub.emit(AppEvents.EVENT_RECENT_PLAYBACK_CHANGED)
  }

  /**
   * 登录信息还没准备好时使用默认键，保证首次进入播放器也能落盘。
   */
  private getRecentPlaybackKey(): string {
    let serverId = this.activeInfo?.serverInfo.serverId
    let userId = this.activeInfo?.userInfo.userId
    if (serverId && userId) {
      return `${Repository.KEY_RECENT_PLAYBACK}_${serverId}_${userId}`
    }
    return Repository.KEY_RECENT_PLAYBACK
  }

  /**
   * 搜索媒体
   * @param keyword
   * @returns
   */
  public searchMedia(keyword: string): Promise<Array<FinItem>> {
    return this.requireApi().search(keyword)
  }

  /**
   * 获取媒体的用户数据
   * @param id
   * @returns
   */
  public getItemData(id: string): Promise<FinItemData> {
    return this.requireApi().getItemData(id)
  }

  /**
   * 播放开始
   * @param id
   * @returns
   */
  public onPlaybackStart(id: string): Promise<void> {
    return this.requireApi().onPlaybackStart(id)
  }

  /**
   * 播放进度
   * @param id
   * @param position
   * @param playing
   * @returns
   */
  public onPlaybackProgress(id: string, position: number, playing: boolean): Promise<void> {
    return this.requireApi().onPlaybackProgress(id, position,playing)
  }

  /**
   * 播放停止
   * @param id
   * @param position
   * @returns
   */
  public onPlaybackStopped(id: string, position: number): Promise<void> {
    return this.requireApi().onPlaybackStopped(id, position)
  }

}
