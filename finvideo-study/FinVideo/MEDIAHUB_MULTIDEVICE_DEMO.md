# MediaHub Multi-Device Demo Checklist

## Current Implementation Baseline

- `entry/src/main/module.json5` targets `phone`, `tablet`, and `2in1`; `EntryAbility` is marked `continuable: true`.
- `EntryAbility` implements `onContinue()`, reads continuation data in `onCreate()` / `onNewWant()`, and activates mission continuation after the window is created.
- Playback continuation keeps only lightweight state: media id, name, type, position, duration, and timestamp. Large video files are never sent through `wantParam`.
- `ContinuationStateStore` rejects continuation payloads larger than 100 KB.
- The UI already includes responsive grid/list behavior, `GridRow/GridCol` toolbar layout, keyboard focus, hover states, and pinch density gestures.
- Settings includes two classroom demo entries: cross-device playback continuation and cross-device file transfer.

## SysCap And Fallback Checks

The implementation now centralizes capability checks in:

`entry/src/main/ets/capability/DeviceCapability.ets`

Checked capabilities:

- `SystemCapability.Ability.AbilityRuntime.Core` for app continuation.
- `SystemCapability.FileManagement.File.FileIO` for distributed file copy and manifest access.
- `SystemCapability.FileManagement.UserFileService` for document picker/save flows.
- `SystemCapability.MiscServices.Pasteboard` for continuation-code copy/paste.
- `SystemCapability.FileManagement.PhotoAccessHelper.Core` for saving player snapshots to Gallery.

Fallback behavior:

- If mission continuation is unavailable, the app keeps the manual continuation-code path.
- If pasteboard is unavailable, users paste the continuation code manually.
- If file picker/saver is unavailable, the file transfer page disables the direct path through toast guidance.
- If FileIO is unavailable, the file transfer page shows a fallback status instead of touching distributed files.
- If Gallery write is unavailable, player snapshot save exits before calling PhotoAccessHelper.

## Build Verification

Run from `finvideo-study/FinVideo`:

```powershell
ohpm install
hvigor assembleHap --stacktrace
```

Also run from the repository root:

```powershell
git diff --check
```

Expected result:

- HAP build succeeds.
- No whitespace errors.
- Existing SDK deprecation/compatibility warnings may remain; they are outside the multi-device demo path unless they mention the newly changed files.

## Simulator / Preview Checklist

- Phone preview: tabs at bottom, top search/title stack cleanly, media grids use smaller density.
- Tablet preview: wider grid columns, toolbar title/search share horizontal space, detail pages have room for two-column layout.
- 2in1 preview: pointer hover and keyboard focus are visible on media/episode cards.
- Pinch gesture on media lists changes density without layout overlap.
- File transfer page shows the device capability panel and refresh/demo-file controls.
- Continuation-code page accepts a pasted code and opens the player at the encoded position.

## Real Device Checklist

Requirements:

- Two HarmonyOS NEXT devices.
- Same Huawei account.
- Wi-Fi and Bluetooth enabled.
- Same package name and same signature installed on both devices.

App continuation:

1. Device A opens and plays a video.
2. Device A uses the system cross-device continuation entry.
3. Device B receives the app continuation.
4. Device B opens the player for the same media and seeks to the transferred position.
5. If the system continuation entry is unavailable, copy the continuation code on Device A and paste it on Device B.

File transfer:

1. Device A opens Settings > cross-device file transfer.
2. Device A chooses a file or generates the demo file.
3. Device B opens the same page and refreshes the receive list.
4. Device B saves the synchronized file to a local user-selected path.

## Review Report Correction Notes

The Claude review snapshot is stale for the current codebase. The current project already contains:

- `continuable: true`.
- `EntryAbility.onContinue()`.
- `setMissionContinueState(ACTIVE)`.
- `GridRow/GridCol`.
- Hover/focus states on media cards.
- `PinchGesture` density control.
- Distributed file directory transfer demo.

The remaining meaningful improvement area was not whether those features exist, but whether capability compatibility and classroom verification evidence are explicit. This update addresses that gap.
