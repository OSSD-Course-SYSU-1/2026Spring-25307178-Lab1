import { window } from "@kit.ArkUI";
import { Constants } from "../cons/Constants";
import { BusinessError, settings } from "@kit.BasicServicesKit";
import hilog from "@ohos.hilog";
import { audio } from "@kit.AudioKit";
const TAG = 'DeviceUtil';

/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2025/4/26 20:46
 * @Version V1.0
 * @Description
 */
export class DeviceUtil {

  private static readonly DEFAULT_BRIGHTNESS: number = -1;

  private static readonly MAX_BRIGHTNESS: number = 1;

  private static windowClass: window.Window | undefined = undefined;

  private static userBrightness?: number

  private static defaultBrightness?: number

  public static MAX_VOLUME = 15

  /**
   * init windowClass
   *
   * @param windowClass Window object
   */
  public static initWindow(windowClass?: window.Window) {
    DeviceUtil.windowClass = windowClass;
    DeviceUtil.MAX_VOLUME = DeviceUtil.getMaxVolume()
  }

  /**
   * Get current brightness
   * @param context
   * @returns
   */
  public static getBrightness(context: Context): number {
    let brightness = DeviceUtil.windowClass?.getWindowProperties().brightness
    if (brightness === undefined) {
      brightness = 0
    } else if (brightness < 0) {
      let value = settings.getValueSync(context
        , settings.display.SCREEN_BRIGHTNESS_STATUS
        , "25"
        , settings.domainName.DEVICE_SHARED)
      try {
        brightness = Number.parseInt(value) / 255
      } catch (error) {
      }
    }
    return brightness
  }

  /**
   * Set brightness
   */
  public static setBrightness(context: Context, brightness: number): void {
    try {
      // Save default brightness before change it
      if (DeviceUtil.defaultBrightness === undefined) {
        DeviceUtil.defaultBrightness = DeviceUtil.windowClass?.getWindowProperties().brightness
      }
      DeviceUtil.windowClass?.setWindowBrightness(brightness);
      DeviceUtil.userBrightness = brightness
    } catch (err) {
      DeviceUtil.defaultBrightness = undefined
      hilog.error(0x0000, TAG, `Failed Set brightness, errorCode: ${err.code}`);
    }
  }

  /**
   * Restore default brightness
   * @param context
   */
  public static restoreDefaultBrightness(context: Context): void {
    // not set before
    if (DeviceUtil.defaultBrightness === undefined) {
      return
    }
    try {
      DeviceUtil.windowClass?.setWindowBrightness(DeviceUtil.defaultBrightness);
    } catch (err) {
      hilog.error(0x0000, TAG, `Failed Set brightness, errorCode: ${err.code}`);
    }
  }

  /**
   * Restore user brightness
   * @param context
   */
  public static restoreUserBrightness(): void {
    // not set before
    if (DeviceUtil.userBrightness === undefined) {
      return
    }
    try {
      DeviceUtil.windowClass?.setWindowBrightness(DeviceUtil.userBrightness);
    } catch (err) {
      hilog.error(0x0000, TAG, `Failed Set brightness, errorCode: ${err.code}`);
    }
  }

  /**
   * Keep screen brightness
   *
   * @param isKeepOn true：keep；false:cancel keep
   */
  public static setWindowKeepScreenState(isKeepOn: boolean): void {
    try {
      DeviceUtil.windowClass?.setWindowKeepScreenOn(isKeepOn, (err: BusinessError) => {
        const errCode: number = err.code;
        if (errCode) {
          hilog.error(0x0000, TAG, `Failed set window keep screen state, errorCode: ${err.code}`);
          return;
        }
        hilog.info(0x0000, TAG, `Success set window keep screen state`);
      });
    } catch (err) {
      hilog.error(0x0000, TAG, `Failed set window keep screen state, errorCode: ${err.code}`);
    }
  }

  /**
   * Set the font color of the status bar
   *
   * @param name Page name
   * @param colorRes Font color of status bar
   */
  public static setStateBarContentColor(name: string, colorRes: string): void {
    if (name !== Constants.NAV_DESTINATION_ITEM_PAY_CODE) {
      return;
    }
    let sysBarPros: window.SystemBarProperties = {
      statusBarContentColor: colorRes
    }
    try {
      DeviceUtil.windowClass?.setWindowSystemBarProperties(sysBarPros).then(() => {
        hilog.info(0x0000, TAG, `Success set window systemBar content color`);
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, TAG, `Failed set window systemBar content color, errorCode:${err.code}`);
      })
    } catch (err) {
      hilog.error(0x0000, TAG, `Success set window systemBar content color, errorCode:${err.code}`);
    }
  }

  public static getVolume(): number {
    let audioManager = audio.getAudioManager();
    let audioVolumeManager = audioManager.getVolumeManager();
    let gm = audioVolumeManager.getVolumeGroupManagerSync(audio.DEFAULT_VOLUME_GROUP_ID)
    return gm.getVolumeSync(audio.AudioVolumeType.MEDIA)
  }

  private static getMaxVolume(): number {
    let audioManager = audio.getAudioManager();
    let audioVolumeManager = audioManager.getVolumeManager();
    let gm = audioVolumeManager.getVolumeGroupManagerSync(audio.DEFAULT_VOLUME_GROUP_ID)
    return gm.getMaxVolumeSync(audio.AudioVolumeType.MEDIA)
  }

}