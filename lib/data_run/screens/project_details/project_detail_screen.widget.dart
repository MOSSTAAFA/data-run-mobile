import 'package:d2_remote/modules/datarun/common/standard_extensions.dart';
import 'package:d2_remote/modules/metadatarun/project/entities/d_project.entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:mass_pro/commons/custom_widgets/navigationbar/navigation_page_configurator.dart';
import 'package:mass_pro/commons/custom_widgets/navigationbar/navigation_tab_bar_view.widget.dart';
import 'package:mass_pro/commons/data_run/utils/view_actions.dart';
import 'package:mass_pro/data_run/screens/general/view_base.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_deck/project_detail_deck.widget.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_page_configurator.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_presenter.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_screen_view.dart';
import 'package:mass_pro/data_run/utils/screens_constants.dart';
import 'package:mass_pro/main/data/service/sync_status_controller.dart';
import 'package:mass_pro/main/l10n/app_localizations.dart';
import 'package:mass_pro/main/usescases/bundle/bundle.dart';
import 'package:mass_pro/riverpod/use_on_init_hook.dart';

/// Project Details screen Listing what a Certain
/// Project contains when a project is clicked
class ProjectDetailScreenWidget extends ConsumerStatefulWidget {
  const ProjectDetailScreenWidget(
      {super.key, this.launchDataSync = false, this.forceToNotSynced = false});

  static const String route = '/project-detail-screen-widget';

  final bool forceToNotSynced;

  final bool launchDataSync;

  // final OpenIdSession.LogOutReason? logOutReason;

  @override
  ConsumerState<ProjectDetailScreenWidget> createState() =>
      _ProjectDetailScreenWidgetState();
}

class _ProjectDetailScreenWidgetState
    extends ConsumerState<ProjectDetailScreenWidget>
    with ProjectDetailScreenView, ViewBase {
  late final ProjectDetailPresenter presenter;
  late final String? projectUid;
  late final String? activityUid;
  final NavigationPageConfigurator _pageConfigurator =
      ProjectDetailPageConfigurator();

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalization.of(context)!;

    return Column(
      children: [
        // Consumer(
        //   // This builder will only get called when the
        //   // programEventDetailModelProvider.progress is updated.
        //   builder: (context, ref, child) => LinearLoadingIndicator(
        //     isLoading: ref.watch(programEventDetailModelProvider
        //         .select((value) => value.progress)),
        //   ),
        // ),
        Expanded(
          child: NavigationTabBarView(
            appBarTitle: Text(ref.watch(projectNameProvider)),
            pageConfigurator: _pageConfigurator,
            // actionButtonBuilder: (context, viewAction) => FloatingActionButton(
            //   heroTag: ViewAction.list_view.name,
            //   child: const Icon(Icons.add),
            //   onPressed: () => startNewEvent(),
            // ),
            // appBarTitle: Text(ref.watch(eventDataStringProvider)),
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
              ViewAction.programs: () => const ProjectDetailDeckWidget(),
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
    presenter = ref.read(projectDetailPresenterProvider(this));
    projectUid = (Get.arguments as Bundle).getString(EXTRA_PROJECT_UID)!;
    presenter.init();
    ref.listenManual<bool?>(
        syncStatusControllerInstanceProvider.select((syncStatusController) =>
            syncStatusController.syncStatusData.running), (previous, next) {
      if (next ?? false) {
        // setFilterButtonVisibility(false);
        // setBottomNavigationVisibility(false);
      } else {
        // setFilterButtonVisibility(true);
        // setBottomNavigationVisibility(true);
        // presenter.onDataSuccess();
      }
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // presenter.wasSyncAlreadyDone().then((alreadyDone) {
    //   if (!alreadyDone) {
    //     presenter.launchInitialDataSync();
    //   }
    // });
    super.didChangeDependencies();
  }

  @override
  void navigateToActivity(String eventId) {
    // ref.read(programEventDetailModelProvider.notifier).setUpdateEvent(eventId);
    // programEventsViewModel.setUpdateEvent(eventId);

    Bundle bundle = Bundle();
    // Bundle bundle = ref.read(bundleObjectProvider);
    //
    // bundle = bundle.putString(PROGRAM_UID, projectUid);
    //
    // bundle = bundle.putString(EVENT_UID, eventId);
    // bundle = bundle.putString(ORG_UNIT, orgUnit);
    // // NMC
    // bundle = bundle.putString(EVENT_MODE, EventMode.CHECK.name);
    // bundle = bundle.putString(ACTIVITY_UID, activityUid);
    //
    // bundle = bundle.putObject(RECORDS, EventRecords(eventId));

    // set to the  Bundle activityUid
    // ref.read(bundleObjectProvider.notifier).setValue(bundle);

    // ref
    //     .read(appStateNotifierProvider.notifier)
    //     .navigateToScreen(const EventCaptureScreen(), bundle: bundle);
    // ref
    //     .read(appStateNotifierProvider.notifier)
    //     .navigateToRoute(EventCaptureScreen.route, arguments: bundle);
  }

  @override
  void goToHome() {
    // TODO: implement goToHome
  }

  @override
  bool hasToNotSync() {
    return widget.forceToNotSynced;
  }

  @override
  void onLockClick() {
    // TODO: implement onLockClick
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
  void setProject(DProject project) {
    useOnInit(() => ref
        .read(projectNameProvider.notifier)
        .update((state) => project.displayName ?? project.name ?? ''));
    // Future(() => ref
    //     .read(programNameProvider.notifier)
    //     .update((state) => program.displayName ?? program.name ?? ''));
  }
}

final projectNameProvider = StateProvider.autoDispose<String>((ref) => '');
