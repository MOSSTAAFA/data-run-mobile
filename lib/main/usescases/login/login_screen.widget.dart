import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../general/view_base.dart';
import 'login_presenter.dart';
import 'login_view.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen(
      {super.key,
      this.skipSync = false,
      this.accountsCount = -1,
      this.isDeletion = false});

  final bool skipSync;
  final int accountsCount;
  final bool isDeletion;
  // final OpenIdSession.LogOutReason? logOutReason;

  @override
  ConsumerState<LoginScreen> createState() => _SyncScreenState();
}

class _SyncScreenState extends ConsumerState<LoginScreen> with LoginView {
  late final LoginScreenPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void initState() {
    super.initState();
    presenter = ref.read(loginScreenPresenterProvider(this));
  }

  @override
  void alreadyAuthenticated() {
    // TODO: implement alreadyAuthenticated
  }

  @override
  String getDefaultServerProtocol() {
    // TODO: implement getDefaultServerProtocol
    throw UnimplementedError();
  }

  @override
  void goToNextScreen() {
    // TODO: implement goToNextScreen
  }

  @override
  void handleLogout() {
    // TODO: implement handleLogout
  }

  @override
  bool isNetworkAvailable() {
    // TODO: implement isNetworkAvailable
    throw UnimplementedError();
  }

  @override
  void navigateToQRActivity() {
    // TODO: implement navigateToQRActivity
  }

  @override
  void onLogoutClick(ViewBase android) {
    // TODO: implement onLogoutClick
  }

  @override
  void onUnlockClick(ViewBase android) {
    // TODO: implement onUnlockClick
  }

  @override
  void openAccountRecovery() {
    // TODO: implement openAccountRecovery
  }

  @override
  void openAccountsActivity() {
    // TODO: implement openAccountsActivity
  }

  @override
  void renderError(Exception throwable) {
    // TODO: implement renderError
  }

  @override
  void saveUsersData(bool isInitialSyncDone) {
    // TODO: implement saveUsersData
  }

  @override
  void setAutocompleteAdapters() {
    // TODO: implement setAutocompleteAdapters
  }

  @override
  void setLoginVisibility(bool isVisible) {
    // TODO: implement setLoginVisibility
  }

  @override
  void setTestingCredentials() {
    // TODO: implement setTestingCredentials
  }

  @override
  void setUrl(String url) {
    // TODO: implement setUrl
  }

  @override
  void setUser(String user) {
    // TODO: implement setUser
  }

  @override
  void showBiometricButton() {
    // TODO: implement showBiometricButton
  }

  @override
  void showCrashlyticsDialog() {
    // TODO: implement showCrashlyticsDialog
  }

  @override
  void showEmptyCredentialsMessage() {
    // TODO: implement showEmptyCredentialsMessage
  }

  @override
  void showLoginProgress(bool showLogin) {
    // TODO: implement showLoginProgress
  }

  @override
  void showNoConnectionDialog() {
    // TODO: implement showNoConnectionDialog
  }

  @override
  void showUnlockButton() {
    // TODO: implement showUnlockButton
  }

  @override
  void goToMainScreen() {}
}
