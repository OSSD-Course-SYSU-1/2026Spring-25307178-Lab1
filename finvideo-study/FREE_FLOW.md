# MediaHub 自由流转改进说明

## 文档依据

本次改进依据桌面课件 `02.自由流转.pptx`，重点对应其中“自由流转（跨端迁移）开发”部分：

- `module.json5` 中配置 `continuable: true`；
- 源端在 `UIAbility.onContinue()` 中保存待恢复任务数据；
- 对端在 `onCreate()` / `onNewWant()` 中恢复任务数据和页面状态；
- 小状态使用迁移参数传递，大数据和文件类内容应改用分布式数据对象或分布式文件；
- 迁移数据应尽量只包含应用状态，避免传输大体积媒体内容。

## 本项目实现范围

MediaHub 的业务场景是视频播放，因此本次实现选择“视频播放状态迁移”：

| PPT 要点 | 本项目对应实现 |
| --- | --- |
| 配置迁移能力 | `EntryAbility` 增加 `continuable: true` |
| 源端保存任务状态 | 播放器持续保存当前媒体 ID、名称、类型、播放进度、时长 |
| `onContinue()` 传输状态 | `EntryAbility.onContinue()` 将小状态写入 `wantParam` |
| 对端恢复状态 | `onCreate()` / `onNewWant()` 读取迁移参数并保存为待恢复状态 |
| 恢复页面状态 | Splash 初始化完成后自动进入播放器并跳到迁移进度 |
| 文件相关内容 | 使用 `context.distributedFilesDir` 写入播放状态清单和可选截图预览 |
| 大数据限制 | 不迁移视频文件本体，接收端使用本机服务器配置重新拉流 |

## 代码改动

### 1. 开启系统应用接续

文件：`FinVideo/entry/src/main/module.json5`

在 `EntryAbility` 下增加：

```json5
"continuable": true
```

这样系统才会把该 Ability 识别为可迁移任务。

### 2. 保存和恢复迁移状态

文件：`FinVideo/entry/src/main/ets/continuation/ContinuationStateStore.ets`

新增统一状态存取类，负责：

- 保存当前播放器状态；
- 将播放器状态写入 `wantParam`；
- 将播放器状态写入分布式文件清单；
- 优先从分布式文件清单读取迁移状态；
- 从对端 `Want` 中读取迁移参数；
- 在应用初始化完成后打开播放器并恢复进度。

迁移状态只包含：

- `id`：媒体 ID；
- `name`：媒体名称；
- `type`：媒体类型；
- `position`：播放进度；
- `duration`：视频时长；
- `createdAt`：状态生成时间。

### 3. 增加自由流转文件清单

文件：`FinVideo/entry/src/main/ets/continuation/ContinuationFileStore.ets`

新增分布式文件辅助类，负责把自由流转相关的轻量级文件写入：

```text
context.distributedFilesDir/mediahub-continuation/
```

目前包含两类文件：

- `mediahub-continuation-session.json`：播放状态清单，记录媒体 ID、名称、类型、播放进度、时长和文件资产列表；
- 视频截屏预览图：用户在播放器点击截屏后，除保存到系统图库外，还会额外写入分布式文件目录，作为自由流转可同步的轻量级文件资产。

系统触发迁移时，`Want` 中只放入清单文件名、大小和文件数量等小字段。对端启动后会优先读取分布式文件清单恢复播放状态；如果分布式文件暂未同步或读取失败，则自动退回到 `Want` 中的内联播放状态，保证课堂演示时不因为文件同步时机影响续播。

### 4. 接入 UIAbility 生命周期

文件：`FinVideo/entry/src/main/ets/ability/entry/EntryAbility.ets`

新增逻辑：

- `setMissionContinueState(ACTIVE)`：激活当前任务的接续状态；
- `onContinue()`：源端写入播放器状态，返回 `AGREE`；
- `onCreate()` / `onNewWant()`：对端接收迁移参数；
- `EVENT_CONTINUATION_RECEIVED`：热启动时通知页面层打开待恢复视频。

### 5. 播放器持续更新状态

文件：`FinVideo/entry/src/main/ets/pages/player/PlayerPage.ets`

播放器在以下时机更新可迁移状态：

- 媒体信息加载成功；
- 播放进度变化；
- 页面隐藏；
- 从迁移进度恢复播放后。

## 演示条件

系统自由流转不是普通局域网页面，需要满足课件中的设备条件：

1. 双端设备为 HarmonyOS NEXT Release 及以上版本；
2. 双端登录同一华为账号；
3. 双端开启 Wi-Fi 和蓝牙；
4. 条件允许时接入同一局域网；
5. 双端安装同包名、同签名、同 Ability 的应用；
6. 双端都已经配置可访问的 Jellyfin / Emby 服务器账号。

## 演示路径

1. 在设备 A 打开 MediaHub 并播放一个视频。
2. 等待播放几秒，让播放器保存当前播放状态。
3. 通过系统自由流转入口把任务迁移到设备 B。
4. 设备 B 启动 MediaHub 后会进入同一视频，并从迁移时的进度继续播放。

如果课堂环境无法触发系统自由流转入口，可以使用应用内“续播码”作为兜底：

1. 设备 A 播放器点击“续播”按钮复制续播码；
2. 设备 B 进入“设置 -> 跨设备续播”；
3. 粘贴续播码并打开续播。

这个兜底方案和系统自由流转使用同一个 `FinTransferSession` 数据模型，便于展示迁移状态的内容和恢复效果。

## 限制说明

- 当前实现迁移的是播放状态、播放状态清单和轻量级截图预览，不迁移视频文件本体。
- 真正的视频流由目标设备使用自己的服务器配置重新获取。
- 系统自由流转是否出现入口，取决于真机系统版本、华为账号、蓝牙/Wi-Fi、签名一致性和设备协同能力。
- 大体积视频文件不适合直接放入自由流转迁移参数；如果后续要做离线媒体文件迁移，应单独设计分布式文件选择、传输进度和冲突处理流程。
