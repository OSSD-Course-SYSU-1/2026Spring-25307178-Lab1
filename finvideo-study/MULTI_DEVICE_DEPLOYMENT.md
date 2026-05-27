# MediaHub 一次开发、多端部署改进说明

## 文档依据

本次改进依据桌面课件 `01.一次开发，多端部署.pptx`，重点覆盖课件中的三层目标：

1. 界面级一多：断点、栅格、自适应布局、响应式布局、交互归一。
2. 功能级一多：尽量复用同一套业务逻辑，避免依赖单一设备形态。
3. 工程级一多：同一工程面向手机、平板、2in1 设备部署。

## 工程级一多

当前工程仍保持一套 ArkTS 代码和一个 Entry HAP。`module.json5` 中已经声明支持：

```json5
"deviceTypes": [
  "phone",
  "tablet",
  "2in1"
]
```

项目结构也符合课件推荐的复用思路：

| 层次 | 当前工程对应 |
| --- | --- |
| 公共能力层 | `framewrok/lib_core/`，包含断点、事件、模型、工具等公共能力 |
| 基础特性层 | `framewrok/lib_framework/`，包含刷新列表、工具栏、状态页等通用 UI 能力 |
| 产品定制层 | `entry/`，实现 MediaHub 的首页、媒体库、详情、播放器、设置等业务页面 |

## 界面级一多

### 1. 统一断点参数

新增 `entry/src/main/ets/adaptive/ResponsiveLayout.ets`，集中管理手机、平板和 2in1 窗口下的布局参数：

- 页面左右边距；
- 首页顶部高度；
- 海报卡宽度；
- 剧集横卡宽度；
- 网格卡片宽度；
- 详情页最大内容宽度；
- 剧集页多列数量。

这样页面不再各自硬编码尺寸，后续继续扩展电脑、平板和折叠屏时，只需要调整一处断点策略。

### 2. 首页顶部使用栅格布局

`HomeToolBar.ets` 从原来的普通 `Row` 改为 `GridRow + GridCol`：

- 小屏：标题和搜索框上下排布，避免挤压；
- 中/大屏：标题和搜索框同一行，搜索框占更合理的栅格宽度；
- 左右边距跟随断点变化。

这对应课件中“顶部标题 / 搜索框使用 GridRow、GridCol 做响应式挪移布局”的要求。

### 3. 首页 Tab 已支持手机和大屏差异

`HomePage.ets` 继续使用断点控制 `Tabs`：

- 手机小屏：底部 Tab；
- 平板、2in1 宽屏：左侧纵向 Tab；
- Tab 宽高跟随断点切换。

这对应课件中“页签栏在不同断点下调整 barPosition、vertical、barWidth、barHeight”的要求。

### 4. 媒体网格响应式密度

以下页面统一接入 `ResponsiveLayout`：

- `pages/home/media/MediaComponent.ets`
- `pages/media/MediaListPage.ets`
- `pages/favourite/FavouriteListPage.ets`
- `pages/search/SearchPage.ets`

实现效果：

- 手机：保持较紧凑的海报尺寸；
- 平板：增大卡片宽度，提高可读性；
- 2in1 / 宽屏：进一步增大卡片和页面边距；
- Grid 使用 `columnsTemplate = repeat(auto-fit, width)` 自动填充列数。

这对应课件中“Grid 组件通过 columnsTemplate 做不同断点下的网格展示数量”的要求。

### 5. 详情页大屏双栏

电影详情页和剧集详情页新增宽屏内容约束：

- 小屏：封面、简介、演员等内容纵向排列；
- 中/大屏：内容最大宽度居中，简介和下一集 / 演职人员区域左右分栏；
- 封面继续使用 `aspectRatio`，随容器宽度自适应。

这对应课件中“利用屏幕宽度优势，将上下布局切换为左右布局”的挪移布局。

### 6. 剧集页多列部署

`ShowSeasonPage.ets` 从单列列表改成 `GridRefreshView`：

- 手机：1 列；
- 平板：2 列；
- 2in1 / 宽屏：3 列；
- 每个剧集项根据断点调整封面尺寸和行高。

这对应课件中的“List / Grid 配合断点改变展示密度”。

## 交互归一

### 1. 鼠标悬浮和键盘焦点

`MediaItem.ets` 和 `EpisodeItem.ets` 增加：

- `onHover`：适配鼠标 / 触控板悬浮；
- `focusable`、`onFocus`、`onBlur`：适配键盘走焦；
- 焦点或悬浮时轻微缩放，给出统一视觉反馈。

这对应课件中的“触摸、鼠标、触控板、键盘等输入方式统一到组件交互状态”。

### 2. 双指捏合调整网格密度

媒体库、媒体列表、收藏列表新增 `PinchGesture`：

- 双指放大：卡片宽度略增，列表更适合演示封面细节；
- 双指缩小：卡片宽度略减，一屏展示更多内容；
- 缩放范围由 `ResponsiveLayout.clampGridScale()` 限制，避免布局过密或过疏。

这对应课件中的“长视频应用一多交互开发：捏合缩放控制网格显示”的案例。

## 功能级一多

MediaHub 的核心功能使用同一套 Jellyfin / Emby API 和同一套 ArkUI 页面逻辑，不为手机、平板、2in1 单独维护业务分支。涉及设备能力的地方保持最小依赖：

- 基础浏览、搜索、收藏、播放依赖网络能力；
- 视频截图保存依赖媒体写入权限；
- 自由流转能力依赖前一份 `FREE_FLOW.md` 中说明的系统接续条件；
- 本次一多改进不引入 NFC、摄像头、SIM 卡等单设备能力，避免影响多端安装。

后续如果加入设备专属能力，应按课件中的 `canIUse` 思路先判断系统能力，再给出友好降级。

## 演示建议

1. 在 DevEco Studio 预览器或模拟器中分别切换手机、平板、2in1 窗口。
2. 打开首页，观察底部 Tab 与左侧 Tab 的切换。
3. 进入媒体库，调整窗口宽度，观察网格列数和卡片尺寸变化。
4. 在媒体库双指捏合，演示网格密度变化。
5. 进入电影或剧集详情页，观察小屏纵向和大屏双栏差异。
6. 进入某一季剧集页，观察手机 1 列、平板 2 列、宽屏 3 列。
7. 使用鼠标或键盘移动焦点，观察卡片悬浮 / 焦点反馈。

## 构建验证

本次改进已执行：

```powershell
cd finvideo-study/FinVideo
hvigor assembleHap --stacktrace
```

验证结果：`BUILD SUCCESSFUL`。

构建过程中仍有原项目遗留的 ArkTS warning，例如部分旧 API deprecated、函数可能抛异常、未配置正式签名等；本次新增的一多部署代码没有引入编译错误。
