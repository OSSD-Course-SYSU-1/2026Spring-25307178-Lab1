# FinVideo Study

This directory contains a course-study copy of `OHPG/FinVideo`.

## Source

- Upstream repository: https://github.com/OHPG/FinVideo
- Selected version: `v0.3.3`
- Upstream commit: `d76959b8d25627d864cf854cbabcfd730c8852a2`

## Why This Version

The upstream `master` branch currently references `@ohpg/player@0.6.3`, which
is not available from the public OHPM registry during local verification. The
public `v0.3.3` source installs dependencies successfully and builds on this
machine, so it is used as the reproducible study baseline.

## Local Build

The copied project includes empty, non-secret `build-properties.json5` files so
DevEco/Hvigor can generate an unsigned debug HAP locally.

```powershell
cd finvideo-study/FinVideo
ohpm install
hvigor assembleHap --stacktrace
hdc install -r entry/build/default/outputs/default/entry-default-unsigned.hap
hdc shell aa start -b org.ohpg.fin.video -a EntryAbility
```

## Verification

On 2026-05-12, the project was built locally and installed on the HarmonyOS
emulator target `127.0.0.1:5555`. The bundle `org.ohpg.fin.video` launched
successfully.

## Course Deliverables

- Code analysis report: `REPORT.md`
- Added feature description: `FEATURES.md`
- Baseline emulator recording: `demo/改前版本.mp4`
- Enhanced emulator recording: `demo/改后版本.mp4`
