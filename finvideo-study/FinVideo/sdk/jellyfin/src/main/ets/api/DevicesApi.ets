import { Api } from "./Api"
import { DeviceOptions } from "../model/DeviceOptions"
import { DeviceOptionsDto } from "../model/DeviceOptionsDto"
import { DeviceInfoQueryResult } from "../model/DeviceInfoQueryResult"
import { DeviceInfos } from "../model/DeviceInfos"

/**
 * Request parameters for deleteDevice operation in DevicesApi.
 * @export
 * @interface DevicesApiDeleteDeviceRequest
 */
export interface DevicesApiDeleteDeviceRequest {
  /**
   * Device Id.
   * @type {string}
   * @memberof DevicesApiDeleteDevice
   */
  readonly id: string
}

/**
 * Request parameters for getDeviceInfo operation in DevicesApi.
 * @export
 * @interface DevicesApiGetDeviceInfoRequest
 */
export interface DevicesApiGetDeviceInfoRequest {
  /**
   * Device Id.
   * @type {string}
   * @memberof DevicesApiGetDeviceInfo
   */
  readonly id: string
}

/**
 * Request parameters for getDeviceOptions operation in DevicesApi.
 * @export
 * @interface DevicesApiGetDeviceOptionsRequest
 */
export interface DevicesApiGetDeviceOptionsRequest {
  /**
   * Device Id.
   * @type {string}
   * @memberof DevicesApiGetDeviceOptions
   */
  readonly id: string
}

/**
 * Request parameters for getDevices operation in DevicesApi.
 * @export
 * @interface DevicesApiGetDevicesRequest
 */
export interface DevicesApiGetDevicesRequest {
  /**
   * Gets or sets the user identifier.
   * @type {string}
   * @memberof DevicesApiGetDevices
   */
  readonly userId?: string
}

/**
 * Request parameters for updateDeviceOptions operation in DevicesApi.
 * @export
 * @interface DevicesApiUpdateDeviceOptionsRequest
 */
export interface DevicesApiUpdateDeviceOptionsRequest {
  /**
   * Device Id.
   * @type {string}
   * @memberof DevicesApiUpdateDeviceOptions
   */
  readonly id: string

  /**
   * Device Options.
   * @type {DeviceOptionsDto}
   * @memberof DevicesApiUpdateDeviceOptions
   */
  readonly deviceOptionsDto: DeviceOptionsDto
}

/**
 * DevicesApi - object-oriented interface
 * @export
 * @class DevicesApi
 * @extends {BaseAPI}
 */
export class DevicesApi extends Api {
  /**
   * deleteDevice
   * @summary Deletes a device.
   * @param {DevicesApiDeleteDeviceRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof DevicesApi
   */
  public async deleteDevice(requestParameters: DevicesApiDeleteDeviceRequest): Promise<void> {
    return this.apiClient.delete({path: "/Devices", parameters: requestParameters})
  }

  /**
   * getDeviceInfo
   * @summary Get info for a device.
   * @param {DevicesApiGetDeviceInfoRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof DevicesApi
   */
  public async getDeviceInfo(requestParameters: DevicesApiGetDeviceInfoRequest): Promise<DeviceInfos> {
    return this.apiClient.get({path: "/Devices/Info", parameters: requestParameters})
  }

  /**
   * getDeviceOptions
   * @summary Get options for a device.
   * @param {DevicesApiGetDeviceOptionsRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof DevicesApi
   */
  public async getDeviceOptions(requestParameters: DevicesApiGetDeviceOptionsRequest): Promise<DeviceOptions> {
    return this.apiClient.get({path: "/Devices/Options", parameters: requestParameters})
  }

  /**
   * getDevices
   * @summary Get Devices.
   * @param {DevicesApiGetDevicesRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof DevicesApi
   */
  public async getDevices(requestParameters: DevicesApiGetDevicesRequest = {}): Promise<DeviceInfoQueryResult> {
    return this.apiClient.get({path: "/Devices", parameters: requestParameters})
  }

  /**
   * updateDeviceOptions
   * @summary Update device options.
   * @param {DevicesApiUpdateDeviceOptionsRequest} requestParameters Request parameters.
   * @throws {RequiredError}
   * @memberof DevicesApi
   */
  public async updateDeviceOptions(requestParameters: DevicesApiUpdateDeviceOptionsRequest): Promise<void> {
    let params: Record<string, string> = {
      "id": requestParameters.id
    }
    return this.apiClient.post({path: "/Devices/Options", parameters: params, data: requestParameters.deviceOptionsDto})
  }
}