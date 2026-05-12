/**
 *
 * @export
 * @enum {string}
 */
export enum TranscodeReason {
  ContainerNotSupported = 'ContainerNotSupported',
  VideoCodecNotSupported = 'VideoCodecNotSupported',
  AudioCodecNotSupported = 'AudioCodecNotSupported',
  SubtitleCodecNotSupported = 'SubtitleCodecNotSupported',
  AudioIsExternal = 'AudioIsExternal',
  SecondaryAudioNotSupported = 'SecondaryAudioNotSupported',
  VideoProfileNotSupported = 'VideoProfileNotSupported',
  VideoLevelNotSupported = 'VideoLevelNotSupported',
  VideoResolutionNotSupported = 'VideoResolutionNotSupported',
  VideoBitDepthNotSupported = 'VideoBitDepthNotSupported',
  VideoFramerateNotSupported = 'VideoFramerateNotSupported',
  RefFramesNotSupported = 'RefFramesNotSupported',
  AnamorphicVideoNotSupported = 'AnamorphicVideoNotSupported',
  InterlacedVideoNotSupported = 'InterlacedVideoNotSupported',
  AudioChannelsNotSupported = 'AudioChannelsNotSupported',
  AudioProfileNotSupported = 'AudioProfileNotSupported',
  AudioSampleRateNotSupported = 'AudioSampleRateNotSupported',
  AudioBitDepthNotSupported = 'AudioBitDepthNotSupported',
  ContainerBitrateExceedsLimit = 'ContainerBitrateExceedsLimit',
  VideoBitrateNotSupported = 'VideoBitrateNotSupported',
  AudioBitrateNotSupported = 'AudioBitrateNotSupported',
  UnknownVideoStreamInfo = 'UnknownVideoStreamInfo',
  UnknownAudioStreamInfo = 'UnknownAudioStreamInfo',
  DirectPlayError = 'DirectPlayError',
  VideoRangeTypeNotSupported = 'VideoRangeTypeNotSupported'
}