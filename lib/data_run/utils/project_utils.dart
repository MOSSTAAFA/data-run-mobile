// ignore_for_file: avoid_dynamic_calls

import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/metadatarun/project/entities/d_project.entity.dart';
import 'package:d2_remote/modules/datarun/common/standard_extensions.dart';
import 'package:mass_pro/core/common/state.dart';
import 'package:mass_pro/data_run/utils/project_type.dart';
import 'package:mass_pro/data_run/utils/utils.providers.dart';

class ProjectUtils {
  ProjectUtils(this.ref);

  final ProjectUtilsRef ref;

  /// get Projects with activities the user have
  /// Assignments in assigned to him
  Future<List<DProject>> getProjects() {
    return D2Remote.projectModuleD.project.get();
  }

  Future<int> getActivitiesCount(DProject? project) async {
    final count = await D2Remote.activityModuleD.activity
        .byProject(project!.uid!)
        .count();
    return count as int;
  }

  Future<State> getProjectState(DProject? project,
      {bool includeInActive = true}) async {
    return when(project!.name.toProjectType, {
      ProjectType.CHVs: () async {
        final withSyncErrorStateRegisters =
            await D2Remote.iccmModule.patientInfo.withSyncErrorState().count();
        final withUpdateErrorStateRegisters = await D2Remote
            .iccmModule.patientInfo
            .withUpdateSyncedErrorState()
            .count();

        final withSyncErrorStateSessions =
            await D2Remote.iccmModule.chvSession.withSyncErrorState().count();
        final withUpdateErrorStateSessions = await D2Remote
            .iccmModule.chvSession
            .withUpdateSyncedErrorState()
            .count();

        final withSyncErrorState = withSyncErrorStateRegisters > 0 ||
            withUpdateErrorStateRegisters > 0;
        final withUpdateErrorState =
            withSyncErrorStateSessions > 0 || withUpdateErrorStateSessions > 0;

        final withToPostStateRegisters =
            await D2Remote.iccmModule.patientInfo.withToPostState().count();
        final withToUpdateStateRegisters =
            await D2Remote.iccmModule.patientInfo.withToUpdateState().count();

        final withToPostStateSessions =
            await D2Remote.iccmModule.chvSession.withToPostState().count();
        final withToUpdateStateSessions =
            await D2Remote.iccmModule.chvSession.withToUpdateState().count();

        final withToPostState =
            withToPostStateRegisters > 0 || withToPostStateSessions > 0;
        final withToUpdateState =
            withToUpdateStateRegisters > 0 || withToUpdateStateSessions > 0;

        return when(true, {
          withUpdateErrorState || withSyncErrorState: () => State.WARNING,
          withToPostState: () => State.TO_POST,
          withToUpdateState: () => State.TO_UPDATE,
        }).orElse(() => State.SYNCED);
      },
      ProjectType.ITNs: () async {
        final withSyncErrorState = await D2Remote.itnsVillageModule.itnsVillage
            .withSyncErrorState()
            .count();

        final withUpdateErrorState = await D2Remote
            .itnsVillageModule.itnsVillage
            .withUpdateSyncedErrorState()
            .count();

        final withToPostState = await D2Remote.itnsVillageModule.itnsVillage
            .withToPostState()
            .count();
        final withToUpdateState = await D2Remote.itnsVillageModule.itnsVillage
            .withToUpdateState()
            .count();

        return when(true, {
          withUpdateErrorState > 0 || withSyncErrorState > 0: () =>
              State.WARNING,
          withToPostState > 0: () => State.TO_POST,
          withToUpdateState > 0: () => State.TO_UPDATE,
        }).orElse(() => State.SYNCED);
      },
      ProjectType.IRS: () async {
        return State.SYNCED;
      },
      ProjectType.AMDs: () async {
        return State.SYNCED;
      },
      ProjectType.UNITS: () async {
        return State.SYNCED;
      },
    }).orElse(() => throw Exception('Unsupported project type'));
  }

  Future<State> getProjectStateByUid(String projectUid) async {
    return getProjectState(
        await D2Remote.projectModuleD.project.byId(projectUid).getOne());
  }
}
