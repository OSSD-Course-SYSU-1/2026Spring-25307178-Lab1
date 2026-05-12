import { CodecProfile } from "./CodecProfile";
import { ContainerProfile } from "./ContainerProfile";
import { DirectPlayProfile } from "./DirectPlayProfile";
import { SubtitleProfile } from "./SubtitleProfile";
import { TranscodingProfile } from "./TranscodingProfile";

/**
 * A MediaBrowser.Model.Dlna.DeviceProfile represents a set of metadata which determines which content a certain device is able to play.  <br />  Specifically, it defines the supported <see cref=\"P:MediaBrowser.Model.Dlna.DeviceProfile.ContainerProfiles\">containers</see> and  <see cref=\"P:MediaBrowser.Model.Dlna.DeviceProfile.CodecProfiles\">codecs</see> (video and/or audio, including codec profiles and levels)  the device is able to direct play (without transcoding or remuxing),  as well as which <see cref=\"P:MediaBrowser.Model.Dlna.DeviceProfile.TranscodingProfiles\">containers/codecs to transcode to</see> in case it isn\'t.
 * @export
 * @interface DeviceProfile
 */
export interface DeviceProfile {
  /**
   * Gets or sets the name of this device profile.
   * @type {string}
   * @memberof DeviceProfile
   */
  'Name'?: string | null;
  /**
   * Gets or sets the Id.
   * @type {string}
   * @memberof DeviceProfile
   */
  'Id'?: string | null;
  /**
   * Gets or sets the maximum allowed bitrate for all streamed content.
   * @type {number}
   * @memberof DeviceProfile
   */
  'MaxStreamingBitrate'?: number | null;
  /**
   * Gets or sets the maximum allowed bitrate for statically streamed content (= direct played files).
   * @type {number}
   * @memberof DeviceProfile
   */
  'MaxStaticBitrate'?: number | null;
  /**
   * Gets or sets the maximum allowed bitrate for transcoded music streams.
   * @type {number}
   * @memberof DeviceProfile
   */
  'MusicStreamingTranscodingBitrate'?: number | null;
  /**
   * Gets or sets the maximum allowed bitrate for statically streamed (= direct played) music files.
   * @type {number}
   * @memberof DeviceProfile
   */
  'MaxStaticMusicBitrate'?: number | null;
  /**
   * Gets or sets the direct play profiles.
   * @type {Array<DirectPlayProfile>}
   * @memberof DeviceProfile
   */
  'DirectPlayProfiles'?: Array<DirectPlayProfile>;
  /**
   * Gets or sets the transcoding profiles.
   * @type {Array<TranscodingProfile>}
   * @memberof DeviceProfile
   */
  'TranscodingProfiles'?: Array<TranscodingProfile>;
  /**
   * Gets or sets the container profiles.
   * @type {Array<ContainerProfile>}
   * @memberof DeviceProfile
   */
  'ContainerProfiles'?: Array<ContainerProfile>;
  /**
   * Gets or sets the codec profiles.
   * @type {Array<CodecProfile>}
   * @memberof DeviceProfile
   */
  'CodecProfiles'?: Array<CodecProfile>;
  /**
   * Gets or sets the subtitle profiles.
   * @type {Array<SubtitleProfile>}
   * @memberof DeviceProfile
   */
  'SubtitleProfiles'?: Array<SubtitleProfile>;
}