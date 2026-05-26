# MediaHub HarmonyOS 应用上架准备说明

## 目标

本次改造目标是把课程仓库中的 FinVideo 学习版本整理成接近 HarmonyOS 应用市场上架要求的状态。代码侧已经补齐应用身份、隐私合规入口、开源许可说明、权限说明和可填写到应用市场后台的材料草稿。

需要注意：真正上架仍必须使用开发者本人的华为开发者账号、实名主体、正式签名证书和 AppGallery Connect 后台完成，仓库无法替代平台审核流程。

## 已完成改造

1. 应用身份改造
   - 应用名由 `FinVideo` 调整为 `MediaHub`，避免直接冒用上游项目对外品牌。
   - 包名由 `org.ohpg.fin.video` 调整为 `com.github.wz167838.mediahub`。
   - 版本号调整为 `1.0.0` / `10000`，作为课程改造后的首个可发布版本。
   - Vendor 由 `example` 调整为 `167838wz`。
   - 显式配置 `targetSdkVersion` 为 `5.0.3(15)`。

2. 图标资源改造
   - 替换 AppScope 图标、启动图标和分层图标前景/背景。
   - 新图标使用 `MediaHub` 自有标识，降低上架时的品牌和版权风险。

3. 应用内合规入口
   - 设置页新增隐私政策、用户协议、权限说明、开源许可入口。
   - 关于页移除上游 QQ 群、官网和备案号展示，改为展示当前应用、基础项目、版本、构建验证和 GPL-3.0 许可信息。
   - 启动隐私链接资源指向课程仓库中的隐私政策草稿，正式上架前应替换为开发者控制的 HTTPS 页面。
   - `module.json5` 中声明网络访问、相册写入和剪贴板读取权限，并补充中文用途说明资源。

4. 上架材料草稿
   - `store-assets/privacy-policy.md`：隐私政策草稿。
   - `store-assets/user-agreement.md`：用户协议草稿。
   - `store-assets/open-source-notices.md`：开源许可说明草稿。
   - `store-assets/app-listing.md`：应用市场后台填写文案和截图清单。

## 仍需开发者账号侧完成

1. 在华为开发者联盟完成实名开发者认证。
2. 在 AppGallery Connect 创建应用，填写应用名称、包名、平台、设备类型、分类、默认语言、隐私声明链接和分发国家/地区。
3. 使用正式发布证书和签名配置生成 release 包；当前仓库不能代替开发者账号证书。
4. 上传 HAP/App Pack 后，补充应用图标、截图、简介、隐私政策 URL、软件著作权或其他按类目要求提交的材料。
5. 使用 AppGallery Connect 的测试、预检和审核流程排查崩溃、权限、隐私和兼容性问题。

## 上架风险清单

| 风险项 | 当前处理 | 正式上架前建议 |
| --- | --- | --- |
| 上游品牌占用 | 已改名为 `MediaHub` | 确认名称和图标没有侵犯第三方商标 |
| GPL-3.0 许可证 | 应用内和文档均提示 GPL-3.0 | 应用详情页提供源码链接和许可证文本 |
| 隐私政策 URL | 资源指向课程仓库 Markdown 页面 | 换成开发者自有 HTTPS 页面 |
| 媒体内容合规 | 应用不内置公共内容源 | 商店简介说明用户自有服务器，不提供影视资源 |
| 正式签名 | 仓库仅保留构建配置 | 使用 AppGallery Connect 证书和发布配置 |
| 依赖许可 | 已列出主要依赖风险 | 发布前再核对所有 OHPM/本地依赖许可证 |
| 旧代码告警 | 构建通过但仍有上游弃用 API 和异常处理提示 | 真正商业上架前建议继续清理到更低告警水平 |

## 构建验证

在 `finvideo-study/FinVideo` 目录执行：

```powershell
hvigor assembleHap --stacktrace
```

用于正式提交的发布包应使用发布证书和 `publish` 产品配置构建。若开发者账号尚未配置发布签名，可先使用默认调试构建验证代码正确性，再在 DevEco Studio 或 CI 中补齐正式签名。

## 官方资料入口

- AppGallery Connect 应用发布服务：https://developer.huawei.com/consumer/cn/solution/agconnect/release/
- 华为开发者服务协议：https://developer.huawei.com/consumer/cn/devservice/ServiceAgreement/
