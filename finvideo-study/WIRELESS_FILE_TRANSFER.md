# MediaHub 跨设备无线文件传输说明

## 功能目标

本功能用于课堂现场演示“手机和平板互传文件”。它独立于 FinVideo 的视频播放业务，不需要 Jellyfin / Emby 服务器，只依赖 HarmonyOS 应用沙箱中的分布式文件目录。

## 实现方式

核心目录：

```text
context.distributedFilesDir/mediahub-wireless-transfer/
```

发送端会把用户选择的文件复制到上述目录，并维护文件清单：

```text
mediahub-wireless-transfer-manifest.json
```

清单中记录：

- 文件 ID；
- 原始文件名；
- 分布式目录中的存储文件名；
- 文件大小；
- 发送来源；
- 创建时间；
- 相对路径。

接收端打开同一页面后读取该目录和清单，展示可接收文件，并通过系统文件保存器把文件另存到本机目录。

## 代码位置

| 文件 | 作用 |
| --- | --- |
| `FinVideo/entry/src/main/ets/pages/filetransfer/FileTransferPage.ets` | 跨设备文件流转页面，提供发送、生成演示文件、刷新接收、保存到本机等交互 |
| `FinVideo/entry/src/main/ets/pages/filetransfer/WirelessFileTransferStore.ets` | 文件选择、复制到分布式目录、维护清单、读取列表、另存文件 |
| `FinVideo/entry/src/main/ets/pages/home/prefer/PreferComponent.ets` | 在设置 / 偏好页增加“跨设备文件流转”入口 |
| `FinVideo/entry/src/main/resources/base/profile/main_pages.json` | 注册页面路由 |

## 页面能力

### 1. 选择文件发送

点击“选择文件发送”后调用系统 `DocumentViewPicker`，用户可以选择最多 5 个文件。应用会把文件复制到 `distributedFilesDir` 下的跨设备文件目录，并写入清单。

### 2. 生成演示文件

点击“生成演示文件”会直接生成一份文本文件，便于课堂现场没有可选文件时快速演示。该文件同样会写入分布式文件目录和文件清单。

### 3. 刷新接收列表

接收端点击“刷新接收列表”后读取清单并展示当前可见文件。如果清单暂不可用，页面会扫描分布式文件目录并展示可识别文件。

### 4. 保存到本机

接收端点击文件右侧“保存”按钮后调用系统 `DocumentViewPicker.save()`，用户选择保存位置，应用把分布式目录中的文件复制到目标位置。

## 真机演示条件

1. 手机和平板均为支持 HarmonyOS 跨设备协同的系统版本。
2. 双端登录同一华为账号。
3. 双端开启 Wi-Fi 和蓝牙，建议处于同一局域网。
4. 双端安装同包名、同签名、同版本的 MediaHub。
5. 双端都打开“设置 / 偏好 -> 跨设备文件流转”页面。

## 演示步骤

1. 手机端进入“设置 / 偏好 -> 跨设备文件流转”。
2. 点击“生成演示文件”或“选择文件发送”。
3. 平板端进入同一页面。
4. 点击“刷新接收列表”。
5. 看到文件后点击“保存”，选择本机保存位置。

## 说明和限制

- 该功能演示的是 HarmonyOS 分布式文件目录下的文件同步能力，不是通过局域网 HTTP 服务或蓝牙 socket 手写传输协议。
- 大文件同步时间取决于系统分布式文件同步状态、设备距离、网络、蓝牙/Wi-Fi 和系统协同开关。
- 如果接收端暂时看不到文件，先等待几秒并再次点击“刷新接收列表”。
- 模拟器只能验证页面、文件写入和保存逻辑；真正“手机和平板互传”必须使用两台真机验证。
