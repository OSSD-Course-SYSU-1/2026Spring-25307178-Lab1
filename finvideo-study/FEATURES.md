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

### 涉及文件

- `finvideo-study/FinVideo/entry/src/main/ets/pages/player/PlayerPage.ets`
- `finvideo-study/FinVideo/entry/src/main/ets/pages/player/XController.ets`

### 相关提交

- `5608a8b Add video snapshot capture`
- `58e65c7 Fix video snapshot gallery save`
- `3150fa2 Fix FinVideo snapshot save with short-term URI`
- `e569c3c Fix FinVideo snapshot gallery save`

## 9. 运行演示说明

### 改前版本

`finvideo-study/demo/改前版本.mp4` 展示基础工程在 HarmonyOS 模拟器上的运行效果，主要用于证明开源工程已能构建、安装并启动运行。

### 改后版本

`finvideo-study/demo/改后版本.mp4` 展示新增功能后的运行效果，重点体现视频播放、最近播放入口和视频截屏保存等可演示功能。

## 10. 构建与验证

本地验证环境为 DevEco Studio + HarmonyOS 模拟器 `127.0.0.1:5555`。主要验证命令如下：

```powershell
cd finvideo-study/FinVideo
ohpm install
hvigor assembleHap --stacktrace
hdc install -r entry/build/default/outputs/default/entry-default-unsigned.hap
hdc shell aa start -b org.ohpg.fin.video -a EntryAbility
```

验证结果：

- 工程可成功构建 unsigned HAP。
- 应用可安装并在 HarmonyOS 模拟器启动。
- Jellyfin 测试库视频可进入播放器播放。
- 新增的最近播放和视频截屏保存功能已在模拟器中验证。
