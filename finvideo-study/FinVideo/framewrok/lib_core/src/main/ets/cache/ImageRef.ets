import { CacheRef } from "./CacheRef";

export class ImageRef extends CacheRef<PixelMap> {

  private readonly size: number

  constructor(cache: PixelMap) {
    super(cache)
    this.size = cache.getPixelBytesNumber()
  }

  public getSize(): number {
    return this.size
  }

  protected onClear(cache: PixelMap): void {
    cache.release()
  }

}