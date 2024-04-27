import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../main.dart';
import '../../main/usescases/bundle/bundle.dart';
import '../../main/usescases/main/main_screen.widget.dart';
import '../../utils/mass_utils/strings.dart';
import '../extensions/dynamic_extensions.dart';
import 'app_state.dart';

part 'app_state_notifier.g.dart';

/// Get.back()	Navigator.pop(context)
/// Get.off()	Navigator.pushReplacement()
/// Get.offNamed()	Navigator.pushReplacementNamed()
/// Get.offUntil()	Navigator.pushAndRemoveUntil()
/// Get.offNamedUntil()	Navigator.pushNamedAndRemoveUntil()
/// Get.offAndToNamed()	Navigator.popAndPushNamed()
/// Get.removeRoute()	Navigator.removeRoutes()
/// Get.offAllNamed()	Navigator.pushNamedAndRemoveUntil()
/// Get.close()	Navigator.popUntil()
@Riverpod(keepAlive: true)
class AppStateNotifier extends _$AppStateNotifier {
  @override
  AppState build() {
    // TODO(NMC): Implement return the stored one
    return AppState.initial();
  }

  /// Get.toNamed()	Navigator.pushNamed()
  void navigateToRoute(String route, {dynamic arguments, bool isRootNavigator = true}) {
    logInfo(info: 'Moving to $route');
    updateCurrentRoute(route);
    // Get.toNamed(route, arguments: arguments);
    // Get.to(route, arguments: arguments);
    Navigator.of(navigatorKey.currentContext!, rootNavigator: false)
        .pushNamed(route, arguments: arguments);
  }

  /// To navigate to a new screen and option to go back
  /// Get.to()	Navigator.push()
  void navigateToScreen(Widget screen, {Bundle? bundle, bool isRootNavigator = true}) {
    final route = '/${screen.runtimeType}';
    logInfo(
        info:
            'Navigating to: ${toCamelCase((() => screen).runtimeType.toString())}');
    updateCurrentRoute(toCamelCase(route));
    Get.to(/*() =>*/ screen, arguments: bundle, fullscreenDialog: true);
  }

  /// To navigate to a new screen and option to go back
  void navigateBack() {
    logInfo(
        info:
            'Navigating Back: from ${Get.currentRoute} to-> ${Get.previousRoute}');
    updateCurrentRoute(Get.previousRoute);
    Get.back();
  }

  /// To go to the next screen and no option to go back to the previous screen
  /// (for use in SplashScreens, login screens and etc.)
  /// startActivity()
  /// Get.off()	Navigator.pushReplacement()
  void gotToNextScreen(Widget screen, {Bundle? bundle}) {
    final route = '/${screen.runtimeType}';
    logInfo(info: 'Navigating off to: ${toCamelCase(route)}');
    logInfo(
        info:
            'Navigating off to: ${toCamelCase((() => screen).runtimeType.toString())}');
    updateCurrentRoute(toCamelCase(route));
    Get.off(/*() => */ screen, arguments: bundle);
  }

  /// To go to the next screen and no option to go back to the previous screen
  /// (for use in SplashScreens, login screens and etc.)
  /// startActivity()
  /// Get.off()	Navigator.pushReplacement()
  void gotToNextRoute(String route, {dynamic arguments}) {
    logInfo(info: 'Navigating off to: $route');
    updateCurrentRoute(toCamelCase(route));
    Get.off(route, arguments: arguments);
  }

  /// To go to the next screen and cancel all previous routes (useful in shopping carts, polls, and tests)
  /// Get.offAllNamed()	Navigator.pushNamedAndRemoveUntil()
  void gotToNextScreenPopAll(Widget screen, {dynamic bundle, bool isRootNavigator = true}) {
    final route = '/${screen.runtimeType}';
    logInfo(info: 'Navigating off pop all to: ${toCamelCase(route)}');
    updateCurrentRoute(toCamelCase(route));
    Get.offAll(() => screen, arguments: bundle);
  }

  /// To go to the next screen and cancel all previous routes (useful in shopping carts, polls, and tests)
  /// Get.offAllNamed()	Navigator.pushNamedAndRemoveUntil()
  void gotToNextRoutePopAll(String route, {dynamic arguments}) {
    logInfo(info: 'Navigating off pop all to: ${toCamelCase(route)}');
    updateCurrentRoute(toCamelCase(route));
    Get.offAll(route, arguments: arguments);
  }

  void updateCurrentRoute(String route) {
    state = state.copyWith.uiState(
        previousRoute: state.uiState.currentRoute,
        currentRoute: route,
        lastActivityAt: DateTime.now().millisecondsSinceEpoch);
  }

  void viewMainScreen({bool addDelay = false}) {
    // if (state.uiState.currentRoute == LoginScreen.route) {
    //   updateCurrentRoute('DashboardScreenBuilder.route');
    // }
    // while (navigatorKey.currentState?.canPop() ?? false) {
    //   navigatorKey.currentState!.pop();
    // }
    // WidgetsBinding.instance.addPostFrameCallback((duration) {
    //   navigatorKey.currentState!.pushNamed('MainScreen.route');
    // });
    updateCurrentRoute(MainScreen.route);

    if (state.prefState.isMobile) {
      navigatorKey.currentState!.pushNamedAndRemoveUntil(
          MainScreen.route, (Route<dynamic> route) => false);
    }
  }

  // void viewDashboard() {
  //   updateCurrentRoute('DashboardScreenBuilder.route');

  //   if (state.prefState.isMobile) {
  //     navigatorKey.currentState!.pushNamedAndRemoveUntil(
  //         'DashboardScreenBuilder.route', (Route<dynamic> route) => false);
  //   }
  // }

  void viewSettings() {}
}
