import 'package:d2_remote/modules/activity_management/activity/entities/activity.entity.dart';
import 'package:d2_remote/modules/metadata/organisation_unit/entities/organisation_unit.entity.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../../../../commons/constants.dart';
import '../../../../commons/custom_widgets/mixins/keyboard_manager.dart';
import '../../../../commons/custom_widgets/nav_bar/fab_bottom_app_bar.dart';
import '../../../../commons/extensions/dynamic_extensions.dart';
import '../../../../form/data/data_integrity_check_result.dart';
import '../../../../form/ui/components/linear_loading_indicator.dart';
import '../../../l10n/app_localizations.dart';
import '../../../utils/custom_views/form_bottom_dialog.dart';
import '../../../utils/event_mode.dart';
import '../../bundle/bundle.dart';
import '../../general/view_base.dart';
import 'di/event_capture_module.dart';
import 'di/event_capture_screen_state_notifier.dart';
import 'event_capture_contract.dart';
import 'model/event_completion_dialog.dart';
import 'widgets/event_capture_app_bar.widget.dart';
import 'widgets/event_capture_app_bar_notifier.dart';
import 'widgets/event_capture_tab_views.widget.dart';

/// EventCaptureActivity && EventCapturePagerAdapter
/// && EventCaptureFormFragment
///
/// ProgramStage selection screen has no layout and calls individual items layout for each program stage using
/// [ProgramStageSelectionAdapter] in [ProgramStageSelectionActivity]
class EventCaptureScreen extends ConsumerStatefulWidget {
  const EventCaptureScreen({
    super.key,
  });

  static const String route = '/EventCaptureScreen';

  @override
  ConsumerState<EventCaptureScreen> createState() => _EventCaptureScreenState();
}

class _EventCaptureScreenState extends ConsumerState<EventCaptureScreen>
    with EventCaptureView, ViewBase, KeyboardManager {
  late final EventMode? eventMode;
  late final String? activityUid;
  late final String? programUid;
  late final String? eventUid;
  late final EventCapturePresenter presenter;
  bool isEventCompleted = false;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalization.of(context)!;
    debugPrint('build(): $runtimeType');
    // final List<Widget> _widgets = <Widget>[
    //   const EventDetailsScreen(),
    //   EventCaptureForm(
    //     showProgress: showProgress,
    //     hideProgress: hideProgress,
    //     hideNavigationBar: hideNavigationBar,
    //     updatePercentage: updatePercentage,
    //     handleDataIntegrityResult: presenter.handleDataIntegrityResult,
    //   ),
    //   const Text('Unimplemented Screen!'),
    // ];

    return Material(
      child: Scaffold(
        appBar: EventCaptureAppBar(
          onSyncButtonPressed: showSyncDialog,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Don't depend on a provider of a parent widget
              /// make depending on this or children widgets' providers
              Consumer(
                builder: (context, ref, child) {
                  final isLoading = ref.watch(
                      eventCaptureScreenStateNotifierProvider
                          .select((notifier) => notifier.progress));

                  return isLoading
                      ? LinearLoadingIndicator(
                          isLoading: isLoading,
                        )
                      : Container(
                          height: 10,
                          color: Colors.grey,
                        );
                },
              ),
              const Expanded(
                child: EventCaptureTabViews(
                    // onHandleDataIntegrityResult:
                    //     presenter.handleDataIntegrityResult,
                    ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: FABBottomAppBar(
          // centerItemText: 'A',
          notchedShape: const CircularNotchedRectangle(),
          onTabSelected: (index) =>
              ref.read(selectedIndexProvider.notifier).update((state) => index),

          items: [
            MenuItem(iconData: Icons.menu, text: 'This'),
            MenuItem(iconData: Icons.layers, text: 'Is'),
            MenuItem(iconData: Icons.dashboard, text: 'Bottom'),
            // MenuItem(iconData: Icons.info, text: 'Bar'),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {},
        //   tooltip: 'Save',
        //   elevation: 2.0,
        //   child: const Icon(Icons.save),
        // ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // showProgress();
    final Bundle bundle = Get.arguments as Bundle;
    eventMode = bundle.getString(EVENT_MODE)?.toEventMode;
    activityUid = bundle.getString(ACTIVITY_UID);
    programUid = bundle.getString(PROGRAM_UID);
    eventUid = bundle.getString(EVENT_UID);
    presenter = ref.read(eventCapturePresenterProvider(this));
    ref.listenManual<DataIntegrityCheckResult?>(
        eventCaptureScreenStateNotifierProvider
            .select((value) => value.dataIntegrityResult), (previous, next) {
      if (next != null) {
        presenter.handleDataIntegrityResult(next);
      }
    });
  }

  @override
  void goBack() {
    // widget.onEditionListener?.call();
    logInfo(info: 'goBack()');
    _finishEditMode();
  }

  void _finishEditMode() {
    logInfo(info: '_finishEditMode()');
    // if (ref.read(navigationBarVisibilityProvider)) {
    //   showNavigationBar();
    // } else {
    //   _attemptFinish();
    // }
  }

  @override
  void showNavigationBar() {
    // ref.read(navigationBarVisibilityProvider.notifier).update((state) => true);
  }

  void _attemptFinish() {
    logInfo(info: '_attemptFinish()');
    // TODO: implement _attemptFinish
    // if (eventMode == EventMode.NEW) {
    //     BottomSheetDialogUiModel bottomSheetDialogUiModel = new BottomSheetDialogUiModel(
    //             getString(R.string.title_delete_go_back),
    //             getString(R.string.discard_go_back),
    //             R.drawable.ic_alert,
    //             Collections.emptyList(),
    //             new DialogButtonStyle.MainButton(R.string.keep_editing),
    //             new DialogButtonStyle.DiscardButton()
    //     );
    //     BottomSheetDialog dialog = new BottomSheetDialog(
    //             bottomSheetDialogUiModel,
    //             () -> Unit.INSTANCE,
    //             () -> {
    //                 presenter.deleteEvent();
    //                 return Unit.INSTANCE;
    //             }
    //     );
    //     dialog.show(getSupportFragmentManager(), AlertBottomDialog.class.getSimpleName());
    // } else {
    //     finishDataEntry();
    // }
  }

  @override
  void finishDataEntry() {
    logInfo(info: 'finishDataEntry()');
    // TODO: implement finishDataEntry
    // Intent intent = new Intent();
    //     if (isEventCompleted)
    //         intent.putExtra(Constants.EVENT_UID, getIntent().getStringExtra(Constants.EVENT_UID));
    //     setResult(RESULT_OK, intent);
    // finish();
  }

  @override
  void attemptToReschedule() {
    logInfo(info: 'attemptToReschedule()');
    // TODO: implement attemptToReschedule
  }

  @override
  void attemptToSkip() {
    logInfo(info: 'attemptToSkip()');
    // TODO: implement attemptToSkip
  }

  @override
  void hideNavigationBar() {
    logInfo(info: 'hideNavigationBar()');
    // TODO: implement hideNavigationBar
  }

  @override
  void restartDataEntry() {
    logInfo(info: 'restartDataEntry()');
    // TODO: implement restartDataEntry
  }

  @override
  void saveAndFinish() {
    logInfo(info: 'saveAndFinish()');
    displayMessage('string.saved');
    _setAction(ActionType.FINISH);
  }

  void _setAction(ActionType actionType) {
    switch (actionType) {
      case ActionType.COMPLETE:
        isEventCompleted = true;
        presenter.completeEvent(false);
        break;
      case ActionType.COMPLETE_ADD_NEW:
        presenter.completeEvent(true);
        break;
      case ActionType.FINISH_ADD_NEW:
        restartDataEntry();
        break;
      case ActionType.SKIP:
        presenter.skipEvent();
        break;
      case ActionType.RESCHEDULE:
        break;
      case ActionType.CHECK_FIELDS:
        break;
      case ActionType.FINISH:
      default:
        finishDataEntry();
        break;
    }
  }

  @override
  void showCompleteActions(
      bool canComplete,
      IMap<String, String> emptyMandatoryFields,
      EventCompletionDialog eventCompletionDialog) {
    logInfo(info: 'showCompleteActions()');
    // TODO: implement showCompleteActions
    Get.snackbar(
      AppLocalization.of(context)!.lookup('showCompleteActions'),
      AppLocalization.of(context)!.lookup('showCompleteActions'),
      icon: const Icon(Icons.warning),
      shouldIconPulse: true,
      // onTap: () {},
      // barBlur: 20,
      isDismissible: true,
    );
  }

  @override
  void showErrorSnackBar() {
    Get.snackbar(
      AppLocalization.of(context)!.lookup('error'),
      AppLocalization.of(context)!.lookup('fix_error'),
      icon: const Icon(Icons.error),
      shouldIconPulse: true,
      // onTap: () {},
      // barBlur: 20,
      isDismissible: true,
    );
  }

  @override
  void showEventIntegrityAlert() {
    logInfo(info: 'showEventIntegrityAlert()');
    Future(() => null);
    // TODO: implement showEventIntegrityAlert
  }

  /// moved to [EventCaptureTabViews]
  @override
  void showProgress() {
    // ref.read(eventCaptureScreenStateNotifierProvider.notifier).showProgress();
  }

  /// moved to [EventCaptureTabViews]
  @override
  void hideProgress() {
    // ref.read(eventCaptureScreenStateNotifierProvider.notifier).hideProgress();
  }

  @override
  void showSnackBar(String message) {
    Get.snackbar(
      '',
      AppLocalization.of(context)!.lookup(message),
      // icon: const Icon(Icons.error),
      // shouldIconPulse: true,
      // onTap: () {},
      barBlur: 20,
      isDismissible: true,
    );
  }

  @override
  void updateNoteBadge(int numberOfNotes) {
    ref.read(noteBadgeProvider.notifier).update((_) => numberOfNotes);
  }

  @override
  void updatePercentage(double primaryValue) {
    // logInfo(info: 'updatePercentage()');
    // ref.read(percentageProvider.notifier).update((_) => primaryValue);
  }

  @override
  void renderInitialInfo(
      {String? stageName,
      String? eventDate,
      OrganisationUnit? orgUnit,
      Activity? activity}) {
    // ref.read(programStageNameProvider.notifier).update((_) => stageName ?? '');

    // ref
    //     .read(activityNameProvider.notifier)
    //     .update((_) => activity?.displayName ?? activity?.name ?? '');

    ref
        .read(eventCaptureAppBarNotifierProvider.notifier)
        .update((state) => state.copyWith(
            eventDate: eventDate,
            orgUnitName: orgUnit?.displayName ?? orgUnit?.name ?? '',
            // TODO(NMC): provide activity name, when adding activity
            activityName: ''));
  }

  void _showSyncButton() {
    // ref.read(syncButtonVisibilityProvider.notifier).update((state) => true);
  }

  void _hideSyncButton() {
    // ref.read(syncButtonVisibilityProvider.notifier).update((state) => false);
  }
}

final selectedIndexProvider = StateProvider.autoDispose<int>((ref) => 0);

// final progressVisibilityProvider =
//     StateProvider.autoDispose<bool>((ref) => false);
// final programStageNameProvider = StateProvider.autoDispose<String>((ref) => '');
// final activityNameProvider = StateProvider.autoDispose<String>((ref) => '');

// final eventDateProvider = StateProvider.autoDispose<String>((ref) => '');
// final orgUnitNameProvider = StateProvider.autoDispose<String>((ref) => '');
// final eventDataStringProvider = Provider.autoDispose<String>((ref) {
//   final eventDate = ref.watch(eventDateProvider);
//   final orgUnitName = ref.watch(orgUnitNameProvider);
//
//   return '$eventDate | $orgUnitName';
// });

final noteBadgeProvider = StateProvider.autoDispose<int>((ref) => 0);
// final percentageProvider = StateProvider.autoDispose<double>((ref) => 0);

// final syncButtonVisibilityProvider =
//     StateProvider.autoDispose<bool>((ref) => false);

// final navigationBarVisibilityProvider =
//     StateProvider.autoDispose<bool>((ref) => true);
//
// final saveButtonVisibilityProvider =
//     StateProvider.autoDispose<bool>((ref) => true);
