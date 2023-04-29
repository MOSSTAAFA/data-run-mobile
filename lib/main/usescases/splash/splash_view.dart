import '../general/view_base.dart';

abstract class SplashView extends ViewBase {
  void renderFlag(String flagName);
  void goToNextScreen(
      {required bool isUserLogged,
      required bool sessionLocked,
      required bool initialSyncDone,
      required bool initialDataSyncDone});
}
