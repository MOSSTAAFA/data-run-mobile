import 'package:d2_remote/modules/data/tracker/entities/event.entity.dart';
import 'package:d2_remote/modules/data/tracker/models/geometry.dart';
import 'package:d2_remote/modules/metadata/program/entities/program.entity.dart';
import 'package:d2_remote/modules/metadata/program/entities/program_stage.entity.dart';

import '../../../../core/event/event_editable_status.dart';
import '../../../../form/data/form_section_view_model.dart';
import '../../../../form/model/field_ui_model.dart';

abstract class EventInitialRepository {
  /// Observable
  Future<Event> event(String eventId);

  /// Observable
  Future<String> createEvent(
      String enrollmentUid,
      String? trackedEntityInstanceUid,
      String program,
      String programStage,
      DateTime date,
      String orgUnitUid,
      String activityUid,
      Geometry coordinates);

  /// Observable
  Future<String> scheduleEvent(
      String enrollmentUid,
      String? trackedEntityInstanceUid,
      String program,
      String programStage,
      DateTime dueDate,
      String orgUnitUid,
      String activityUid,
      Geometry coordinates);

  /// Observable
  Future<ProgramStage?> programStage(String? programUid);

  /// Observable
  Future<ProgramStage?> programStageWithId(String? programStageUid);

  /// Observable
  Future<bool> accessDataWrite(String programId);

  Future<void> deleteEvent(String eventId, String trackedEntityInstance);

  Future<bool> isEnrollmentOpen();

  /// Observable
  Future<Program?> getProgramWithId(String? programUid);

  /// Flowable
  Future<ProgramStage?> programStageForEvent(String eventId);

  /// Flowable
  bool showCompletionPercentage();

  /// Flowable
  Future<List<FormSectionViewModel>> eventSections();

  /// Flowable
  Future<List<FieldUiModel>> list();

  // /// Flowable
  // Future<Result<RuleEffect>> calculate();

  /// Flowable
  Future<EventEditableStatus> getEditableStatus();

  /// Observable
  Future<String> permanentReferral(
      String enrollmentUid,
      String teiUid,
      String programUid,
      String programStage,
      DateTime dueDate,
      String orgUnitUid,
      String activityUid,
      Geometry geometry);
}
