import 'package:flutter/foundation.dart';
import 'package:mass_pro/commons/logging/logging.dart';
import 'package:mass_pro/commons/prefs/preference.dart';
import 'package:mass_pro/commons/prefs/preference_provider.dart';
import 'package:mass_pro/data_run/screens/home_screen/home_repository.dart';
import 'package:mass_pro/data_run/screens/home_screen/home_repository_impl.dart';
import 'package:mass_pro/data_run/screens/home_screen/home_screen_view.dart';
import 'package:mass_pro/main/data/service/sync_status_controller.dart';
import 'package:mass_pro/main/data/service/work_manager/work_manager_controller.dart';
import 'package:mass_pro/main/data/service/work_manager/work_manager_controller_impl.dart';
import 'package:mass_pro/main/data/service/work_manager/worker_item.dart';
import 'package:mass_pro/main/data/service/work_manager/worker_type.dart';
import 'package:mass_pro/main/usescases/login/sync_is_performed_interactor.dart';
import 'package:mass_pro/main/usescases/sync/sync_screen_presenter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_presenter.g.dart';

@Riverpod(keepAlive: true)
HomePresenter homePresenter(
    HomePresenterRef ref, HomeScreenView view) {
  return HomePresenter(
      view,
      ref.read(homeRepositoryProvider),
      ref.read(preferencesInstanceProvider),
      ref.read(workManagerControllerProvider),
      ref.read(syncStatusControllerInstanceProvider),
      ref.read(syncIsPerformedInteractorProvider));
}

class HomePresenter {
  HomePresenter(
      this.view,
      this.repository,
      this.preferencesProvider,
      this.workManagerController,
      this.syncStatusController,
      this.syncIsPerformedInteractor);

  final HomeScreenView view;
  final HomeRepository repository;
  final PreferenceProvider preferencesProvider;
  final WorkManagerController workManagerController;

  // final FilterManager filterManager;
  // final FilterRepository filterRepository;
  // final MatomoAnalyticsController matomoAnalyticsController;
  // final UserManager userManager;
  // final DeleteUserData deleteUserData;
  final SyncIsPerformedInteractor syncIsPerformedInteractor;

  final SyncStatusController syncStatusController;

  Future<String> getUserUid() async {
    try {
      return (await repository.user())!.uid!;
    } catch (e) {
      return '';
    }
  }

  Future<bool> logOut() {
    return Future.wait([
      workManagerController.cancelAllWork(),
      // FilterManager.getInstance().clearAllFilters(),
      preferencesProvider.setValue(SESSION_LOCKED, false),
      preferencesProvider.setValue(PIN, null)
    ])
        .then((value) => repository.logOut())
        .then((value) async =>
            view.goToLogin(await repository.accountsCount(), isDeletion: false))
        .then((_) => true);
  }

  Future<dynamic> onDeleteAccount() async {
    // view.showProgressDeleteNotification();
    try {
      workManagerController.cancelAllWork();
      // deleteUserData.wipeCacheAndPreferences(view.obtainFileView())
      // userManager.d2?.wipeModule()?.wipeEverything()
      // userManager.d2?.userModule()?.accountManager()?.deleteCurrentAccount()
      // view.cancelNotifications();

      view.goToLogin(await repository.accountsCount(), isDeletion: true);
    } catch (exception) {
      logError(info: 'Timber.e($exception)');
    }
  }

  void blockSession() {
    workManagerController.cancelAllWork();
    view.back();
  }

  // String _username(DUser user) {
  //   return '${user.firstName} ${user.surname ?? ''}';
  // }

  Future<void> onClickSyncManager() async {
    await preferencesProvider.setValue(WAS_INITIAL_SYNC_DONE, false);
    // matomoAnalyticsController.trackEvent(HOME, SETTINGS, CLICK)
  }

  void setOpeningFilterToNone() {
    // filterRepository.collapseAllFilters();
  }

  Future<void> launchInitialDataSync() async {
    await workManagerController.syncDataForWorker(DATA_NOW, INITIAL_SYNC);
    //           required String workerName,
    // required WorkerType workerType,
    // double? delayInSeconds,
    // Map<String, dynamic>? data,
    // Duration initialDelay = Duration.zero,
    final workerItem = WorkerItem(
      workerName: RESERVED,
      workerType: WorkerType.RESERVED,
    );
    await workManagerController.cancelAllWorkByTag(workerItem.workerName);
    await workManagerController.syncDataForWorkerItem(workerItem);
  }

  Future<bool> wasSyncAlreadyDone() async {
    if (view.hasToNotSync()) {
      return true;
    }
    return syncIsPerformedInteractor();
  }

  Future<bool> onDataSuccess() async {
    return preferencesProvider.setValue(WAS_INITIAL_SYNC_DONE, true);
    // userManager.d2.dataStoreModule().localDataStore().value(WAS_INITIAL_SYNC_DONE)
    //     .blockingSet(TRUE)
  }
}
