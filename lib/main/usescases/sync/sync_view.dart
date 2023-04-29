import '../general/view_base.dart';

abstract class SyncView extends ViewBase {
  void setServerTheme(int themeId);
  void setFlag(String? flagName);
  void goToLogin();
  void setMetadataSyncStarted();
  void setMetadataSyncSucceed();
  void showMetadataFailedMessage(String? message);
  void goToMain();
}
