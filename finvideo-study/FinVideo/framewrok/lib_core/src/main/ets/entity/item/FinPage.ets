import { FinItem } from "./FinItem"

export interface FinPage {

  /**
   * 当前页
   */
  cur: number

  /**
   * 当前页数据
   */
  items: Array<FinItem>

  /**
   * 是否还有更多
   */
  more?: boolean

}