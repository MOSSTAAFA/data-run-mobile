// ignore_for_file: unused_local_variable

import 'package:d2_remote/d2_remote.dart';
import 'package:flutter/material.dart';
import 'package:datarun/commons/constants.dart';
import 'package:datarun/commons/prefs/preference.dart';
import 'package:datarun/commons/prefs/preference_provider.dart';
import 'package:datarun/data_run/screens/home_screen/home_screen.widget.dart';
import 'package:datarun/main/data/server/user_manager.dart';
import 'package:datarun/main/data/server/user_manager_impl.dart';
import 'package:datarun/main/usescases/login/login_screen.widget.dart';
import 'package:datarun/main/usescases/sync/sync_screen.widget.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/navigator_key.dart';

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
                          preferenceProvider.getBool(SESSION_LOCKED, false),
                      initialSyncDone: preferenceProvider.getBool(
                          INITIAL_METADATA_SYNC_DONE, false),
                      initialDataSyncDone: preferenceProvider.getBool(
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
      Navigator.pushReplacement(
        navigatorKey.currentContext!,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
      // Get.offNamed(HomeScreenWidget.route);
    } else if (isUserLogged && !initialSyncDone) {
      // Get.off(const SyncScreen());
      Navigator.pushReplacement(
        navigatorKey.currentContext!,
        MaterialPageRoute(builder: (context) => const SyncScreen()),
      );
    } else {
      getAccounts().then((count) {
        Navigator.pushReplacement(
          navigatorKey.currentContext!,
          MaterialPageRoute(
              builder: (context) => LoginScreen(accountsCount: count)),
        );

        // Get.off(LoginScreen(accountsCount: count));
      });
    }
  }
}
