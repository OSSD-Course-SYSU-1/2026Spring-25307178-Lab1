import { Device } from "./Device";
import { Locator } from "./Locator";

export interface ProgressDto {

  device: Device

  locator: Locator

  modified: string
}