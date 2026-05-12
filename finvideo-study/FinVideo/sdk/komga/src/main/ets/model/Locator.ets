import { Locations } from "./Locations"
import { LocatorText } from "./LocatorText"

export interface Locator {
  href: string
  koboSpan?: string
  locations: Locations
  text?: LocatorText
  title?: string
  type: string
}