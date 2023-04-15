import 'package:d2_remote/modules/metadata/program/entities/program_stage.entity.dart';
import 'package:d2_remote/modules/metadata/program/entities/program.entity.dart';
import 'package:flutter/material.dart';

import '../event_details/models/event_details.dart';
import 'event_initial_view_base.dart';

/// EventInitialActivity
class EventInitialScreen extends StatefulWidget {
  const EventInitialScreen({super.key});

  @override
  State<EventInitialScreen> createState() => _EventInitialScreenState();
}

class _EventInitialScreenState extends State<EventInitialScreen>
    with EventInitialViewBase {
  EventDetails _eventDetails = new EventDetails();

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void onEventCreated(String eventUid) {
    // TODO: implement onEventCreated
  }

  @override
  void onEventUpdated(String eventUid) {
    // TODO: implement onEventUpdated
  }

  @override
  void renderError(String message) {
    // TODO: implement renderError
  }

  @override
  void setAccessDataWrite(bool canWrite) {
    // TODO: implement setAccessDataWrite
  }

  @override
  void setProgram(Program program) {
    // TODO: implement setProgram
  }

  @override
  void setProgramStage(ProgramStage programStage) {
    // TODO: implement setProgramStage
  }

  @override
  void showEventWasDeleted() {
    // TODO: implement showEventWasDeleted
  }

  @override
  void showProgramStageSelection() {
    // TODO: implement showProgramStageSelection
  }

  @override
  void showQR() {
    // TODO: implement showQR
  }

  @override
  void updatePercentage(double primaryValue) {
    // TODO: implement updatePercentage
  }
}
