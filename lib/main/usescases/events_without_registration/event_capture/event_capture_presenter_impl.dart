import 'package:d2_remote/modules/activity_management/activity/entities/activity.entity.dart';
import 'package:d2_remote/modules/metadata/organisation_unit/entities/organisation_unit.entity.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import '../../../../commons/date/field_with_issue.dart';
import '../../../../commons/prefs/preference.dart';
import '../../../../commons/prefs/preference_provider.dart';
import '../../../../core/event/event_status.dart';
import '../../../../form/data/data_integrity_check_result.dart';
import 'di/event_capture_module.dart';
import 'di/event_capture_providers.dart';
import 'domain/configure_event_completion_dialog.dart';
import 'event_capture_contract.dart';
import 'model/event_completion_dialog.dart';

class EventCapturePresenterImpl implements EventCapturePresenter {
  EventCapturePresenterImpl(this.ref,
      {required this.eventCaptureRepository,
      required this.eventUid,
      required this.view,
      // this.isExpired = false,
      required this.preferences,
      required this.configureEventCompletionDialog}) {
    init();
  }

  final EventCapturePresenterRef ref;

  final EventCaptureRepository eventCaptureRepository;
  final String eventUid;

  // final SchedulerProvider schedulerProvider;
  final EventCaptureView view;

  // bool isExpired;
  // final PublishProcessor<Unit> notesCounterProcessor;
  final PreferenceProvider preferences;
  final ConfigureEventCompletionDialog configureEventCompletionDialog;

  @override
  void init() {
    eventCaptureRepository.eventIntegrityCheck().then((check) {
      if (!check) {
        view.showEventIntegrityAlert();
      }
    });

    String? programStageName;
    String? eventDate;
    OrganisationUnit? orgUnit;
    Activity? activity;

    Future.wait<void>([
      eventCaptureRepository
          .programStageName()
          .then((result) => programStageName = result),
      eventCaptureRepository.eventDate().then((result) => eventDate = result),
      eventCaptureRepository.orgUnit().then((result) => orgUnit = result),
      eventCaptureRepository.activity().then((result) => activity = result),
    ]).then((value) {
      preferences.setValue(CURRENT_ORG_UNIT, orgUnit?.id);
      Future(() => view.renderInitialInfo(
          stageName: programStageName,
          eventDate: eventDate,
          orgUnit: orgUnit,
          activity: activity));
    });

    _checkExpiration();
  }

  Future<void> _checkExpiration() async {
    if ((await _getEventStatus()) == EventStatus.COMPLETED) {
      eventCaptureRepository.isCompletedEventExpired(eventUid).then(
          (hasExpiredResult) async => ref
              .read(hasExpiredProvider.notifier)
              .setValue(hasExpiredResult &&
                  !(await eventCaptureRepository.isEventEditable(eventUid))));
    } else {
      ref
          .read(hasExpiredProvider.notifier)
          .setValue(!(await eventCaptureRepository.isEventEditable(eventUid)));
    }
  }

  @override
  void onBackClick() {
    view.goBack();
  }

  @override
  Future<void> attemptFinish(
      bool canComplete,
      String? onCompleteMessage,
      IList<FieldWithIssue> errorFields,
      IMap<String, String> emptyMandatoryFields,
      IList<FieldWithIssue> warningFields) async {
    if (errorFields.isNotEmpty) {
      view.showErrorSnackBar();
    }

    final EventStatus eventStatus = await _getEventStatus();
    if (eventStatus != EventStatus.ACTIVE) {
      _setUpActionByStatus(eventStatus);
    } else {
      final EventCompletionDialog eventCompletionDialog =
          configureEventCompletionDialog.call(errorFields, emptyMandatoryFields,
              warningFields, canComplete, onCompleteMessage);

      view.showCompleteActions(
          canComplete && await eventCaptureRepository.isEnrollmentOpen(),
          emptyMandatoryFields,
          eventCompletionDialog);
    }

    view.showNavigationBar();
  }

  Future<void> _setUpActionByStatus(EventStatus eventStatus) async {
    switch (eventStatus) {
      case EventStatus.COMPLETED:
        if (!ref.read(hasExpiredProvider) &&
            !(await eventCaptureRepository.isEnrollmentCancelled()))
          view.saveAndFinish();
        else
          view.finishDataEntry();
        break;
      case EventStatus.OVERDUE:
        view.attemptToSkip();
        break;
      case EventStatus.SKIPPED:
        view.attemptToReschedule();
        break;
      default:
        break;
    }
  }

  @override
  Future<bool> isEnrollmentOpen() {
    return eventCaptureRepository.isEnrollmentOpen();
  }

  @override
  Future<void> completeEvent(bool addNew) {
    return eventCaptureRepository.completeEvent().then((value) {
      if (addNew)
        view.restartDataEntry();
      else {
        preferences.setValue(PREF_COMPLETED_EVENT, eventUid);
        view.finishDataEntry();
      }
    });
  }

  @override
  Future<void> deleteEvent() {
    return eventCaptureRepository.deleteEvent().then((result) {
      if (result) {
        view.showSnackBar('event_was_deleted');
      }
    }).then((value) => view.finishDataEntry());
  }

  @override
  void skipEvent() {
    eventCaptureRepository
        .updateEventStatus(EventStatus.SKIPPED)
        .then((result) => view.showSnackBar('event_was_skipped'))
        .then((value) => view.finishDataEntry());
  }

  @override
  void rescheduleEvent(DateTime time) {
    eventCaptureRepository
        .rescheduleEvent(time)
        .then((value) => view.finishDataEntry());
  }

  @override
  Future<bool> canWrite() {
    return eventCaptureRepository.getAccessDataWrite();
  }

  @override
  bool hasExpired() {
    return ref.read(hasExpiredProvider);
  }

  @override
  void displayMessage(String message) {
    view.displayMessage(message);
  }

  @override
  void initNoteCounter() {
    /// TODO(NMC): implement initNoteCounter
    // if (!notesCounterProcessor.hasSubscribers()) {
    //     compositeDisposable.add(
    //             notesCounterProcessor.startWith(new Unit())
    //                     .flatMapSingle(unit ->
    //                             eventCaptureRepository.getNoteCount())
    //                     .subscribeOn(schedulerProvider.io())
    //                     .observeOn(schedulerProvider.ui())
    //                     .subscribe(
    //                             view::updateNoteBadge,
    //                             Timber::e
    //                     )
    //     );
    // } else {
    //     notesCounterProcessor.onNext(new Unit());
    // }
  }

  @override
  void refreshTabCounters() {
    initNoteCounter();
  }

  /// Not used
  @override
  void hideProgress() {
    // view.hideProgress();
  }

  /// Not used
  @override
  void showProgress() {
    // view.showProgress();
  }

  @override
  Future<bool> getCompletionPercentageVisibility() {
    return eventCaptureRepository.showCompletionPercentage();
  }

  Future<EventStatus> _getEventStatus() {
    return eventCaptureRepository.eventStatus();
  }

  @override
  void updatePercentage(double primaryValue) {
    // view.updatePercentage(primaryValue);
  }

  /// By NMC: From EventCaptureFormPresenter
  @override
  void handleDataIntegrityResult(DataIntegrityCheckResult result) {
    result.map(
      fieldsWithErrorResult: (result) => attemptFinish(
          result.canComplete,
          result.onCompleteMessage,
          result.fieldUidErrorList,
          result.mandatoryFields,
          result.warningFields),
      fieldsWithWarningResult: (result) => attemptFinish(
          result.canComplete,
          result.onCompleteMessage,
          IList([]),
          IMap({}),
          result.fieldUidWarningList),
      missingMandatoryResult: (result) => attemptFinish(
          result.canComplete,
          result.onCompleteMessage,
          result.errorFields,
          result.mandatoryFields,
          result.warningFields),
      successfulResult: (result) => attemptFinish(result.canComplete,
          result.onCompleteMessage, IList([]), IMap({}), IList([])),
      notSavedResult: (result) {},
    );
  }

// /// By NMC: From EventCaptureFormPresenter
// @override
// Future<void> showOrHideSaveButton() async {
//   final EventEditableStatus isEditable =
//       await ref.read(eventServiceProvider).getEditableStatus(eventUid);
//   if (isEditable is Editable) {
//     view.showSaveButton();
//   } else {
//     view.hideSaveButton();
//   }
// }
}
