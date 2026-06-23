const SYSCAP_ABILITY_RUNTIME = 'SystemCapability.Ability.AbilityRuntime.Core'
const SYSCAP_FILE_IO = 'SystemCapability.FileManagement.File.FileIO'
const SYSCAP_USER_FILE_SERVICE = 'SystemCapability.FileManagement.UserFileService'
const SYSCAP_PASTEBOARD = 'SystemCapability.MiscServices.Pasteboard'
const SYSCAP_PHOTO_ACCESS_HELPER = 'SystemCapability.FileManagement.PhotoAccessHelper.Core'

export interface CapabilityStatus {
  name: string
  syscap: string
  supported: boolean
  fallback: string
}

export class DeviceCapability {
  public static supportsAppContinuation(): boolean {
    return DeviceCapability.canUse(SYSCAP_ABILITY_RUNTIME)
  }

  public static supportsDistributedFileTransfer(): boolean {
    return DeviceCapability.supportsFileIo() && DeviceCapability.supportsFilePicker()
  }

  public static supportsFileIo(): boolean {
    return DeviceCapability.canUse(SYSCAP_FILE_IO)
  }

  public static supportsFilePicker(): boolean {
    return DeviceCapability.canUse(SYSCAP_USER_FILE_SERVICE)
  }

  public static supportsPasteboard(): boolean {
    return DeviceCapability.canUse(SYSCAP_PASTEBOARD)
  }

  public static supportsPhotoAccess(): boolean {
    return DeviceCapability.canUse(SYSCAP_PHOTO_ACCESS_HELPER)
  }

  public static transferCapabilityRows(): CapabilityStatus[] {
    return [
      {
        name: 'Distributed file storage',
        syscap: SYSCAP_FILE_IO,
        supported: DeviceCapability.supportsFileIo(),
        fallback: 'Use continuation code only'
      },
      {
        name: 'System file picker',
        syscap: SYSCAP_USER_FILE_SERVICE,
        supported: DeviceCapability.supportsFilePicker(),
        fallback: 'Generate demo file'
      },
      {
        name: 'Pasteboard continuation code',
        syscap: SYSCAP_PASTEBOARD,
        supported: DeviceCapability.supportsPasteboard(),
        fallback: 'Paste code manually'
      },
      {
        name: 'Application continuation',
        syscap: SYSCAP_ABILITY_RUNTIME,
        supported: DeviceCapability.supportsAppContinuation(),
        fallback: 'Use continuation code'
      }
    ]
  }

  private static canUse(syscap: string): boolean {
    try {
      return canIUse(syscap)
    } catch (_) {
      return false
    }
  }
}
