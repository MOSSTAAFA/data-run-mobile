import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/commons/prefs/preference.dart';
import 'package:mass_pro/commons/prefs/preference_provider.dart';
import 'package:mass_pro/core/user/auth_service.dart';
import 'package:mass_pro/data_run/screens/home_screen/home_screen.widget.dart';
import 'package:mass_pro/main/usescases/login/login_screen.widget.dart';
import 'package:mass_pro/main/usescases/sync/sync_screen.widget.dart';
import 'package:mass_pro/utils/navigator_key.dart';

class AuthCheck extends ConsumerWidget {
  const AuthCheck();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userService = UserService.instance;
    if (userService.user != null && userService.isLoggedIn) {
      final initialSyncDone = ref
          .read(preferencesInstanceProvider)
          .getBool(INITIAL_METADATA_SYNC_DONE, false);
      if (!initialSyncDone) {
        return const SyncScreen();
      }
      return const HomeScreen();
    }

    return LoginScreen();
  }

  void goToNextScreen(
      {required bool isUserLogged,
      required bool sessionLocked,
      required bool initialSyncDone,
      required bool initialDataSyncDone}) {
    if (isUserLogged && initialSyncDone && !sessionLocked) {
      pushUniqueScreen(navigatorKey.currentContext!, HomeScreen.routeName);
      // Navigator.pushReplacement(
      //   navigatorKey.currentContext!,
      //   MaterialPageRoute(builder: (context) => const HomeScreen()),
      // );
      // Get.offNamed(HomeScreenWidget.route);
    } else if (isUserLogged && !initialSyncDone) {
      // Get.off(const SyncScreen());

      Navigator.pushAndRemoveUntil(
          navigatorKey.currentContext!,
          MaterialPageRoute(builder: (context) => const SyncScreen()),
          (Route<dynamic> route) => false);
    }
  }
}
