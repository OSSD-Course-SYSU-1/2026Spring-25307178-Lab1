import { window } from '@kit.ArkUI'
import { CommonConstants, ToolBar } from '@ohpg/fin-framework'

@Entry
@Component
struct PrivacyPolicyPage {

  @StorageProp("currentAvoidArea") avoidArea?: window.AvoidArea = undefined

  @Builder
  private section(title: string, body: string) {
    Column({ space: CommonConstants.SPACE_8 }) {
      Text(title)
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .fontColor($r('sys.color.ohos_id_color_text_primary'))
        .width(CommonConstants.FULL_PERCENT)

      Text(body)
        .fontSize(15)
        .lineHeight(22)
        .fontColor($r('sys.color.ohos_id_color_text_secondary'))
        .width(CommonConstants.FULL_PERCENT)
    }
    .width(CommonConstants.FULL_PERCENT)
    .alignItems(HorizontalAlign.Start)
  }

  build() {
    Column({ space: CommonConstants.SPACE_8 }) {
      ToolBar({
        title: '隐私政策'
      })

      Scroll() {
        Column({ space: CommonConstants.SPACE_16 }) {
          this.section('信息收集', 'MediaHub 不运营自有云端服务器，不主动收集身份信息、通讯录、定位、短信或通话记录。用户需要自行填写 Jellyfin / Emby 服务器地址和账号信息，应用仅用于连接用户指定的媒体服务器。')
          this.section('本地存储', '服务器地址、用户名、播放偏好、跨设备续播码和收藏等信息会保存在本机，用于下次启动时恢复使用状态。卸载应用后，本机应用数据会随系统机制清除。')
          this.section('网络访问', '应用会向用户填写的媒体服务器发起登录、媒体库读取、海报加载和视频播放请求。除用户主动填写的服务器外，应用不内置广告、统计或第三方追踪服务。')
          this.section('图片与相册', '用户点击截图保存按钮时，应用会把当前视频截图写入系统相册。该行为由用户主动触发，不会批量读取或上传相册内容。')
          this.section('剪贴板', '跨设备续播功能会提供续播码复制和粘贴入口，仅用于在用户设备之间转移播放进度，不会在后台读取剪贴板。')
          this.section('儿童与敏感内容', '应用本身不提供公共内容源，实际媒体内容来自用户自有服务器。请用户自行确保媒体来源和内容分级符合当地法律法规。')
          this.section('联系与更新', '本政策随应用功能变化更新。正式上架前，应将本政策发布到开发者控制的 HTTPS 页面，并在 AppGallery Connect 中填写对应隐私声明链接。')
        }
        .width(CommonConstants.FULL_PERCENT)
        .padding({
          left: CommonConstants.SPACE_16,
          right: CommonConstants.SPACE_16,
          bottom: px2vp(this.avoidArea?.bottomRect.height) + CommonConstants.SPACE_16
        })
      }
      .layoutWeight(1)
      .width(CommonConstants.FULL_PERCENT)
    }
    .width(CommonConstants.FULL_PERCENT)
    .height(CommonConstants.FULL_PERCENT)
  }
}
