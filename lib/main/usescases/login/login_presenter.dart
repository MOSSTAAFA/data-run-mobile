import 'package:d2_remote/modules/auth/user/models/login-response.model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../commons/constants.dart';
import '../../../commons/extensions/string_extension.dart';
import '../../../commons/network/network_utils.dart';
import '../../../commons/prefs/preference.dart';
import '../../../commons/prefs/preference_provider.dart';
import '../../data/server/user_manager.dart';
import '../../data/server/user_manager_impl.dart';
import '../events_without_registration/event_initial/di/event_initial_module.dart';
import 'login_view.dart';
import 'sync_is_performed_interactor.dart';
part 'login_presenter.g.dart';

@riverpod
LoginScreenPresenter loginScreenPresenter(
    LoginScreenPresenterRef ref, LoginView view) {
  return LoginScreenPresenter(view, ref.read(preferencesInstanceProvider),
      ref.read(networkUtilsProvider),
      userManager: ref.read(userManagerProvider));
}

class LoginScreenPresenter {
  LoginScreenPresenter(this.view, this.preferenceProvider, this.network,
      {this.userManager});

  final LoginView view;
  // final FingerPrintController fingerPrintController;
  final PreferenceProvider preferenceProvider;

  // final AnalyticsHelper analyticsHelper;
  // final CrashReportController crashReportControllerl;
  final NetworkUtils network;

  UserManager? userManager;

  bool? canHandleBiometrics;

  late SyncIsPerformedInteractor syncIsPerformedInteractor;

  void init({UserManager? userManager}) {
    this.userManager = userManager;
    syncIsPerformedInteractor = SyncIsPerformedInteractor(userManager);

    if (this.userManager == null) {
      view.setUrl(view.getDefaultServerProtocol());
    } else {
      this
          .userManager!
          .isUserLoggedIn(
              sharedPreferenceInstance: PreferenceProvider.sharedPreferences())
          .then((isUserLoggedIn) {
        final isSessionLocked =
            preferenceProvider.getBoolean(SESSION_LOCKED, false);
        if (isUserLoggedIn && !isSessionLocked) {
          view.goToMainScreen();
        } else if (isSessionLocked) {
          view.showUnlockButton();
        }
        if (!isUserLoggedIn) {
          final serverUrl = preferenceProvider.getString(
              SECURE_SERVER_URL, view.getDefaultServerProtocol());
          final user = preferenceProvider.getString(SECURE_USER_NAME, '');
          if (!serverUrl.isNullOrEmpty && !user.isNullOrEmpty) {
            view.setUrl(serverUrl!);
            view.setUser(user!);
          } else {
            view.setUrl(view.getDefaultServerProtocol());
          }
        }
      }) /* .onError((error, stackTrace) => null) */;
    }
  }

  void onButtonClick() {
    view.hideKeyboard();
    // analyticsHelper.setEvent(LOGIN, CLICK, LOGIN);
    if (!preferenceProvider.getBoolean(USER_ASKED_CRASHLYTICS, false)) {
      view.showCrashlyticsDialog();
    } else {
      view.showLoginProgress(true);
    }
  }

  void logIn(String serverUrl, String userName, String pass) {
    // disposable.add(
    //     Observable.just(
    //         (view.abstracContext.applicationContext as App).createServerComponent()
    //             .userManager()
    //     )
    //         .flatMap { userManager ->
    preferenceProvider.setValue(SERVER, '$serverUrl/api');
    // this.userManager = userManager
    // userName.trim { it <= ' ' }, pass, serverUrl
    userManager?.logIn(userName.trim(), pass, serverUrl).then((value) async {
      preferenceProvider.setValue(
        USER,
        await userManager?.userName(),
      );
      preferenceProvider.setValue(SESSION_LOCKED, false);
      preferenceProvider.setValue(PIN, null);
      _trackUserInfo();
      // Response.success<Any>(null)
      //  this.handleResponse(it, userName, serverUrl);
    }).onError<LoginResponseStatus>(
      (error, stackTrace) {
        _handleError(error, serverUrl, userName, pass);
      },
    );
  }

  void _trackUserInfo() {
    final username = preferenceProvider.getString(USER);
    final server = preferenceProvider.getString(SERVER);

    // crashReportController.trackServer(server);
    // crashReportController.trackUser(username, server);
  }

  void logOut() {
    if (userManager != null) {
      userManager!.logout().then((value) async {
        await preferenceProvider.setValue(SESSION_LOCKED, false);
        view.handleLogout();
        return true;
      }).onError((error, stackTrace) {
        view.handleLogout();
        return false;
      });
    }
  }

  Future<void> handleResponse(
      LoginResponseStatus userResponse, String userName, String server) async {
    view.showLoginProgress(false);

    if (userResponse == LoginResponseStatus.ONLINE_LOGIN_SUCCESS ||
        userResponse == LoginResponseStatus.OFFLINE_LOGIN_SUCCESS) {
      // _trackServerVersion();
      final isInitialSyncDone = await syncIsPerformedInteractor();
      final updatedServer = preferenceProvider.getList(PREFS_URLS, [])!;
      if (!updatedServer.contains(server)) {
        updatedServer.add(server);
      }
      final updatedUsers = preferenceProvider.getList(PREFS_USERS, [])!;
      if (!updatedUsers.contains(userName)) {
        updatedUsers.add(userName);
      }

      preferenceProvider.setValue(PREFS_URLS, updatedServer);
      preferenceProvider.setValue(PREFS_USERS, updatedUsers);

      view.saveUsersData(isInitialSyncDone);
    }
  }

  void _handleError(LoginResponseStatus throwable, String serverUrl,
      String userName, String pass) {
    print('Timber.e($throwable)');
    // if (throwable is D2Error && throwable.errorCode() == D2ErrorCode.ALREADY_AUTHENTICATED) {
    //     userManager?.d2?.userModule()?.blockingLogOut()
    //     logIn(serverUrl, userName, pass)
    // } else {
    view.renderError(Exception(throwable.name));
    // }
    view.showLoginProgress(false);
  }
}
