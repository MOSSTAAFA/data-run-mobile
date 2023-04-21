import 'package:d2_remote/modules/activity_management/activity/entities/activity.entity.dart';
import 'package:d2_remote/modules/metadata/organisation_unit/entities/organisation_unit.entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../commons/date/field_with_issue.dart';
import '../../../../commons/prefs/preference.dart';
import '../../../../commons/prefs/preference_provider.dart';
import '../../../../core/event/event_status.dart';
import 'di/event_capture_providers.dart';
import 'domain/configure_event_completion_dialog.dart';
import 'event_capture_contract.dart';
import 'model/event_completion_dialog.dart';

class EventCapturePresenterImpl implements EventCapturePresenter {
  EventCapturePresenterImpl(this.ref,
      {required this.eventCaptureRepository,
      required this.eventUid,
      required this.view,
      this.isExpired = false,
      required this.preferences,
      required this.configureEventCompletionDialog});

  final AutoDisposeRef ref;

  /* private */ final EventCaptureRepository eventCaptureRepository;
  /* private */ final String eventUid;
  // /* private */ final SchedulerProvider schedulerProvider;
  /* private */ final EventCaptureView view;
  /* private */ bool isExpired;
  // /* private */ final PublishProcessor<Unit> notesCounterProcessor;
  /* private */ final PreferenceProvider preferences;
  /* private */ final ConfigureEventCompletionDialog
      configureEventCompletionDialog;

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
      // final EventCaptureModel data = ref.read(eventCaptureDataProvider);
      // ref.read(eventCaptureDataProvider.notifier).setValue(data.copyWith(
      //     programStageName: programStageName,
      //     eventDate: eventDate,
      //     orgUnit: orgUnit!.displayName,
      //     activity: activity!.displayName));
      view.renderInitialInfo(
          stageName: programStageName,
          eventDate: eventDate,
          orgUnit: orgUnit,
          activity: activity);
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
      String onCompleteMessage,
      List<FieldWithIssue> errorFields,
      Map<String, String> emptyMandatoryFields,
      List<FieldWithIssue> warningFields) async {
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
      if (result) view.showSnackBar('event_was_deleted');
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

  @override
  void hideProgress() {
    view.hideProgress();
  }

  @override
  void showProgress() {
    view.showProgress();
  }

  @override
  Future<bool> getCompletionPercentageVisibility() {
    return eventCaptureRepository.showCompletionPercentage();
  }

  Future<EventStatus> _getEventStatus() {
    return eventCaptureRepository.eventStatus();
  }
}
