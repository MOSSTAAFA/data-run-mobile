import 'package:flutter/material.dart';

/// View interface
abstract class ViewAbstract {
  void back();

  void displayMessage(String message, BuildContext context);

  Future<void> showInfoDialogWithoutActions(
      String title, String message, BuildContext context);

  // void showInfoDialog(
  //     String title, String message, OnDialogClickListener dialogListener);

  void setTutorial();

  void showTutorial(bool shaked);

  void hideKeyboard();

  Future<void> showInfoDialog(
      {required String title,
      required String message,
      required String positiveButtonText,
      required String negativeButtonText,
      void Function()? onPositiveClick,
      void Function()? onNegativeClick,
      required BuildContext context});

  Future<void> showDescription(String description, BuildContext context);

  Future<void> showSyncDialog(BuildContext context);

  TabController? getTabController();
}
