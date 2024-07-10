import 'package:d2_remote/d2_remote.dart';
import 'package:get/get.dart';
import 'package:mass_pro/data_run/screens/dashboard/dashboard_screen.widget.dart';
import 'package:mass_pro/main/usescases/login/login_screen.widget.dart';
import 'package:mass_pro/main/usescases/sync/sync_screen.widget.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:mass_pro/commons/constants.dart';
import 'package:mass_pro/commons/prefs/preference.dart';
import 'package:mass_pro/commons/prefs/preference_provider.dart';
import 'package:mass_pro/main/data/server/user_manager.dart';
import 'package:mass_pro/main/data/server/user_manager_impl.dart';

part 'splash_presenter.g.dart';

@riverpod
SplashPresenter splashPresenter(SplashPresenterRef ref) {
  return SplashPresenter(
      ref.read(preferencesInstanceProvider), ref.read(userManagerProvider));
}

class SplashPresenter {
  SplashPresenter(this.preferenceProvider, this.userManager);

  UserManager? userManager;

  final PreferenceProvider preferenceProvider;

  void init() {
    _isUserLoggedIn();
  }

  Future<void> _isUserLoggedIn() async {
    if (userManager != null) {
      Future.delayed(
          const Duration(
            milliseconds: 2000,
          ),
          () => userManager!
                  .isUserLoggedIn(
                      sharedPreferenceInstance:
                          PreferenceProvider.sharedPreferences())
                  .then((userLogged) {
                if (userLogged) {
                  _trackUserInfo();
                  goToNextScreen(
                      isUserLogged: userLogged,
                      sessionLocked:
                          preferenceProvider.getBoolean(SESSION_LOCKED, false),
                      initialSyncDone: preferenceProvider.getBoolean(
                          INITIAL_METADATA_SYNC_DONE, false),
                      initialDataSyncDone: preferenceProvider.getBoolean(
                          INITIAL_DATA_SYNC_DONE, false));
                } else {
                  goToNextScreen(
                      isUserLogged: false,
                      sessionLocked: false,
                      initialSyncDone: false,
                      initialDataSyncDone: false);
                }
              }));
    } else {
      goToNextScreen(
          isUserLogged: false,
          sessionLocked: false,
          initialSyncDone: false,
          initialDataSyncDone: false);
    }
  }

  void _trackUserInfo() {
    final username = preferenceProvider.getString(USER);
    final server = preferenceProvider.getString(SERVER);

    // crashReportController.trackServer(server);
    // crashReportController.trackUser(username, server);
  }

  Future getAccounts() async {
    final databaseName = await D2Remote.getDatabaseName();
    if (databaseName == null) {
      return 0;
    }
    return D2Remote.userModule.user.count();
  }

  void goToNextScreen(
      {required bool isUserLogged,
      required bool sessionLocked,
      required bool initialSyncDone,
      required bool initialDataSyncDone}) {
    if (isUserLogged && initialSyncDone && !sessionLocked) {
      Get.off(DashboardScreenWidget(launchDataSync: initialDataSyncDone));
    } else if (isUserLogged && !initialSyncDone) {
      Get.off(const SyncScreen());
    } else {
      getAccounts().then((count) {
        Get.off(LoginScreen(accountsCount: count));
      });
    }
  }
}
