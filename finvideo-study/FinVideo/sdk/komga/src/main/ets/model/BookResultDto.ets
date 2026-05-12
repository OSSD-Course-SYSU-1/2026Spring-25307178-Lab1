import { BookDto } from "./BookDto";
import { PageDto } from "./PageDto";
import { SortDto } from "./SortDto";

export interface BookResultDto {
  content: Array<BookDto>
  pageable: PageDto,
  last: false
  totalElements: number
  totalPages: number
  sort: SortDto
  number: number
  first: boolean
  numberOfElements: number
  size: number
  empty: boolean
}