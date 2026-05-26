import { window } from '@kit.ArkUI'
import { CommonConstants, ToolBar } from '@ohpg/fin-framework'

@Entry
@Component
struct UserAgreementPage {

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
        title: '用户协议'
      })

      Scroll() {
        Column({ space: CommonConstants.SPACE_16 }) {
          this.section('服务说明', 'MediaHub 是个人媒体服务器客户端，需要用户自行准备并维护合法可访问的 Jellyfin / Emby 服务器。应用不提供公共影视资源、下载资源站或内容分发服务。')
          this.section('账号与服务器', '用户应对自己填写的服务器地址、账号、密码、访问令牌和媒体内容来源负责。请勿使用未经授权的服务器或账号访问他人内容。')
          this.section('内容责任', '应用只负责展示用户服务器返回的媒体信息和播放地址。用户应确保媒体内容的版权、分级和传播方式符合法律法规及服务器所在地要求。')
          this.section('功能限制', '跨设备续播和视频截图等功能依赖系统能力、网络环境和媒体格式。部分受 DRM、编码格式或服务器权限限制的内容可能无法播放或截图。')
          this.section('开源声明', '本应用基于 FinVideo 开源项目改造，继续遵循 GPL-3.0 许可证。发行应用时应同时公开对应源代码、保留版权声明并提供许可证文本。')
          this.section('协议更新', '正式上架前，开发者应根据真实运营主体、联系方式和分发地区补充完整协议文本，并保持应用内与上架后台填写内容一致。')
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
