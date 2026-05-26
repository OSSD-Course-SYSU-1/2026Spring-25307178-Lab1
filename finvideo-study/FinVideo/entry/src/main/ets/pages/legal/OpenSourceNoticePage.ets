import { window } from '@kit.ArkUI'
import { CommonConstants, ToolBar } from '@ohpg/fin-framework'

@Entry
@Component
struct OpenSourceNoticePage {

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
        title: '开源许可'
      })

      Scroll() {
        Column({ space: CommonConstants.SPACE_16 }) {
          this.section('基础项目', 'MediaHub 基于 OHPG/FinVideo v0.3.3 修改，课程仓库保留了原始源码、修改记录和构建验证信息。')
          this.section('许可证', 'FinVideo 及本改造版本遵循 GNU General Public License v3.0。发行本应用时，应向用户提供完整对应源代码、许可证文本和修改说明。')
          this.section('第三方组件', '项目中还包含 Jellyfin / Emby 访问模块、WLMedia 播放器支持和 HarmonyOS ArkUI 相关依赖。正式上架前应再次核对每个依赖的许可证、署名和再分发要求。')
          this.section('上游与修改', '本版本保留上游贡献说明，并新增了课程移植、播放修复、视频截图、大小屏适配、跨设备续播和上架合规入口等改动。')
          this.section('源码获取', '正式发布包应在应用详情或官网中提供源码仓库链接。当前课程版本源码位于 GitHub 课程组织仓的 finvideo-study 目录。')
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
