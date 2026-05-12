import { ApiError } from "@ohpg/network";

export class RequiredError extends ApiError {
  constructor(message: string) {
    super(403, message)
  }

}