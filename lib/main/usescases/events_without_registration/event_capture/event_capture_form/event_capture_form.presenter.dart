// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../../../../core/di/providers.dart';
// import '../../../../../core/event/event_editable_status.dart';
// import '../../../../../form/data/data_integrity_check_result.dart';
// import '../event_capture_contract.dart';
// import 'event_capture_form_view.dart';

// class EventCaptureFormPresenter {
//   EventCaptureFormPresenter(this.ref,
//       {required this.view,
//       required this.eventUid,
//       required this.activityPresenter});
//   EventCaptureFormPresenterRef ref;
//   // AutoDisposeRef ref;
//   EventCaptureFormView view;
//   final String eventUid;
//   final EventCapturePresenter activityPresenter;

//   void handleDataIntegrityResult(DataIntegrityCheckResult result) {
//     result.map(
//       fieldsWithErrorResult: (result) => activityPresenter.attemptFinish(
//           result.canComplete,
//           result.onCompleteMessage,
//           result.fieldUidErrorList,
//           result.mandatoryFields,
//           result.warningFields),
//       fieldsWithWarningResult: (result) => activityPresenter.attemptFinish(
//           result.canComplete,
//           result.onCompleteMessage,
//           [],
//           {},
//           result.fieldUidWarningList),
//       missingMandatoryResult: (result) => activityPresenter.attemptFinish(
//           result.canComplete,
//           result.onCompleteMessage,
//           result.errorFields,
//           result.mandatoryFields,
//           result.warningFields),
//       successfulResult: (result) => activityPresenter.attemptFinish(
//           result.canComplete, result.onCompleteMessage, [], {}, []),
//       notSavedResult: (result) {},
//     );
//   }

//   Future<void> showOrHideSaveButton() async {
//     final EventEditableStatus isEditable =
//         await ref.read(eventServiceProvider).getEditableStatus(eventUid ?? '');
//     // d2.eventModule().eventService().getEditableStatus(eventUid = eventUid).blockingGet()
//     if (isEditable is Editable) {
//       view.showSaveButton();
//     } else {
//       view.hideSaveButton();
//     }
//   }
// }
