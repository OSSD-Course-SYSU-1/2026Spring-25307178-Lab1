# Stdio Sorter

This repository contains a DevEco Studio HarmonyOS app written with ArkTS.

The app demonstrates a simple standard-input / standard-output style workflow:
users enter numbers, tap the sort button, and read the sorted output on screen.

## Features

- HarmonyOS Stage model project.
- ArkTS UI implemented in `entry/src/main/ets/pages/Index.ets`.
- Merge sort implementation without calling a built-in sort helper.
- Supports numbers separated by spaces, commas, or new lines.
- Sort direction can be toggled between ascending and descending output.
- Displays count, minimum, maximum, sum, and average for the parsed input.

## Command Line Tools

This machine has DevEco Studio command line tools configured:

```bash
ohpm --version
hvigor --version
hdc -v
```

## Build

Install project dependencies:

```bash
ohpm install
```

Build the HAP:

```bash
hvigor assembleHap
```

## Advanced Stage App Study

An additional OpenHarmony Stage model sample and report are included under
`advanced-stage-app/`. It analyzes the official `AbilityStartMode` project,
covering `AbilityStage`, `WindowStage`, multiple `UIAbility` launch modes, and
verification on a DevEco Studio HarmonyOS emulator.
