// ignore_for_file: avoid_dynamic_calls

import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/data/tracker/entities/event.entity.dart';
import 'package:d2_remote/modules/data/tracker/queries/event.query.dart';
import 'package:d2_remote/modules/datarun/common/standard_extensions.dart';
import 'package:d2_remote/modules/metadata/program/entities/program.entity.dart';
import 'package:d2_remote/modules/metadata/program/entities/tracked_entity_type.entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/common/state.dart';
import '../../core/program/program_type.dart';

part 'mp_program_utils.g.dart';

@Riverpod(keepAlive: true)
MpProgramUtils mpProgramUtils(MpProgramUtilsRef ref, EventQuery eventQuery) {
  return MpProgramUtils(eventQuery);
}

class MpProgramUtils {
  MpProgramUtils(this.eventQuery);
  final EventQuery eventQuery;
  Future<SyncableEntityState> getProgramState(Program? program) {
    final programType = program?.programType.toProgramType;
    return when(programType, {
      ProgramType.WITH_REGISTRATION: () {
        // TODO(NMC): implement getTrackerProgramState
        // getTrackerProgramState(program);
        return Future.value(SyncableEntityState.WARNING);
      },
      ProgramType.WITHOUT_REGISTRATION: () => getEventProgramState(program),
    }).orElse(() => throw Exception('Unsupported program type'));
  }

  Future<SyncableEntityState> getProgramStateByUid(String programUid) async {
    return getProgramState(
        await D2Remote.programModule.program.byId(programUid).getOne());
  }

  Future<List<Program>> getProgramsInCaptureOrgUnits() {
    return D2Remote.programModule.program.get();
    // return d2.programModule().programs()
    //     .withTrackedEntityType()
    //     .byOrganisationUnitScope(OrganisationUnit.Scope.SCOPE_DATA_CAPTURE)
    //     .get().toFlowable()
  }

  Future<SyncableEntityState> getEventProgramState(Program? program) async {
    if (program != null) {
      final bool hasEventWithErrorState =
          await _hasEventWithErrorState(program.uid!);
      final bool hasEventWithSMSState = _hasEventWithSMSState(program.uid!);
      final bool hasEventWithNotSyncedStateOrDeleted =
          await _hasEventWithNotSyncedStateOrDeleted(program.uid!);
      return when(true, {
        hasEventWithErrorState: () => SyncableEntityState.WARNING,
        hasEventWithSMSState: () => SyncableEntityState.SENT_VIA_SMS,
        hasEventWithNotSyncedStateOrDeleted: () => SyncableEntityState.TO_UPDATE
      }).orElse(() => SyncableEntityState.SYNCED);
    } else {
      return SyncableEntityState.SYNCED;
    }
  }

  Future<bool> _hasEventWithErrorState(String id) async {
    return (await eventQuery
            .byProgram(id)
            .where(attribute: 'deleted', value: false)
            .where(attribute: 'synced', value: false)
            .where(attribute: 'dirty', value: true)
            .where(attribute: 'syncFailed', value: true)
            .count()) >
        0;
  }

  bool _hasEventWithSMSState(String id) {
    // TODO(NMC): implement
    return false;
  }

  Future<bool> _hasEventWithNotSyncedStateOrDeleted(String id) async {
    final List<Event> events = await D2Remote.trackerModule.event
        .byProgram(id)
        .where(attribute: 'deleted', value: false)
        .where(attribute: 'dirty', value: true)
        .get();

    if (events.isNotEmpty) {
      return true;
    }
    final List<Event> events2 = await D2Remote.trackerModule.event
        .byProgram(id)
        .where(attribute: 'deleted', value: true)
        .get();

    if (events.isNotEmpty) {
      return true;
    }

    return false;
  }

  Future<String> getProgramRecordLabel(
      Program program, String defaultTrackerLabel, String defaultEventLabel) {
    return when<ProgramType?, Future<String>>(
        program.programType.toProgramType, {
      ProgramType.WITH_REGISTRATION: () async {
        final TrackedEntityType? trackedEntityType = await D2Remote
            .programModule.trackedEntityType
            .byId(program.trackedEntityType ?? '')
            .getOne();
        return trackedEntityType?.displayName ?? defaultTrackerLabel;
      },
      ProgramType.WITHOUT_REGISTRATION: () => Future.value(defaultEventLabel)
    }).orElse(() => Future.value(''));
  }
  // private fun getTrackerProgramState(program: Program): State {
  //       val teiRepository = d2.trackedEntityModule().trackedEntityInstances()
  //           .byProgramUids(arrayListOf(program.uid()))
  //       val enrollmentRepository = d2.enrollmentModule().enrollments()
  //           .byProgram().eq(program.uid())

  //       return when {
  //           hasTeiWithErrorOrWarningState(teiRepository, enrollmentRepository) -> State.WARNING
  //           hasTeiWithSMSState(teiRepository) -> State.SENT_VIA_SMS
  //           hasTeiWithNotSyncedStateOrDeleted(teiRepository) -> State.TO_UPDATE
  //           else -> State.SYNCED
  //       }
  //   }

  //   private fun hasTeiWithErrorOrWarningState(
  //       teiRepository: TrackedEntityInstanceCollectionRepository,
  //       enrollmentRepository: EnrollmentCollectionRepository
  //   ): Boolean {
  //       return teiRepository
  //           .byDeleted().isFalse
  //           .byAggregatedSyncState().`in`(State.ERROR, State.WARNING)
  //           .blockingGet().isNotEmpty() ||
  //           enrollmentRepository.byAggregatedSyncState().`in`(State.ERROR, State.WARNING)
  //               .blockingGet().isNotEmpty()
  //   }

  //   private fun hasTeiWithSMSState(
  //       teiRepository: TrackedEntityInstanceCollectionRepository
  //   ): Boolean {
  //       return teiRepository
  //           .byDeleted().isFalse
  //           .byAggregatedSyncState().`in`(State.SENT_VIA_SMS, State.SYNCED_VIA_SMS)
  //           .blockingGet().isNotEmpty()
  //   }

  //   private fun hasTeiWithNotSyncedStateOrDeleted(
  //       teiRepository: TrackedEntityInstanceCollectionRepository
  //   ): Boolean {
  //       return teiRepository
  //           .byDeleted().isFalse
  //           .byAggregatedSyncState().`in`(State.TO_UPDATE, State.TO_POST, State.UPLOADING)
  //           .blockingGet().isNotEmpty() ||
  //           teiRepository
  //               .byDeleted().isTrue.blockingGet().isNotEmpty()
  //   }
}
