import { Axios, AxiosRequestConfig, AxiosResponse, ParamsSerializerOptions } from "@ohos/axios"
import { rcp } from '@kit.RemoteCommunicationKit';
import { ClientInfo } from "../entity/ClientInfo";
import { DeviceInfo } from "../entity/DeviceInfo";
import { ServerInfo } from "../entity/ServerInfo";
import { ApiError } from "./ApiError";
import { ApiRequest } from "./ApiRequest";

/** The authorization header field name. */
export const HEADER_ACCEPT = 'application/json, application/octet-stream;q=0.9, */*;q=0.8';

export const JSON_TYPE = 'application/json'

export const FORM_TYPE = 'application/x-www-form-urlencoded'

/**
 * @Author peerless2012
 * @Email peerless2012@126.com
 * @DateTime 2024/10/15 20:48
 * @Version V1.0
 * @Description
 */
export abstract class ApiClient {

  public readonly clientInfo: ClientInfo;

  public readonly deviceInfo: DeviceInfo;

  private serverInfo?: ServerInfo

  private axios?: Axios

  private rcpSession?: rcp.Session

  constructor(clientInfo: ClientInfo, deviceInfo: DeviceInfo) {
    this.clientInfo = clientInfo
    this.deviceInfo = deviceInfo
  }

  /**
   * Update server address
   * @param address
   */
  public updateServer(serverInfo: ServerInfo) {
    this.serverInfo = serverInfo
    let basePath = serverInfo.address.endsWith('/')
      ? serverInfo.address.slice(0, -1)
      : serverInfo.address;
    this.axios = new Axios({
      baseURL: basePath,
      paramsSerializer: {
        serialize: this.paramsSerializer
      }
    })
    this.rcpSession?.close()
    this.rcpSession = rcp.createSession({
      baseAddress: basePath
    })
  }

  public getServer(): ServerInfo | undefined {
    return this.serverInfo
  }

  private paramsSerializer(params: Record<string, ESObject>, options?: ParamsSerializerOptions): string {
    const queryString = Object.keys(params)
      .map(key => {
        const value: ESObject = params[key];
        if (Array.isArray(value)) {
          let array = new Array<string>()
          value.forEach((v: ESObject) => {
            if (v !== undefined && v !== null) {
              array.push(`${encodeURIComponent(key)}=${encodeURIComponent(v)}`)
            }
          })
          return array.join('&')
        }
        if (value === undefined || value === null) {
          return ""
        }
        return `${encodeURIComponent(key)}=${encodeURIComponent(value)}`;
      })
      .filter(Boolean)
      .join('&');

    return queryString;
  }

  /**
   * Returns a valid authorization header string.
   */
  public abstract getAuthorization(): string

  protected getHeaders(request: ApiRequest): Record<string, string> {
    return {
      'Content-Type': JSON_TYPE,
      'Accept': HEADER_ACCEPT,
      'Authorization': this.getAuthorization(),
      'User-Agent': `${this.clientInfo.name}/${this.clientInfo.version} (HarmonyOS)`
    }
  }

  private async request<T>(request: ApiRequest, method: string): Promise<T> {
    if (this.axios == undefined) {
      throw new ApiError(403, "Server not set.") as Error
    }

    let config: AxiosRequestConfig = {
      url: request.path,
      baseURL: request.url,
      method: method,
      headers: this.getHeaders(request),
      params: request.parameters,
      data: request.data
    }
    return this.axios
      .request<T>(config)
      .then((response: AxiosResponse) => {
        if (response.status === 204) {
          return undefined as T
        } else if (response.status == 200) {
          return JSON.parse(response.data as string) as T
        } else {
          throw new ApiError(response.status, response.data) as Error
        }
      })
  }

  private async rcpRequest<T>(request: ApiRequest, method: string): Promise<T> {
    if (this.rcpSession == undefined) {
      throw new ApiError(403, "Server not set.") as Error
    }
    let rcpRequest: rcp.Request = new rcp.Request(
      request.path, method, this.getHeaders(request), request.data
    )
    return this.rcpSession
      .fetch(rcpRequest)
      .then((response: rcp.Response) => {
        if (response.statusCode === 204) {
          return undefined as T
        } else if (response.statusCode == 200) {
          return response.toJSON() as T
        } else {
          throw new ApiError(response.statusCode, response.toString() || "") as Error
        }
      })
  }

  public async post<T>(request: ApiRequest): Promise<T> {
    return this.request(request, "POST")
  }

  public async patch<T>(request: ApiRequest): Promise<T> {
    return this.rcpRequest(request, "PATCH")
  }

  public async put<T>(request: ApiRequest): Promise<T> {
    return this.rcpRequest(request, "PUT")
  }

  public async get<T>(request: ApiRequest): Promise<T> {
    return this.request(request, "GET")
  }

  public async delete<T>(request: ApiRequest): Promise<T> {
    return this.request(request, "DELETE")
  }

  public async createUrl(request: ApiRequest): Promise<string> {
    if (this.axios == undefined) {
      throw new ApiError(403, "Server not set.") as Error
    }
    let config: AxiosRequestConfig = {
      url: request.path,
      method: "GET",
      // headers: {
      //   'Content-Type': JSON_TYPE,
      //   'Accept': HEADER_ACCEPT,
      //   'Authorization': this.getAuthorization()
      // },
      params: request.parameters
    }
    return this.axios.getUri(config)
  }

  public release() {
    this.rcpSession?.close()
    this.rcpSession = undefined
  }

}