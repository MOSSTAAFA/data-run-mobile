import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/metadatarun/activity/entities/d_activity.entity.dart';
import 'package:d2_remote/modules/metadatarun/project/entities/d_project.entity.dart';
import 'package:d2_remote/modules/metadatarun/teams/entities/d_team.entity.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'activities_access_repository.g.dart';

@Riverpod(keepAlive: true)
ActivitiesAccessRepository activitiesAccessRepository(
    ActivitiesAccessRepositoryRef ref) {
  return ActivitiesAccessRepository();
}

class ActivitiesAccessRepository {
  /// All available teams including disabled
  Future<IList<DTeam>> getAllTeams() async {
    final List<DTeam> teams = await D2Remote.teamModuleD.team.get();

    return teams.toIList();
  }

  /// All available activities including disabled
  Future<IList<DActivity>> getAllActivities() async {
    final List<DActivity> activities =
        await D2Remote.activityModuleD.activity.get();

    return activities.toIList();
  }

  /// All available projects including disabled
  Future<IList<DProject>> getAllProjects() async {
    final List<DProject> projects = await D2Remote.projectModuleD.project.get();

    return projects.toIList();
  }

  /// the team is in active activity
  Future<bool> teamIsInActiveActivity(DTeam team) async {
    final List<DActivity> enabledActivities = await D2Remote
        .activityModuleD.activity
        .where(attribute: 'disabled', value: false)
        .get();

    return enabledActivities.any((DActivity activity) => activity.id == team.activity);
  }

  /// activity is Active and has one or more active teams assigned to user
  Future<bool> activityIsActiveWithActiveTeams(String activityUid) async {
    final DActivity? activity =
        await D2Remote.activityModuleD.activity.byId(activityUid).getOne();

    final List<DTeam> enabledTeams = await D2Remote.teamModuleD.team
        .where(attribute: 'disabled', value: false)
        .get();

    return activity?.disabled != true &&
        enabledTeams.any((DTeam team) => activityUid == team.activity);
  }

  // /// form's activity is Active, and activity has one
  // /// or more active teams assigned to user
  // Future<bool> formIsActive(String formUid) async {
  //   final DynamicForm? form =
  //       await D2Remote.formModule.form.byId(formUid).getOne();
  //
  //   final DActivity? activity =
  //       await D2Remote.activityModuleD.activity.byId(form?.activity!).getOne();
  //
  //   if (activity?.id != null) {
  //     return activityIsActiveWithActiveTeams(activity!.id!);
  //   } else {
  //     return false;
  //   }
  // }

  /// project has one or more active activities
  Future<bool> projectHasActiveActivities(DProject project) async {
    final List<DActivity> enabledActivities = await D2Remote
        .activityModuleD.activity
        .where(attribute: 'disabled', value: false)
        .get();

    return enabledActivities.any((DActivity activity) => activity.project == project.id);
  }

  ///
  /// Only Enabled
  /// Only Active teams (Enabled)
  Future<IList<DTeam>> getActiveTeams() async {
    /// get all teams from teamsProvider and filter disabled
    final IList<DTeam> enabledTeams = await getAllTeams()
        .then((IList<DTeam> teams) => teams.where((DTeam team) => !team.disabled).toIList());

    /// get all activities from activitiesProvider and filter disabled
    final IList<DActivity> enabledActivities = await getAllActivities().then(
        (IList<DActivity> activities) =>
            activities.where((DActivity activity) => !activity.disabled).toIList());

    /// Predicate<T>
    bool teamInActiveActivity(DTeam team) =>
        enabledActivities.any((DActivity activity) => activity.id == team.activity);

    return enabledTeams.where(teamInActiveActivity).toIList();
  }

  /// Only Active activities (Enabled)
  Future<IList<DActivity>> getActiveActivities() async {
    /// get all teams from teamsProvider and filter disabled
    final IList<DTeam> enabledTeams = await getAllTeams()
        .then((IList<DTeam> teams) => teams.where((DTeam team) => !team.disabled).toIList());

    /// get all activities from activitiesProvider and filter disabled
    final IList<DActivity> enabledActivities = await getAllActivities().then(
        (IList<DActivity> activities) =>
            activities.where((DActivity activity) => !activity.disabled).toIList());

    /// Predicate<T>
    bool activityHasActiveTeam(DActivity activitie) =>
        enabledTeams.any((DTeam team) => team.activity == activitie.id);

    return enabledActivities.where(activityHasActiveTeam).toIList();
  }

  /// Only Active projects (Enabled)
  Future<IList<DProject>> getActiveProjects() async {
    final List<DProject> projects = await D2Remote.projectModuleD.project.get();

    final List<DProject> enabledProjects = <DProject>[];

    for (final DProject project in projects) {
      final bool projectIsActive = await projectHasActiveActivities(project);
      if (projectIsActive) {
        enabledProjects.add(project);
      }
    }

    return enabledProjects.toIList();
  }

  // /// Only Active forms (Enabled)
  // /// that has active activity and active team
  // Future<IList<DynamicForm>> getActiveForms() async {
  //   final List<DynamicForm> forms = await D2Remote.formModule.form.get();
  //
  //   final List<DynamicForm> enabledForms = [];
  //
  //   for (final form in forms) {
  //     final formActivityIsActive =
  //         await activityIsActiveWithActiveTeams(form.activity);
  //     if (formActivityIsActive) {
  //       enabledForms.add(form);
  //     }
  //   }
  //   return enabledForms.toIList();
  // }

  // /// Only Active forms (Enabled)
  // /// that has active activity and active team
  // Future<IList<DynamicForm>> getActiveFormsByActivity(
  //     [String? activityUid]) async {
  //   DynamicFormQuery query = D2Remote.formModule.form;
  //   if(activityUid != null) {
  //     query = query.where(attribute: 'activity', value: activityUid);
  //   }
  //   final List<DynamicForm> forms = await D2Remote.formModule.form.get();
  //
  //   final List<DynamicForm> enabledForms = [];
  //
  //   for (final form in forms) {
  //     final formActivityIsActive =
  //         await activityIsActiveWithActiveTeams(form.activity);
  //     if (formActivityIsActive) {
  //       enabledForms.add(form);
  //     }
  //   }
  //   return enabledForms.toIList();
  // }

  /// Only Active forms (Enabled)
  Future<DTeam?> getActivityTeam(String activityUid) async {
    return D2Remote.teamModuleD.team
        .where(attribute: 'activity', value: activityUid)
        .getOne();
  }
}
