import 'package:d2_remote/modules/auth/user/entities/user.entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../commons/prefs/preference.dart';
import '../../../commons/prefs/preference_provider.dart';
import '../../data/service/sync_status_controller.dart';
import '../../data/service/work_manager/work_manager_controller.dart';
import '../../data/service/work_manager/work_manager_controller_impl.dart';
import '../../data/service/work_manager/worker_item.dart';
import '../../data/service/work_manager/worker_type.dart';
import '../events_without_registration/event_initial/di/event_initial_module.dart';
import 'home_repository.dart';
import 'home_repository_impl.dart';
import 'main_view.dart';
part 'main_presenter.g.dart';

@Riverpod(keepAlive: true)
MainPresenter mainPresenter(MainPresenterRef ref, MainView view) {
  return MainPresenter(
      view,
      ref.read(homeRepositoryProvider),
      ref.read(preferencesInstanceProvider),
      ref.read(workManagerControllerProvider),
      ref.read(syncStatusControllerInstanceProvider));
}

class MainPresenter {
  MainPresenter(this.view, this.repository, this.preferences,
      this.workManagerController, this.syncStatusController) {
    _init();
  }

  final MainView view;
  final HomeRepository repository;
  final PreferenceProvider preferences;
  final WorkManagerController workManagerController;
  // final FilterManager filterManager;
  // final FilterRepository filterRepository;
  // final MatomoAnalyticsController matomoAnalyticsController;
  // final UserManager userManager;
  // final DeleteUserData deleteUserData;
  // final SyncIsPerformedInteractor syncIsPerformedInteractor;
  final SyncStatusController syncStatusController;

  Future<void> _init() async {
    preferences.removeValue(CURRENT_ORG_UNIT);
    repository.user().then((it) => view.renderUsername(it!.username!));
  }

  Future<String> getUserUid() async {
    try {
      return (await repository.user())!.id!;
    } catch (e) {
      return '';
    }
  }

  Future<bool> logOut() {
    return Future.wait([
      workManagerController.cancelAllWork(),
      // FilterManager.getInstance().clearAllFilters(),
      preferences.setValue(SESSION_LOCKED, false),
      preferences.setValue(PIN, null)
    ])
        .then((value) => repository.logOut())
        .then((value) async =>
            view.goToLogin(await repository.accountsCount(), isDeletion: false))
        .then((_) => true);
  }

  Future onDeleteAccount() async {
    view.showProgressDeleteNotification();
    try {
      workManagerController.cancelAllWork();
      // deleteUserData.wipeCacheAndPreferences(view.obtainFileView())
      // userManager.d2?.wipeModule()?.wipeEverything()
      // userManager.d2?.userModule()?.accountManager()?.deleteCurrentAccount()
      view.cancelNotifications();

      view.goToLogin(await repository.accountsCount(), isDeletion: true);
    } catch (exception) {
      print('Timber.e($exception)');
    }
  }

  void onSyncAllClick() {
    view.showGranularSync();
  }

  void blockSession() {
    workManagerController.cancelAllWork();
    view.back();
  }

  void showFilter() {
    view.showHideFilter();
  }

  void onMenuClick() {
    view.openDrawer(/* 'Gravity.START' */ 0);
  }

  String _username(User user) {
    return '${user.firstName} ${user.surname ?? ''}';
  }

  Future<bool> hasProgramWithAssignment() {
    return repository.hasProgramWithAssignment();
  }

  void onNavigateBackToHome() {
    view.goToHome();
    // initFilters();
  }

  void onClickSyncManager() {
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

  // LiveData<SyncStatusData> observeDataSync() {
  //     return syncStatusController.observeDownloadProcess();
  // }

  bool wasSyncAlreadyDone() {
    if (view.hasToNotSync()) {
      return true;
    }
    // TODO(NMCP): save and get if excuted
    return true;
    // return syncIsPerformedInteractor.execute()
  }

  Future onDataSuccess() async {
    // TODO(NMCP): implement
    // userManager.d2.dataStoreModule().localDataStore().value(WAS_INITIAL_SYNC_DONE)
    //     .blockingSet(TRUE)
  }

  void trackHomeAnalytics() {
    // matomoAnalyticsController.trackEvent(HOME, OPEN_ANALYTICS, CLICK)
  }

  void trackPinDialog() {
    // matomoAnalyticsController.trackEvent(HOME, BLOCK_SESSION_PIN, CLICK)
  }

  void trackQRScanner() {
    // matomoAnalyticsController.trackEvent(HOME, QR_SCANNER, CLICK)
  }

  void trackJiraReport() {
    // matomoAnalyticsController.trackEvent(HOME, JIRA_REPORT, CLICK)
  }
}
