import 'package:d2_remote/modules/metadata/organisation_unit/entities/organisation_unit.entity.dart';

import '../../../../commons/date/field_with_issue.dart';
import '../../../../core/event/event_status.dart';
import 'model/event_completion_dialog.dart';

abstract class EventCapturePresenter {
  void init();

  void onBackClick();

  void attemptFinish(
      bool canComplete,
      String onCompleteMessage,
      List<FieldWithIssue> errorFields,
      Map<String, String> emptyMandatoryFields,
      List<FieldWithIssue> warningFields);

  bool isEnrollmentOpen();

  void completeEvent(bool addNew);

  void deleteEvent();

  void skipEvent();

  void rescheduleEvent(DateTime time);

  bool canWrite();

  bool hasExpired();

  void initNoteCounter();

  void refreshTabCounters();

  void hideProgress();

  void showProgress();

  bool getCompletionPercentageVisibility();
}

abstract class EventCaptureView {
  void updatePercentage(double primaryValue);

  void showCompleteActions(
      bool canComplete,
      Map<String, String> emptyMandatoryFields,
      EventCompletionDialog eventCompletionDialog);

  void restartDataEntry();

  void finishDataEntry();

  void saveAndFinish();

  void showSnackBar(int messageId);

  void attemptToSkip();

  void attemptToReschedule();

  void showErrorSnackBar();

  void showEventIntegrityAlert();

  void updateNoteBadge(int numberOfNotes);

  void goBack();

  void showProgress();

  void hideProgress();

  void showNavigationBar();

  void hideNavigationBar();
}

abstract class EventCaptureRepository {
  /// Flowable
  Future<bool> eventIntegrityCheck();

  /// Flowable
  Future<String> programStageName();

  /// Flowable
  Future<String> eventDate();

  /// Flowable
  Future<OrganisationUnit> orgUnit();

  /// Flowable
  Future<String> activity();

  /// Observable
  Future<bool> completeEvent();

  /// Flowable
  Future<EventStatus> eventStatus();

  /// Flowable
  Future<bool> isEnrollmentOpen();

  /// Observable
  Future<bool> deleteEvent();

  /// Observable
  Future<bool> updateEventStatus(EventStatus skipped);

  /// Observable
  Future<bool> rescheduleEvent(DateTime time);

  /// Observable
  Future<String> programStage();

  /// Flowable
  Future<bool> getAccessDataWrite();

  Future<bool> isEnrollmentCancelled();

  Future<bool> isEventEditable(String eventUid);

  /// Single
  Future<bool> canReOpenEvent();

  /// Observable
  Future<bool> isCompletedEventExpired(String eventUid);

  /// Single
  Future<int> getNoteCount();

  Future<bool> showCompletionPercentage();

  Future<bool> hasAnalytics();

  Future<bool> hasRelationships();
}
