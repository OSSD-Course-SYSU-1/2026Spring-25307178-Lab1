import { SortDto } from "./SortDto"

export interface PageDto {
  pageNumber: number
  pageSize: number
  sort: SortDto
  offset: number
  paged: boolean
  unpaged: boolean
}