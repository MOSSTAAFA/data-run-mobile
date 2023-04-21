// import 'package:d2_remote/core/mp/enrollment/enrollment_status.dart';
// import 'package:d2_remote/core/mp/period/period_type.dart';
// import 'package:d2_remote/modules/metadata/program/entities/program.entity.dart';
// import 'package:d2_remote/modules/metadata/program/entities/program_stage.entity.dart';
// import 'package:equatable/equatable.dart';

// class EventInitialBundle with EquatableMixin {
//   EventInitialBundle(
//       {this.eventUid,
//       this.orgUnit,
//       this.eventCreationType,
//       this.programStageUid,
//       this.programUid,
//       this.periodType,
//       this.enrollmentId,
//       this.scheduleInterval = 0,
//       this.activityUid,
//       this.initialOrgUnitUid,
//       this.enrollmentStatus,
//       this.trackedEntityInstance,
//       this.program,
//       this.programStage});

//   final String? orgUnit;

//   final String? eventUid;

//   final String? eventCreationType;

//   final String? programStageUid;

//   final String? programUid;

//   final PeriodType? periodType;

//   final String? enrollmentId;

//   final int scheduleInterval;

//   final String? activityUid;

//   final String? initialOrgUnitUid;

//   final EnrollmentStatus? enrollmentStatus;

//   final String? trackedEntityInstance;

//   final Program? program;

//   final ProgramStage? programStage;

//   /// copyWith
//   EventInitialBundle copyWith(
//           {String? eventUid,
//           String? eventCreationType,
//           String? orgUnit,
//           String? programStageUid,
//           String? programUid,
//           PeriodType? periodType,
//           String? enrollmentId,
//           int? scheduleInterval,
//           String? activityUid,
//           String? initialOrgUnitUid,
//           EnrollmentStatus? enrollmentStatus,
//           String? trackedEntityInstance,
//           Program? program,
//           ProgramStage? programStage}) =>
//       EventInitialBundle(
//           eventUid: eventUid ?? this.eventUid,
//           eventCreationType: eventCreationType ?? this.eventCreationType,
//           orgUnit: orgUnit ?? this.orgUnit,
//           programStageUid: programStageUid ?? this.programStageUid,
//           programUid: programUid ?? this.programUid,
//           periodType: periodType ?? this.periodType,
//           enrollmentId: enrollmentId ?? this.enrollmentId,
//           scheduleInterval: scheduleInterval ?? this.scheduleInterval,
//           activityUid: activityUid ?? this.activityUid,
//           initialOrgUnitUid: initialOrgUnitUid ?? this.initialOrgUnitUid,
//           enrollmentStatus: enrollmentStatus ?? this.enrollmentStatus,
//           program: program ?? this.program,
//           programStage: programStage ?? this.programStage,
//           trackedEntityInstance:
//               trackedEntityInstance ?? this.trackedEntityInstance);
//   @override
//   List<Object?> get props => [
//         eventUid,
//         eventCreationType,
//         programStageUid,
//         programUid,
//         periodType,
//         enrollmentId,
//         scheduleInterval,
//         activityUid,
//         initialOrgUnitUid,
//         enrollmentStatus,
//         trackedEntityInstance,
//         program,
//         programStage
//       ];
// }
