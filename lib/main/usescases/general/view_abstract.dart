/// AbstractActivityContracts.View interface
abstract class ViewAbstract {
  void back();

  void displayMessage(String? message);

  Future<void> showInfoDialogWithoutActions(String title, String message);

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
      void Function()? onNegativeClick});

  Future<void> showDescription(String description);

  Future<void> showSyncDialog<T>([T? uid]);
}
