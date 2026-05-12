/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2024/11/20 21:03
 * @Version V1.0
 * @Description
 */
export class TimeTool {

  // 使用 toLocaleString 方法获取本地化的时间字符串
  public static options: Intl.DateTimeFormatOptions = {
    year: 'numeric',
    month: '2-digit',
    day: '2-digit',
    hour: '2-digit',
    minute: '2-digit',
    second: '2-digit',
    hour12: false, // 24小时制
  };

  static formatMillionSecondsToHMS(seconds: number): string {
    return TimeTool.formatSecondsToHMS(seconds / 1000)
  }

  static formatSecondsToHMS(seconds: number): string {
    if (seconds < 0) {
      return "--:--"
    }
    const hours = Math.floor(seconds / 3600);
    const minutes = Math.floor((seconds % 3600) / 60);
    const remainingSeconds = Math.floor(seconds % 60);

    const formattedHours = String(hours).padStart(2, '0');
    const formattedMinutes = String(minutes).padStart(2, '0');
    const formattedSeconds = String(remainingSeconds).padStart(2, '0');

    return `${formattedHours}:${formattedMinutes}:${formattedSeconds}`;
  }

}