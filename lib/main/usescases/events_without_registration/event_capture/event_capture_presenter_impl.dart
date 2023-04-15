import '../../../../commons/date/field_with_issue.dart';
import 'event_capture_presenter.dart';

class EventCapturePresenterImpl implements EventCapturePresenter {
  @override
  void init() {
    // TODO: implement init
  }

  @override
  void attemptFinish(
      bool canComplete,
      String onCompleteMessage,
      List<FieldWithIssue> errorFields,
      Map<String, String> emptyMandatoryFields,
      List<FieldWithIssue> warningFields) {
    // TODO: implement attemptFinish
  }

  @override
  bool canWrite() {
    // TODO: implement canWrite
    throw UnimplementedError();
  }

  @override
  void completeEvent(bool addNew) {
    // TODO: implement completeEvent
  }

  @override
  void deleteEvent() {
    // TODO: implement deleteEvent
  }

  @override
  bool getCompletionPercentageVisibility() {
    // TODO: implement getCompletionPercentageVisibility
    throw UnimplementedError();
  }

  @override
  bool hasExpired() {
    // TODO: implement hasExpired
    throw UnimplementedError();
  }

  @override
  void hideProgress() {
    // TODO: implement hideProgress
  }

  @override
  void initNoteCounter() {
    // TODO: implement initNoteCounter
  }

  @override
  bool isEnrollmentOpen() {
    // TODO: implement isEnrollmentOpen
    throw UnimplementedError();
  }

  @override
  void onBackClick() {
    // TODO: implement onBackClick
  }

  @override
  void refreshTabCounters() {
    // TODO: implement refreshTabCounters
  }

  @override
  void rescheduleEvent(DateTime time) {
    // TODO: implement rescheduleEvent
  }

  @override
  void showProgress() {
    // TODO: implement showProgress
  }

  @override
  void skipEvent() {
    // TODO: implement skipEvent
  }
}
