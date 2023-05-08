import '../general/view_base.dart';

mixin SplashView implements ViewBase {
  void renderFlag(String flagName);

  void goToNextScreen(
      {required bool isUserLogged,
      required bool sessionLocked,
      required bool initialSyncDone,
      required bool initialDataSyncDone});
}
