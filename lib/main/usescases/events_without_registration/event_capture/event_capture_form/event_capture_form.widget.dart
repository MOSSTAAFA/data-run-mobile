import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../../../../../commons/constants.dart';
import '../../../../../commons/extensions/dynamic_extensions.dart';
import '../../../../../form/data/data_integrity_check_result.dart';
import '../../../../../form/model/form_repository_records.dart';
import '../../../../../form/ui/di/form_view_controllers.dart';
import '../../../../../form/ui/form_view.widget.dart';
import '../../../bundle/bundle.dart';
import '../event_capture_screen.widget.dart';
import 'event_capture_form.presenter.dart';
import 'event_capture_form_view.dart';

/// One of the Tabs in [EventCapturePagerWidget]
/// Holds the formView of the dataEntry Tab
/// ProgramStage selection screen has no layout and calls individual items layout for each program stage using
/// [ProgramStageSelectionAdapter] in [ProgramStageSelectionActivity]
class EventCaptureForm extends ConsumerStatefulWidget {
  const EventCaptureForm({
    super.key,
    this.showProgress,
    this.hideProgress,
    this.hideNavigationBar,
    this.updatePercentage,
    this.handleDataIntegrityResult,
    // required this.formView,
  });

  // final FormView formView;

  /// replacing EventCapture Activity -> EventCaptureScreen the container of
  /// Taps screen
  final VoidCallback? showProgress;
  final VoidCallback? hideProgress;
  final VoidCallback? hideNavigationBar;
  final void Function(double percentage)? updatePercentage;

  // to call on Activity -> EventCaptureScreen
  final void Function(DataIntegrityCheckResult result)?
      handleDataIntegrityResult;

  @override
  ConsumerState<EventCaptureForm> createState() => _EventCaptureFormState();
}

class _EventCaptureFormState extends ConsumerState<EventCaptureForm>
    with EventCaptureFormView {
  late final EventRecords eventRecords;
  late final EventCaptureFormPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        formRepositoryRecordsInstanceProvider.overrideWith((ref) => eventRecords)
      ],
      child: FormViewWidget(
        records: eventRecords,
        onLoadingListener: (loading) {
          if (loading) {
            widget.showProgress?.call();
          } else {
            widget.hideProgress?.call();
          }
        },
        onFocused: () => widget.hideNavigationBar?.call(),
        onPercentageUpdate: (percentage) =>
            widget.updatePercentage?.call(percentage),
        onDataIntegrityCheck: (result) =>
            widget.handleDataIntegrityResult?.call(result),
      ),
    );
  }

  @override
  void initState() {
    final Bundle bundle = Get.arguments as Bundle;
    final eventUid = bundle.getString(EVENT_UID);
    eventRecords = EventRecords(eventUid);
    presenter = ref.read(eventCaptureFormPresenterProvider(this));
    presenter.showOrHideSaveButton();
    super.initState();
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
    // ref.read(itemsProvider.notifier).loadData();
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
}
