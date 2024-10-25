import 'package:mass_pro/data_run/screens/view/view_base.dart';

mixin HomeScreenView implements ViewBase {

  void goToLogin(int accountsCount, {bool isDeletion = false});

  bool hasToNotSync();
}
