# FinVideo 新增功能说明

## 1. 文档目的

本文档对应课程要求中的“在基础工程上新增功能，并描述新增功能项”。基础工程为开源 HarmonyOS 项目 FinVideo v0.3.3，源码位于 `finvideo-study/FinVideo/`。

## 2. 交付物对应关系

| 课程要求 | 仓库文件 |
| --- | --- |
| 开源鸿蒙基础工程 | `finvideo-study/FinVideo/` |
| 基础工程运行录屏 | `finvideo-study/demo/改前版本.mp4` |
| 工程代码解析报告 | `finvideo-study/REPORT.md` |
| 新增功能说明 | `finvideo-study/FEATURES.md` |
| 新增功能运行录屏 | `finvideo-study/demo/改后版本.mp4` |

## 3. 新增功能概览

本次在基础工程上补充了面向课程演示和真实使用的功能，主要包括：

1. 应用内课程移植信息展示。
2. 搜索结果页支持就地修改关键词和清空结果。
3. 播放器设置页支持一键恢复默认播放器。
4. 首页展示最近播放记录。
5. 播放器内支持视频画面截屏并保存到系统图库。
6. 主页、媒体库、收藏和搜索结果支持大小屏响应式适配。
7. 播放器支持复制跨设备续播码，偏好页支持导入续播码继续播放。
8. 按“自由流转”课程文档补充 HarmonyOS 应用接续能力，支持系统跨端迁移视频播放状态和轻量级文件资产。
9. 按“一次开发，多端部署”课程文档强化手机、平板、2in1 多端布局和交互归一。

## 4. 功能一：课程移植信息展示

### 功能说明

在关于页面增加“课程移植信息”区域，直接展示本次选用的 FinVideo 版本、上游提交、构建验证和模拟器运行验证信息。这样在演示时可以从应用内确认工程来源与运行状态。

### 涉及文件

- `finvideo-study/FinVideo/entry/src/main/ets/pages/about/AboutPage.ets`

### 相关提交

- `9a89a95 Add FinVideo study info section`

## 5. 功能二：搜索结果页就地改词与清空

### 功能说明

原基础工程搜索后需要返回上一层才能更换关键词。新增功能在搜索结果页顶部加入搜索输入框和“清空”按钮，用户可以直接输入新关键词重新搜索，也可以一键清空当前结果。

### 涉及文件

- `finvideo-study/FinVideo/entry/src/main/ets/pages/search/SearchPage.ets`
- `finvideo-study/FinVideo/entry/src/main/ets/pages/search/SearchViewModel.ets`

### 相关提交

- `054e9aa Add editable search results`

## 6. 功能三：播放器偏好一键重置

### 功能说明

原基础工程支持选择不同播放器实现，但没有明显的恢复默认入口。新增功能在视频设置页增加“恢复默认播放器”按钮，将播放器偏好重置为 `AUTO` 模式，并通过 Toast 告知用户操作成功。

### 涉及文件

- `finvideo-study/FinVideo/entry/src/main/ets/pages/setting/VideoSettingPage.ets`
- `finvideo-study/FinVideo/entry/src/main/ets/prefer/AppPrefer.ets`

### 相关提交

- `0974fba Add player preference reset`

## 7. 功能四：首页最近播放记录

### 功能说明

新增最近播放记录功能。用户进入播放器后，应用会记录最近播放的视频；回到首页后，可以在“最近播放”区域快速再次打开刚播放过的内容，方便课程演示时展示播放链路闭环。

### 涉及文件

- `finvideo-study/FinVideo/entry/src/main/ets/pages/player/PlayerPage.ets`
- `finvideo-study/FinVideo/entry/src/main/ets/pages/player/PlayerViewModel.ets`
- `finvideo-study/FinVideo/entry/src/main/ets/pages/home/main/MainComponent.ets`
- `finvideo-study/FinVideo/entry/src/main/ets/pages/home/main/MainViewModel.ets`
- `finvideo-study/FinVideo/entry/src/main/ets/entity/FinPlaybackInfo.ets`

### 相关提交

- `2692fa9 Add recent playback section`

## 8. 功能五：视频截屏保存到图库

### 功能说明

播放器控制栏新增保存按钮。播放视频时点击该按钮，应用会优先按当前播放进度解码视频帧，压缩为 JPEG 后通过系统媒体库接口写入图库。保存成功后会显示 Toast，用户可以在虚拟机图库中查看截屏结果。

为适配模拟器演示，还补充了保存失败日志和媒体库写入方式修复，避免因短期授权接口不匹配导致“截屏失败”。

为配合“自由流转”文件资产演示，截屏成功后还会把同一张 JPEG 预览图写入 `context.distributedFilesDir/mediahub-continuation/`，作为跨端迁移时可同步的轻量级文件内容。

### 涉及文件

- `finvideo-study/FinVideo/entry/src/main/ets/pages/player/PlayerPage.ets`
- `finvideo-study/FinVideo/entry/src/main/ets/pages/player/XController.ets`

### 相关提交

- `5608a8b Add video snapshot capture`
- `58e65c7 Fix video snapshot gallery save`
- `3150fa2 Fix FinVideo snapshot save with short-term URI`
- `e569c3c Fix FinVideo snapshot gallery save`

## 9. 功能六：大小屏适配

### 功能说明

新增大小屏适配能力。主页、媒体库、收藏、搜索结果和媒体列表页会读取应用已有的 `BreakpointSystem` 断点状态，在手机小屏保持原始布局，在中屏和大屏下自动放大海报卡、剧集横卡，并增加页面左右边距。这样同一个 FinVideo 工程在手机、平板、2in1 或模拟器宽屏窗口中都能保持更合适的内容密度。

### 涉及文件

- `finvideo-study/FinVideo/entry/src/main/ets/pages/home/main/MainComponent.ets`
- `finvideo-study/FinVideo/entry/src/main/ets/pages/home/media/MediaComponent.ets`
- `finvideo-study/FinVideo/entry/src/main/ets/pages/home/favourite/FavouriteComponent.ets`
- `finvideo-study/FinVideo/entry/src/main/ets/pages/media/MediaListPage.ets`
- `finvideo-study/FinVideo/entry/src/main/ets/pages/favourite/FavouriteListPage.ets`
- `finvideo-study/FinVideo/entry/src/main/ets/pages/search/SearchPage.ets`
- `finvideo-study/FinVideo/entry/src/main/ets/widget/media/MediaItem.ets`
- `finvideo-study/FinVideo/entry/src/main/ets/widget/media/EpisodeItem.ets`

### 相关提交

- `7bcefe3 Add responsive large-screen layout`

## 10. 功能七：跨设备续播

### 功能说明

新增跨设备续播演示能力。播放器顶部增加“续播”按钮，点击后会把当前视频的媒体 ID、名称、类型、播放进度和时长编码成 FinVideo 续播码并复制到剪贴板。另一台设备进入“设置/偏好”页中的“跨设备续播”入口后，可以通过安全粘贴按钮读取续播码，预览视频名称和进度，并直接跳转播放器从对应时间点继续播放。

该功能为了课堂演示稳定，采用“续播码 + 剪贴板/手动粘贴”的方式传递播放状态；真正拉流仍然使用目标设备本机配置的 Jellyfin/Emby 服务器地址和账号。

### 涉及文件

- `finvideo-study/FinVideo/entry/src/main/ets/pages/player/PlayerPage.ets`
- `finvideo-study/FinVideo/entry/src/main/ets/pages/player/PlayerArgs.ets`
- `finvideo-study/FinVideo/entry/src/main/ets/pages/transfer/TransferPage.ets`
- `finvideo-study/FinVideo/entry/src/main/ets/pages/transfer/TransferSessionCodec.ets`
- `finvideo-study/FinVideo/entry/src/main/ets/entity/FinTransferSession.ets`
- `finvideo-study/FinVideo/entry/src/main/ets/pages/home/prefer/PreferComponent.ets`
- `finvideo-study/FinVideo/entry/src/main/resources/base/profile/main_pages.json`

## 11. 功能八：HarmonyOS 自由流转应用接续

### 功能说明

按 `02.自由流转.pptx` 的“跨端迁移开发”流程补充系统级应用接续能力：

1. 在 `module.json5` 的 `EntryAbility` 中配置 `continuable: true`，让系统识别该 Ability 支持迁移。
2. 源端播放器持续保存当前播放状态，包括媒体 ID、名称、类型、播放进度和时长。
3. 系统触发自由流转时，`EntryAbility.onContinue()` 将当前播放状态写入 `wantParam`。
4. 同时把播放状态写入 `context.distributedFilesDir/mediahub-continuation/mediahub-continuation-session.json`，并在 `wantParam` 中记录清单文件名、大小和文件数量。
5. 用户使用视频截屏功能后，截屏预览图也会写入同一个分布式文件目录，作为可同步的文件资产。
6. 对端应用在 `onCreate()` 或 `onNewWant()` 收到迁移参数后，优先读取分布式文件清单；如果文件暂未同步，则回退读取 `wantParam` 中的内联状态。
7. 初始化完成后，对端自动进入播放器，并从迁移进度继续播放。

本功能同时覆盖 PPT 中“小状态通过迁移框架 / Want 参数传递”和“文件类内容使用分布式文件目录”的场景。视频文件和流媒体本身不放入 `wantParam`，避免超过课程文档中提到的小数据迁移限制；目标设备仍使用本机配置的 Jellyfin/Emby 服务器重新拉流。

### 涉及文件

- `finvideo-study/FinVideo/entry/src/main/module.json5`
- `finvideo-study/FinVideo/entry/src/main/ets/ability/entry/EntryAbility.ets`
- `finvideo-study/FinVideo/entry/src/main/ets/continuation/ContinuationFileStore.ets`
- `finvideo-study/FinVideo/entry/src/main/ets/continuation/ContinuationStateStore.ets`
- `finvideo-study/FinVideo/entry/src/main/ets/pages/player/PlayerPage.ets`
- `finvideo-study/FinVideo/entry/src/main/ets/pages/splash/SplashPage.ets`
- `finvideo-study/FinVideo/entry/src/main/ets/pages/home/HomePage.ets`
- `finvideo-study/FinVideo/framewrok/lib_core/src/main/ets/event/AppEvents.ets`

### 演示说明

真机演示需要两台 HarmonyOS NEXT Release 及以上设备，并满足课程文档中的限制：双端登录同一华为账号、开启 Wi-Fi 和蓝牙、双端都安装同包名同签名应用。若课堂环境无法触发系统自由流转入口，仍可使用上一节的“续播码 + 剪贴板”作为功能兜底演示。

## 12. 功能九：一次开发、多端部署强化

### 功能说明

按 `01.一次开发，多端部署.pptx` 的界面级一多、功能级一多和工程级一多要求继续强化 MediaHub：

1. 新增 `ResponsiveLayout`，集中管理手机、平板、2in1 窗口下的边距、卡片宽度、详情页最大宽度和剧集列数。
2. 首页顶部从普通 `Row` 改为 `GridRow + GridCol`，小屏标题和搜索框上下排布，中/大屏同排展示。
3. 媒体库、媒体列表、收藏列表和搜索结果统一使用断点卡片宽度，Grid 自动填充列数。
4. 电影详情页、剧集详情页在宽屏下居中限宽并切换为左右分栏，小屏仍保持纵向阅读。
5. 剧集列表页改为 Grid，手机 1 列、平板 2 列、2in1 / 宽屏 3 列。
6. 海报卡和剧集卡增加鼠标悬浮、键盘焦点反馈；媒体网格增加双指捏合调整密度。

详细说明见 `finvideo-study/MULTI_DEVICE_DEPLOYMENT.md`。

### 涉及文件

- `finvideo-study/MULTI_DEVICE_DEPLOYMENT.md`
- `finvideo-study/FinVideo/entry/src/main/ets/adaptive/ResponsiveLayout.ets`
- `finvideo-study/FinVideo/entry/src/main/ets/widget/bar/HomeToolBar.ets`
- `finvideo-study/FinVideo/entry/src/main/ets/widget/media/MediaItem.ets`
- `finvideo-study/FinVideo/entry/src/main/ets/widget/media/EpisodeItem.ets`
- `finvideo-study/FinVideo/entry/src/main/ets/pages/home/media/MediaComponent.ets`
- `finvideo-study/FinVideo/entry/src/main/ets/pages/media/MediaListPage.ets`
- `finvideo-study/FinVideo/entry/src/main/ets/pages/favourite/FavouriteListPage.ets`
- `finvideo-study/FinVideo/entry/src/main/ets/pages/detail/movie/MoviePage.ets`
- `finvideo-study/FinVideo/entry/src/main/ets/pages/detail/show/ShowPage.ets`
- `finvideo-study/FinVideo/entry/src/main/ets/pages/detail/show/season/ShowSeasonPage.ets`

### 演示说明

课堂演示时建议在 DevEco Studio 预览器或模拟器中切换手机、平板、2in1 窗口，依次展示：首页底部 Tab / 左侧 Tab 切换、媒体网格列数变化、双指捏合调整网格密度、详情页宽屏双栏、剧集页多列布局和鼠标 / 键盘焦点反馈。

## 13. 运行演示说明

### 改前版本

`finvideo-study/demo/改前版本.mp4` 展示基础工程在 HarmonyOS 模拟器上的运行效果，主要用于证明开源工程已能构建、安装并启动运行。

### 改后版本

`finvideo-study/demo/改后版本.mp4` 展示新增功能后的运行效果，重点体现视频播放、最近播放入口和视频截屏保存等可演示功能。

## 14. 构建与验证

本地验证环境为 DevEco Studio + HarmonyOS 模拟器 `127.0.0.1:5555`。主要验证命令如下：

```powershell
cd finvideo-study/FinVideo
ohpm install
hvigor assembleHap --stacktrace
hdc install -r entry/build/default/outputs/default/entry-default-unsigned.hap
hdc shell aa start -b com.github.wz167838.mediahub -a EntryAbility
```

验证结果：

- 工程可成功构建 unsigned HAP。
- 应用可安装并在 HarmonyOS 模拟器启动。
- Jellyfin 测试库视频可进入播放器播放。
- 新增的最近播放和视频截屏保存功能已在模拟器中验证。
- 应用接续相关配置和生命周期代码已通过 `hvigor assembleHap --stacktrace` 构建验证；系统自由流转需要双真机环境验证。
- 一次开发、多端部署相关布局和交互代码已通过 `hvigor assembleHap --stacktrace` 构建验证；多端视觉效果建议在 DevEco 多设备预览器和真机窗口中继续确认。
