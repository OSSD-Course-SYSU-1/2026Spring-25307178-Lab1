import { CacheRef } from "./CacheRef";
import { LruCache } from "./LruCache";

/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2025/9/28 11:13
 * @Version V1.0
 * @Description: 
 */
export class RefLruCache<K, V> extends LruCache<K, CacheRef<V>>{

  protected sizeOf(key: K, value: CacheRef<V>): number {
    return value.getSize()
  }

  protected entryRemoved(evicted: boolean, key: K, value: CacheRef<V>, newValue?: CacheRef<V> | undefined): void {
    if (evicted) {
      value.clear()
    }
  }

}