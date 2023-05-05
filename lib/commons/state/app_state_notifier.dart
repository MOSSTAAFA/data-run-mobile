import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../main.dart';
import '../../main/usescases/bundle/bundle.dart';
import '../../utils/mass_utils/strings.dart';
import 'app_state.dart';

part 'app_state_notifier.g.dart';

@Riverpod(keepAlive: true)
class AppStateNotifier extends _$AppStateNotifier {
  @override
  AppState build() {
    // TODO(NMC): Implement return the stored one
    return AppState.initial();
  }

  void navigateToRoute(String route, {Bundle? bundle}) {
    updateCurrentRoute(route);
    Get.toNamed(route, arguments: bundle);
  }

  /// To navigate to a new screen and option to go back
  void navigateToScreen(Widget screen, {Bundle? bundle}) {
    updateCurrentRoute(toCamelCase('$runtimeType'));
    Get.to(() => screen, arguments: bundle);
  }

  /// To go to the next screen and no option to go back to the previous screen (for use in SplashScreens, login screens and etc.)
  /// startActivity()
  void gotToNextScreen(Widget screen, {Bundle? bundle}) {
    updateCurrentRoute(toCamelCase('$runtimeType'));
    Get.off(() => screen, arguments: bundle);
  }

  /// To go to the next screen and cancel all previous routes (useful in shopping carts, polls, and tests)
  void gotToNextScreenPopAll(Widget screen, {Bundle? bundle}) {
    updateCurrentRoute(toCamelCase('$runtimeType'));
    Get.offAll(() => screen, arguments: bundle);
  }

  void updateCurrentRoute(String route) {
    state = state.copyWith.uiState(
        previousRoute: state.uiState.currentRoute,
        currentRoute: route,
        lastActivityAt: DateTime.now().millisecondsSinceEpoch);
  }

  void viewMainScreen({bool addDelay = false}) {
    if (state.uiState.currentRoute == 'LoginScreen.route') {
      updateCurrentRoute('DashboardScreenBuilder.route');
    }
    while (navigatorKey.currentState?.canPop() ?? false) {
      navigatorKey.currentState!.pop();
    }
    WidgetsBinding.instance.addPostFrameCallback((duration) {
      navigatorKey.currentState!.pushNamed('MainScreen.route');
    });
  }

  void viewDashboard() {
    updateCurrentRoute('DashboardScreenBuilder.route');

    if (state.prefState.isMobile) {
      navigatorKey.currentState!.pushNamedAndRemoveUntil(
          'DashboardScreenBuilder.route', (Route<dynamic> route) => false);
    }
  }

  void viewSettings() {}
}
