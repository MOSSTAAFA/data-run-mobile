import 'package:get/get.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../commons/constants.dart';
import '../../../../../core/di/providers.dart';
import '../../../../../core/event/event_editable_status.dart';
import '../../../bundle/bundle.dart';
import 'event_capture_form_view.dart';

part 'event_capture_form.presenter.g.dart';

@riverpod
EventCaptureFormPresenter eventCaptureFormPresenter(
    EventCaptureFormPresenterRef ref, EventCaptureFormView view) {
  final Bundle bundle = Get.arguments as Bundle;
  return EventCaptureFormPresenter(
    ref,
    eventUid: bundle.getString(EVENT_UID)!,
    view: view,
  );
}

class EventCaptureFormPresenter {
  EventCaptureFormPresenter(
    this.ref, {
    required this.view,
    required this.eventUid,
  });

  EventCaptureFormPresenterRef ref;

  // AutoDisposeRef ref;
  EventCaptureFormView view;
  final String eventUid;

  /// Moved to [EventCapturePresenterImpl]
  // void handleDataIntegrityResult(DataIntegrityCheckResult result) {
  //   final activityPresenter = ref.read(eventCapturePresenterProvider);
  //   result.map(
  //     fieldsWithErrorResult: (result) => activityPresenter.attemptFinish(
  //         result.canComplete,
  //         result.onCompleteMessage,
  //         result.fieldUidErrorList,
  //         result.mandatoryFields,
  //         result.warningFields),
  //     fieldsWithWarningResult: (result) => activityPresenter.attemptFinish(
  //         result.canComplete,
  //         result.onCompleteMessage,
  //         [],
  //         {},
  //         result.fieldUidWarningList),
  //     missingMandatoryResult: (result) => activityPresenter.attemptFinish(
  //         result.canComplete,
  //         result.onCompleteMessage,
  //         result.errorFields,
  //         result.mandatoryFields,
  //         result.warningFields),
  //     successfulResult: (result) => activityPresenter.attemptFinish(
  //         result.canComplete, result.onCompleteMessage, [], {}, []),
  //     notSavedResult: (result) {},
  //   );
  // }

  Future<void> showOrHideSaveButton() async {
    final EventEditableStatus isEditable =
        await ref.read(eventServiceProvider).getEditableStatus(eventUid);
    // d2.eventModule().eventService().getEditableStatus(eventUid = eventUid).blockingGet()
    if (isEditable is Editable) {
      view.showSaveButton();
    } else {
      view.hideSaveButton();
    }
  }
}
