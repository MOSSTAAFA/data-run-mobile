import 'package:d2_remote/modules/activity_management/activity/entities/activity.entity.dart';
import 'package:d2_remote/modules/metadata/organisation_unit/entities/organisation_unit.entity.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import '../../../../commons/date/field_with_issue.dart';
import '../../../../core/event/event_status.dart';
import '../../../../form/data/data_integrity_check_result.dart';
import '../../general/view_base.dart';
import 'model/event_completion_dialog.dart';

abstract class EventCapturePresenter {
  void init();

  void onBackClick();

  void attemptFinish(
      bool canComplete,
      String? onCompleteMessage,
      IList<FieldWithIssue> errorFields,
      IMap<String, String> emptyMandatoryFields,
      IList<FieldWithIssue> warningFields);

  Future<bool> isEnrollmentOpen();

  Future<void> completeEvent(bool addNew);

  Future<void> deleteEvent();

  void skipEvent();

  void rescheduleEvent(DateTime time);

  Future<bool> canWrite();

  bool hasExpired();

  void displayMessage(String message);

  void initNoteCounter();

  void refreshTabCounters();

  void hideProgress();

  void showProgress();

  Future<bool> getCompletionPercentageVisibility();

  void updatePercentage(double primaryValue);

  /// By NMC: From EventCaptureFormPresenter
  void handleDataIntegrityResult(DataIntegrityCheckResult result);

  // /// By NMC: From EventCaptureFormPresenter
  // Future<void> showOrHideSaveButton();
}

mixin EventCaptureView implements ViewBase {
  void renderInitialInfo(
      {String? stageName,
      String? eventDate,
      OrganisationUnit? orgUnit,
      Activity? activity});

  void updatePercentage(double primaryValue);

  void showCompleteActions(
      bool canComplete,
      IMap<String, String> emptyMandatoryFields,
      EventCompletionDialog eventCompletionDialog);

  void restartDataEntry();

  void finishDataEntry();

  void saveAndFinish();

  void showSnackBar(String messageId);

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

  // /// By NMC: From EventCaptureFormPresenter
  // void showSaveButton();
  //
  // /// By NMC: From EventCaptureFormPresenter
  // void hideSaveButton();
  //
  // /// By NMC: From EventCaptureFormPresenter
  // void performSaveClick();
  //
  // /// By NMC: From EventCaptureFormPresenter
  // void onReopen();
  //
  // /// By NMC: From EventCaptureFormPresenter
  // void onEditionListener();
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
  Future<Activity> activity();

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
