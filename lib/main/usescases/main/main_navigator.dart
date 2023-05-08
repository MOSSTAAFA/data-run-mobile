import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../commons/state/app_state.dart';
import '../../../commons/state/app_state_notifier.dart';
import '../../../commons/utils/view_actions.dart';
import '../general/view_abstract.dart';
import 'program/program_screen.widget.dart';

part 'main_navigator.g.dart';

enum MainScreenNavItem {
  PROGRAMS(
      'R.done_task',
      IListConst<ViewAction>(
          [])), //('R.done_task',  ViewAction.homeMenu().lock),
  VISUALIZATIONS('R.done_task',
      IListConst<ViewAction>([])), //(R.string.done_task, R.id.menu_home),
  QR('R.QR_SCANNER',
      IListConst<ViewAction>([])), //(R.QR_SCANNER, R.id.qr_scan),
  SETTINGS('R.SYNC_MANAGER',
      IListConst<ViewAction>([])), //(R.SYNC_MANAGER, R.id.sync_manager),
  TROUBLESHOOTING(
      'R.main_menu_troubleshooting',
      IListConst<ViewAction>(
          [])), //(R.main_menu_troubleshooting, R.id.menu_troubleshooting),
  JIRA('R.jira_report',
      IListConst<ViewAction>([])), //(R.jira_report, R.id.menu_jira),
  ABOUT('R.about', IListConst<ViewAction>([])); //(R.about, R.id.menu_about);

  const MainScreenNavItem(this.title, this.navViewActions);

  final String title;

  // final ViewAction navViewId;
  final IList<ViewAction> navViewActions;
}

@Riverpod(keepAlive: true)
MainNavigator mainNavigator(MainNavigatorRef ref) {
  final AppState state = ref.read(appStateNotifierProvider);
  // final uiState = ref.watch(appStateNotifierProvider.select((value) => value.uiState));
  // final prefState =ref.watch(appStateNotifierProvider.select((value) => value.prefState));
  final subRoute =
      '/${ref.watch(appStateNotifierProvider.select((value) => value.uiState.subRoute))}';
  String mainRoute =
      '/${ref.watch(appStateNotifierProvider.select((value) => value.uiState.mainRoute))}';

  return MainNavigator(ref, mainRoute, subRoute);
}

class MainNavigator {
  MainNavigator(
    this.ref,
    this.mainRoute,
    this.subRoute,
    /* this.onScreenChanged */
  );

  // final void Function(
  //         String titleRes, bool showFilterButton, bool showBottomNavigation)
  //     onScreenChanged;
  final MainNavigatorRef ref;
  final String mainRoute;
  final String subRoute;
  MainScreenNavItem? currentScreen;
  ViewAbstract? currentFragment;

  bool isHome() => isPrograms() || isVisualizations();

  bool isPrograms() => currentScreen == MainScreenNavItem.PROGRAMS;

  bool isVisualizations() => currentScreen == MainScreenNavItem.VISUALIZATIONS;

  ProgramViewScreen? getCurrentIfProgram() {
    if (currentFragment != null && currentFragment is ProgramViewScreen) {
      return currentFragment! as ProgramViewScreen;
    }
  }

  String? currentScreenName() => currentScreen?.name;

  /// current More Actions
  IList<ViewAction> currentNavigationViewItemId(String screenName) =>
      MainScreenNavItem.values.byName(screenName).navViewActions;

  void openHome(/* NavigationBottomBar navigationBottomBar */) {
    final AppState state = ref.read(appStateNotifierProvider);
    final uiState = state.uiState;
    final prefState = state.prefState;
    final subRoute = '/${uiState.subRoute}';
    String mainRoute = '/${uiState.mainRoute}';

    // when(ref.read(AppStateNotifierProvider), branches)

    // when {
    //     isVisualizations() -> navigationBottomBar.selectedItemId = R.id.navigation_analytics
    //     else -> navigationBottomBar.selectedItemId = R.id.navigation_programs
    // }
  }

// fun openPrograms() {
//     val programFragment = ProgramFragment()
//     val sharedView = if (isVisualizations()) {
//         (currentFragment as GroupAnalyticsFragment).sharedView()
//     } else {
//         null
//     }
//     if (sharedView != null) {
//         programFragment.sharedElementEnterTransition = ChangeBounds()
//         programFragment.sharedElementReturnTransition = ChangeBounds()
//     }
//     beginTransaction(
//         ProgramFragment(), MainScreenNavItem.PROGRAMS, sharedView
//     )
// }

// fun restoreScreen(screenToRestoreName: String, languageSelectorOpened: Boolean = false) {
//     when (MainScreenNavItem.valueOf(screenToRestoreName)) {
//         MainScreenNavItem.PROGRAMS -> openPrograms()
//         MainScreenNavItem.VISUALIZATIONS -> openVisualizations()
//         MainScreenNavItem.QR -> openQR()
//         MainScreenNavItem.SETTINGS -> openSettings()
//         MainScreenNavItem.JIRA -> openJira()
//         MainScreenNavItem.ABOUT -> openAbout()
//         MainScreenNavItem.TROUBLESHOOTING -> openTroubleShooting(languageSelectorOpened)
//     }
// }
}
