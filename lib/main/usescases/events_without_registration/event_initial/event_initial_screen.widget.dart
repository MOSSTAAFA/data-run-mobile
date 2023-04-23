import 'package:d2_remote/core/mp/enrollment/enrollment_status.dart';
import 'package:d2_remote/core/mp/period/period_type.dart';
import 'package:d2_remote/modules/metadata/program/entities/program_stage.entity.dart';
import 'package:d2_remote/modules/metadata/program/entities/program.entity.dart';
import 'package:flutter/material.dart';

import '../../../../commons/constants.dart';
import '../../bundle/bundle.dart';
import '../event_details/models/event_details.dart';
import 'event_initial_view_base.dart';

/// EventInitialActivity
class EventInitialScreen extends StatefulWidget {
  const EventInitialScreen({super.key});

  @override
  State<EventInitialScreen> createState() => _EventInitialScreenState();

  static Bundle getBundle(
      String? programUid,
      String? eventUid,
      String? eventCreationType,
      String? teiUid,
      PeriodType? eventPeriodType,
      String? orgUnit,
      String? stageUid,
      String? enrollmentUid,
      int? eventScheduleInterval,
      EnrollmentStatus? enrollmentStatus) {
    // final Map<String, dynamic> bundle = {};
    final Bundle bundle = Bundle();
    bundle.putString(PROGRAM_UID, programUid);
    bundle.putString(EVENT_UID, eventUid);
    bundle.putString(EVENT_CREATION_TYPE, eventCreationType);
    bundle.putString(TRACKED_ENTITY_INSTANCE, teiUid);
    bundle.putString(ENROLLMENT_UID, enrollmentUid);
    bundle.putString(ORG_UNIT, orgUnit);
    // bundle.putSerializable(EVENT_PERIOD_TYPE, eventPeriodType?.name);
    bundle.putString(EVENT_PERIOD_TYPE, eventPeriodType?.name);
    bundle.putString(PROGRAM_STAGE_UID, stageUid);
    bundle.putInt(EVENT_SCHEDULE_INTERVAL, eventScheduleInterval);
    // bundle.putSerializable(ENROLLMENT_STATUS, enrollmentStatus?.name);
    bundle.putString(ENROLLMENT_STATUS, enrollmentStatus?.name);
    return bundle;
  }
}

class _EventInitialScreenState extends State<EventInitialScreen>
    with EventInitialViewBase {
  final EventDetails _eventDetails = const EventDetails();

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
  void setProgram(Program? program) {
    // TODO: implement setProgram
  }

  @override
  void setProgramStage(ProgramStage? programStage) {
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
