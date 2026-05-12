/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2025/3/29 18:55
 * @Version V1.0
 * @Description EventHub
 */
export class EventHub {

  private eventForeverMap = new Map<string, Array<Function>>()

  private eventOnceMap = new Map<string, Array<Function>>()

  on(event: string, callback: Function): void {
    let funArr = this.eventForeverMap.get(event)
    if (!funArr) {
      funArr = new Array<Function>()
      this.eventForeverMap.set(event, funArr)
    }
    funArr.push(callback)
  }

  off(event: string, callback?: Function): void {
    if (callback) {
      let funArr = this.eventForeverMap.get(event)
      if (funArr) {
        let index = funArr.indexOf(callback)
        if (index >= 0) {
          funArr.splice(index, 1)
        }
      }
    } else {
      this.eventForeverMap.delete(event)
    }
  }

  once(event: string, callback: Function): void {
    let funArr = this.eventOnceMap.get(event)
    if (!funArr) {
      funArr = new Array<Function>()
      this.eventOnceMap.set(event, funArr)
    }
    funArr.push(callback)
  }

  emit(event: string, ...args: Object[]): void {
    let funArr = this.eventOnceMap.get(event)
    if (funArr) {
      funArr.forEach((value) => {
        value(...args)
      })
      funArr.splice(0)
    }

    funArr = this.eventForeverMap.get(event)
    if (funArr) {
      funArr.forEach((value) => {
        value(...args)
      })
    }
  }

}

export const AppEventHub = new EventHub()