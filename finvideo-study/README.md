# FinVideo / MediaHub 课程学习与扩展

本目录是对开源 HarmonyOS 应用 FinVideo 的课程级学习、复现和二次开发成果。工作不仅包含源码拷贝，还包括可复现构建、架构解析、功能增量、多设备适配、自由流转和课堂演示材料。

## 项目来源与基线

| 项目 | 内容 |
| --- | --- |
| 上游仓库 | <https://github.com/OHPG/FinVideo> |
| 选用版本 | `v0.3.3` |
| 上游提交 | `d76959b8d25627d864cf854cbabcfd730c8852a2` |
| 应用包名 | `com.github.wz167838.mediahub` |
| 开发语言 | ArkTS |
| 应用模型 | HarmonyOS Stage 模型 |
| 主要后端 | Jellyfin 10.10+ |
| 目标设备 | phone、tablet、2in1 |

选择 `v0.3.3` 是为了保证课程仓可复现：上游 `master` 在本地核验时引用了公开 OHPM 源无法取得的 `@ohpg/player@0.6.3`，而 `v0.3.3` 能完成依赖安装与 HAP 构建。本目录在这一稳定基线上继续实现课程功能。

## 项目能做什么

FinVideo 是私有媒体服务器客户端，不自带影视资源。用户配置自己的 Jellyfin 服务后，可以浏览媒体库、搜索电影和剧集、查看详情与收藏、继续观看，并通过系统播放器或 WLMedia 播放视频。

课程扩展后的 MediaHub 还提供：

- 最近播放记录与播放器设置重置。
- 播放器视频帧截取、JPEG 编码和系统图库写入。
- 手机、平板、2in1 的响应式页面和输入方式适配。
- 续播码导入导出与系统应用接续。
- `distributedFilesDir` 中的接续清单、预览图和独立文件流转。
- SysCap 检查和剪贴板、文件选择、图库、应用接续不可用时的回退提示。

## 快速阅读路线

| 文档 | 建议用途 |
| --- | --- |
| [`REPORT.md`](REPORT.md) | 最完整的源码解析；适合答辩前通读和按调用链定位代码 |
| [`FEATURES.md`](FEATURES.md) | 对照课程要求查看每项新增功能、文件和提交 |
| [`MULTI_DEVICE_DEPLOYMENT.md`](MULTI_DEVICE_DEPLOYMENT.md) | 查看“一次开发，多端部署”的断点、栅格和交互实现 |
| [`FREE_FLOW.md`](FREE_FLOW.md) | 查看应用接续、Want 参数和分布式文件清单 |
| [`WIRELESS_FILE_TRANSFER.md`](WIRELESS_FILE_TRANSFER.md) | 查看独立的跨设备文件流转流程 |
| [`STORE_READINESS.md`](STORE_READINESS.md) | 查看权限、隐私和上架准备边界 |
| [`FinVideo/MEDIAHUB_MULTIDEVICE_DEMO.md`](FinVideo/MEDIAHUB_MULTIDEVICE_DEMO.md) | 课堂演示、SysCap 与双真机检查清单 |

推荐源码阅读顺序：

```text
App.ets
  -> EntryAbility.ets
  -> SplashPage.ets
  -> CoreRepository / Repository
  -> FinVideoApiFactory / JellyfinFinApi
  -> HomePage 与各 ViewModel
  -> PlayerViewModel / XController / AbstractPlayer
  -> ContinuationStateStore / WirelessFileTransferStore
```

## 工程结构

```text
finvideo-study/
├── FinVideo/                    # 可独立打开和构建的 HarmonyOS 多模块工程
│   ├── entry/                   # 页面、业务仓储、播放器、跨端扩展
│   ├── framewrok/lib_core/      # 实体、数据库、事件、窗口和断点基础能力
│   ├── framewrok/lib_framework/ # 登录、路由、ViewModel、刷新/状态组件
│   ├── sdk/network/             # Axios/RCP 网络封装
│   ├── sdk/jellyfin/            # Jellyfin API 与生成模型
│   ├── sdk/emby/                # Emby SDK；主应用适配当前仍是未完成骨架
│   └── entry/libs/              # WLMedia HAR 播放器依赖
├── demo/                        # 改前、改后演示视频
├── store-assets/                # 上架文案、隐私政策、开源声明等材料
├── REPORT.md                    # 源码解析报告
└── FEATURES.md                  # 新增功能说明
```

> `framewrok` 是上游目录的原始拼写，为避免破坏模块依赖路径而保留。

## 本地构建与运行

### 1. 安装依赖并构建

```powershell
cd finvideo-study/FinVideo
ohpm install
hvigor assembleHap --stacktrace
```

构建产物：

```text
entry/build/default/outputs/default/entry-default-unsigned.hap
```

### 2. 安装到已连接设备或模拟器

```powershell
hdc list targets
hdc install -r entry/build/default/outputs/default/entry-default-unsigned.hap
hdc shell aa start -b com.github.wz167838.mediahub -a EntryAbility
```

如果 `hdc list targets` 没有设备，应先在 DevEco Studio 中启动模拟器或连接真机。调试包可以无发布签名构建，但双设备应用接续要求两端安装同包名、同签名应用。

## 已完成验证与证据边界

- 2026-05-12 已在本地执行依赖安装、HAP 构建、模拟器安装和 Ability 启动。
- 模拟器目标为 `127.0.0.1:5555`，包名 `com.github.wz167838.mediahub` 可成功启动。
- 后续课程改动持续通过 `hvigor assembleHap --stacktrace` 做构建验证。
- 系统应用接续和分布式文件同步属于双真机能力；构建或单模拟器成功只能证明代码与工程配置有效，不能替代双真机端到端证据。

## 远程测试

课程检查可直接连接公开的 Jellyfin 测试服务器：

| 登录项 | 内容 |
| --- | --- |
| 服务器地址 | `http://154.51.40.24:8096` |
| 用户名 | `finvideo-demo` |
| 密码 | `FinVideoDemo2026` |
| App 内别名 | `VPS Demo` |

测试账号不是管理员，媒体库只包含本仓库的两个演示视频。Web 登录页和
完整验证说明见 [`REMOTE_TEST.md`](REMOTE_TEST.md)。

## 演示建议

1. 先展示首页、媒体库、详情和播放器基本链路。
2. 在搜索结果页演示直接换词和清空。
3. 播放视频后返回首页，展示“最近播放”。
4. 在播放器保存截图并到系统图库核对。
5. 调整模拟器/窗口宽度，展示底部 Tab 与侧边 Tab、卡片尺寸和详情布局变化。
6. 用续播码完成稳定的单机或双设备兜底演示。
7. 条件允许时，再用双真机演示系统应用接续和分布式文件同步。

## 当前限制

- `Repository.getSupportServer()` 当前只返回 Jellyfin；`EmbyFinApi` 的大部分方法仍会抛出 `Method not implemented`，不能把“存在 Emby SDK”理解为“主应用已完整支持 Emby”。
- 正常使用时由用户配置自己的 Jellyfin 地址、账号与媒体；仓库只公开课程演示服务器的受限测试账号和两个作业视频，不包含管理员凭据或其他影视资源。
- `AUTO` 播放器策略在课程版中固定选择系统 `AVPlayer`，用于规避 DevEco x86_64 模拟器加载 WLMedia 原生库时的稳定性问题；真机可显式选择 WLMedia。
- 应用接续只迁移媒体 ID、类型、进度等小状态和轻量文件资产，视频流本身始终由接收端重新从 Jellyfin 拉取。
- `build-properties.json5` 是空的非秘密调试配置；发布签名与 AppGallery 账号操作不在仓库中。

## 课程交付物

- 基础工程源码：`FinVideo/`
- 完整源码解析：`REPORT.md`
- 新增功能说明：`FEATURES.md`
- 改前演示：`demo/改前版本.mp4`
- 改后演示：`demo/改后版本.mp4`
- 多设备专题文档：`MULTI_DEVICE_DEPLOYMENT.md`、`FREE_FLOW.md`、`WIRELESS_FILE_TRANSFER.md`
- 上架准备材料：`STORE_READINESS.md`、`store-assets/`
- 公网测试说明：`REMOTE_TEST.md`
