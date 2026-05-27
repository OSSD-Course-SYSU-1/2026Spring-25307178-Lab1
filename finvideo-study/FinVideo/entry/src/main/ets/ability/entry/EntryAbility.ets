import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { AppEventHub, AppEvents, BreakpointSystem } from '@ohpg/fin-core';
import { AvoidAreaSystem } from '@ohpg/fin-core';
import { DeviceUtil } from '@ohpg/fin-framework';
import { ContinuationStateStore } from '../../continuation/ContinuationStateStore';

export default class EntryAbility extends UIAbility {

  private breakpointSystem: BreakpointSystem = new BreakpointSystem();

  private avoidAreaSystem: AvoidAreaSystem = new AvoidAreaSystem();

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    this.saveContinuationWant(want);
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');
    let window = windowStage.getMainWindowSync()
    DeviceUtil.initWindow(window)
    window.setImmersiveModeEnabledState(true)
    this.activateContinuation();
    this.avoidAreaSystem.register(windowStage.getMainWindowSync())
    windowStage.loadContent('pages/splash/SplashPage', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      this.breakpointSystem.register(window);
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content.');
    });
  }

  onWindowStageWillDestroy(windowStage: window.WindowStage): void {
    DeviceUtil.initWindow(undefined)
    this.avoidAreaSystem.unregister()
    this.breakpointSystem.unregister()
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }

  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onNewWant');
    if (this.saveContinuationWant(want)) {
      AppEventHub.emit(AppEvents.EVENT_CONTINUATION_RECEIVED);
    }
  }

  onContinue(wantParam: Record<string, Object>): AbilityConstant.OnContinueResult {
    if (ContinuationStateStore.writeCurrentSessionToWant(wantParam)) {
      hilog.info(0x0000, 'testTag', '%{public}s', 'Ability continuation accepted');
      return AbilityConstant.OnContinueResult.AGREE;
    }
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability continuation rejected: no player session');
    return AbilityConstant.OnContinueResult.REJECT;
  }

  private saveContinuationWant(want: Want): boolean {
    return ContinuationStateStore.savePendingFromWant(want);
  }

  private activateContinuation(): void {
    this.context.setMissionContinueState(AbilityConstant.ContinueState.ACTIVE).then(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'Mission continuation activated');
    }).catch((error: Error) => {
      hilog.warn(0x0000, 'testTag', 'Mission continuation activation failed: %{public}s', error.message);
    });
  }
}
