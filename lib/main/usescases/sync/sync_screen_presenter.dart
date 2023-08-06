import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../commons/prefs/preference.dart';
import '../../../commons/prefs/preference_provider.dart';
import '../../data/server/user_manager.dart';
import '../../data/server/user_manager_impl.dart';
import '../../data/service/work_manager/work_manager_controller.dart';
import '../../data/service/work_manager/work_manager_controller_impl.dart';
import '../events_without_registration/event_initial/di/event_initial_module.dart';
import 'sync_view.dart';

part 'sync_screen_presenter.g.dart';

const String WAS_INITIAL_SYNC_DONE = 'WasInitialSyncDone';

@riverpod
SyncScreenPresenter syncScreenPresenter(
    SyncScreenPresenterRef ref, SyncView view) {
  return SyncScreenPresenter(
      view,
      ref.read(userManagerProvider),
      ref.read(preferencesInstanceProvider),
      ref.read(workManagerControllerProvider));
}

class SyncScreenPresenter {
  SyncScreenPresenter(this.view, this.userManager, this.preferences,
      this.workManagerController);

  /*  {
    workManagerController.syncMetaDataForWorker(META_NOW, INITIAL_SYNC);
  } */

  final SyncView view;
  final UserManager? userManager;
  final WorkManagerController workManagerController;
  final PreferenceProvider preferences;

  void init() {
    workManagerController.syncMetaDataForWorker(META_NOW, INITIAL_SYNC);
  }

  /// Replaced by syncSucceedProvider & syncFailedProvider
  /// defined in SyncScreen Widget
  // LiveData<List<WorkInfo>> observeSyncProcess() {
  //       return workManagerController.getWorkInfosForUniqueWorkLiveData(Constants.INITIAL_SYNC);
  //   }

  /// Replaced by syncSucceedProvider & syncFailedProvider
  /// defined in SyncScreen Widget
  // void handleSyncInfo(WorkInfo progressInfo) {
  //   // workInfoList.forEach { workInfo ->
  //   //     if (workInfo.tags.contains(Constants.META_NOW)) {
  //   handleMetaState(
  //       progressInfo.progress, progressInfo.state, progressInfo.message);
  //   //     }
  //   // }
  // }

  /// Replaced by syncSucceedProvider & syncFailedProvider
  /// defined in SyncScreen Widget
  // void handleMetaState(int progress, WorkInfoState state, String message) {
  //   when(state, {
  //     WorkInfoState.RUNNING: () => view.setMetadataSyncStarted(progress),
  //     WorkInfoState.SUCCEEDED: () => view.setMetadataSyncSucceed(),
  //     WorkInfoState.FAILED: () => view.showMetadataFailedMessage(message),
  //   });
  // }

  Future<void> onMetadataSyncSuccess() async {
    await preferences.setValue(INITIAL_METADATA_SYNC_DONE, true);
    // userManager?.let { userManager ->
    //     disposable.add(
    //         userManager.theme.doOnSuccess { flagAndTheme ->
    //             preferences.setValue(Preference.FLAG, flagAndTheme.first)
    //             preferences.setValue(Preference.THEME, flagAndTheme.second)
    //         }
    //             .subscribeOn(schedulerProvider.io())
    //             .observeOn(schedulerProvider.ui())
    //             .subscribe(
    //                 { (first, second) ->
    //                     view.setFlag(first)
    //                     view.setServerTheme(second)
    view.goToMain();
    //             },
    //             { t: Throwable? ->
    //                 Timber.e(t)
    //             }
    //         )
    // )
  }

  Future<void> onLogout() async {
    await userManager?.logOut();
    // userManager?.let { userManager ->
    //     disposable.add(
    //         userManager.logout()
    //             .subscribeOn(schedulerProvider.io())
    //             .observeOn(schedulerProvider.ui())
    //             .subscribe(
    //                 {
    view.goToLogin();
    //                   }
    //             ) { t: Throwable? ->
    //                 Timber.e(t)
    //             }
    //     )
    // }
  }
}
