import 'package:d2_remote/modules/metadata/program/entities/program.entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../commons/constants.dart';
import '../../../commons/data/event_creation_type.dart';
import '../../../commons/helpers/collections.dart';
import '../../../commons/state/app_state_notifier.dart';
import '../../utils/event_mode.dart';
import '../bundle/bundle.dart';
import '../events_without_registration/event_capture/event_capture_screen.widget.dart';
import '../events_without_registration/event_initial/event_initial_screen.widget.dart';
import 'event_list/event_list_screen.widget.dart';
import 'program_event_detail_view_model.dart';
import 'program_event_page_configurator.dart';
import '../../../commons/custom_widgets/navigationbar/navigation_tab_bar_view.widget.dart';
import '../../../commons/extensions/standard_extensions.dart';
import '../../../commons/utils/view_actions.dart';
import '../../../form/ui/components/linear_loading_indicator.dart';
import '../../l10n/app_localizations.dart';
import 'di/program_event_detail_providers.dart';
import 'event_map/event_map.widget.dart';
import 'event_table/event_table.widget.dart';
import 'program_event_detail_contract.dart';

import '../general/view_base.dart';

/// ProgramEventDetailActivity

const String EXTRA_PROGRAM_UID = 'PROGRAM_UID';

class ProgramEventDetailScreen extends ConsumerStatefulWidget {
  const ProgramEventDetailScreen({super.key});

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

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalization.of(context)!;

    return ProviderScope(
      overrides: [
        pageConfiguratorProvider
            .overrideWith((_) => ProgramEventPageConfigurator())
      ],
      child: Column(
        children: [
          Consumer(
            // This builder will only get called when the
            // programEventDetailModelProvider.progress is updated.
            builder: (context, ref, child) => LinearLoadingIndicator(
              isLoading: ref.watch(programEventDetailModelProvider
                  .select((value) => value.progress)),
            ),
          ),
          NavigationTabBarView(
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
        ],
      ),
    );
  }

  @override
  void initState() {
    presenter = ref.read(programEventDetailPresenterProvider(this));
    // programUid = (Get.arguments as Bundle).getString(EXTRA_PROGRAM_UID);
    programUid = ref.read(bundleObjectProvider).getString(EXTRA_PROGRAM_UID)!;
    activityUid = ref.read(bundleObjectProvider).getString(ACTIVITY_UID);
    _setObservers();
    super.initState();
  }

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

    // final Bundle bundle = Bundle();
    Bundle bundle = ref.read(bundleObjectProvider);

    bundle = bundle.putString(PROGRAM_UID, programUid);

    bundle = bundle.putString(EVENT_UID, eventId);
    bundle = bundle.putString(ORG_UNIT, orgUnit);
    // NMC
    bundle = bundle.putString(EVENT_MODE, EventMode.CHECK.name);
    bundle = bundle.putString(ACTIVITY_UID, activityUid);

    // set to the  Bundle activityUid
    ref.read(bundleObjectProvider.notifier).setValue(bundle);

    ref
        .read(appStateNotifierProvider.notifier)
        .navigateToScreen(const EventCaptureScreen(), bundle: bundle);
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
    Future(() => ref
        .read(programNameProvider.notifier)
        .update((state) => program.displayName ?? program.name ?? ''));
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
    Bundle bundle = ref.read(bundleObjectProvider);

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
    ref.read(bundleObjectProvider.notifier).setValue(bundle);

    ref
        .read(appStateNotifierProvider.notifier)
        .navigateToScreen(const EventInitialScreen(), bundle: bundle);
  }

  @override
  void updateFilters(int totalFilters) {
    // TODO: implement updateFilters
  }
}

final programNameProvider = StateProvider.autoDispose<String>((ref) => '');
