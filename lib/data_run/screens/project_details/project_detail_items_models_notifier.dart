// ignore_for_file: avoid_dynamic_calls

import 'package:d2_remote/modules/datarun/common/standard_extensions.dart';
import 'package:d2_remote/modules/metadatarun/activity/entities/d_activity.entity.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mass_pro/commons/resources/resource_manager.dart';
import 'package:mass_pro/commons/ui/metadata_icon_data.dart';
import 'package:mass_pro/data_run/screens/dashboard/dashboard_deck/dashboard_item.model.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_item.model.dart';
import 'package:mass_pro/data_run/utils/screens_constants.dart';
import 'package:mass_pro/data_run/utils/utils.providers.dart';
import 'package:mass_pro/main/data/service/sync_status_data.dart';
import 'package:mass_pro/main/usescases/bundle/bundle.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../utils/activities_access_repository.dart';

part 'project_detail_items_models_notifier.g.dart';

@riverpod
ProjectDetailItemModel projectDetailItemModel(ProjectDetailItemModelRef ref) {
  throw UnimplementedError();
}

@Riverpod(keepAlive: true)
class ProjectDetailItemsModelsNotifier
    extends _$ProjectDetailItemsModelsNotifier {
  @override
  Future<IList<ProjectDetailItemModel>> build() async {
    final projectUid = (Get.arguments as Bundle).getString(EXTRA_PROJECT_UID)!;

    final IList<DActivity> activeActivities = await ref
        .watch(activitiesAccessRepositoryProvider)
        .getActiveActivities();

    final projectActivities =
        activeActivities.where((t) => t.project == projectUid);
    IList<ProjectDetailItemModel> programModles =
        IList<ProjectDetailItemModel>();
    for (final activity in projectActivities) {
      final state =
          await ref.read(activityUtilsProvider).getActivityState(activity);

      // final count =
      // await ref.read(projectUtilsProvider).getActivitiesCount(activity);

      final ProjectDetailItemModel programModel = ProjectDetailItemModel(
          uid: activity.uid!,
          title: activity.name ?? activity.code ?? activity.uid!,
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
          // count: count,
          type: activity.name,
          dirty: activity.dirty,
          state: state,
          // State.valueOf(state.name),
          // hasOverdueEvent: hasOverdue,
          // filtersAreActive: filtersAreActive,
          downloadState: ProjectDownloadState.NONE);

      programModles = programModles.add(programModel);
    }
    return programModles.let((t) => applyFilters(t)).sort(
        (p1, p2) => p1.title.toLowerCase().compareTo(p2.title.toLowerCase()));
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
}
