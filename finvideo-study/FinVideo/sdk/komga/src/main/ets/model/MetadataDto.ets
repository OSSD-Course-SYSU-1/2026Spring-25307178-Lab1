import { Author } from "./Author"

export interface MetadataDto {
  title: string
  titleLock: boolean
  summary: string
  summaryLock: boolean
  number: string
  numberLock: boolean
  numberSort: number
  numberSortLock: boolean
  releaseDate: string
  releaseDateLock: boolean
  authors?: Array<Author>
  authorsLock: boolean
  tags: Array<string>
  tagsLock: boolean
  isbn: string
  isbnLock: boolean
  links: Array<string>
  linksLock: boolean
  created: string
  lastModified: string
}