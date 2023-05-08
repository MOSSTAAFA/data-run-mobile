import '../general/view_base.dart';

mixin LoginView implements ViewBase {
  void showUnlockButton();

  void onUnlockClick(ViewBase android);

  void onLogoutClick(ViewBase android);

  void setAutocompleteAdapters();

  void saveUsersData(bool isInitialSyncDone);

  void handleLogout();

  void setLoginVisibility(bool isVisible);

  Future<void> showLoginProgress(bool showLogin);

  void goToNextScreen();

  void setUrl(String url);

  void setUser(String user);

  void showCrashlyticsDialog();

  void navigateToQRActivity();

  void renderError(Exception throwable);

  // FingerPrintAuth

  void showBiometricButton();

  void openAccountRecovery();

  void alreadyAuthenticated();

  // void showCredentialsData(Goldfinger.Type type, List<String> args);
  void showEmptyCredentialsMessage();

  void setTestingCredentials();

  String getDefaultServerProtocol();

  // Goldfinger.PromptParams getPromptParams();
  bool isNetworkAvailable();

  // void openOpenIDActivity(IntentWithRequestCode? it);
  void openAccountsActivity();

  void showNoConnectionDialog();
}
