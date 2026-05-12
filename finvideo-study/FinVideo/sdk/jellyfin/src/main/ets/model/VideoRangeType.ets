/**
 * An enum representing types of video ranges.
 * @export
 * @enum {string}
 */
export enum VideoRangeType {
  Unknown = 'Unknown',
  Sdr = 'SDR',
  Hdr10 = 'HDR10',
  Hlg = 'HLG',
  Dovi = 'DOVI',
  DoviWithHdr10 = 'DOVIWithHDR10',
  DoviWithHlg = 'DOVIWithHLG',
  DoviWithSdr = 'DOVIWithSDR',
  Hdr10Plus = 'HDR10Plus'
}