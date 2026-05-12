/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2024/11/9 18:30
 * @Version V1.0
 * @Description Cipher
 */
export class Cipher {

  /**
   * string to buffer array
   * @param str
   * @returns
   */
  public static stringToUint8Array(str: string): Uint8Array {
    let arr: number[] = [];
    for (let i = 0, j = str.length; i < j; ++i) {
      arr.push(str.charCodeAt(i));
    }
    return new Uint8Array(arr);
  }

  /**
   * buffer array to string
   * @param array
   * @returns
   */
  public static uint8ArrayToString(array: Uint8Array): string {
    let arrayString = '';
    for (let i = 0; i < array.length; i++) {
      arrayString += String.fromCharCode(array[i]);
    }
    return arrayString;
  }

  /**
   * buffer array to hex string
   * @param array
   * @returns
   */
  public static uint8ArrayToHexString(array: Uint8Array): string {
    let str = ''
    for (let i = 0; i < array.length; i++) {
      let num = array[i] as number
      let hex = num.toString(16).toLowerCase()
      if (hex.length <= 1) {
        str += "0"
      }
      str += hex
    }
    return str
  }

}