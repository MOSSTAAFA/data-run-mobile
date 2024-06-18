// ignore_for_file: avoid_dynamic_calls

import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/datarun/common/standard_extensions.dart';
import 'package:d2_remote/modules/datarun_shared/sync/call/d2_progress_status.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mass_pro/commons/resources/resource_manager.dart';
import 'package:mass_pro/commons/ui/metadata_icon_data.dart';
import 'package:mass_pro/data_run/screens/dashboard/dashboard_deck/dashboard_item.model.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail.providers.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_item.model.dart';
import 'package:mass_pro/data_run/utils/screens_constants.dart';
import 'package:mass_pro/data_run/utils/utils.providers.dart';
import 'package:mass_pro/main/data/service/sync_status_controller.dart';
import 'package:mass_pro/main/data/service/sync_status_data.dart';
import 'package:mass_pro/main/usescases/bundle/bundle.dart';

class ProjectDetailRepository {
  ProjectDetailRepository(this.ref) {
    _startListeningForLastSyncStatus();
  }

  void _startListeningForLastSyncStatus() {
    ref.listen<SyncStatusData>(
        syncStatusControllerInstanceProvider
            .select((value) => value.syncStatusData), (previous, next) {
      lastSyncStatus = previous;
    });
  }

  final ProjectDetailRepositoryRef ref;

  late final ProjectDetailItemModel projectDetailViewModelMapper;
  IList<ProjectDetailItemModel> baseProjectDetailItemsCache =
      IList<ProjectDetailItemModel>();
  SyncStatusData? lastSyncStatus;
  String? lastOpenedProjectId;

  Future<IList<ProjectDetailItemModel>> projectDetailItems(
      SyncStatusData syncStatusData) async {
    IList<ProjectDetailItemModel> projectViewModels =
        await projectDetailCachedItems(
            syncStatusData) /* .catchError((onError) => IList<ProgramViewModel>()) */;
    projectViewModels = projectViewModels.sort(
        (p1, p2) => p1.title.toLowerCase().compareTo(p2.title.toLowerCase()));

    return projectViewModels;
  }

  Future<IList<ProjectDetailItemModel>> projectDetailCachedItems(
      SyncStatusData syncStatusData) async {
    if (baseProjectDetailItemsCache.isEmpty) {
      baseProjectDetailItemsCache = await _baseProjectItems();
    }
    return baseProjectDetailItemsCache
        .let((it) => applyFilters(it))
        .let((it) => applySync(it, syncStatusData));
  }

  Future<IList<ProjectDetailItemModel>> _baseProjectItems() async {
    final projectUid = (Get.arguments as Bundle).getString(EXTRA_PROJECT_UID)!;
    final projectActivities =
        await D2Remote.activityModuleD.activity.byProject(projectUid).get();
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
    return programModles;
  }

  IList<ProjectDetailItemModel> applyFilters(
      IList<ProjectDetailItemModel> models) {
    // TODO(NMC): implement filtering

    return models;
  }

  IList<ProjectDetailItemModel> applySync(
      IList<ProjectDetailItemModel> models, SyncStatusData syncStatusData) {
    return models
        .map((projectModel) => projectModel.copyWith(
            downloadState: when<bool, ProjectDownloadState>(true, {
              syncStatusData.hasDownloadError(projectModel.uid): () =>
                  ProjectDownloadState.ERROR,
              syncStatusData.isProgramDownloading(projectModel.uid): () =>
                  ProjectDownloadState.DOWNLOADING,
              syncStatusData.wasProgramDownloading(
                  lastSyncStatus, projectModel.uid): () => when(
                      syncStatusData
                          .programSyncStatusMap[projectModel.uid]?.syncStatus,
                      {
                        [
                          D2ProgressSyncStatus.SUCCESS,
                          D2ProgressSyncStatus.ERROR
                        ]: () => ProjectDownloadState.DOWNLOADED,
                        D2ProgressSyncStatus.PARTIAL_ERROR: () =>
                            ProjectDownloadState.ERROR,
                      }).orElse(() => ProjectDownloadState.DOWNLOADED),
            }).orElse(() => ProjectDownloadState.NONE),
            downloadActive: syncStatusData.running))
        .toIList();
  }
}
