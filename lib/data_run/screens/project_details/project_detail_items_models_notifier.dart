// ignore_for_file: avoid_dynamic_calls

import 'dart:async';

import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/datarun/common/standard_extensions.dart';
import 'package:d2_remote/modules/datarun/form/entities/dynamic_form.entity.dart';
import 'package:d2_remote/modules/metadatarun/activity/entities/d_activity.entity.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mass_pro/commons/resources/resource_manager.dart';
import 'package:mass_pro/commons/ui/metadata_icon_data.dart';
import 'package:mass_pro/core/common/state.dart' as item_state;
import 'package:mass_pro/data_run/screens/project_details/form_entity_mapped_repository.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_item.model.dart';
import 'package:mass_pro/data_run/utils/activities_access_repository.dart';
import 'package:mass_pro/data_run/utils/screens_constants.dart';
import 'package:mass_pro/data_run/utils/utils.providers.dart';
import 'package:mass_pro/main/data/service/sync_status_data.dart';
import 'package:mass_pro/main/usescases/bundle/bundle.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'project_detail_items_models_notifier.g.dart';

@riverpod
ProjectDetailItemModel projectDetailItemModel(ProjectDetailItemModelRef ref) {
  throw UnimplementedError();
}

@Riverpod(dependencies: [projectDetailItemModel])
Future<IList<FormListItemModel>> formListItemModels(
    FormListItemModelsRef ref) async {
  final model = ref.watch(projectDetailItemModelProvider);
  final List<DynamicForm> activeForms = await D2Remote.formModule.form
      .where(attribute: 'activity', value: model.activity)
      .get();

  IList<FormListItemModel> formListItemModels = IList([]);

  for (final form in activeForms) {
    final entitiesToPost = await ref
        .watch(formEntityMappedRepositoryProvider(form.code!))
        .getEntitiesCount(state: item_state.SyncableEntityState.TO_POST);

    final entitiesToUpdate = await ref
        .watch(formEntityMappedRepositoryProvider(form.code!))
        .getEntitiesCount(state: item_state.SyncableEntityState.TO_UPDATE);

    final entitiesSynced = await ref
        .watch(formEntityMappedRepositoryProvider(form.code!))
        .getEntitiesCount(state: item_state.SyncableEntityState.SYNCED);

    final entitiesWithError = await ref
        .watch(formEntityMappedRepositoryProvider(form.code!))
        .getEntitiesCount(state: item_state.SyncableEntityState.ERROR);

    final entitiesStatus = await ref
        .watch(formEntityMappedRepositoryProvider(form.code!))
        .getStatus();

    formListItemModels = formListItemModels.add(FormListItemModel(
        form: form.id!,
        formCode: form.code!,
        formName: form.name,
        activity: model.activity,
        entitiesToPost: entitiesToPost,
        entitiesToUpdate: entitiesToUpdate,
        entitiesSynced: entitiesSynced,
        entitiesWithError: entitiesWithError,
        canAddNewEvent: true,
        description: '',
        state: entitiesStatus));
  }
  return formListItemModels;
}

@riverpod
class ProjectDetailItemsModelsNotifier
    extends _$ProjectDetailItemsModelsNotifier {
  @override
  Future<IList<ProjectDetailItemModel>> build() async {
    final projectUid = (Get.arguments as Bundle).getString(EXTRA_PROJECT_UID)!;

    final IList<DActivity> activeActivities = await ref
        .watch(activitiesAccessRepositoryProvider)
        .getActiveActivities();

    final Iterable<DActivity> projectActivities =
        activeActivities.where((t) => t.project == projectUid);
    IList<ProjectDetailItemModel> programModles =
        IList<ProjectDetailItemModel>();
    for (final activity in projectActivities) {
      final state =
          await ref.read(activityUtilsProvider).getActivityState(activity);

      final List<DynamicForm> activeFormCount = await D2Remote.formModule.form
          .where(attribute: 'activity', value: activity.id)
          .get();

      final ProjectDetailItemModel programModel = ProjectDetailItemModel(
          activity: activity.id!,
          activityName: activity.name!,
          activeFormCount: activeFormCount.length,
          // description: activity.description,
          metadataIconData: MetadataIconData(
              programColor: ref
                  .read(resourceManagerProvider)
                  .getColorOrDefaultFrom(/* program.style?.color */ null),
              iconResource: ref
                  .read(resourceManagerProvider)
                  .getObjectStyleDrawableResource(
                      /* program.style()?.icon() */
                      null,
                      Icons.question_mark)),
          state: state);

      programModles = programModles.add(programModel);
    }
    return programModles.let((t) => applyFilters(t)).sort((p1, p2) =>
        p1.activityName.toLowerCase().compareTo(p2.activityName.toLowerCase()));
  }

  IList<ProjectDetailItemModel> applyFilters(
      IList<ProjectDetailItemModel> models) {
    // TODO(NMC): implement filtering

    return models;
  }

  IList<ProjectDetailItemModel> applySync(
      IList<ProjectDetailItemModel> models, SyncStatusData syncStatusData) {
    return models;
  }

  Future<void> toggleExpansion(ProjectDetailItemModel item) async {
    // Caution: The previous state may still be loading or in error state.
    // A graceful way of handling this would be to read `this.future` instead
    // of `this.state`, which would enable awaiting the loading state, and
    // throw an error if the state is in error state.
    final previousState = await future;
    // Mutable the previous list of todos.
    final newState = previousState.replaceFirstWhere(
        (t) => t.activity == item.activity,
        (t) => t!.copyWith(valueListIsOpen: !t.valueListIsOpen));
    state = AsyncData(newState);
  }
}
