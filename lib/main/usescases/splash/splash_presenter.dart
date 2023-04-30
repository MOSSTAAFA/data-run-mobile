import 'package:d2_remote/d2_remote.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../commons/constants.dart';
import '../../../commons/prefs/preference.dart';
import '../../../commons/prefs/preference_provider.dart';
import '../events_without_registration/event_initial/di/event_initial_module.dart';
import 'splash_view.dart';
part 'splash_presenter.g.dart';

@riverpod
SplashPresenter splashPresenter(SplashPresenterRef ref, SplashView view) {
  return SplashPresenter(view, ref.read(preferencesInstanceProvider));
}

class SplashPresenter {
  SplashPresenter(this.view, this.preferenceProvider) {
    init();
  }
  final SplashView view;
  // final UserManager? userManager;
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

  Future<void> _isUserLoggedIn() {
    return Future.delayed(
        Duration(
          milliseconds: 2000,
        ),
        () => D2Remote.isAuthenticated(
                    sharedPreferenceInstance:
                        PreferenceProvider.sharedPreferences())
                .then((userLogged) {
              if (userLogged) {
                _trackUserInfo();
                //   required bool isUserLogged,
                // required bool sessionLocked,
                // required bool initialSyncDone,
                // required bool initialDataSyncDone
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
  }

  void _trackUserInfo() {
    final username = preferenceProvider.getString(USER);
    final server = preferenceProvider.getString(SERVER);

    // crashReportController.trackServer(server);
    // crashReportController.trackUser(username, server);
  }

  Future<int> getAccounts() {
    return Future.value(1);
  }
}
