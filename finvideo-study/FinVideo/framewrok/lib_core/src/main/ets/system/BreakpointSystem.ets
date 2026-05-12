import { mediaquery, window } from '@kit.ArkUI';
import { WindowUtil } from './WindowUtil';

enum BreakpointTypeEnum {
  SM = 'sm',
  MD = 'md',
  LG = 'lg',
}

export interface BreakpointTypes<T> {
  sm: T;
  md: T;
  lg: T;
}

export class BreakpointType<T> {
  sm: T;
  md: T;
  lg: T;

  constructor(param: BreakpointTypes<T>) {
    this.sm = param.sm;
    this.md = param.md;
    this.lg = param.lg;
  }

  getValue(currentBreakpoint: string): T {
    if (currentBreakpoint === BreakpointTypeEnum.SM) {
      return this.sm;
    }
    if (currentBreakpoint === BreakpointTypeEnum.MD) {
      return this.md;
    }
    return this.lg;
  }
}

export class BreakpointSystem {

  public static readonly CURRENT_WIDTH_BREAKPOINT = "currentWidthBreakpoint"

  public static readonly CURRENT_HEIGHT_BREAKPOINT = "currentHeightBreakpoint"

  private window?: window.Window

  private windowSizeCallback: Callback<Size> = (size) => {
    this.updateCurrentBreakpoint()
  }

  constructor() {
    this.updateCurrentBreakpoint()
  }

  private updateCurrentBreakpoint() {
    AppStorage.setOrCreate(BreakpointSystem.CURRENT_WIDTH_BREAKPOINT
      , this.window ? this.window.getUIContext().getWindowWidthBreakpoint() : WidthBreakpoint.WIDTH_SM)
    AppStorage.setOrCreate(BreakpointSystem.CURRENT_HEIGHT_BREAKPOINT
      , this.window ? this.window.getUIContext().getWindowHeightBreakpoint() : HeightBreakpoint.HEIGHT_SM)
  }

  public register(window: window.Window) {
    this.window = window
    this.updateCurrentBreakpoint()
    window.on('windowSizeChange', this.windowSizeCallback)
  }

  public unregister() {
    this.window?.off('windowSizeChange', this.windowSizeCallback)
  }
}