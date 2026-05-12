import { ApiError } from "@ohpg/network";
import { ApiClient } from "@ohpg/network";

/** Class representing the Jellyfin API. */
export class Api {

  readonly apiClient: ApiClient;

  constructor(
    apiClient: ApiClient
  ) {
    this.apiClient = apiClient
  }

  protected assertParam(param?: string | number | null) {
    if (param == undefined || param == null) {
      throw new ApiError(403, "Param error") as Error
    }
  }

}