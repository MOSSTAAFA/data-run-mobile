import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../commons/constants.dart';
import '../../../commons/custom_widgets/fields/decorated_form_field.dart';
import '../../../commons/custom_widgets/fields/password_field.dart';
import '../../../commons/custom_widgets/form_card.dart';
import '../../../commons/custom_widgets/mixins/keyboard_manager.dart';
import '../../../commons/extensions/string_extension.dart';
import '../../../commons/resources/resource_manager.dart';
import '../../../form/di/injector.dart';
import '../../l10n/app_localizations.dart';
import '../general/view_base.dart';
import 'login_presenter.dart';
import 'login_view.dart';
import 'login_view_model.dart';
import 'widgets/headline1.dart';
import 'widgets/login_header.dart';
import 'widgets/selectable_error.widget.dart';

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
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen>
    with LoginView, KeyboardManager {
  late final LoginScreenPresenter presenter;

  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(debugLabel: '_login');

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();
  final TextEditingController _secretController = TextEditingController();
  final TextEditingController _oneTimePasswordController =
      TextEditingController();
  final TextEditingController _tokenController = TextEditingController();

  final RoundedLoadingButtonController _buttonController =
      RoundedLoadingButtonController();

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
                                        icon: Icon(Icons.person,
                                            color: Theme.of(context)
                                                .primaryColorLight),
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
                                        readOnly: ref
                                            .watch(showLoginProgressProvider),
                                        controller: _passwordController,
                                        autoValidate: false,
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
                                                .select((value) =>
                                                    value.isDataComplete ??
                                                    false))
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

  @override
  void initState() {
    super.initState();
    presenter = ref.read(loginScreenPresenterProvider(this));
    _urlController.addListener(() => ref
        .read(loginModelProvider.notifier)
        .onServerChanged(_urlController.text));

    _userController.addListener(() => ref
        .read(loginModelProvider.notifier)
        .onUserChanged(_userController.text));
    _passwordController.addListener(() => ref
        .read(loginModelProvider.notifier)
        .onPassChanged(_passwordController.text));
    // _setListeners();
  }

  @override
  void dispose() {
    _urlController.removeListener(() => ref
        .read(loginModelProvider.notifier)
        .onServerChanged(_urlController.text));
    _userController.removeListener(() => ref
        .read(loginModelProvider.notifier)
        .onUserChanged(_userController.text));
    _passwordController.removeListener(() => ref
        .read(loginModelProvider.notifier)
        .onPassChanged(_passwordController.text));

    _firstNameController.dispose();
    _lastNameController.dispose();
    _userController.dispose();
    _passwordController.dispose();
    _urlController.dispose();
    _secretController.dispose();
    _oneTimePasswordController.dispose();
    _tokenController.dispose();

    super.dispose();
  }

  // void _setListeners() {
  //   ref.listenManual<bool>(
  //       loginModelProvider.select((value) => value.isDataComplete ?? false),
  //       (previous, next) => !next ? _buttonController.reset() : null);
  // }

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
  void showLoginProgress(bool showLogin) {
    if (showLogin) {
      ref.read(showLoginProgressProvider.notifier).update((state) => true);
      _buttonController.start();
      presenter.logIn(
          kApiBaseUrl, _userController.text, _passwordController.text);
    } else {
      ref.read(showLoginProgressProvider.notifier).update((state) => false);
      _buttonController.reset();
    }
  }

  @override
  void renderError(Exception throwable) {
    Get.dialog(
        SelectableError(
          errorMessage: AppLocalization.of(context)!.lookup('login_error'),
        ),
        name: ref.read(resourceManagerProvider).parseD2Error(throwable));
  }

  @override
  void setUrl(String url) {
    _urlController.text = url;
  }

  @override
  void setUser(String user) {
    _userController.text = user;
  }

  @override
  void alreadyAuthenticated() {
    // TODO: implement alreadyAuthenticated
  }

  @override
  String getDefaultServerProtocol() {
    return 'https://';
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
    return ref.read(networkUtilsProvider).isOnline(context);
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
  void saveUsersData(bool isInitialSyncDone) {
    // TODO: implement saveUsersData
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
  void showEmptyCredentialsMessage() {
    // TODO: implement showEmptyCredentialsMessage
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

final showLoginProgressProvider =
    StateProvider.autoDispose<bool>((ref) => false);
