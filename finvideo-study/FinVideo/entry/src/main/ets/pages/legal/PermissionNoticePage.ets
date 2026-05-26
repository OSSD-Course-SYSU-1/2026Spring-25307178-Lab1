import { window } from '@kit.ArkUI'
import { CommonConstants, ToolBar } from '@ohpg/fin-framework'

@Entry
@Component
struct PermissionNoticePage {

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
        title: '权限说明'
      })

      Scroll() {
        Column({ space: CommonConstants.SPACE_16 }) {
          this.section('网络访问', '用于连接用户主动填写的 Jellyfin / Emby 服务器，完成登录、媒体库浏览、海报加载和视频播放。')
          this.section('图片与视频写入', '用于用户主动点击截图保存按钮后，将当前视频截图保存到系统相册。应用不会在后台写入或上传相册内容。')
          this.section('剪贴板', '用于复制和粘贴跨设备续播码，方便把当前播放位置转移到另一台设备。读取动作由用户点击粘贴按钮触发。')
          this.section('本地存储', '用于保存服务器配置、播放偏好、收藏和最近播放信息，让应用下次启动时恢复状态。')
          this.section('权限最小化', '当前版本未接入广告、统计、位置、通讯录、短信、通话、麦克风或摄像头能力。后续新增敏感能力时，应先更新隐私政策和上架权限说明。')
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
