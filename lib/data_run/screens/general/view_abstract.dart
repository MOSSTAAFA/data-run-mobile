/// AbstractActivityContracts.View interface
mixin ViewAbstract {
  void back();

  void displayMessage(String? message);

  // Future<void> showInfoDialogWithoutActions(String title, String message);

  // void showInfoDialog(
  //     String title, String message, OnDialogClickListener dialogListener);

  void setTutorial();

  void showTutorial(bool shaked);

  void hideKeyboard();

  Future<void> showInfoDialog(
      {required String title,
      String? prefix,
      required String message,
      String? positiveButtonText,
      String? negativeButtonText,
      void Function()? onPositiveClick,
      void Function()? onNegativeClick});

  Future<void> showDescription(String description);

  Future<void> showSyncDialog<T>([T? uid]);
}
