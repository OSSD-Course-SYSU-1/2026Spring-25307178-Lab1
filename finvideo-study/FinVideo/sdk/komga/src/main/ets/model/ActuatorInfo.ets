import { BuildInfo } from "./BuildInfo";
import { GitInfo } from "./GitInfo";
import { OsInfo } from "./OsInfo";

export interface ActuatorInfo {
  git: GitInfo

  os: OsInfo

  build: BuildInfo

}