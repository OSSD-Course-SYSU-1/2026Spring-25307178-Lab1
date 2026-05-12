# FinVideo 代码解析报告

## 1. 项目基本信息

| 项目 | 内容 |
| --- | --- |
| 应用名称 | FinVideo |
| 上游仓库 | https://github.com/OHPG/FinVideo |
| 本次选用版本 | v0.3.3 |
| 上游提交 | d76959b8d25627d864cf854cbabcfd730c8852a2 |
| 应用包名 | org.ohpg.fin.video |
| 技术栈 | HarmonyOS Stage 模型、ArkTS、DevEco hvigor、OHPM |
| 核心定位 | Jellyfin/Emby 私有媒体服务器客户端 |

> 说明：上游最新 master 在本地执行 `ohpm install` 时依赖 `@ohpg/player@0.6.3` 无法从公开 OHPM 源获取，因此本次选择可复现构建的 `v0.3.3` 版本进行解析、运行和扩展。

## 2. 本地运行验证

本次已在本地 DevEco/HarmonyOS 环境中完成构建、安装和启动验证。

| 步骤 | 命令或结果 |
| --- | --- |
| 安装依赖 | `ohpm install` |
| 构建 HAP | `hvigor assembleHap --stacktrace` |
| 构建产物 | `entry/build/default/outputs/default/entry-default-unsigned.hap` |
| 模拟器设备 | `127.0.0.1:5555` |
| 安装结果 | `install bundle successfully` |
| 启动结果 | `start ability successfully` |

## 3. 项目功能概述

FinVideo 是一个面向个人影音库的 HarmonyOS 客户端。用户可以添加 Jellyfin 或 Emby 服务端，登录后浏览媒体库、查看电影/剧集详情、继续播放历史内容、查看收藏内容、搜索媒体，并进入播放器页面播放视频。

从功能边界看，FinVideo 并不是一个在线视频站点，而是一个私有媒体服务器的移动端/鸿蒙端访问入口。真正的影视资源、用户信息、播放进度和收藏状态来自用户配置的 Jellyfin/Emby 后端。

## 4. 目录结构分析

```text
FinVideo/
├── entry/                 # 主应用模块，包含页面、播放器、仓储和资源
├── framewrok/             # 上游公共框架子项目，目录名保留原拼写
│   ├── lib_core/          # 核心实体、缓存、数据库、系统工具、事件等
│   └── lib_framework/     # 通用页面、路由、对话框、刷新列表、ViewModel 基类
├── sdk/
│   ├── network/           # HTTP 请求封装和基础网络模型
│   ├── jellyfin/          # Jellyfin API SDK 和数据模型
│   ├── emby/              # Emby API SDK 和数据模型
│   └── komga/             # Komga SDK，当前主应用未作为重点入口使用
└── entry/libs/
    └── libwlmedia.har     # 第三方播放器 HAR 依赖，用于增强格式兼容性
```

主应用代码集中在 `entry/src/main/ets`。其中 `pages` 负责页面，`data` 负责应用级仓储，`api` 负责把后端服务适配成统一接口，`player` 负责播放器抽象和具体实现。

## 5. 启动流程分析

### 5.1 应用级初始化

入口类位于：

```text
entry/src/main/ets/app/App.ets
```

`App` 继承 `AbilityStage`，在 `onCreate` 中完成三类全局对象初始化：

| 对象 | 作用 |
| --- | --- |
| `AppPrefer` | 读取和写入用户偏好，例如隐私授权、播放器选择、排序方式 |
| `AppConfig` | 把用户偏好转换为运行时配置 |
| `Repository` | 应用统一数据仓库，对页面屏蔽 Jellyfin/Emby 的具体差异 |

这些对象被放入 `AppStorage`，后续页面和 ViewModel 可以直接获取，形成全局共享状态。

### 5.2 Ability 窗口初始化

入口 Ability 位于：

```text
entry/src/main/ets/ability/entry/EntryAbility.ets
```

`EntryAbility` 在 `onWindowStageCreate` 中执行以下工作：

1. 获取主窗口并初始化 `DeviceUtil`。
2. 开启沉浸式窗口。
3. 注册安全区域监听 `AvoidAreaSystem`。
4. 加载启动页 `pages/splash/SplashPage`。
5. 页面加载成功后注册断点系统 `BreakpointSystem`，用于适配不同屏幕宽度。

### 5.3 启动页跳转

启动页位于：

```text
entry/src/main/ets/pages/splash/SplashPage.ets
```

启动页先检查隐私授权。如果用户已授权，则执行 `repository.init()` 初始化服务端、地址、用户等持久化数据。初始化完成后：

- 如果存在可用账号，跳转到 `HomePage`。
- 如果没有账号，进入框架提供的登录/添加服务端流程。

## 6. 数据层与 API 适配

### 6.1 Repository 统一入口

应用仓储位于：

```text
entry/src/main/ets/data/Repository.ets
```

`Repository` 继承框架层的 `FinRepository`，对页面提供更贴近业务的接口，例如：

- `getResumeItems()`：继续观看列表。
- `getNextUp()`：接下来播放列表。
- `getLibraryList()`：媒体库列表。
- `getMovie()` / `getShow()` / `getEpisode()`：详情数据。
- `searchMedia()`：媒体搜索。
- `onPlaybackStart()` / `onPlaybackProgress()` / `onPlaybackStopped()`：播放状态回传。

这样页面层只依赖 `Repository`，不需要关心当前后端是 Jellyfin 还是 Emby。

### 6.2 API 工厂

API 工厂位于：

```text
entry/src/main/ets/api/FinVideoApiFactory.ets
```

`FinVideoApiFactory` 根据服务端类型创建具体 API：

| 服务端类型 | 具体实现 |
| --- | --- |
| `ServerType.JELLYFIN` | `JellyfinFinApi` |
| `ServerType.EMBY` | `EmbyFinApi` |

这一层属于典型的工厂模式。它把不同后端协议适配为统一的 `FinVideoApi`，便于页面和仓储层复用同一套调用方式。

## 7. 页面层结构

主页面位于：

```text
entry/src/main/ets/pages/home/HomePage.ets
```

`HomePage` 使用 `Tabs` 组织四个主入口：

| Tab | 页面组件 | 作用 |
| --- | --- | --- |
| 主页 | `MainComponent` | 展示继续观看、接下来播放、各媒体库最近内容 |
| 媒体库 | `MediaComponent` | 展示媒体库入口 |
| 收藏 | `FavouriteComponent` | 展示收藏媒体 |
| 设置 | `PreferComponent` | 管理服务端、地址、用户、界面、播放器和关于信息 |

页面层普遍采用 `Component + ViewModel + Repository` 的结构。组件负责 UI，ViewModel 负责加载数据，Repository 负责后端访问。

## 8. 播放器模块分析

播放器相关代码位于：

```text
entry/src/main/ets/player/
entry/src/main/ets/pages/player/
```

主要类包括：

| 文件 | 作用 |
| --- | --- |
| `AbstractPlayer.ets` | 播放器抽象基类，统一播放、暂停、进度、音轨、字幕等接口 |
| `AVPlayer.ets` | HarmonyOS 系统播放器实现，适合系统原生支持的格式和 HDR 场景 |
| `WLPlayer.ets` | 基于 `libwlmedia.har` 的播放器实现，增强常见视频/音频/字幕格式兼容性 |
| `PlayerPage.ets` | 播放器页面，负责播放 UI、手势、进度条、音轨字幕选择等 |
| `PlayerViewModel.ets` | 根据电影或剧集参数加载播放所需媒体数据 |

播放器选择保存在 `AppPrefer` 中。视频设置页 `VideoSettingPage.ets` 提供 Auto、AVPlayer、WLMedia 三种选择。Auto 模式会结合媒体类型选择更合适的播放器实现。

## 9. 公共框架与复用设计

`framewrok/lib_core` 提供基础能力：

- 服务端、地址、用户、媒体项等实体模型。
- 本地数据库和偏好存储辅助类。
- 安全区域、断点、窗口工具。
- 事件中心、缓存和字符串/时间工具。

`framewrok/lib_framework` 提供上层 UI 和业务框架：

- 登录、编辑服务端、编辑地址、编辑用户页面。
- 通用路由 `FinRouter`。
- 列表刷新组件 `ListRefreshView`、`GridRefreshView`、`ScrollRefreshView`。
- 空状态、错误状态和加载状态组件。
- `FinViewModel`、`FinRepository` 等页面开发基类。

因此 FinVideo 的主应用代码可以把重点放在视频业务上，而把登录、路由、基础列表和状态页交给框架库复用。

## 10. 关键运行链路

```text
App.onCreate
  -> 初始化 AppPrefer / AppConfig / Repository
EntryAbility.onWindowStageCreate
  -> 加载 SplashPage
SplashPage.aboutToAppear
  -> 检查隐私授权
  -> Repository.init()
  -> 有账号进入 HomePage，无账号进入添加服务端流程
HomePage
  -> MainComponent / MediaComponent / FavouriteComponent / PreferComponent
ViewModel.loadData
  -> Repository
  -> FinVideoApiFactory
  -> JellyfinFinApi 或 EmbyFinApi
详情页
  -> MediaRouter.openDetail()
  -> MoviePage 或 ShowPage
播放器页
  -> PlayerViewModel.loadData()
  -> AbstractPlayer
  -> AVPlayer 或 WLPlayer
```

## 11. 代码特点

1. 分层比较清晰：页面、ViewModel、Repository、API SDK、播放器实现各自分工明确。
2. 服务端适配做了隔离：Jellyfin 和 Emby 被封装在不同 API 类中，页面层不直接依赖后端细节。
3. 复用框架较完整：登录、编辑、路由、刷新列表、状态页都下沉到 `lib_framework`。
4. 播放器实现有扩展空间：通过抽象播放器接口，可以继续接入新的播放内核。
5. 项目包含较多自动生成 SDK 模型，代码量大，但业务入口仍集中在 `entry` 模块。

## 12. 可改进点

1. 部分中文注释和资源在当前查看环境中出现编码显示异常，后续维护时应统一文件编码。
2. 当前 `Repository.getSupportServer()` 返回 Jellyfin，虽然 API 工厂支持 Emby，但 UI 层是否完整暴露 Emby 能力还需要继续验证。
3. 播放器页面功能较多，建议继续补充更细粒度的状态注释，方便理解手势、音轨、字幕和进度同步逻辑。
4. 项目依赖外部 OHPM 包和 HAR 文件，课程提交中应保留必要依赖说明，避免复现时缺文件。

## 13. 后续功能扩展计划

本次后续将在课程仓中继续分三次提交三个功能，每个功能单独构建验证并单独推送：

1. 增加学习版项目信息展示，帮助查看当前提交版本、上游来源和本地验证状态。
2. 增加搜索页的快速清空能力，改善输入搜索时的交互效率。
3. 增加播放器偏好重置能力，便于恢复默认播放配置。

