import 'dart:async';

import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/datarun/form/entities/dynamic_form.entity.dart';
import 'package:d2_remote/modules/datarun/form/entities/form_definition.entity.dart';
import 'package:d2_remote/modules/datarun_shared/utilities/active_status.dart';
import 'package:d2_remote/modules/metadatarun/activity/entities/d_activity.entity.dart';
import 'package:d2_remote/modules/metadatarun/teams/entities/d_team.entity.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mass_pro/commons/prefs/preference_provider.dart';
import 'package:mass_pro/commons/resources/resource_manager.dart';
import 'package:mass_pro/commons/ui/metadata_icon_data.dart';
import 'package:mass_pro/data_run/screens/project_activity_detail/model/project_detail_item.model.dart';
import 'package:mass_pro/data_run/screens/submission_list/model/submission_list.provider.dart';
import 'package:mass_pro/data_run/utils/activities_access_repository.dart';
import 'package:mass_pro/data_run/utils/screens_constants.dart';
import 'package:mass_pro/main/data/server/user_manager_impl.dart';
import 'package:mass_pro/main/usescases/bundle/bundle.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'project_detail_items_models_notifier.g.dart';

@riverpod
Future<IList<DTeam>> userAssignedTeams(UserAssignedTeamsRef ref,
    {ActiveStatus activeStatus = ActiveStatus.EnabledOnly,
    String? activity}) async {
  final isLoggedIn = await ref.read(userManagerProvider).isUserLoggedIn(
      sharedPreferenceInstance: PreferenceProvider.sharedPreferences());

  if (!isLoggedIn) {
    return IList();
  }

  List<DTeam> teams = await (activity != null
      ? D2Remote.teamModuleD.team
          .byActivity(activity)
          .byActivityStatus(activeStatus)
          .get()
      : D2Remote.teamModuleD.team.byActivityStatus(activeStatus).get());

  return teams.toIList();
}

@riverpod
FutureOr<IList<DActivity>> userAssignedActivities(UserAssignedActivitiesRef ref,
    {ActiveStatus activeStatus = ActiveStatus.EnabledOnly,
    String? project}) async {
  final teams = await ref
      .watch(userAssignedTeamsProvider(activeStatus: activeStatus).future);
  final List<String> userActivitiesUids = teams
      .takeWhile((t) => t.activity != null)
      .map((t) => t.activity!)
      .toList();

  final List<DActivity> activities = await D2Remote.activityModuleD.activity
      .byIds(userActivitiesUids)
      .byActivityStatus(activeStatus)
      .get();

  return (project != null
          ? activities.where((t) => t.project == project)
          : activities)
      .toIList();
}

@riverpod
Future<List<FormDefinition?>> activityFormsDefinitions(
    ActivityFormsDefinitionsRef ref,
    {required String activity}) async {
  final List<DynamicForm> activeForms = await D2Remote.formModule.form
      .where(attribute: 'activity', value: activity)
      .get();

  final formsDefinitions = Future.wait([
    for (final form in activeForms)
      D2Remote.formModule.formDefinition
          .byForm(form.uid!)
          .byVersion(form.version)
          .getOne(),
  ]);

  return formsDefinitions;
}

@riverpod
ProjectDetailItemModel projectDetailItemModel(ProjectDetailItemModelRef ref) {
  throw UnimplementedError();
}

@riverpod
Future<IList<FormListItemModel>> formListItemModels(FormListItemModelsRef ref,
    {required String activity, required String team}) async {
  final formDefinitions = await ref
      .watch(activityFormsDefinitionsProvider(activity: activity).future);

  IList<FormListItemModel> formListItemModels = IList(<FormListItemModel>[]);

  for (final form in formDefinitions) {
    formListItemModels = formListItemModels.add(FormListItemModel(
        form: form!,
        team: team,
        submissionStatusModel: await ref
            .watch(submissionStatusModelProvider(form: form.form!).future),
        canAddNewEvent: true));
  }
  return formListItemModels;
}

@riverpod
Future<IList<ProjectDetailItemModel>> projectDetailItemModels(
    ProjectDetailItemModelsRef ref) async {
  final String projectUid =
      (Get.arguments as Bundle).getString(EXTRA_PROJECT_UID)!;

  /// get the list of active activities
  final IList<DActivity> activeActivities = await ref
      .watch(userAssignedActivitiesProvider(project: projectUid).future);

  /// Filter activities By project Id
  final Iterable<DActivity> projectActivities =
      activeActivities.where((DActivity t) => t.project == projectUid);

  /// create initial programModels that will hold the ui models
  IList<ProjectDetailItemModel> projectDetailItemModels =
      IList<ProjectDetailItemModel>();

  /// iterate over all activities
  for (final DActivity activity in projectActivities) {
    final List<DynamicForm> activeFormCount = await D2Remote.formModule.form
        .where(attribute: 'activity', value: activity.id)
        .get();

    /// get Team associated with the activity
    final DTeam? team = await ref
        .watch(activitiesAccessRepositoryProvider)
        .getActivityTeam(activity.id!);

    final ProjectDetailItemModel programModel = ProjectDetailItemModel(
      activity: activity,

      activityForms: activeFormCount.length,
      // description: activity.description,
      team: team,
      metadataIconData: MetadataIconData(
          programColor: ref
              .read(resourceManagerProvider)
              .getColorOrDefaultFrom(/* program.style?.color */ null),
          iconResource:
              ref.read(resourceManagerProvider).getObjectStyleDrawableResource(
                  /* program.style()?.icon() */
                  null,
                  Icons.question_mark)),
    );

    projectDetailItemModels = projectDetailItemModels.add(programModel);
  }
  return projectDetailItemModels;
}
