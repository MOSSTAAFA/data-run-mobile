import 'package:d2_remote/modules/activity_management/activity/entities/activity.entity.dart';
import 'package:d2_remote/modules/metadata/organisation_unit/entities/organisation_unit.entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../../../../commons/constants.dart';
import '../../../../commons/custom_widgets/navigationbar/navigation_tab_bar_view.widget.dart';
import '../../../../commons/extensions/standard_extensions.dart';
import '../../../../commons/utils/view_actions.dart';
import '../../../../form/model/form_repository_records.dart';
import '../../../../form/ui/components/linear_loading_indicator.dart';
import '../../../../form/ui/form_view.widget.dart';
import '../../../../form/ui/form_view_model.dart';
import '../../../l10n/app_localizations.dart';
import '../../../utils/event_mode.dart';
import '../../bundle/bundle.dart';
import '../../program_event_detail/di/program_event_detail_providers.dart';
import '../../program_event_detail/program_event_detail_view_model.dart';
import '../event_details/ui/event_details.widget.dart';
import 'di/event_capture_module.dart';
import 'di/event_capture_providers.dart';
import 'event_capture_contract.dart';
import 'event_capture_form/on_edition_listener.dart';
import 'event_page_configurator.dart';
import 'model/event_completion_dialog.dart';

/// EventCaptureActivity && EventCapturePagerAdapter
/// && EventCaptureFormFragment
class EventCaptureScreen extends ConsumerStatefulWidget {
  const EventCaptureScreen({
    super.key,
  });

  @override
  ConsumerState<EventCaptureScreen> createState() => _EventCaptureScreenState();
}

class _EventCaptureScreenState extends ConsumerState<EventCaptureScreen>
    with EventCaptureView {
  late final EventMode? eventMode;
  late final String? activityUid;
  late final String? programUid;
  late final String? eventUid;
  late final EventCapturePresenter presenter;
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
          Consumer(
            // This builder will only get called when the
            // programEventDetailModelProvider.progress is updated.
            builder: (context, ref, child) => LinearLoadingIndicator(
              isLoading: ref.watch(programEventDetailModelProvider
                  .select((value) => value.progress)),
            ),
          ),
          NavigationTabBarView(
            onPositionChange: (position) {
              if (position == ViewAction.details &&
                  eventMode != EventMode.NEW) {
                _showSyncButton();
              } else {
                _hideSyncButton();
              }
            },
            appBarTitle: Text(ref.watch(eventDataStringProvider)),
            appBarActions: [
              Consumer(
                builder: (context, ref, child) {
                  return ref.watch(syncButtonVisibilityProvider)
                      ? IconButton(
                          icon: const Icon(Icons.sync),
                          tooltip: localization.lookup('sync'),
                          onPressed: () => showSyncDialog(),
                        )
                      : const SizedBox();
                },
              ),
            ],
            actionButtonBuilder: (context, viewAction) => FloatingActionButton(
              heroTag: ViewAction.data_entry.name,
              tooltip: localization.lookup('save'),
              onPressed: () {},
              child: const Icon(Icons.save),
            ),
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
              ViewAction.details: () => const EventDetailsView(),
              ViewAction.data_entry: () => FormView(
                    // needToForceUpdate: needToForceUpdate,
                    records: EventRecords(
                        ref.read(bundleObjectProvider).getString(EVENT_UID)!),
                    // onItemChangeListener: onItemChangeListener,
                    onLoadingListener: (loading) {
                      if (loading) {
                        showProgress();
                      } else {
                        hideProgress();
                      }
                    },
                    onFocused: () => hideNavigationBar(),
                    // onFinishDataEntry: onFinishDataEntry,
                    // onActivityForResult: onActivityForResult,
                    onPercentageUpdate: (percentage) =>
                        updatePercentage(percentage),
                    onDataIntegrityCheck: (result) =>
                        presenter.handleDataIntegrityResult(result),
                    // onFieldItemsRendered: onFieldItemsRendered,
                    // onSavePicture: onSavePicture,
                    // resultDialogUiProvider: resultDialogUiProvider
                  ),
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
    showProgress();
    super.initState();
    // final Bundle bundle = Get.arguments as Bundle;
    presenter = ref.read(eventCapturePresenterProvider(this));
    final Bundle bundle = ref.read(bundleObjectProvider);
    eventMode = bundle.getString(EVENT_MODE)?.toEventMode;
    activityUid = bundle.getString(ACTIVITY_UID);
    programUid = bundle.getString(PROGRAM_UID);
    eventUid = bundle.getString(EVENT_UID);
  }

  @override
  void goBack() {
    final OnEditionListener? onEditionListener =
        ref.read(onEditionEventCaptureListenerProvider);
    if (onEditionListener != null) {
      onEditionListener.onEditionListener?.call();
    }
    _finishEditMode();
  }

  void _finishEditMode() {
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
    // TODO: implement finishDataEntry
    // Intent intent = new Intent();
    //     if (isEventCompleted)
    //         intent.putExtra(Constants.EVENT_UID, getIntent().getStringExtra(Constants.EVENT_UID));
    //     setResult(RESULT_OK, intent);
    // finish();
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
  void hideNavigationBar() {
    // TODO: implement hideNavigationBar
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
    Future(() => null);
    // TODO: implement showEventIntegrityAlert
  }

  @override
  void showProgress() {
    Future(() =>
        ref.read(progressVisibilityProvider.notifier).update((_) => true));
  }

  @override
  void hideProgress() {
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

  @override
  void hideSaveButton() {
    ref.read(saveButtonVisibilityProvider.notifier).update((state) => false);
  }

  @override
  void showSaveButton() {
    ref.read(saveButtonVisibilityProvider.notifier).update((state) => true);
  }

  @override
  void onReopen() {
    // TODO: implement onReopen
    // formView.reload();
    ref.read(itemsProvider.notifier).loadData();
  }

  @override
  void performSaveClick() {
    // TODO: implement performSaveClick
    // formView.onSaveClick()
    /// in form View it's just:
    /// onEditionFinish()
    /// viewModel.saveDataEntry()
  }

  @override
  void onEditionListener() {
    // TODO: implement performSaveClick
    // formView.onEditionFinish();
    // in form View it's just: binding.recyclerView.requestFocus();
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
