import { FinItem } from "@ohpg/fin-core"
import { MediaRouter } from "../../pages/common/MediaRouter"
import { CommonConstants } from "../../pages/common/CommonConstants"

@Reusable
@Component
export struct MediaItem {

  @Require @State item?: FinItem = undefined

  @Prop itemWidth: string | number = CommonConstants.FULL_PERCENT

  @State private hovered: boolean = false

  @State private focused: boolean = false

  aboutToReuse(params: Record<string, object>): void {
    this.item = params['item'] as FinItem
    this.hovered = false
    this.focused = false
  }

  private cardScale(): number {
    return (this.hovered || this.focused) ? 1.03 : 1
  }

  build() {
    Column({space: CommonConstants.SPACE_8}) {
      Image(this.item?.image?.primary)
        .alt($r('app.media.alt'))
        .objectFit(ImageFit.Cover)
        .autoResize(true)
        .width(CommonConstants.FULL_PERCENT)
        .borderRadius($r('app.float.lg_border_radius'))
        .aspectRatio(0.67)

      Text(this.item?.name)
        .maxLines(1)
        .width(CommonConstants.FULL_PERCENT)
    }
    .width(this.itemWidth)
    .scale({ x: this.cardScale(), y: this.cardScale() })
    .animation({ duration: 120, curve: Curve.EaseOut })
    .focusable(true)
    .onHover((isHover: boolean) => {
      this.hovered = isHover
    })
    .onFocus(() => {
      this.focused = true
    })
    .onBlur(() => {
      this.focused = false
    })
    .onClick(() => {
      MediaRouter.openDetail(this.item!)
    })
  }

  aboutToRecycle(): void {

  }
}
