import { MediaDto } from "./MediaDto"
import { MetadataDto } from "./MetadataDto"
import { ReadProgressDto } from "./ReadProgressDto"

export interface BookDto {
  id: string
  seriesId: string
  seriesTitle: string
  libraryId: string
  name: string
  url: string
  number: number
  created: string
  lastModified: string
  fileLastModified: string
  sizeBytes: number
  size: string
  media: MediaDto,
  metadata: MetadataDto,
  readProgress?: ReadProgressDto,
  deleted: boolean
  fileHash: string
  oneshot: boolean
}