# FinVideo 远程测试说明

## 测试地址

- Jellyfin 服务地址：`http://154.51.40.24:8096`
- Web 测试页面：`http://154.51.40.24:8096/web/index.html`
- 用户名：`finvideo-demo`
- 密码：`FinVideoDemo2026`
- App 内别名：`VPS Demo`

## App 登录方法

在 FinVideo / MediaHub 登录页依次填写：

1. 服务器地址：`http://154.51.40.24:8096`
2. 用户名：`finvideo-demo`
3. 密码：`FinVideoDemo2026`
4. 别名：`VPS Demo`

点击“登录”后，可看到以下两个媒体条目：

- `FinVideo-Before`：对应 `demo/改前版本.mp4`
- `FinVideo-After`：对应 `demo/改后版本.mp4`

## 验证状态

2026-06-23 已完成以下公网验证：

- Jellyfin 版本：`10.11.8`
- 启动向导已完成
- 测试账号可从公网登录
- 测试账号不是管理员
- 媒体库包含两个演示视频
- 视频 Range 请求返回 HTTP `206`，可正常读取视频流

## 安全范围

这是公开的课程演示账号，只包含本课程的两个演示视频。该密码仅用于
这台测试服务器，不用于任何其他账号或服务。管理员凭据未写入仓库。
