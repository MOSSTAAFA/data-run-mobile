import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/datarun/form/entities/dynamic_form.entity.dart';
import 'package:d2_remote/modules/metadatarun/activity/entities/d_activity.entity.dart';
import 'package:d2_remote/modules/metadatarun/project/entities/d_project.entity.dart';
import 'package:d2_remote/modules/metadatarun/teams/entities/d_team.entity.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/data_run/utils/activity_utils.dart';
import 'package:mass_pro/data_run/utils/project_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'utils.providers.g.dart';

/// All available teams including disabled
@riverpod
Future<IList<DTeam>> teams(TeamsRef ref) async {
  final List<DTeam> teams = await D2Remote.teamModuleD.team.get();

  return teams.toIList();
}

/// All available activities including disabled
@riverpod
Future<IList<DActivity>> activities(ActivitiesRef ref) async {
  final List<DActivity> activities =
      await D2Remote.activityModuleD.activity.get();

  return activities.toIList();
}

/// All available projects including disabled
@riverpod
Future<IList<DProject>> projects(ProjectsRef ref) async {
  final List<DProject> projects = await D2Remote.projectModuleD.project.get();

  return projects.toIList();
}

/// the team is in active activity
Future<bool> teamIsInActiveActivity(DTeam team) async {
  final List<DActivity> enabledActivities = await D2Remote
      .activityModuleD.activity
      .where(attribute: 'disabled', value: false)
      .get();

  return enabledActivities.any((activity) => activity.id == team.activity);
}

/// activity is Active and has one or more active teams assigned to user
Future<bool> activityIsActiveWithActiveTeams(String activityUid) async {
  final DActivity? activity =
      await D2Remote.activityModuleD.activity.byId(activityUid).getOne();

  final List<DTeam> enabledTeams = await D2Remote.teamModuleD.team
      .where(attribute: 'disabled', value: false)
      .get();

  return activity?.disabled != true &&
      enabledTeams.any((team) => activityUid == team.activity);
}

/// project has one or more active activities
Future<bool> projectHasActiveActivities(DProject project) async {
  final List<DActivity> enabledActivities = await D2Remote
      .activityModuleD.activity
      .where(attribute: 'disabled', value: false)
      .get();

  return enabledActivities.any((activity) => activity.project == project.id);
}

///
/// Only Enabled
/// Only Active teams (Enabled)
@riverpod
Future<IList<DTeam>> activeTeams(ActiveTeamsRef ref) async {
  /// get all teams from teamsProvider and filter disabled
  final IList<DTeam> enabledTeams = await ref
      .watch(teamsProvider.future)
      .then((teams) => teams.where((team) => !team.disabled).toIList());

  /// get all activities from activitiesProvider and filter disabled
  final IList<DActivity> enabledActivities = await ref
      .watch(activitiesProvider.future)
      .then((activities) =>
          activities.where((activity) => !activity.disabled).toIList());

  /// Predicate<T>
  bool teamInActiveActivity(DTeam team) =>
      enabledActivities.any((activity) => activity.id == team.activity);

  return enabledTeams.where(teamInActiveActivity).toIList();
}

/// Only Active activities (Enabled)
@riverpod
Future<IList<DActivity>> activeActivities(ActiveActivitiesRef ref) async {
  /// get all teams from teamsProvider and filter disabled
  final IList<DTeam> enabledTeams = await ref
      .watch(teamsProvider.future)
      .then((teams) => teams.where((team) => !team.disabled).toIList());

  /// get all activities from activitiesProvider and filter disabled
  final IList<DActivity> enabledActivities = await ref
      .watch(activitiesProvider.future)
      .then((activities) =>
          activities.where((activity) => !activity.disabled).toIList());

  /// Predicate<T>
  bool activityHasActiveTeam(DActivity activitie) =>
      enabledTeams.any((team) => team.activity == activitie.id);

  return enabledActivities.where(activityHasActiveTeam).toIList();
}

/// Only Active projects (Enabled)
@riverpod
Future<IList<DProject>> activeProjects(ActiveProjectsRef ref) async {
  final List<DProject> projects = await D2Remote.projectModuleD.project.get();

  final List<DProject> enabledProjects = [];

  for (final project in projects) {
    final projectIsActive = await projectHasActiveActivities(project);
    if (projectIsActive) {
      enabledProjects.add(project);
    }
  }

  return enabledProjects.toIList();
}

/// Only Active forms (Enabled)
@riverpod
Future<IList<DynamicForm>> activeForms(ActiveFormsRef ref) async {
  final List<DynamicForm> forms = await D2Remote.formModule.form.get();

  final List<DynamicForm> enabledForms = [];

  for (final form in forms) {
    final formActivityIsActive =
        await activityIsActiveWithActiveTeams(form.activity);
    if (formActivityIsActive) {
      enabledForms.add(form);
    }
  }
  return enabledForms.toIList();
}

@Riverpod(keepAlive: true)
ProjectUtils projectUtils(ProjectUtilsRef ref) {
  return ProjectUtils(ref);
}

@Riverpod(keepAlive: true)
ActivityUtils activityUtils(ActivityUtilsRef ref) {
  return ActivityUtils(ref);
}
