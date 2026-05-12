import { window } from "@kit.ArkUI";

/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2024/11/13 20:41
 * @Version V1.0
 * @Description
 */
export class AvoidAreaSystem {

  public static readonly CURRENT_AVOID_AREA = "currentAvoidArea"

  public static readonly CURRENT_WINDOW = "currentWindow"

  private win?: window.Window

  private avoidArea: window.AvoidArea = {
    visible: true,
    leftRect: {
      left: 0, top: 0, width: 0, height: 0
    },
    rightRect: {
      left: 0, top: 0, width: 0, height: 0
    },
    topRect: {
      left: 0, top: 0, width: 0, height: 0
    },
    bottomRect: {
      left: 0, top: 0, width: 0, height: 0
    }
  }

  private avoidAreaMap = new Map<window.AvoidAreaType, window.AvoidArea>()

  private avoidAreaChangeCallback: Callback<window.AvoidAreaOptions> = (avoidAreaOptions) => {
    if (avoidAreaOptions.type === window.AvoidAreaType.TYPE_SYSTEM
      || avoidAreaOptions.type === window.AvoidAreaType.TYPE_CUTOUT
      || avoidAreaOptions.type === window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR) {
      this.avoidAreaMap.set(avoidAreaOptions.type, avoidAreaOptions.area)
      this.updateAvoidArea()
    }
  }

  public register(win: window.Window) {
    this.win = win
    AppStorage.setOrCreate(AvoidAreaSystem.CURRENT_WINDOW, win)
    let area = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM)
    this.avoidAreaMap.set(window.AvoidAreaType.TYPE_SYSTEM, area)
    let cutout = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_CUTOUT)
    this.avoidAreaMap.set(window.AvoidAreaType.TYPE_CUTOUT, cutout)
    let indicator = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR)
    this.avoidAreaMap.set(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR, indicator)
    this.updateAvoidArea()
    win.on("avoidAreaChange", this.avoidAreaChangeCallback)
  }
  private updateAvoidArea() {
    this.clearArea(this.avoidArea)
    this.avoidAreaMap.forEach((area, type) => {
      this.compareAreaRect(this.avoidArea.leftRect, area.leftRect)
      this.compareAreaRect(this.avoidArea.rightRect, area.rightRect)
      this.compareAreaRect(this.avoidArea.topRect, area.topRect)
      this.compareAreaRect(this.avoidArea.bottomRect, area.bottomRect)
    })
    AppStorage.setOrCreate(AvoidAreaSystem.CURRENT_AVOID_AREA, this.avoidArea)
  }

  private clearArea(area: window.AvoidArea) {
    area.visible = false
    this.clearAreaRect(area.leftRect)
    this.clearAreaRect(area.topRect)
    this.clearAreaRect(area.rightRect)
    this.clearAreaRect(area.bottomRect)
  }

  private clearAreaRect(rect: window.Rect) {
    rect.width = 0
    rect.height = 0
    rect.left = 0
    rect.top = 0
  }

  private compareAreaRect(left: window.Rect, right: window.Rect) {
    left.left = Math.min(left.left, right.left)
    left.top = Math.min(left.left, right.left)
    left.width = Math.max(left.width, right.width)
    left.height = Math.max(left.height, right.height)
  }

  unregister() {
    this.win?.off("avoidAreaChange", this.avoidAreaChangeCallback)
    this.win = undefined
  }

}