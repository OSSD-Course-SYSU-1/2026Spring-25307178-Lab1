import { VpStepTypes } from "./VpStepTypes";

export interface VpStepInfo {
  'StepType'?: VpStepTypes,
  'StepTypeName'?: string;
  'HardwareContextName'?: string;
  'IsHardwareContext'?: boolean;
  'Name'?: string;
  'Short'?: string;
  'FfmpegName'?: string;
  'FfmpegDescription'?: string;
  'FfmpegOptions'?: string;
  'Param'?: string;
  'ParamShort'?: string;
}