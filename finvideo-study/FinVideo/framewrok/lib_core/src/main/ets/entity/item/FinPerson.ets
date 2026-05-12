import { FinImage } from "./FinImage"
import { FinPersonType } from "./FinPersonType"

export interface FinPerson {

  id: string

  name: string

  role?: string

  image?: FinImage

  type?: FinPersonType
}