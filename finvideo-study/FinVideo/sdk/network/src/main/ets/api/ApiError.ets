import { BusinessError } from "@ohos.base";

export class ApiError<T = void> implements BusinessError<T> {

  readonly name: string = "ApiError";

  readonly code: number;

  readonly message: string;

  readonly data?: T;

  readonly stack?: string | undefined;

  constructor(code: number, message: string, data?: T, stack?: string) {
    this.code = code
    this.message = message
    this.data = data
    this.stack = stack
  }
}