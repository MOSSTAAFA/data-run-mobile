import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../commons/custom_widgets/navigationbar/navigation_page_configurator.dart';
import '../../../commons/custom_widgets/navigationbar/navigation_tab_bar_view.widget.dart';
import '../../../commons/extensions/standard_extensions.dart';
import '../../../commons/state/app_state_notifier.dart';
import '../../../commons/utils/view_actions.dart';
import '../../../form/ui/components/linear_loading_indicator.dart';
import '../../data/service/sync_status_controller.dart';
import '../../l10n/app_localizations.dart';
import '../general/view_base.dart';
import '../login/login_screen.widget.dart';
import '../program_event_detail/program_event_detail_view_model.dart';
import 'home_page_configurator.dart';
import 'main_navigator.dart';
import 'main_presenter.dart';
import 'main_view.dart';
import 'program/program_screen.widget.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen(
      {super.key,
      this.initScreen,
      this.launchDataSync = false,
      this.forceToNotSynced = false});

  static const String route = '/MainScreen';

  final bool forceToNotSynced;

  final MainScreenNavItem? initScreen;
  final bool launchDataSync;

  // final OpenIdSession.LogOutReason? logOutReason;

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen>
    with MainView, ViewBase {
  late final MainPresenter presenter;
  final NavigationPageConfigurator _pageConfigurator = HomePageConfigurator();

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalization.of(context)!;

    return Column(
      children: [
        Consumer(
          // This builder will only get called when the
          // programEventDetailModelProvider.progress is updated.
          builder: (context, ref, child) => LinearLoadingIndicator(
            isLoading: ref.watch(programEventDetailModelProvider
                .select((value) => value.progress)),
          ),
        ),
        Expanded(
          child: NavigationTabBarView(
            pageConfigurator: _pageConfigurator,
            // actionButtonBuilder: (context, viewAction) => FloatingActionButton(
            //   heroTag: ViewAction.list_view.name,
            //   child: const Icon(Icons.add),
            //   onPressed: () => startNewEvent(),
            // ),
            // appBarTitle: Text(ref.watch(eventDataStringProvider)),
            // appBarActions: [
            //   Consumer(
            //     builder: (context, ref, child) {
            //       return ref.watch(syncButtonVisibilityProvider)
            //           ? IconButton(
            //               icon: const Icon(Icons.sync),
            //               tooltip: localization.lookup('sync'),
            //               onPressed: () => showSyncDialog(),
            //             )
            //           : const SizedBox();
            //     },
            //   ),
            // ],
            tabBuilder: (context, viewAction) {
              final name = localization.lookup(viewAction.name);
              return when(viewAction, {
                ViewAction.list_view: () => Tab(text: name),
                ViewAction.programs: () => Tab(text: name),
                ViewAction.table_view: () => Tab(text: name),
                ViewAction.map_view: () => Tab(text: name),
                ViewAction.analytics: () => Tab(text: name),
              })!;
            },
            pageBuilder: (context, viewAction) =>
                when<ViewAction, Widget>(viewAction, {
              ViewAction.programs: () => const ProgramViewScreen(),
              // ViewAction.list_view: () => const ProgramViewScreen(),
              // ViewAction.table_view: () => const EventTable(),
              // ViewAction.map_view: () => const EventMap(),
            }).orElse(() => const Center(
                      child: Text('Unimplemented Screen!'),
                    )),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    presenter = ref.read(mainPresenterProvider(this));

    ref.listenManual<bool?>(
        syncStatusControllerInstanceProvider.select((syncStatusController) =>
            syncStatusController.syncStatusData.running), (previous, next) {
      if (next ?? false) {
        // setFilterButtonVisibility(false);
        // setBottomNavigationVisibility(false);
      } else {
        // setFilterButtonVisibility(true);
        // setBottomNavigationVisibility(true);
        presenter.onDataSuccess();
      }
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    presenter.init();
    presenter.wasSyncAlreadyDone().then((alreadyDone) {
      if (!alreadyDone) {
        presenter.launchInitialDataSync();
      }
    });
    super.didChangeDependencies();
  }

  @override
  void cancelNotifications() {
    // TODO: implement cancelNotifications
  }

  @override
  void changeFragment(int id) {
    // TODO: implement changeFragment
  }

  @override
  void goToHome() {
    // TODO: implement goToHome
  }

  @override
  void goToLogin(int accountsCount, {bool isDeletion = false}) {
    ref
        .read(appStateNotifierProvider.notifier)
        .gotToNextScreenPopAll(LoginScreen(
          accountsCount: accountsCount,
          isDeletion: isDeletion,
        ));
  }

  @override
  bool hasToNotSync() {
    return widget.forceToNotSynced;
  }

  @override
  void hideFilters() {
    // TODO: implement hideFilters
  }

  @override
  File? obtainFileView() {
    // TODO: implement obtainFileView
    throw UnimplementedError();
  }

  @override
  void onLockClick() {
    // TODO: implement onLockClick
  }

  @override
  void openDrawer(int gravity) {
    // TODO: implement openDrawer
  }

  @override
  void renderUsername(String username) {
    // TODO: implement renderUsername
  }

  @override
  void showGranularSync() {
    // TODO: implement showGranularSync
  }

  @override
  void showHideFilter() {
    // TODO: implement showHideFilter
  }

  @override
  void showProgressDeleteNotification() {
    // TODO: implement showProgressDeleteNotification
  }

  @override
  void updateFilters(int totalFilters) {
    // TODO: implement updateFilters
  }
}
