import 'package:d2_remote/modules/activity_management/activity/entities/activity.entity.dart';
import 'package:d2_remote/modules/metadata/organisation_unit/entities/organisation_unit.entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../../../../commons/constants.dart';
import '../../../../commons/custom_widgets/mixins/keyboard_manager.dart';
import '../../../../commons/custom_widgets/nav_bar/fab_bottom_app_bar.dart';
import '../../../../commons/custom_widgets/navigationbar/navigation_tab_bar_view.widget.dart';
import '../../../../commons/extensions/dynamic_extensions.dart';
import '../../../../commons/extensions/standard_extensions.dart';
import '../../../../commons/utils/view_actions.dart';
import '../../../../form/ui/components/linear_loading_indicator.dart';
import '../../../l10n/app_localizations.dart';
import '../../../utils/custom_views/form_bottom_dialog.dart';
import '../../../utils/event_mode.dart';
import '../../bundle/bundle.dart';
import '../../general/view_base.dart';
import '../../program_event_detail/program_event_detail_view_model.dart';
import '../../program_event_detail/program_event_page_configurator.dart';
import '../event_details/ui/event_details_screen.widget.dart';
import 'di/event_capture_module.dart';
import 'event_capture_contract.dart';
import 'event_capture_form/event_capture_form.widget.dart';
import 'event_page_configurator.dart';
import 'model/event_completion_dialog.dart';

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

  int _selectedIndex = 0;

  void _selectedTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalization.of(context)!;

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
        appBar: AppBar(
          centerTitle: false,
          title: Row(
            children: [
              Expanded(
                child: Text(ref.watch(eventDataStringProvider)),
              ),
            ],
          ),
          actions: /*ref.watch(navInfoNotifierProvider.select(
                  (value) => value.index == 0 && eventMode != EventMode.NEW))*/
              _selectedIndex == 0 && eventMode != EventMode.NEW
                  ? [
                      IconButton(
                        icon: const Icon(Icons.sync),
                        tooltip: localization.lookup('sync'),
                        onPressed: () => showSyncDialog(),
                      ),
                    ]
                  : null,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer(
                // This builder will only get called when the
                // programEventDetailModelProvider.progress is updated.
                builder: (context, ref, child) => LinearLoadingIndicator(
                  isLoading: ref.watch(programEventDetailModelProvider
                      .select((value) => value.progress)),
                  backgroundColor: Colors.grey,
                ),
              ),
              Expanded(
                child: IndexedStack(
                  index: _selectedIndex,
                  children: [
                    const EventDetailsScreen(),
                    EventCaptureForm(
                      // showProgress: showProgress,
                      // hideProgress: hideProgress,
                      // hideNavigationBar: hideNavigationBar,
                      // updatePercentage: updatePercentage,
                      handleDataIntegrityResult: (result) =>
                          presenter.handleDataIntegrityResult(result),
                    ),
                    const Text('Unimplemented Screen!')
                  ],
                ),
              ),
              // Consumer(
              //   builder: (context, ref, child) {
              //     // final selectedIndex = ref.watch(
              //     //     navInfoNotifierProvider.select((value) => value.index));
              //     return Expanded(
              //       child: when<int, Widget>(_selectedIndex, {
              //         0: () => const EventDetailsScreen(),
              //         1: () => EventCaptureForm(
              //               // showProgress: showProgress,
              //               // hideProgress: hideProgress,
              //               // hideNavigationBar: hideNavigationBar,
              //               // updatePercentage: updatePercentage,
              //               handleDataIntegrityResult: (result) =>
              //                   presenter.handleDataIntegrityResult(result),
              //             ),
              //       }).orElse(() => const Text('Unimplemented Screen!')),
              //     );
              //   },
              // ),
            ],
          ),
        ),
        bottomNavigationBar: FABBottomAppBar(
          // centerItemText: 'A',
          notchedShape: const CircularNotchedRectangle(),
          onTabSelected:
              (index) => /* ref
              .read(navInfoNotifierProvider.notifier)
              .selectTabIndex(index)*/
                  _selectedTab(index),
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
    // return ProviderScope(
    //   overrides: [
    //     pageConfiguratorProvider.overrideWith((_) => EventPageConfigurator()),
    //   ],
    //   child: Column(
    //     children: [
    //       Consumer(
    //         // This builder will only get called when the
    //         // programEventDetailModelProvider.progress is updated.
    //         builder: (context, ref, child) => LinearLoadingIndicator(
    //           isLoading: ref.watch(programEventDetailModelProvider
    //               .select((value) => value.progress)),
    //         ),
    //       ),
    //       Expanded(
    //         child: NavigationTabBarView(
    //           onPositionChange: (position) {
    //             if (position == ViewAction.details &&
    //                 eventMode != EventMode.NEW) {
    //               _showSyncButton();
    //             } else {
    //               _hideSyncButton();
    //             }
    //           },
    //           appBarTitle: Text(ref.watch(eventDataStringProvider)),
    //           appBarActions: [
    //             Consumer(
    //               builder: (context, ref, child) {
    //                 return ref.watch(syncButtonVisibilityProvider)
    //                     ? IconButton(
    //                         icon: const Icon(Icons.sync),
    //                         tooltip: localization.lookup('sync'),
    //                         onPressed: () => showSyncDialog(),
    //                       )
    //                     : const SizedBox();
    //               },
    //             ),
    //           ],
    //           actionButtonBuilder: (context, viewAction) =>
    //               FloatingActionButton(
    //             heroTag: ViewAction.data_entry.name,
    //             tooltip: localization.lookup('save'),
    //             onPressed: () {},
    //             child: const Icon(Icons.save),
    //           ),
    //           tabBuilder: (context, viewAction) {
    //             final name = localization.lookup(viewAction.name);
    //             return when(viewAction, {
    //               ViewAction.details: () => Tab(text: name),
    //               ViewAction.data_entry: () => Tab(text: name),
    //               ViewAction.notes: () => Tab(text: name),
    //               ViewAction.analytics: () => Tab(text: name),
    //               ViewAction.relationships: () => Tab(text: name),
    //             })!;
    //           },
    //           pageBuilder: (context, viewAction) =>
    //               when<ViewAction, Widget>(viewAction, {
    //             ViewAction.details: () => const EventDetailsScreen(),
    //             ViewAction.data_entry: () => EventCaptureForm(
    //                   // showProgress: showProgress,
    //                   // hideProgress: hideProgress,
    //                   // hideNavigationBar: hideNavigationBar,
    //                   // updatePercentage: updatePercentage,
    //                   handleDataIntegrityResult:
    //                       presenter.handleDataIntegrityResult,
    //                 ),
    //           }).orElse(() => const Center(
    //                     child: Text('Unimplemented Screen!'),
    //                   )),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }

  // Widget _buildFab() {
  //   return FloatingActionButton(
  //     onPressed: () {},
  //     tooltip: 'Save',
  //     elevation: 2.0,
  //     child: const Icon(Icons.save),
  //   );
  // }

  @override
  void initState() {
    showProgress();
    final Bundle bundle = Get.arguments as Bundle;
    eventMode = bundle.getString(EVENT_MODE)?.toEventMode;
    activityUid = bundle.getString(ACTIVITY_UID);
    programUid = bundle.getString(PROGRAM_UID);
    eventUid = bundle.getString(EVENT_UID);
    presenter = ref.read(eventCapturePresenterProvider(this));
    super.initState();
  }

  @override
  void goBack() {
    // widget.onEditionListener?.call();
    logInfo(info: 'goBack()');
    _finishEditMode();
  }

  void _finishEditMode() {
    logInfo(info: '_finishEditMode()');
    if (ref.read(navigationBarVisibilityProvider)) {
      showNavigationBar();
    } else {
      _attemptFinish();
    }
  }

  @override
  void showNavigationBar() {
    ref.read(navigationBarVisibilityProvider.notifier).update((state) => true);
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
      Map<String, String> emptyMandatoryFields,
      EventCompletionDialog eventCompletionDialog) {
    logInfo(info: 'showCompleteActions()');
    // TODO: implement showCompleteActions
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

  @override
  void showProgress() {
    logInfo(info: 'showProgress()');
    Future(() =>
        ref.read(progressVisibilityProvider.notifier).update((_) => true));
  }

  @override
  void hideProgress() {
    logInfo(info: 'hideProgress()');
    Future(() =>
        ref.read(progressVisibilityProvider.notifier).update((_) => false));
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
    Future(() =>
        ref.read(noteBadgeProvider.notifier).update((_) => numberOfNotes));
  }

  @override
  void updatePercentage(double primaryValue) {
    logInfo(info: 'updatePercentage()');
    Future(() =>
        ref.read(percentageProvider.notifier).update((_) => primaryValue));
  }

  @override
  void renderInitialInfo(
      {String? stageName,
      String? eventDate,
      OrganisationUnit? orgUnit,
      Activity? activity}) {
    ref.read(programStageNameProvider.notifier).update((_) => stageName ?? '');

    ref
        .read(activityNameProvider.notifier)
        .update((_) => activity?.displayName ?? activity?.name ?? '');

    ref.read(eventDateProvider.notifier).update((_) => eventDate ?? '');

    ref
        .read(orgUnitNameProvider.notifier)
        .update((_) => orgUnit?.displayName ?? orgUnit?.name ?? '');
  }

  void _showSyncButton() {
    ref.read(syncButtonVisibilityProvider.notifier).update((state) => true);
  }

  void _hideSyncButton() {
    ref.read(syncButtonVisibilityProvider.notifier).update((state) => false);
  }
}

final progressVisibilityProvider =
    StateProvider.autoDispose<bool>((ref) => false);
final programStageNameProvider = StateProvider.autoDispose<String>((ref) => '');
final activityNameProvider = StateProvider.autoDispose<String>((ref) => '');

final eventDateProvider = StateProvider.autoDispose<String>((ref) => '');
final orgUnitNameProvider = StateProvider.autoDispose<String>((ref) => '');
final eventDataStringProvider = Provider.autoDispose<String>((ref) {
  final eventDate = ref.watch(eventDateProvider);
  final orgUnitName = ref.watch(orgUnitNameProvider);

  return '$eventDate | $orgUnitName';
});

final noteBadgeProvider = StateProvider.autoDispose<int>((ref) => 0);
final percentageProvider = StateProvider.autoDispose<double>((ref) => 0);

final syncButtonVisibilityProvider =
    StateProvider.autoDispose<bool>((ref) => false);

final navigationBarVisibilityProvider =
    StateProvider.autoDispose<bool>((ref) => true);

final saveButtonVisibilityProvider =
    StateProvider.autoDispose<bool>((ref) => true);
