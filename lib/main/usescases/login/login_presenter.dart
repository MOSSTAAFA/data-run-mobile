import 'package:d2_remote/core/common/exception/exception.dart';
import 'package:d2_remote/core/maintenance/d2_error.dart';
import 'package:d2_remote/core/maintenance/d2_error_code.dart';
import 'package:d2_remote/modules/auth/user/models/login-response.model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../commons/constants.dart';
import '../../../commons/extensions/dynamic_extensions.dart';
import '../../../commons/extensions/string_extension.dart';
import '../../../commons/network/network_utils.dart';
import '../../../commons/prefs/preference.dart';
import '../../../commons/prefs/preference_provider.dart';
import '../../../commons/state/app_state_notifier.dart';
import '../../data/server/user_manager.dart';
import '../../data/server/user_manager_impl.dart';
import '../events_without_registration/event_initial/di/event_initial_module.dart';
import '../main/main_screen.widget.dart';
import 'login_view.dart';
import 'sync_is_performed_interactor.dart';

part 'login_presenter.g.dart';

// final showLoginProgressProvider =
//     StateProvider.autoDispose<bool>((ref) => false);

@riverpod
class ShowLoginProgress extends _$ShowLoginProgress {
  @override
  bool build() {
    return false;
  }

  void update(bool Function(bool state) value) {
    state = value.call(state);
  }
}

@riverpod
LoginScreenPresenter loginScreenPresenter(
    LoginScreenPresenterRef ref, LoginView view) {
  return LoginScreenPresenter(ref, view, ref.read(preferencesInstanceProvider),
      ref.read(networkUtilsProvider),
      userManager: ref.read(userManagerProvider));
}

class LoginScreenPresenter {
  LoginScreenPresenter(
      this.ref, this.view, this.preferenceProvider, this.network,
      {this.userManager});

  /* {
    init();
  } */

  final LoginScreenPresenterRef ref;

  final LoginView view;

  // final FingerPrintController fingerPrintController;
  final PreferenceProvider preferenceProvider;

  // final AnalyticsHelper analyticsHelper;
  // final CrashReportController crashReportControllerl;
  final NetworkUtils network;

  UserManager? userManager;

  bool? canHandleBiometrics;

  late SyncIsPerformedInteractor syncIsPerformedInteractor;

  void init(/* {UserManager? userManager} */) {
    // this.userManager = userManager;
    syncIsPerformedInteractor = SyncIsPerformedInteractor(userManager);

    if (userManager == null) {
      view.setUrl(view.getDefaultServerProtocol());
    } else {
      userManager!
          .isUserLoggedIn(
              sharedPreferenceInstance: PreferenceProvider.sharedPreferences())
          .then((isUserLoggedIn) {
        final isSessionLocked =
            preferenceProvider.getBoolean(SESSION_LOCKED, false);
        if (isUserLoggedIn && !isSessionLocked) {
          ref
              .read(appStateNotifierProvider.notifier)
              .gotToNextScreenPopAll(const MainScreen());
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
    // if (!preferenceProvider.getBoolean(USER_ASKED_CRASHLYTICS, false)) {
    //   view.showCrashlyticsDialog();
    // } else {
    view.showLoginProgress(true);
    // }
  }

  Future<void> logIn(String serverUrl, String userName, String pass) async {
    // disposable.add(
    //     Observable.just(
    //         (view.abstracContext.applicationContext as App).createServerComponent()
    //             .userManager()
    //     )
    //         .flatMap { userManager ->
    await preferenceProvider.setValue(SERVER, serverUrl);
    // this.userManager = userManager
    // userName.trim { it <= ' ' }, pass, serverUrl
    return userManager
        ?.logIn(userName.trim(), pass, serverUrl)
        .then((it) async {
      await preferenceProvider.setValue(
        USER,
        await userManager?.userName(),
      );
      await preferenceProvider.setValue(SESSION_LOCKED, false);
      await preferenceProvider.setValue(PIN, null);
      _trackUserInfo();
      // Response.success<Any>(null)
      await handleResponse(it, userName, serverUrl);
    }).catchError((Object error, StackTrace stackTrace) async {
      if (error is ThrowableException) {
        error.cause != null
            ? await _handleError(
                error.cause! as ThrowableException, serverUrl, userName, pass)
            : await _handleError(error, serverUrl, userName, pass);
      }
    });
  }

  void _trackUserInfo() {
    final username = preferenceProvider.getString(USER);
    final server = preferenceProvider.getString(SERVER);

    // crashReportController.trackServer(server);
    // crashReportController.trackUser(username, server);
  }

  Future<void> logOut() async {
    if (userManager != null) {
      logInfo(info: 'logging out...');
      userManager!.logOut().catchError((error, stackTrace) {
        logInfo(info: 'Error logging out...');
        logError(info: '$error, StackTrace: $stackTrace');
        view.handleLogout();
      });
      await preferenceProvider.setValue(SESSION_LOCKED, false);
      view.handleLogout();
    }
  }

  Future<void> handleResponse(
      LoginResponseStatus userResponse, String userName, String server) async {
    logInfo(info: 'Login Response: $userResponse');
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

  Future<void> _handleError(Exception throwable, String serverUrl,
      String userName, String pass) async {
    logError(info: 'Timber.e($throwable)');
    if (throwable is D2Error &&
        throwable.errorCode == D2ErrorCode.ALREADY_AUTHENTICATED) {
      await userManager?.logOut();
      logIn(serverUrl, userName, pass);
    } else {
      view.renderError(throwable);
    }
    view.showLoginProgress(false);
  }

  bool areSameCredentials(String? serverUrl, String? userName, String? pass) {
    return preferenceProvider.areCredentialsSet() &&
        preferenceProvider.areSameCredentials(serverUrl, userName, pass);
  }

  Future<void> saveUserCredentials(
      String serverUrl, String userName, String pass) {
    return preferenceProvider.saveUserCredentials(serverUrl, userName, pass);
  }

  void onAccountRecovery() {
    if (network.isOnline()) {
      // analyticsHelper.setEvent(ACCOUNT_RECOVERY, CLICK, ACCOUNT_RECOVERY);
      view.openAccountRecovery();
    } else {
      view.showNoConnectionDialog();
    }
  }
}
