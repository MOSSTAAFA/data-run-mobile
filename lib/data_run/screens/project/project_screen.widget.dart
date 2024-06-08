import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/commons/custom_widgets/navigationbar/navigation_page_configurator.dart';
import 'package:mass_pro/commons/custom_widgets/navigationbar/navigation_tab_bar_view.widget.dart';
import 'package:mass_pro/commons/data_run/utils/view_actions.dart';
import 'package:mass_pro/commons/extensions/standard_extensions.dart';
import 'package:mass_pro/commons/state/app_state_notifier.dart';
import 'package:mass_pro/data_run/screens/general/view_base.dart';
import 'package:mass_pro/data_run/screens/project/project_deck/project_deck.widget.dart';
import 'package:mass_pro/data_run/screens/project/project_page_configurator.dart';
import 'package:mass_pro/data_run/screens/project/project_presenter.dart';
import 'package:mass_pro/data_run/screens/project/project_screen_view.dart';
import 'package:mass_pro/form/ui/components/linear_loading_indicator.dart';
import 'package:mass_pro/main/data/service/sync_status_controller.dart';
import 'package:mass_pro/main/l10n/app_localizations.dart';
import 'package:mass_pro/main/usescases/login/login_screen.widget.dart';
import 'package:mass_pro/main/usescases/program_event_detail/program_event_detail_view_model.dart';

const String EXTRA_PROJECT_UID = 'PROGRAM_UID';

/// Project Details screen Listing what a Certain
/// Project contains when a project is clicked
class ProjectScreenWidget extends ConsumerStatefulWidget {
  const ProjectScreenWidget(
      {super.key, this.launchDataSync = false, this.forceToNotSynced = false});

  static const String route = '/ProjectScreen';

  final bool forceToNotSynced;

  final bool launchDataSync;

  // final OpenIdSession.LogOutReason? logOutReason;

  @override
  ConsumerState<ProjectScreenWidget> createState() =>
      _ProjectScreenWidgetState();
}

class _ProjectScreenWidgetState extends ConsumerState<ProjectScreenWidget>
    with ProjectScreenView, ViewBase {
  late final ProjectPresenter presenter;
  final NavigationPageConfigurator _pageConfigurator =
      ProjectPageConfigurator();

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
            appBarActions: [
              Consumer(
                builder: (context, ref, child) {
                  return IconButton(
                    icon: const Icon(Icons.logout_rounded),
                    tooltip: localization.lookup('sync'),
                    onPressed: () => presenter.logOut(),
                  );
                },
              ),
            ],
            tabBuilder: (context, viewAction) {
              final name = localization.lookup(viewAction.name);
              return when(viewAction, {
                ///project tab
                ViewAction.list_view: () => Tab(text: name),

                /// Assignments, or Targets Tab
                ViewAction.programs: () => Tab(text: name),

                /// Analytics Tab
                ViewAction.table_view: () => Tab(text: name),

                /// Notification Tab
                ViewAction.map_view: () => Tab(text: name),
                ViewAction.analytics: () => Tab(text: name),
              })!;
            },
            pageBuilder: (context, viewAction) =>
                when<ViewAction, Widget>(viewAction, {
              ViewAction.programs: () => const ProjectDeckWidget(),
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
    presenter = ref.read(projectPresenterProvider(this));

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
