import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import '../../../commons/utils/view_actions.dart';
import '../../l10n/app_localizations.dart';

/// any screen ActivityGlobalAbstract
class ViewBase {
  // final PinDialog pinDialog;
  void onCreate() {
    // ServerComponent serverComponent = ((App) getApplicationContext()).getServerComponent();
    // if (serverComponent != null) {
    //     serverComponent.openIdSession().setSessionCallback(this, logOutReason -> {
    //         startActivity(LoginActivity.class, LoginActivity.Companion.bundle(true, -1, false, logOutReason), true, true, null);
    //         return Unit.INSTANCE;
    //     });
    //     if (serverComponent.userManager().isUserLoggedIn().blockingFirst() &&
    //             !serverComponent.userManager().allowScreenShare()) {
    //         getWindow().setFlags(WindowManager.LayoutParams.FLAG_SECURE, WindowManager.LayoutParams.FLAG_SECURE);
    //     }
    // }

    // if (!getResources().getBoolean(R.bool.is_tablet))
    //     setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_SENSOR_PORTRAIT);

    // SharedPreferences prefs = getSharedPreferences();
    // if (this is MainActivity || this is LoginActivity || this is SplashActivity || this is AccountsActivity) {
    //     if (serverComponent != null) {
    //         serverComponent.themeManager().clearProgramTheme();
    //     }
    //     prefs.edit().remove(Constants.PROGRAM_THEME).apply();
    // }

    // if (!(this is SplashActivity) &&
    //         !(this is LoginActivity) &&
    //         !(this is AccountsActivity) &&
    //         !(this is ScanActivity)
    // ) {
    //     if (serverComponent != null) {
    //         setTheme(serverComponent.themeManager().getProgramTheme());
    //     } else {
    //         setTheme(R.style.AppTheme);
    //     }
    // }
  }

  List<ViewAction> getMoreOptions() {
    return ViewAction.homeMoreActions();
  }

  @override
  void back() {}

  @override
  void displayMessage(String? message, BuildContext context) {
    if (message != null) {
      showToast(message, context: context);
    }
  }

  @override
  void hideKeyboard() {}

  @override
  void setTutorial() {}

  @override
  Future<void> showDescription(String description, BuildContext context) {
    return showDialog<String>(
        context: context,
        builder: (BuildContext context) => Dialog(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(description),
                    const SizedBox(height: 15),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(AppLocalization.of(context)!.lookup('close')),
                    ),
                  ],
                ),
              ),
            ));
  }

  @override
  Future<void> showInfoDialog(
      {required String title,
      required String message,
      required String positiveButtonText,
      required String negativeButtonText,
      void Function()? onPositiveClick,
      void Function()? onNegativeClick,
      required BuildContext context}) {
    return showDialog<void>(
      context: context,
      // barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(negativeButtonText),
              onPressed: () {
                onNegativeClick?.call();
                // Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(positiveButtonText),
              onPressed: () {
                onPositiveClick?.call();
                // Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Future<void> showInfoDialogWithoutActions(
      String title, String message, BuildContext context) {
    return showDialog<void>(
      context: context,
      // barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(AppLocalization.of(context)!.lookup('ok')),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void showTutorial(bool shaked) {}

  Future<void> showSyncDialog(BuildContext context) {
    return Future.value();
  }

  TabController? getTabController() {
    return null;
  }
}
