# 2026 Spring OSSD Lab 1：HarmonyOS / OpenHarmony 课程实践

本仓库是 2026 年春季 OSSD 课程 Lab 1 的个人实践仓，围绕 ArkTS、HarmonyOS Stage 模型、开源应用阅读、功能扩展与多设备协同展开。仓库既保留了可独立构建的小型课堂示例，也包含对真实开源项目 FinVideo 的完整移植、源码解析和二次开发。

## 仓库内容一览

| 目录 | 内容 | 主要学习点 |
| --- | --- | --- |
| `entry/` | Stdio Sorter 主工程 | ArkUI 状态管理、输入解析、归并排序、基础交互 |
| `advanced-stage-app/` | AbilityStartMode 官方样例学习 | Stage 模型、`AbilityStage`、`UIAbility`、启动模式与窗口生命周期 |
| `finvideo-study/` | FinVideo 开源项目学习与扩展 | 大型 ArkTS 工程分层、Jellyfin API、播放器、多端适配、自由流转、分布式文件 |
| `wireless-file-transfer/` | 浏览器式无线文件传输演示 | Node.js HTTP 服务、同一局域网跨设备上传与下载 |

## 重点成果：FinVideo / MediaHub

`finvideo-study/` 是本仓库内容最完整的课程成果。它以可复现构建的 `OHPG/FinVideo v0.3.3` 为基线，在理解原项目架构后完成了多项扩展：

- 课程移植信息展示、搜索页就地改词与清空、播放器偏好重置。
- 首页最近播放记录、视频帧截取并保存到系统图库。
- 手机、平板和 2in1 的响应式布局、栅格密度与交互适配。
- 续播码跨设备恢复、HarmonyOS 系统级应用接续与分布式文件清单。
- 独立的跨设备文件选择、发送、接收、刷新和另存能力。
- 基于 `canIUse` 的 SysCap 检查，以及能力不可用时的可见降级路径。

建议按下面的顺序阅读：

1. [`finvideo-study/README.md`](finvideo-study/README.md)：项目入口、构建方法和文档导航。
2. [`finvideo-study/REPORT.md`](finvideo-study/REPORT.md)：从启动、存储、API、页面到播放器和跨端功能的源码解析。
3. [`finvideo-study/FEATURES.md`](finvideo-study/FEATURES.md)：课程新增功能、涉及文件和提交对应关系。
4. [`finvideo-study/MULTI_DEVICE_DEPLOYMENT.md`](finvideo-study/MULTI_DEVICE_DEPLOYMENT.md)：一次开发、多端部署实现。
5. [`finvideo-study/FREE_FLOW.md`](finvideo-study/FREE_FLOW.md)：应用接续与自由流转实现。
6. [`finvideo-study/WIRELESS_FILE_TRANSFER.md`](finvideo-study/WIRELESS_FILE_TRANSFER.md)：跨设备无线文件流转说明。
7. [`finvideo-study/REMOTE_TEST.md`](finvideo-study/REMOTE_TEST.md)：公网 Jellyfin 课程测试入口与验证范围。

## 主工程：Stdio Sorter

主工程是一个使用 ArkTS 编写的 HarmonyOS Stage 模型应用。用户输入一组数字后，应用用手写归并排序生成升序或降序结果，并展示数量、最小值、最大值、总和与平均值。

主要特性：

- 页面入口：`entry/src/main/ets/pages/Index.ets`。
- 支持空格、逗号和换行分隔数字。
- 排序实现不调用内置 `sort`，便于演示算法过程。
- 支持升序/降序切换、示例输入和一键清空。
- 使用 HarmonyOS Stage 模型和 ArkUI 声明式界面。

## 环境与命令行工具

推荐使用 DevEco Studio 打开各 HarmonyOS 工程。命令行环境可检查：

```powershell
ohpm --version
hvigor --version
hdc -v
```

主工程构建：

```powershell
ohpm install
hvigor assembleHap --stacktrace
```

FinVideo 是独立的多模块工程，需要切换到其工程根目录：

```powershell
cd finvideo-study/FinVideo
ohpm install
hvigor assembleHap --stacktrace
```

## Advanced Stage App Study

`advanced-stage-app/AbilityStartMode/` 收录并分析了 OpenHarmony Stage 模型样例，覆盖：

- `AbilityStage` 与 `UIAbility` 的职责边界。
- `WindowStage` 创建、内容加载和销毁过程。
- standard、singleton、specified 等 Ability 启动模式。
- DevEco Studio 模拟器上的构建与运行验证。

详细内容见 [`advanced-stage-app/README.md`](advanced-stage-app/README.md) 和 [`advanced-stage-app/REPORT.md`](advanced-stage-app/REPORT.md)。

## Wireless File Transfer

`wireless-file-transfer/` 是一个独立的局域网文件传输演示。启动本地 Node.js 服务后，同一 Wi-Fi 下的手机、平板或电脑可通过浏览器上传、查看、下载和删除文件。

该示例与 FinVideo 内部基于 `distributedFilesDir` 的系统级文件流转不同：前者依赖局域网 HTTP，后者依赖 HarmonyOS 分布式文件能力。两种方案分别展示“通用网络传输”和“系统协同能力”的实现路径。

## 课程交付说明

- 仓库中的开源项目保留上游来源、版本与提交信息。
- 构建命令、运行验证、演示视频和新增功能说明均放在对应子目录。
- FinVideo 的基线能力与课程新增代码在文档中分开说明，避免把上游已有功能误写为本次新增。
- 仓库提供受限的公网 Jellyfin 课程测试账号和两段作业演示视频，便于教师不搭建服务端直接检查；具体入口见 `finvideo-study/REMOTE_TEST.md`。
- 真机相关能力（系统接续、分布式文件同步）需要满足同账号、同签名、网络与设备能力条件；模拟器构建成功不等同于双真机链路已经验证。
