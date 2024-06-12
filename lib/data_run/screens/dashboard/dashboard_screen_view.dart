import 'package:mass_pro/data_run/screens/general/view_base.dart';

mixin DashboardScreenView implements ViewBase {
  void renderUsername(String username);

  void openDrawer(int gravity);

  void goToHome();

  void showGranularSync();

  void goToLogin(int accountsCount, {bool isDeletion = false});

  bool hasToNotSync();
}
