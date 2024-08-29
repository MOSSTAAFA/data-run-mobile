// ignore_for_file: always_specify_types

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/commons/constants.dart';
import 'package:mass_pro/commons/custom_widgets/fields/decorated_form_field.dart';
import 'package:mass_pro/commons/custom_widgets/fields/password_field.dart';
import 'package:mass_pro/commons/custom_widgets/mixins/keyboard_manager.dart';
import 'package:mass_pro/commons/extensions/dynamic_extensions.dart';
import 'package:mass_pro/commons/extensions/string_extension.dart';
import 'package:mass_pro/commons/network/network_utils.dart';
import 'package:mass_pro/commons/resources/resource_manager.dart';
import 'package:mass_pro/commons/state/app_state_notifier.dart';
import 'package:mass_pro/data_run/screens/home_screen/home_screen.widget.dart';
import 'package:mass_pro/data_run/screens/view/view_base.dart';
import 'package:mass_pro/generated/l10n.dart';
import 'package:mass_pro/main/usescases/login/login_presenter.dart';
import 'package:mass_pro/main/usescases/login/login_view.dart';
import 'package:mass_pro/main/usescases/login/login_view_model.dart';
import 'package:mass_pro/main/usescases/sync/sync_screen.widget.dart';
import 'package:mass_pro/riverpod/use_on_init_hook.dart';
import 'package:mass_pro/utils/mass_utils/utils.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen(
      {super.key,
      this.skipSync = false,
      this.accountsCount = -1,
      this.isDeletion = false});

  static const String route = '/login-screen';

  final bool skipSync;
  final int accountsCount;
  final bool isDeletion;

  // final OpenIdSession.LogOutReason? logOutReason;

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen>
    with LoginView, ViewBase, KeyboardManager {
  late final LoginScreenPresenter presenter;

  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(debugLabel: '_login');

  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();

  final RoundedLoadingButtonController _buttonController =
      RoundedLoadingButtonController();
  bool skipSync = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () => hideTheKeyboard(context),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(top: 40, bottom: 20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Theme.of(context).dialogBackgroundColor,
                                Theme.of(context).dialogBackgroundColor
                              ]),
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset.zero,
                                spreadRadius: 0,
                                blurRadius: .5,
                                color: Colors.black)
                          ],
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40))),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/launcher_icon/logo_white.png',
                            height: 100,
                            width: 100,
                            // fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 8),
                          // Spacer between logo and text
                          Text(
                            S.of(context).nmcpYemen,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context)
                                  .primaryColorDark, // Match with logo color
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(L('login'),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineMedium),
                    SizedBox(
                      height: 16,
                    ),
                    Form(
                      key: _formKey,
                      child: AutofillGroup(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 16.0, right: 16.0),
                          child: Column(
                            children: [
                              Consumer(
                                builder: (context, ref, child) {
                                  return Column(
                                    children: <Widget>[
                                      DecoratedFormField(
                                        onChanged: (value) => ref
                                            .read(loginModelProvider.notifier)
                                            .onUserChanged(value),
                                        controller: _userController,
                                        label: L('username'),
                                        keyboardType: TextInputType.name,
                                        readOnly: ref
                                            .watch(showLoginProgressProvider),
                                        validator: (String? val) {
                                          return val?.trim().isNullOrEmpty ??
                                                  false
                                              ? L('enterYourUsername')
                                              : null;
                                        },
                                        autofillHints: const [
                                          AutofillHints.username
                                        ],
                                        autofocus: true,
                                        onSavePressed: (_) =>
                                            presenter.onButtonClick(),
                                      ),
                                      PasswordFormField(
                                        onChanged: (value) => ref
                                            .read(loginModelProvider.notifier)
                                            .onPassChanged(value),
                                        readOnly: ref
                                            .watch(showLoginProgressProvider),
                                        controller: _passwordController,
                                        onSavePressed: (_) =>
                                            presenter.onButtonClick(),
                                      ),
                                    ],
                                  );
                                },
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 10, left: 16, right: 16),
                                  child: Consumer(
                                    builder: (context, ref, child) {
                                      return RoundedLoadingButton(
                                        borderRadius: 4,
                                        width: 430,
                                        controller: _buttonController,
                                        onPressed: () {
                                          if (_formKey.currentState
                                                  ?.validate() ==
                                              true) {
                                            presenter.onButtonClick();
                                          } else {
                                            showLoginProgress(false);
                                          }
                                        },
                                        // onPressed: ref.watch(loginModelProvider
                                        //             .select((value) =>
                                        //                 value.isDataComplete)) ==
                                        //         true
                                        //     ? () => presenter.onButtonClick()
                                        //     : null,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Icon(Icons.account_box,
                                                color: Colors.white),
                                            const SizedBox(width: 10),
                                            Text(
                                              L('login'),
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  )),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  /// LifeCycle methods
  @override
  void initState() {
    super.initState();
    presenter = ref.read(loginScreenPresenterProvider(this));
  }

  @override
  void didChangeDependencies() {
    useOnInit(() => presenter.init());
    // presenter.init();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    _urlController.dispose();
    super.dispose();
  }

  /// Custom methods
  @override
  void hideKeyboard() {
    hideTheKeyboard(context);
  }

  @override
  void setLoginVisibility(bool isVisible) {
    /// Not Needed, we call loginModelProvider.isDataComplete directly to
    /// enable/disable login button
    // ref.read(loginVisibilityProvider.notifier).update((state) => isVisible);
  }

  @override
  Future<void> showLoginProgress(bool showLogin) async {
    if (showLogin) {
      ref.read(showLoginProgressProvider.notifier).update((state) => true);
      _buttonController.start();
      await presenter.logIn(kApiBaseUrl, _userController.text,
          _passwordController.text);
    } else {
      ref.read(showLoginProgressProvider.notifier).update((state) => false);
      _buttonController.reset();
    }
  }

  @override
  void renderError(Exception throwable) {
    showInfoDialog(
        title: S.of(context).error,
        prefix: S.of(context).loginErrorErrorResponse,
        message: ref.read(resourceManagerProvider).parseD2Error(throwable));
    // Get.dialog(
    //     SelectableError(
    //       errorMessage: AppLocalization.of(context)!.lookup('login_error'),
    //     ),
    //     name: ref.read(resourceManagerProvider).parseD2Error(throwable));
  }

  @override
  void setUrl(String url) {
    // ref.read(loginModelProvider.notifier).onServerChanged(url);
    _urlController.text = url;
  }

  @override
  void setUser(String user) {
    ref.read(loginModelProvider.notifier).onUserChanged(user);
    _userController.text = user;
  }

  @override
  String getDefaultServerProtocol() {
    return kApiBaseUrl;
    // return 'https://';
  }

  @override
  void goToNextScreen() {
    if (isNetworkAvailable() && !widget.skipSync) {
      ref
          .read(appStateNotifierProvider.notifier)
          .gotToNextScreen(const SyncScreen());
    } else {
      ref
          .read(appStateNotifierProvider.notifier)
          .gotToNextScreenPopAll(HomeScreenWidget());
    }
  }

  @override
  bool isNetworkAvailable() {
    return ref.read(networkUtilsProvider).isOnline(context);
  }

  @override
  void onLogoutClick(ViewBase android) {
    presenter.logOut();
  }

  @override
  void saveUsersData(bool isInitialSyncDone) {
    logInfo(info: '''saveUsersData, isInitialSyncDone: $isInitialSyncDone, 
            ${isInitialSyncDone ? 'so will skipSync' : 'so will start ync'}''');

    skipSync = isInitialSyncDone;
    // if (!presenter.areSameCredentials(
    //     ref.read(loginModelProvider).serverUrl,
    //     ref.read(loginModelProvider).userName,
    //     ref.read(loginModelProvider).password)) {
      // This is commented until fingerprint login for multiuser is supported
      /* if (presenter.canHandleBiometrics() == true) {
                showInfoDialog(
                    getString(string.biometrics_security_title),
                    getString(string.biometrics_security_text),
                    object : OnDialogClickListener {
                        override fun onPositiveClick() {
                            presenter.saveUserCredentials(
                                binding.serverUrlEdit.text.toString(),
                                binding.userNameEdit.text.toString(),
                                binding.userPassEdit.text.toString()
                            )
                            goToNextScreen()
                        }

                        override fun onNegativeClick() {
                            goToNextScreen()
                        }
                    }
                )
               goToNextScreen()
            } else {
                presenter.saveUserCredentials(
                    binding.serverUrlEdit.text.toString(),
                    binding.userNameEdit.text.toString(),
                    ""
                )
                goToNextScreen()
            } */
      presenter.saveUserCredentials(ref.read(loginModelProvider).serverUrl!,
          ref.read(loginModelProvider).userName!, '');
      goToNextScreen();
    // } else {
    //   goToNextScreen();
    // }
  }

  @override
  void showEmptyCredentialsMessage() {
    showInfoDialog(
        title: L('biometrics_dialog_title'),
        message: L('biometrics_first_use_text'));
  }

  @override
  void showNoConnectionDialog() {
    showInfoDialog(
        title: L('network_unavailable'),
        message: L('no_network_to_recover_account'),
        positiveButtonText: L('ok'));
  }

  @override
  void navigateToQRActivity() {
    // TODO: implement navigateToQRActivity
  }

  @override
  void handleLogout() {
    // TODO: implement handleLogout
  }

  @override
  void alreadyAuthenticated() {
    // TODO: implement alreadyAuthenticated
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
  void setAutocompleteAdapters() {
    // TODO: implement setAutocompleteAdapters
  }

  @override
  void setTestingCredentials() {
    // TODO: implement setTestingCredentials
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
  void showUnlockButton() {
    // TODO: implement showUnlockButton
  }
}

// final showLoginProgressProvider =
//     StateProvider.autoDispose<bool>((ref) => false);
