export interface UserDto {

  id: string

  email: string

  roles: Array<string>

  sharedAllLibraries: boolean

  sharedLibrariesIds: Array<string>

  labelsAllow: Array<string>

  labelsExclude: Array<string>

}