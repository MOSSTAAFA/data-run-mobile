// ignore_for_file: avoid_dynamic_calls

import 'package:d2_remote/modules/datarun/common/standard_extensions.dart';
import 'package:d2_remote/modules/metadatarun/project/entities/d_project.entity.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:mass_pro/commons/resources/resource_manager.dart';
import 'package:mass_pro/commons/ui/metadata_icon_data.dart';
import 'package:mass_pro/core/common/state.dart';
import 'package:mass_pro/data_run/screens/dashboard/dashboard_deck/dashboard_item.model.dart';
import 'package:mass_pro/data_run/utils/activities_access_repository.dart';
import 'package:mass_pro/main/data/service/sync_status_controller.dart';
import 'package:mass_pro/main/data/service/sync_status_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dashboard_items_models_notifier.g.dart';

@riverpod
DashboardItemModel dashboardItemModel(DashboardItemModelRef ref) {
  throw UnimplementedError();
}

@riverpod
class DashboardItemsModelsNotifier extends _$DashboardItemsModelsNotifier {
  @override
  Future<IList<DashboardItemModel>> build() async {
    final syncStatusData = ref.watch(syncStatusControllerInstanceProvider
        .select((value) => value.syncStatusData));

    final IList<DProject> projects =
        await ref.watch(activitiesAccessRepositoryProvider).getActiveProjects();

    IList<DashboardItemModel> programModles = IList<DashboardItemModel>();
    for (final DProject project in projects) {
      final SyncStatus state = SyncStatus.SYNCED;
      // await ref.read(projectUtilsProvider).getProjectState(project);

      // final count =
      //     await ref.read(projectUtilsProvider).getActivitiesCount(project);

      final DashboardItemModel programModel = DashboardItemModel(
          uid: project.uid!,
          title: project.name!,
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
          type: project.name,
          dirty: project.dirty,
          state: state,
          // State.valueOf(state.name),
          // hasOverdueEvent: hasOverdue,
          // filtersAreActive: filtersAreActive,
          downloadState: ProjectDownloadState.NONE);

      programModles = programModles.add(programModel);
    }

    return programModles
        .let((t) => applyFilters(t))
        .let((t) => applySync(t, syncStatusData))
        .sort((p1, p2) =>
            p1.title.toLowerCase().compareTo(p2.title.toLowerCase()));
  }

  IList<DashboardItemModel> applyFilters(IList<DashboardItemModel> models) {
    return models;
  }

  IList<DashboardItemModel> applySync(
      IList<DashboardItemModel> models, SyncStatusData syncStatusData) {
    return models;
  }
}
