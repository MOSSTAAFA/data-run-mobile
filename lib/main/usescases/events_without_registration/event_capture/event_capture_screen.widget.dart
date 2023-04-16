import 'package:flutter/material.dart';

import '../../../utils/event_mode.dart';
import '../../general/view_Base.dart';
import 'event_capture_contract.dart';
import 'event_capture_tabs.widget.dart';
import 'model/event_completion_dialog.dart';

/// EventCaptureActivity
class EventCaptureScreen extends StatefulWidget {
  const EventCaptureScreen(
      {super.key,
      this.isEventCompleted = false,
      required this.eventMode,
      required this.activityUid,
      required this.programUid,
      required this.eventUid,
      this.onEditionListener,
      required this.adapter});

  final bool isEventCompleted;
  final EventMode eventMode;
  final String activityUid;
  final String programUid;
  final String eventUid;
  // LiveData<bool> relationshipMapButton = new MutableLiveData<>(false);
  final void Function()? onEditionListener;
  final EventCaptureTabs adapter;

  @override
  State<EventCaptureScreen> createState() => _EventCaptureScreenState();
}

class _EventCaptureScreenState extends State<EventCaptureScreen>
    with EventCaptureView {
  @override
  Widget build(BuildContext context) {
    return Container();
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
  void finishDataEntry() {
    // TODO: implement finishDataEntry
  }

  @override
  void goBack() {
    // TODO: implement goBack
  }

  @override
  void hideNavigationBar() {
    // TODO: implement hideNavigationBar
  }

  @override
  void hideProgress() {
    // TODO: implement hideProgress
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
    // TODO: implement showErrorSnackBar
  }

  @override
  void showEventIntegrityAlert() {
    // TODO: implement showEventIntegrityAlert
  }

  @override
  void showNavigationBar() {
    // TODO: implement showNavigationBar
  }

  @override
  void showProgress() {
    // TODO: implement showProgress
  }

  @override
  void showSnackBar(String message) {
    // TODO: implement showSnackBar
  }

  @override
  void updateNoteBadge(int numberOfNotes) {
    // TODO: implement updateNoteBadge
  }

  @override
  void updatePercentage(double primaryValue) {
    // TODO: implement updatePercentage
  }
}
