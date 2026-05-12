import { ActivityLogApi } from "./api/ActivityLogApi";
import { ArtistsApi } from "./api/ArtistsApi";
import { AudioApi } from "./api/AudioApi";
import { DevicesApi } from "./api/DevicesApi";
import { GenresApi } from "./api/GenresApi";
import { ItemsApi } from "./api/ItemsApi";
import { LibraryApi } from "./api/LibraryApi";
import { MediaInfoApi } from "./api/MediaInfoApi";
import { PlaylistsApi } from "./api/PlaylistsApi";
import { PlayStateApi } from "./api/PlayStateApi";
import { SessionApi } from "./api/SessionApi";
import { SystemApi } from "./api/SystemApi";
import { TrickPlayApi } from "./api/TrickPlayApi";
import { TvShowsApi } from "./api/TvShowsApi";
import { UserApi } from "./api/UserApi";
import { UserLibraryApi } from "./api/UserLibraryApi";
import { UserViewsApi } from "./api/UserViewsApi";
import { VideosApi } from "./api/VideosApi";
import { ClientInfo, UserInfo } from "@ohpg/network";
import { DeviceInfo } from "@ohpg/network";
import { ServerInfo } from "@ohpg/network";
import { ApiClient } from "@ohpg/network";
import { JellyfinApiClient } from "./network/JellyfinApiClient";

/** Class representing the Jellyfin SDK. */
export class Jellyfin {
  readonly clientInfo: ClientInfo;

  readonly deviceInfo: DeviceInfo;

  readonly apiClient: ApiClient

  private systemApi?: SystemApi

  private userApi?: UserApi

  private userViewsApi?: UserViewsApi

  private libraryApi?: LibraryApi

  private userLibraryApi?: UserLibraryApi

  private itemsApi?: ItemsApi

  private artistsApi?: ArtistsApi

  private genresApi?: GenresApi

  private tvShowsApi?: TvShowsApi

  private mediaInfoApi?: MediaInfoApi

  private videosApi?: VideosApi

  private audioApi?: AudioApi

  private sessionApi?: SessionApi

  private devicesApi?: DevicesApi

  private playStateApi?: PlayStateApi

  private trickPlayApi?: TrickPlayApi

  private activityLogApi?: ActivityLogApi

  private playlistApi?: PlaylistsApi

  constructor(clientInfo: ClientInfo,
    deviceInfo: DeviceInfo) {
    this.clientInfo = clientInfo;
    this.deviceInfo = deviceInfo;
    this.apiClient = new JellyfinApiClient(this.clientInfo, this.deviceInfo)
  }

  public selectServer(serverInfo: ServerInfo) {
    this.apiClient.updateServer(serverInfo)
  }

  public selectUser(userInfo: UserInfo) {
    (this.apiClient as JellyfinApiClient).updateUserInfo(userInfo)
  }

  public getSystemApi(): SystemApi {
    if (!this.systemApi) {
      this.systemApi = new SystemApi(this.apiClient)
    }
    return this.systemApi
  }

  public getUserApi(): UserApi {
    if (!this.userApi) {
      this.userApi = new UserApi(this.apiClient)
    }
    return this.userApi
  }

  public getUserViewsApi(): UserViewsApi {
    if (!this.userViewsApi) {
      this.userViewsApi = new UserViewsApi(this.apiClient)
    }
    return this.userViewsApi
  }

  public getUserLibraryApi(): UserLibraryApi {
    if (!this.userLibraryApi) {
      this.userLibraryApi = new UserLibraryApi(this.apiClient)
    }
    return this.userLibraryApi
  }

  public getLibraryApi(): LibraryApi {
    if (!this.libraryApi) {
      this.libraryApi = new LibraryApi(this.apiClient)
    }
    return this.libraryApi
  }

  public getItemsApi(): ItemsApi {
    if (!this.itemsApi) {
      this.itemsApi = new ItemsApi(this.apiClient)
    }
    return this.itemsApi
  }

  public getArtistsApi(): ArtistsApi {
    if (!this.artistsApi) {
      this.artistsApi = new ArtistsApi(this.apiClient)
    }
    return this.artistsApi
  }

  public getGenresApi(): GenresApi {
    if (!this.genresApi) {
      this.genresApi = new GenresApi(this.apiClient)
    }
    return this.genresApi
  }

  public getTvShowsApi(): TvShowsApi {
    if (!this.tvShowsApi) {
      this.tvShowsApi = new TvShowsApi(this.apiClient)
    }
    return this.tvShowsApi
  }

  public getMediaInfoApi(): MediaInfoApi {
    if (!this.mediaInfoApi) {
      this.mediaInfoApi = new MediaInfoApi(this.apiClient)
    }
    return this.mediaInfoApi
  }

  public getVideosApi(): VideosApi {
    if (!this.videosApi) {
      this.videosApi = new VideosApi(this.apiClient)
    }
    return this.videosApi
  }

  public getAudioApi(): AudioApi {
    if (!this.audioApi) {
      this.audioApi = new AudioApi(this.apiClient)
    }
    return this.audioApi
  }

  public getSessionApi(): SessionApi {
    if (!this.sessionApi) {
      this.sessionApi = new SessionApi(this.apiClient)
    }
    return this.sessionApi
  }

  public getDevicesApi(): DevicesApi {
    if (!this.devicesApi) {
      this.devicesApi = new DevicesApi(this.apiClient)
    }
    return this.devicesApi
  }

  public getPlayStateApi(): PlayStateApi {
    if (!this.playStateApi) {
      this.playStateApi = new PlayStateApi(this.apiClient)
    }
    return this.playStateApi
  }

  public getTrickPlayApi(): TrickPlayApi {
    if (!this.trickPlayApi) {
      this.trickPlayApi = new TrickPlayApi(this.apiClient)
    }
    return this.trickPlayApi
  }

  public getActivityLogApi(): ActivityLogApi {
    if (!this.activityLogApi) {
      this.activityLogApi = new ActivityLogApi(this.apiClient)
    }
    return this.activityLogApi
  }

  public getPlaylistApi(): PlaylistsApi {
    if (!this.playlistApi) {
      this.playlistApi = new PlaylistsApi(this.apiClient)
    }
    return this.playlistApi
  }

}