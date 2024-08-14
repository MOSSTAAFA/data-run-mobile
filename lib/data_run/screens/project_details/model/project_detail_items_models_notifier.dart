import 'dart:async';

import 'package:d2_remote/modules/datarun/form/entities/data_form_submission.entity.dart';
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
import 'package:mass_pro/core/common/state.dart';
import 'package:mass_pro/data_run/screens/entities_list_screen/state/form_submission_list_repository.dart';
import 'package:mass_pro/data_run/screens/project_details/model/entity_count.dart';
import 'package:mass_pro/data_run/screens/project_details/model/project_detail_item.model.dart';
import 'package:mass_pro/data_run/utils/activities_access_repository.dart';
import 'package:mass_pro/data_run/utils/screens_constants.dart';
import 'package:mass_pro/main/data/server/user_manager_impl.dart';
import 'package:mass_pro/main/usescases/bundle/bundle.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:mass_pro/core/common/state.dart';

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

  final activities = await D2Remote.activityModuleD.activity
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
Future<IList<DataFormSubmission>> formSubmissionsByStatus(
    FormSubmissionsByStatusRef ref,
    {required String form,
    SyncableEntityState? entityStatus,
    String sortBy = 'name'}) async {
  final ddd = await ref
      .watch(formSubmissionListRepositoryProvider(form))
      .getEntitiesByState(state: entityStatus);
  return ddd;
}

@riverpod
Future<EntityCountByStatus> entityCountByStatus(EntityCountByStatusRef ref,
    {required String form}) async {
  final toPost = await ref.watch(formSubmissionsByStatusProvider(
          form: form, entityStatus: SyncableEntityState.TO_POST)
      .future);

  final toUpdate = await ref.watch(formSubmissionsByStatusProvider(
          form: form, entityStatus: SyncableEntityState.TO_UPDATE)
      .future);

  final synced = await ref.watch(formSubmissionsByStatusProvider(
          form: form, entityStatus: SyncableEntityState.SYNCED)
      .future);

  final withError = await ref.watch(formSubmissionsByStatusProvider(
          form: form, entityStatus: SyncableEntityState.ERROR)
      .future);
  return EntityCountByStatus(
      toPost: toPost.length,
      toUpdate: toUpdate.length,
      synced: synced.length,
      withError: withError.length);
}

@riverpod
ProjectDetailItemModel projectDetailItemModel(ProjectDetailItemModelRef ref) {
  throw UnimplementedError();
}

@Riverpod(dependencies: <Object>[projectDetailItemModel])
Future<IList<FormListItemModel>> formListItemModels(
    FormListItemModelsRef ref) async {
  final projectDetailItemModel = ref.watch(projectDetailItemModelProvider);

  final formDefinitions = await ref.watch(
      activityFormsDefinitionsProvider(activity: projectDetailItemModel.activity.uid!)
          .future);

  ///
  IList<FormListItemModel> formListItemModels = IList(<FormListItemModel>[]);

  for (final form in formDefinitions) {
    formListItemModels = formListItemModels.add(FormListItemModel(
        form: form!,
        team: projectDetailItemModel.team?.uid,
        entityCount: await ref
            .watch(entityCountByStatusProvider(form: form!.uid!).future),
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
  final IList<DActivity> activeActivities =
      await ref.watch(userAssignedActivitiesProvider().future);

  /// Filter activities By project Id
  final Iterable<DActivity> projectActivities =
      activeActivities.where((DActivity t) => t.project == projectUid);

  /// create initial programModels that will hold the ui models
  IList<ProjectDetailItemModel> projectDetailItemModels =
      IList<ProjectDetailItemModel>();

  /// iterate over all activities
  for (final DActivity activity in projectActivities) {
    const SyncableEntityState state = SyncableEntityState.SYNCED;
    // await ref.read(activityUtilsProvider).getActivityState(activity);

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

// @riverpod
// class ProjectDetailItemsModelsNotifier
//     extends _$ProjectDetailItemsModelsNotifier {
//   @override
//   Future<IList<ProjectDetailItemModel>> build() async {
//     final String projectUid =
//         (Get.arguments as Bundle).getString(EXTRA_PROJECT_UID)!;
//
//     /// get the list of active activities
//     final IList<DActivity> activeActivities = await ref
//         .watch(userAssignedActivitiesProvider().future);
//
//     /// Filter activities By project Id
//     final Iterable<DActivity> projectActivities =
//         activeActivities.where((DActivity t) => t.project == projectUid);
//
//     /// create initial programModels that will hold the ui models
//     IList<ProjectDetailItemModel> projectDetailItemModels =
//         IList<ProjectDetailItemModel>();
//
//     /// iterate over all activities
//     for (final DActivity activity in projectActivities) {
//       const SyncableEntityState state = SyncableEntityState.SYNCED;
//       // await ref.read(activityUtilsProvider).getActivityState(activity);
//
//       final List<DynamicForm> activeFormCount = await D2Remote.formModule.form
//           .where(attribute: 'activity', value: activity.id)
//           .get();
//
//       /// get Team associated with the activity
//       final DTeam? team = await ref
//           .watch(activitiesAccessRepositoryProvider)
//           .getActivityTeam(activity.id!);
//
//       final ProjectDetailItemModel programModel = ProjectDetailItemModel(
//           activity: activity.id!,
//           activityName: activity.name!,
//           activityForms: activeFormCount.length,
//           // description: activity.description,
//           team: team!.id,
//           metadataIconData: MetadataIconData(
//               programColor: ref
//                   .read(resourceManagerProvider)
//                   .getColorOrDefaultFrom(/* program.style?.color */ null),
//               iconResource: ref
//                   .read(resourceManagerProvider)
//                   .getObjectStyleDrawableResource(
//                       /* program.style()?.icon() */
//                       null,
//                       Icons.question_mark)),
//           syncablesState: state);
//
//       projectDetailItemModels = projectDetailItemModels.add(programModel);
//     }
//     return projectDetailItemModels
//         .let((IList<ProjectDetailItemModel> t) => applyFilters(t))
//         .sort((ProjectDetailItemModel p1, ProjectDetailItemModel p2) => p1
//             .activityName
//             .toLowerCase()
//             .compareTo(p2.activityName.toLowerCase()));
//   }
//
//   IList<ProjectDetailItemModel> applyFilters(
//       IList<ProjectDetailItemModel> models) {
//     // TODO(NMC): implement filtering
//
//     return models;
//   }
//
//   IList<ProjectDetailItemModel> applySync(
//       IList<ProjectDetailItemModel> models, SyncStatusData syncStatusData) {
//     return models;
//   }
//
//   Future<void> toggleExpansion(ProjectDetailItemModel item) async {
//     // Caution: The previous state may still be loading or in error state.
//     // A graceful way of handling this would be to read `this.future` instead
//     // of `this.state`, which would enable awaiting the loading state, and
//     // throw an error if the state is in error state.
//     final IList<ProjectDetailItemModel> previousState = await future;
//     // Mutable the previous list of todos.
//     final IList<ProjectDetailItemModel> newState =
//         previousState.replaceFirstWhere(
//             (ProjectDetailItemModel t) => t.activity == item.activity,
//             (ProjectDetailItemModel? t) =>
//                 t!.copyWith(valueListIsOpen: !t.valueListIsOpen));
//     state = AsyncData(newState);
//   }
// }
