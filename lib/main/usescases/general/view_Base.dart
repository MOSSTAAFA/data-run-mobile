import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import '../../../commons/custom_widgets/copy_to_clipboard.dart';
import 'view_abstract.dart';

import '../../../commons/utils/view_actions.dart';
import '../../../main.dart';
import '../../l10n/app_localizations.dart';

/// any screen ActivityGlobalAbstract
class ViewBase implements ViewAbstract {
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
  void displayMessage(String? message) {
    if (message != null) {
      showToast(message, context: navigatorKey.currentContext);
    }
  }

  @override
  void hideKeyboard() {}

  @override
  void setTutorial() {}

  @override
  Future<void> showDescription(String description) {
    return showDialog<String>(
        context: navigatorKey.currentContext!,
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
      String? prefix,
      required String message,
      String? positiveButtonText,
      String? negativeButtonText,
      void Function()? onPositiveClick,
      void Function()? onNegativeClick}) {
    return showDialog<void>(
      context: navigatorKey.currentContext!,
      // barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                CopyToClipboard(
                  prefix: prefix,
                  value: message,
                  child: Text(message),
                )
              ],
            ),
          ),
          actions: <Widget>[
            if (positiveButtonText != null)
              TextButton(
                child: Text(positiveButtonText),
                onPressed: () {
                  onPositiveClick?.call();
                },
              ),
            if (negativeButtonText != null)
              TextButton(
                child: Text(negativeButtonText),
                onPressed: () {
                  onNegativeClick?.call();
                },
              ),
          ],
        );
      },
    );
  }

  @override
  Future<void> showInfoDialogWithoutActions(String title, String message) {
    return showDialog<void>(
      context: navigatorKey.currentContext!,
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
              child: Text(AppLocalization.of(navigatorKey.currentContext!)!
                  .lookup('ok')),
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

  @override
  Future<void> showSyncDialog<T>([T? uid]) {
    return Future.value();
  }
}
