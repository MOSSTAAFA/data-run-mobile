// ignore_for_file: avoid_dynamic_calls

import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/metadatarun/activity/entities/d_activity.entity.dart';
import 'package:d2_remote/modules/metadatarun/project/entities/d_project.entity.dart';
import 'package:d2_remote/modules/datarun/common/standard_extensions.dart';
import 'package:mass_pro/core/common/state.dart';
import 'package:mass_pro/data_run/utils/project_type.dart';
import 'package:mass_pro/data_run/utils/utils.providers.dart';

class ActivityUtils {
  ActivityUtils(this.ref);

  final ActivityUtilsRef ref;

  Future<State> getActivityState(DActivity? activity,
      {bool includeInActive = true}) async {
    final projectId = activity!.project as String;
    final DProject? project =
        await D2Remote.projectModuleD.project.byId(projectId).getOne();
    return when(project!.name.toProjectType, {
      ProjectType.CHVs: () async {
        return await getChvActivityState();
      },
      ProjectType.ITNs: () => getItnActivityState(activity: activity),
      ProjectType.IRS: () async {
        // Unimplemented
        return State.SYNCED;
      },
      ProjectType.AMDs: () async {
        // Unimplemented
        return State.SYNCED;
      },
      ProjectType.UNITS: () async {
        // Unimplemented
        return State.SYNCED;
      },
    }).orElse(() => throw Exception('Unsupported project type'));
  }

  Future<State> getChvActivityState() async {
    final withSyncErrorStateRegisters =
        await D2Remote.iccmModule.patientInfo.withSyncErrorState().count();
    final withUpdateErrorStateRegisters = await D2Remote.iccmModule.patientInfo
        .withUpdateSyncedErrorState()
        .count();

    final withSyncErrorStateSessions =
        await D2Remote.iccmModule.chvSession.withSyncErrorState().count();
    final withUpdateErrorStateSessions = await D2Remote.iccmModule.chvSession
        .withUpdateSyncedErrorState()
        .count();

    final withSyncErrorState =
        withSyncErrorStateRegisters > 0 || withUpdateErrorStateRegisters > 0;
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
  }

  Future<State> getItnActivityState({DActivity? activity}) async {
    final query = D2Remote.itnsVillageModule.itnsVillage;

    if (activity != null) {
      query.where(attribute: 'activity', value: activity.uid);
    }

    final withSyncErrorState = await query.withSyncErrorState().count();

    final withUpdateErrorState =
        await query.withUpdateSyncedErrorState().count();

    final withToPostState = await query.withToPostState().count();
    final withToUpdateState = await query.withToUpdateState().count();

    return when(true, {
      withUpdateErrorState > 0 || withSyncErrorState > 0: () => State.WARNING,
      withToPostState > 0: () => State.TO_POST,
      withToUpdateState > 0: () => State.TO_UPDATE,
    }).orElse(() => State.SYNCED);
  }

  Future<State> getActivityStateByUid(String activityUid) async {
    return getActivityState(
        await D2Remote.activityModuleD.activity.byId(activityUid).getOne());
  }

  /// get Activities the user has teams assignedhave
  /// Assignments in assigned to him
  Future<List<DActivity>> getActivities(
      {DProject? project, bool includeInactive = false}) async {
    final query = D2Remote.activityModuleD.activity;

    if (project != null) {
      query.byProject(project.uid!);
    }

    if (includeInactive) {
      return query.get();
    } else {
      final activeTeams = await D2Remote.teamModuleD.team.activated().get();
      // final activeTeamsActivities =
      //     activeTeams.map((team) => team.activity as String).toList();

      // query.byIds(activeTeamsActivities);

      if (project != null) {
        query.byProject(project.uid!);
      }

      return query.activated().get();
    }
  }

  /// get Activities the user have
  /// Assignments in assigned to him and Active
  Future<List<DActivity>> getActivitiesByProject(DProject? project,
      {bool includeInactive = false}) {
    return getActivities(project: project, includeInactive: includeInactive);
  }
}
