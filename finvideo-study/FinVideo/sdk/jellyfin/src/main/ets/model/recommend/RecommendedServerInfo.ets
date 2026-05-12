import { PublicSystemInfo } from "../PublicSystemInfo"
import { RecommendedServerIssue } from "../recommend/Issue"
import { RecommendedServerInfoScore } from "./RecommendedServerInfoScore"

/** Information about a recommended server. */
export interface RecommendedServerInfo {
  address: string,
  responseTime: number,
  score: RecommendedServerInfoScore,
  issues: Array<RecommendedServerIssue>
  systemInfo?: PublicSystemInfo
}