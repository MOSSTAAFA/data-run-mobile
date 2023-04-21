import 'package:d2_remote/modules/activity_management/activity/entities/activity.entity.dart';
import 'package:d2_remote/modules/metadata/organisation_unit/entities/organisation_unit.entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../../../../commons/constants.dart';
import '../../../../commons/custom_widgets/navigationbar/navigation_tab_bar_view.widget.dart';
import '../../../../commons/extensions/standard_extensions.dart';
import '../../../../commons/utils/view_actions.dart';
import '../../../../form/ui/components/linear_loading_indicator.dart';
import '../../../l10n/app_localizations.dart';
import '../../../utils/event_mode.dart';
import '../../bundle/bundle.dart';
import '../../program_event_detail/di/program_event_detail_providers.dart';
import '../../program_event_detail/program_event_detail_view_model.dart';
import '../../program_event_detail/widgets/progress_bar.dart';
import 'event_capture_contract.dart';
import 'event_page_configurator.dart';
import 'model/event_completion_dialog.dart';

/// EventCaptureActivity
class EventCaptureScreen extends ConsumerStatefulWidget {
  const EventCaptureScreen({
    super.key,
    // this.isEventCompleted = false,
    // required this.eventMode,
    // required this.activityUid,
    // required this.programUid,
    // required this.eventUid,
    // this.onEditionListener,
    // required this.adapter
  });

  static const String route = '/eventCaptureActivity';

  // final bool isEventCompleted;
  // final EventMode eventMode;
  // final String activityUid;
  // final String programUid;
  // final String eventUid;
  // LiveData<bool> relationshipMapButton = new MutableLiveData<>(false);
  // final void Function()? onEditionListener;
  // final EventCaptureTabs adapter;

  @override
  ConsumerState<EventCaptureScreen> createState() => _EventCaptureScreenState();
}

class _EventCaptureScreenState extends ConsumerState<EventCaptureScreen>
    with EventCaptureView {
  late final EventMode? eventMode;
  late final String? activityUid;
  late final String? programUid;
  late final String? eventUid;
  bool isEventCompleted = false;
  @override
  Widget build(BuildContext context) {
    final localization = AppLocalization.of(context)!;

    return ProviderScope(
      overrides: [
        pageConfiguratorProvider.overrideWith((_) => EventPageConfigurator())
      ],
      child: Column(
        children: [
          const ProgressBar(),
          NavigationTabBarView(
            actionButtonBuilder: (context, viewAction) => when(viewAction, {
              ViewAction.data_entry: () => FloatingActionButton(
                    heroTag: ViewAction.data_entry.name,
                    child: const Icon(Icons.add),
                    onPressed: () {},
                  ),
              ViewAction.notes: () => FloatingActionButton(
                    heroTag: ViewAction.notes.name,
                    child: const Icon(Icons.add),
                    onPressed: () {},
                  ),
            }),
            // onPressedActionButton: (viewAction) => when(viewAction, {
            //   [ViewAction.data_entry, ViewAction.notes]: () {},
            // }),
            tabBuilder: (context, viewAction) {
              final name = localization.lookup(viewAction.name);
              return when(viewAction, {
                ViewAction.details: () => Tab(text: name),
                ViewAction.data_entry: () => Tab(text: name),
                ViewAction.notes: () => Tab(text: name),
                ViewAction.analytics: () => Tab(text: name),
                ViewAction.relationships: () => Tab(text: name),
              })!;
            },
            pageBuilder: (context, viewAction) =>
                when<ViewAction, Widget>(viewAction, {
              ViewAction.details: () => throw UnimplementedError(),
              ViewAction.data_entry: () => throw UnimplementedError(),
              ViewAction.notes: () => throw UnimplementedError(),
              // ViewAction.relationships: () => const Center(
              //       child: Text('Unimplemented'),
              //     ),
              // ViewAction.analytics: () => const Center(
              //       child: Text('Unimplemented yet!'),
              //     ),
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
    super.initState();
    // final Bundle bundle = Get.arguments as Bundle;
    final Bundle bundle = ref.read(bundleObjectProvider);
    eventMode = bundle.getString(EVENT_MODE)?.toEventMode;
    activityUid = bundle.getString(ACTIVITY_UID);
    programUid = bundle.getString(PROGRAM_UID);
    eventUid = bundle.getString(EVENT_UID);
  }

  @override
  void attemptToReschedule() {
    // TODO: implement attemptToReschedule
  }

  @override
  void attemptToSkip() {
    // TODO: implement attemptToSkip
  }

  @override
  void finishDataEntry() {
    // TODO: implement finishDataEntry
  }

  @override
  void goBack() {
    // TODO: implement goBack
  }

  @override
  void hideNavigationBar() {
    // TODO: implement hideNavigationBar
  }

  @override
  void hideProgress() {
    // TODO: implement hideProgress
  }

  @override
  void restartDataEntry() {
    // TODO: implement restartDataEntry
  }

  @override
  void saveAndFinish() {
    // TODO: implement saveAndFinish
  }

  @override
  void showCompleteActions(
      bool canComplete,
      Map<String, String> emptyMandatoryFields,
      EventCompletionDialog eventCompletionDialog) {
    // TODO: implement showCompleteActions
  }

  @override
  void showErrorSnackBar() {
    // TODO: implement showErrorSnackBar
  }

  @override
  void showEventIntegrityAlert() {
    // TODO: implement showEventIntegrityAlert
  }

  @override
  void showNavigationBar() {
    // TODO: implement showNavigationBar
  }

  @override
  void showProgress() {
    // TODO: implement showProgress
  }

  @override
  void showSnackBar(String message) {
    // TODO: implement showSnackBar
  }

  @override
  void updateNoteBadge(int numberOfNotes) {
    // TODO: implement updateNoteBadge
  }

  @override
  void updatePercentage(double primaryValue) {
    // TODO: implement updatePercentage
  }

  @override
  void renderInitialInfo(
      {String? stageName,
      String? eventDate,
      OrganisationUnit? orgUnit,
      Activity? activity}) {
    // TODO: implement renderInitialInfo
  }
}
