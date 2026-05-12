import { Api } from "./Api";
import { LibraryDto } from "../model/LibraryDto";

export class LibraryApi extends Api {

  public async getLibraries(): Promise<Array<LibraryDto>> {
    return this.apiClient.get({
      path: "/api/v1/libraries"
    })
  }

}