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

  Future<SyncableEntityState> getProjectState(DProject? project,
      {bool includeInActive = true}) async {
    return when(project!.name.toProjectType, {
      ProjectType.CHVS: () async {
        final withSyncErrorStateRegisters =
            await D2Remote.iccmModule.chvRegister.withSyncErrorState().count();
        final withUpdateErrorStateRegisters = await D2Remote
            .iccmModule.chvRegister
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
            await D2Remote.iccmModule.chvRegister.withToPostState().count();
        final withToUpdateStateRegisters =
            await D2Remote.iccmModule.chvRegister.withToUpdateState().count();

        final withToPostStateSessions =
            await D2Remote.iccmModule.chvSession.withToPostState().count();
        final withToUpdateStateSessions =
            await D2Remote.iccmModule.chvSession.withToUpdateState().count();

        final withToPostState =
            withToPostStateRegisters > 0 || withToPostStateSessions > 0;
        final withToUpdateState =
            withToUpdateStateRegisters > 0 || withToUpdateStateSessions > 0;

        return when(true, {
          withUpdateErrorState || withSyncErrorState: () => SyncableEntityState.WARNING,
          withToPostState: () => SyncableEntityState.TO_POST,
          withToUpdateState: () => SyncableEntityState.TO_UPDATE,
        }).orElse(() => SyncableEntityState.SYNCED);
      },
      ProjectType.ITNS: () async {
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
              SyncableEntityState.WARNING,
          withToPostState > 0: () => SyncableEntityState.TO_POST,
          withToUpdateState > 0: () => SyncableEntityState.TO_UPDATE,
        }).orElse(() => SyncableEntityState.SYNCED);
      },
      ProjectType.IRS: () async {
        return SyncableEntityState.SYNCED;
      },
      ProjectType.AMDS: () async {
        return SyncableEntityState.SYNCED;
      },
      ProjectType.UNITS: () async {
        return SyncableEntityState.SYNCED;
      },
    }).orElse(() async => SyncableEntityState.SYNCED);
  }

  Future<SyncableEntityState> getProjectStateByUid(String projectUid) async {
    return getProjectState(
        await D2Remote.projectModuleD.project.byId(projectUid).getOne());
  }
}
