export class CacheRef<T> {

  private readonly cache: T

  private cleared = false

  private needClear = false

  private ref: number = 0

  constructor(cache: T) {
    this.cache = cache
  }

  public acquire(): T | undefined {
    if (this.cleared) return undefined
    this.ref++
    return this.cache
  }

  public release(): void {
    if (this.ref <= 0) return
    this.ref--
    if (this.ref <=0 && this.needClear) {
      this.clear()
    }
  }

  public clear(): void {
    if (this.ref <= 0) {
      this.onClear(this.cache)
      this.cleared = true
      this.needClear = false
    } else {
      this.needClear = true
    }
  }

  public getSize(): number {
    return 0
  }

  protected onClear(cache: T) {

  }

}