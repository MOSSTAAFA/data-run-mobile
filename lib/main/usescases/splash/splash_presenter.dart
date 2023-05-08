import 'package:d2_remote/d2_remote.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../commons/constants.dart';
import '../../../commons/prefs/preference.dart';
import '../../../commons/prefs/preference_provider.dart';
import '../../data/server/user_manager.dart';
import '../../data/server/user_manager_impl.dart';
import '../events_without_registration/event_initial/di/event_initial_module.dart';
import 'splash_view.dart';

part 'splash_presenter.g.dart';

@riverpod
SplashPresenter splashPresenter(SplashPresenterRef ref, SplashView view) {
  return SplashPresenter(view, ref.read(preferencesInstanceProvider),
      ref.read(userManagerProvider));
}

class SplashPresenter {
  SplashPresenter(this.view, this.preferenceProvider, this.userManager);

  final SplashView view;
  UserManager? userManager;
  final PreferenceProvider preferenceProvider;

  // final CrashReportController crashReportController;

  void init() {
    // PreferenceProvider.sharedPreferences()
    //     .then((SharedPreferences sharedPreferences) {
    //   sharedPreferences.getKeys().forEach((key) {
    //     when(key, {
    //       [PREFS_URLS, PREFS_USERS]: () => preferenceProvider.setValue(key, value),
    //     });
    //   });
    // });
    _isUserLoggedIn();
  }

  Future<void> _isUserLoggedIn() async {
    if (userManager != null) {
      Future.delayed(
          Duration(
            milliseconds: 2000,
          ),
          () => userManager!
                  .isUserLoggedIn(
                      sharedPreferenceInstance:
                          PreferenceProvider.sharedPreferences())
                  .then((userLogged) {
                if (userLogged) {
                  _trackUserInfo();
                  view.goToNextScreen(
                      isUserLogged: userLogged,
                      sessionLocked:
                          preferenceProvider.getBoolean(SESSION_LOCKED, false),
                      initialSyncDone: preferenceProvider.getBoolean(
                          INITIAL_METADATA_SYNC_DONE, false),
                      initialDataSyncDone: preferenceProvider.getBoolean(
                          INITIAL_DATA_SYNC_DONE, false));
                } else {
                  view.goToNextScreen(
                      isUserLogged: false,
                      sessionLocked: false,
                      initialSyncDone: false,
                      initialDataSyncDone: false);
                }
              }));
    } else {
      view.goToNextScreen(
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
}
