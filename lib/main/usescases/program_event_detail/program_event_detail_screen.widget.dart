import 'package:d2_remote/modules/metadata/program/entities/program.entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../../../commons/constants.dart';
import '../../../commons/custom_widgets/navigationbar/navigation_page_configurator.dart';
import '../../../commons/custom_widgets/navigationbar/navigation_tab_bar_view.widget.dart';
import '../../../commons/data/event_creation_type.dart';
import '../../../commons/extensions/standard_extensions.dart';
import '../../../commons/helpers/collections.dart';
import '../../../commons/state/app_state_notifier.dart';
import '../../../commons/utils/view_actions.dart';
import '../../../form/model/form_repository_records.dart';
import '../../../form/ui/components/linear_loading_indicator.dart';
import '../../../riverpod/use_on_init_hook.dart';
import '../../l10n/app_localizations.dart';
import '../../utils/event_mode.dart';
import '../bundle/bundle.dart';
import '../events_without_registration/event_capture/event_capture_screen.widget.dart';
import '../events_without_registration/event_initial/event_initial_screen.widget.dart';
import '../general/view_base.dart';
import 'event_list/event_list_screen.widget.dart';
import 'event_map/event_map.widget.dart';
import 'event_table/event_table.widget.dart';
import 'program_event_detail_contract.dart';
import 'program_event_detail_presenter.dart';
import 'program_event_detail_view_model.dart';
import 'program_event_page_configurator.dart';

final GlobalKey<NavigatorState> programNavigatorKey = GlobalKey<NavigatorState>();
/// ProgramEventDetailActivity
/// the screen that list the events of a particular program, navigated to from
/// Program list in the main page
///
/// ProgramStage selection screen has no layout and calls individual items layout for each program stage using
/// [ProgramStageSelectionAdapter] in [ProgramStageSelectionActivity]
const String EXTRA_PROGRAM_UID = 'PROGRAM_UID';

class ProgramEventDetailScreen extends ConsumerStatefulWidget {
  const ProgramEventDetailScreen({super.key});

  static const String route = '/ProgramEventDetailScreen';

  @override
  ConsumerState<ProgramEventDetailScreen> createState() =>
      _ProgramEventDetailScreenState();
}

class _ProgramEventDetailScreenState
    extends ConsumerState<ProgramEventDetailScreen>
    with ProgramEventDetailView, ViewBase {
  late final ProgramEventDetailPresenter presenter;
  late final String programUid;
  late final String? activityUid;
  final NavigationPageConfigurator _pageConfigurator =
      ProgramEventPageConfigurator();

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
            appBarTitle: Text(ref.watch(programNameProvider)),
            actionButtonBuilder: (context, viewAction) => FloatingActionButton(
              heroTag: ViewAction.list_view.name,
              child: const Icon(Icons.add),
              onPressed: () => startNewEvent(),
            ),
            tabBuilder: (context, viewAction) {
              final name = localization.lookup(viewAction.name);
              return when(viewAction, {
                ViewAction.list_view: () => Tab(text: name),
                ViewAction.table_view: () => Tab(text: name),
                ViewAction.map_view: () => Tab(text: name),
                ViewAction.analytics: () => Tab(text: name),
              })!;
            },
            pageBuilder: (context, viewAction) =>
                when<ViewAction, Widget>(viewAction, {
              ViewAction.list_view: () => const EventListScreen(),
              ViewAction.table_view: () => const EventTable(),
              ViewAction.map_view: () => const EventMap(),
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
    super.initState();
    presenter = ref.read(programEventDetailPresenterProvider(this));
    presenter.init();
    programUid = (Get.arguments as Bundle).getString(EXTRA_PROGRAM_UID)!;
    activityUid = (Get.arguments as Bundle).getString(ACTIVITY_UID);
    // programUid = ref.read(bundleObjectProvider).getString(EXTRA_PROGRAM_UID)!;
    // programUid = ref.read(bundleObjectProvider).getString(EXTRA_PROGRAM_UID)!;
    // activityUid = ref.read(bundleObjectProvider).getString(ACTIVITY_UID);
    _setObservers();
  }

  // @override
  // void didChangeDependencies() {
  //   presenter.init();
  //   super.didChangeDependencies();
  // }

  void _setObservers() {
    ref.listenManual<String?>(
        programEventDetailModelProvider
            .select((value) => value.eventSyncClicked),
        (previous, next) =>
            next?.let((eventUid) => presenter.onSyncIconClick(eventUid)));

    ref.listenManual<Pair<String, String>?>(
        programEventDetailModelProvider.select((value) => value.eventClicked),
        (previous, next) => next?.let((eventData) {
              navigateToEvent(eventData.first, eventData.second);
            }));
  }

  @override
  void hideFilters() {
    // TODO: implement hideFilters
  }

  @override
  void navigateToEvent(String eventId, String orgUnit) {
    ref.read(programEventDetailModelProvider.notifier).setUpdateEvent(eventId);
    // programEventsViewModel.setUpdateEvent(eventId);

    Bundle bundle = Bundle();
    // Bundle bundle = ref.read(bundleObjectProvider);

    bundle = bundle.putString(PROGRAM_UID, programUid);

    bundle = bundle.putString(EVENT_UID, eventId);
    bundle = bundle.putString(ORG_UNIT, orgUnit);
    // NMC
    bundle = bundle.putString(EVENT_MODE, EventMode.CHECK.name);
    bundle = bundle.putString(ACTIVITY_UID, activityUid);

    bundle = bundle.putObject(RECORDS, EventRecords(eventId));

    // set to the  Bundle activityUid
    // ref.read(bundleObjectProvider.notifier).setValue(bundle);

    // ref
    //     .read(appStateNotifierProvider.notifier)
    //     .navigateToScreen(const EventCaptureScreen(), bundle: bundle);
    ref
        .read(appStateNotifierProvider.notifier)
        .navigateToRoute(EventCaptureScreen.route, arguments: bundle);
  }

  @override
  void openOrgUnitTreeSelector() {
    // TODO: implement openOrgUnitTreeSelector
  }

  @override
  void renderError(String message) {
    // TODO: implement renderError
  }

  @override
  void setProgram(Program program) {
    useOnInit(() => ref
        .read(programNameProvider.notifier)
        .update((state) => program.displayName ?? program.name ?? ''));
    // Future(() => ref
    //     .read(programNameProvider.notifier)
    //     .update((state) => program.displayName ?? program.name ?? ''));
  }

  @override
  void setWritePermission(bool aBoolean) {
    // TODO: implement setWritePermission
  }

  @override
  void showCatOptComboDialog(String catComboUid) {
    // TODO: implement showCatOptComboDialog
  }

  @override
  void showFilterProgress() {
    ref.read(programEventDetailModelProvider.notifier).setProgress(true);
  }

  @override
  void showHideFilter() {
    // TODO: implement showHideFilter
  }

  @override
  Future<void> startNewEvent() async {
    // analyticsHelper().setEvent(AnalyticsConstants.CREATE_EVENT, AnalyticsConstants.DATA_CREATION, AnalyticsConstants.CREATE_EVENT);
    //     binding.addEventButton.setEnabled(false);
    //     Bundle bundle = EventInitialActivity.getBundle(programUid, null, EventCreationType.ADDNEW.name(),
    //             null, null, null, presenter.getStageUid(), null,
    //             0, null);
    //     startActivity(EventInitialActivity.class, bundle, false, false, null);
    // Bundle bundle = ref.read(bundleObjectProvider);
    Bundle bundle = Bundle();

    bundle = bundle.putString(ACTIVITY_UID, activityUid);

    bundle = bundle.putString(PROGRAM_UID, programUid);
    // bundle = bundle.putString(EVENT_UID, null);
    bundle =
        bundle.putString(EVENT_CREATION_TYPE, EventCreationType.ADDNEW.name);
    // bundle = bundle.putString(TRACKED_ENTITY_INSTANCE, null);
    // bundle.putString(ENROLLMENT_UID, null);
    // bundle = bundle.putString(ORG_UNIT, null);
    // bundle.putSerializable(EVENT_PERIOD_TYPE, eventPeriodType?.name);
    // bundle = bundle.putString(EVENT_PERIOD_TYPE, null);
    bundle = bundle.putString(PROGRAM_STAGE_UID, await presenter.getStageUid());
    bundle = bundle.putInt(EVENT_SCHEDULE_INTERVAL, 0);
    // bundle.putSerializable(ENROLLMENT_STATUS, enrollmentStatus?.name);
    // bundle = bundle.putString(ENROLLMENT_STATUS, null);
    // set to the  Bundle activityUid
    // ref.read(bundleObjectProvider.notifier).setValue(bundle);

    ref
        .read(appStateNotifierProvider.notifier)
        .navigateToRoute(EventInitialScreen.route, arguments: bundle);
  }

  @override
  void updateFilters(int totalFilters) {
    // TODO: implement updateFilters
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

final programNameProvider = StateProvider.autoDispose<String>((ref) => '');
