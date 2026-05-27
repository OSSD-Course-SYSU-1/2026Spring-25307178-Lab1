/**
 * Centralized responsive layout tokens for the "one development, multi-device deployment" demo.
 * The same ArkTS pages can therefore switch density and spacing for phone, tablet, and 2in1 windows.
 */
export class ResponsiveLayout {
  public static isCompact(widthBreakpoint: WidthBreakpoint): boolean {
    return widthBreakpoint <= WidthBreakpoint.WIDTH_SM
  }

  public static isMedium(widthBreakpoint: WidthBreakpoint): boolean {
    return widthBreakpoint === WidthBreakpoint.WIDTH_MD
  }

  public static isExpanded(widthBreakpoint: WidthBreakpoint): boolean {
    return widthBreakpoint > WidthBreakpoint.WIDTH_MD
  }

  public static pagePadding(widthBreakpoint: WidthBreakpoint): number {
    if (ResponsiveLayout.isCompact(widthBreakpoint)) {
      return 16
    }
    if (ResponsiveLayout.isMedium(widthBreakpoint)) {
      return 24
    }
    return 32
  }

  public static homeToolbarHeight(widthBreakpoint: WidthBreakpoint): number {
    return ResponsiveLayout.isCompact(widthBreakpoint) ? 104 : 64
  }

  public static posterCardWidth(widthBreakpoint: WidthBreakpoint): number {
    if (ResponsiveLayout.isCompact(widthBreakpoint)) {
      return 140
    }
    if (ResponsiveLayout.isMedium(widthBreakpoint)) {
      return 168
    }
    return 196
  }

  public static episodeCardWidth(widthBreakpoint: WidthBreakpoint): number {
    if (ResponsiveLayout.isCompact(widthBreakpoint)) {
      return 200
    }
    if (ResponsiveLayout.isMedium(widthBreakpoint)) {
      return 260
    }
    return 320
  }

  public static gridCardWidth(widthBreakpoint: WidthBreakpoint, gridScale: number = 1): number {
    let baseWidth = ResponsiveLayout.posterCardWidth(widthBreakpoint)
    let scaledWidth = Math.round(baseWidth * gridScale)
    return Math.max(120, Math.min(260, scaledWidth))
  }

  public static clampGridScale(scale: number): number {
    return Math.max(0.85, Math.min(1.35, scale))
  }

  public static detailMaxWidth(widthBreakpoint: WidthBreakpoint): string | number {
    if (ResponsiveLayout.isCompact(widthBreakpoint)) {
      return '100%'
    }
    if (ResponsiveLayout.isMedium(widthBreakpoint)) {
      return 760
    }
    return 1040
  }

  public static detailGap(widthBreakpoint: WidthBreakpoint): number {
    return ResponsiveLayout.isCompact(widthBreakpoint) ? 12 : 24
  }

  public static seasonLaneCount(widthBreakpoint: WidthBreakpoint): number {
    if (ResponsiveLayout.isCompact(widthBreakpoint)) {
      return 1
    }
    if (ResponsiveLayout.isMedium(widthBreakpoint)) {
      return 2
    }
    return 3
  }

  public static seasonCoverWidth(widthBreakpoint: WidthBreakpoint): number {
    return ResponsiveLayout.isCompact(widthBreakpoint) ? 160 : 200
  }

  public static seasonItemHeight(widthBreakpoint: WidthBreakpoint): number {
    return ResponsiveLayout.isCompact(widthBreakpoint) ? 100 : 126
  }
}
