// ignore_for_file: always_specify_types

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../commons/constants.dart';
import '../../../commons/custom_widgets/fields/decorated_form_field.dart';
import '../../../commons/custom_widgets/fields/password_field.dart';
import '../../../commons/custom_widgets/form_card.dart';
import '../../../commons/custom_widgets/mixins/keyboard_manager.dart';
import '../../../commons/extensions/dynamic_extensions.dart';
import '../../../commons/extensions/string_extension.dart';
import '../../../commons/network/network_utils.dart';
import '../../../commons/resources/resource_manager.dart';
import '../../../commons/state/app_state_notifier.dart';
import '../../../riverpod/use_on_init_hook.dart';
import '../../l10n/app_localizations.dart';
import '../general/view_base.dart';
import '../main/main_screen.widget.dart';
import '../sync/sync_screen.widget.dart';
import 'login_presenter.dart';
import 'login_view.dart';
import 'login_view_model.dart';
import 'widgets/headline1.dart';
import 'widgets/login_header.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen(
      {super.key,
      this.skipSync = false,
      this.accountsCount = -1,
      this.isDeletion = false});

  static const String route = '/loginscreen';

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
    final localization = AppLocalization.of(context)!;

    return Scaffold(
      body: Builder(
        builder: (BuildContext context) {
          return GestureDetector(
            onTap: () => hideTheKeyboard(context),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  LoginHeader(),
                  Headline1(text: localization.lookup('login')),
                  Padding(
                    padding: const EdgeInsets.all(32),
                    child: Form(
                      key: _formKey,
                      child: AutofillGroup(
                        child: FormCard(
                            forceNarrow: true,
                            internalPadding: const EdgeInsets.all(20),
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
                                        label: localization.lookup('username'),
                                        keyboardType: TextInputType.name,
                                        readOnly: ref
                                            .watch(showLoginProgressProvider),
                                        validator: (String? val) {
                                          return val?.trim().isNullOrEmpty ??
                                                  false
                                              ? localization.lookup(
                                                  'pleaseEnterYourUsername')
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
                                        // controller: _passwordController,
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
                                        onPressed: ref.watch(loginModelProvider
                                                    .select((value) => value
                                                        .isDataComplete)) ==
                                                true
                                            ? () => presenter.onButtonClick()
                                            : null,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Icon(Icons.account_box,
                                                color: Colors.white),
                                            const SizedBox(width: 10),
                                            Text(
                                              localization.lookup('user'),
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  )),
                            ]),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
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
      await presenter.logIn(kApiBaseUrl, ref.read(loginModelProvider).userName!,
          ref.read(loginModelProvider).password!);
    } else {
      ref.read(showLoginProgressProvider.notifier).update((state) => false);
      _buttonController.reset();
    }
  }

  @override
  void renderError(Exception throwable) {
    showInfoDialog(
        title: 'Error',
        prefix: AppLocalization.of(context)!.lookup('login_error'),
        message: ref.read(resourceManagerProvider).parseD2Error(throwable));
    // Get.dialog(
    //     SelectableError(
    //       errorMessage: AppLocalization.of(context)!.lookup('login_error'),
    //     ),
    //     name: ref.read(resourceManagerProvider).parseD2Error(throwable));
  }

  @override
  void setUrl(String url) {
    ref.read(loginModelProvider.notifier).onServerChanged(url);
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
          .gotToNextScreen(const MainScreen());
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
    if (!presenter.areSameCredentials(
        ref.read(loginModelProvider).serverUrl,
        ref.read(loginModelProvider).userName,
        ref.read(loginModelProvider).password)) {
      // This is commented until fingerprint login for multiuser is supported
      /* if (presenter.canHandleBiometrics() == true) {
                showInfoDialog(
                    getString(R.string.biometrics_security_title),
                    getString(R.string.biometrics_security_text),
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
    } else {
      goToNextScreen();
    }
  }

  @override
  void showEmptyCredentialsMessage() {
    final localization = AppLocalization.of(context)!;
    showInfoDialog(
        title: localization.lookup('R.biometrics_dialog_title'),
        message: localization.lookup('R.biometrics_first_use_text'));
  }

  @override
  void showNoConnectionDialog() {
    final localization = AppLocalization.of(context)!;
    showInfoDialog(
        title: localization.lookup('R.network_unavailable'),
        message: localization.lookup('R.no_network_to_recover_account'),
        positiveButtonText: localization.lookup('ok'));
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
