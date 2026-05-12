import { util } from "@kit.ArkTS";

/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2025/9/28 11:54
 * @Version V1.0
 * @Description:
 */
export class LruCache<K, V> {

  private lruCache: util.LRUCache<K, V>;

  private curSize: number = 0;

  protected maxSize: number = 0;

  public constructor(maxSize: number = 128 * 1024 * 1024) {
    this.lruCache = new util.LRUCache(1024);
    this.maxSize = maxSize;
  }

  /**
   * 获取最大缓存大小
   * @returns
   */
  public getMaxSize(): number {
    return this.maxSize
  }

  /**
   * 获取当前缓存大小
   * @returns
   */
  public getCurrentSize(): number {
    return this.curSize
  }

  /**
   * 获取存储元素实际大小
   * @param key
   * @param value
   * @returns
   */
  protected sizeOf(key: K, value: V): number {
    return 1
  }

  /**
   * 元素被移除
   * @param evicted
   * @param key
   * @param value
   * @param newValue
   */
  protected entryRemoved(evicted: boolean, key: K, value: V, newValue?: V) {

  }

  /**
   * 动态调整最大容量
   * @param newMaxBytes
   */
  public updateMaxCapacity(newMaxBytes: number): void {
    this.maxSize = newMaxBytes;
    this.trimToSize(this.maxSize)
  }

  /**
   * 添加元素
   * @param key
   * @param pixelMap
   */
  public put(key: K, value: V): void {
    const size = this.sizeOf(key, value);
    this.lruCache.put(key, value);
    this.curSize += size;
    this.trimToSize(this.maxSize)
  }

  /**
   * 获取元素
   * @param key
   * @returns
   */
  public get(key: K): V | undefined {
    return this.lruCache.get(key);
  }

  /**
   * 删除元素
   * @param key
   */
  public remove(key: K): V | undefined {
    const value = this.lruCache.remove(key);
    if (value) {
      this.curSize -= this.sizeOf(key, value);
      this.entryRemoved(false, key, value, undefined)
    }
    return value
  }

  /**
   * 压缩缓存
   * @param size
   */
  public trimToSize(size: number) {
    if (this.curSize <= size) return
    let keys = this.lruCache.keys()
    for (const key of keys) {
      let value = this.lruCache.remove(key)
      if (value) {
        this.curSize -= this.sizeOf(key, value)
        this.entryRemoved(true, key, value, undefined)
      }
      if (this.curSize <= size) {
        break
      }
    }
  }

  /**
   * 清空缓存
   */
  public clear(): void {
    this.trimToSize(0)
    this.lruCache.clear()
    this.curSize = 0;
  }

}