// ignore_for_file: avoid_dynamic_calls

import 'package:d2_remote/modules/datarun/common/standard_extensions.dart';
import 'package:d2_remote/modules/datarun/sync/call/d2_progress_status.dart';
import 'package:d2_remote/modules/metadatarun/project/entities/d_project.entity.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:mass_pro/commons/resources/resource_manager.dart';
import 'package:mass_pro/commons/ui/metadata_icon_data.dart';
import 'package:mass_pro/data_run/screens/dashboard/dashboard_deck/dashboard_deck.providers.dart';
import 'package:mass_pro/data_run/screens/dashboard/dashboard_deck/dashboard_deck_repository.dart';
import 'package:mass_pro/data_run/screens/dashboard/dashboard_deck/dashboard_item.model.dart';
import 'package:mass_pro/data_run/utils/utils.providers.dart';
import 'package:mass_pro/main/data/service/sync_status_controller.dart';
import 'package:mass_pro/main/data/service/sync_status_data.dart';

class DashboardDeckRepositoryImpl implements DashboardDeckRepository {
  DashboardDeckRepositoryImpl(this.ref) {
    _startListeningForLastSyncStatus();
  }

  void _startListeningForLastSyncStatus() {
    ref.listen<SyncStatusData>(
        syncStatusControllerInstanceProvider
            .select((value) => value.syncStatusData), (previous, next) {
      lastSyncStatus = previous;
    });
  }

  // final FilterPresenter filterPresenter;
  final DashboardDeckRepositoryRef ref;

  IList<DashboardItemModel> baseProgramCache = IList<DashboardItemModel>();
  SyncStatusData? lastSyncStatus;

  @override
  Future<IList<DashboardItemModel>> deckItems(
      SyncStatusData syncStatusData) async {
    final IList<DashboardItemModel> dashboardItemViewModels = await deckCachedModels(
        syncStatusData) /* .catchError((onError) => IList<ProgramViewModel>()) */;
    return dashboardItemViewModels.sort(
        (p1, p2) => p1.title.toLowerCase().compareTo(p2.title.toLowerCase()));
  }

  @override
  Future<IList<DashboardItemModel>> deckCachedModels(
      SyncStatusData syncStatusData) async {
    if (baseProgramCache.isEmpty) {
      baseProgramCache = await _baseDashboardItems();
    }
    return baseProgramCache
        .let((it) => applyFilters(it))
        .let((it) => applySync(it, syncStatusData));
  }

  /// fetch projects and map each project into [DashboardItemModel]
  Future<IList<DashboardItemModel>> _baseDashboardItems() async {
    final projects =
        await ref.read(projectUtilsProvider).getProjects();
    IList<DashboardItemModel> programModles = IList<DashboardItemModel>();
    for (final DProject project in projects) {
      final state =
          await ref.read(projectUtilsProvider).getProjectState(project);

      final count =
          await ref.read(projectUtilsProvider).getActivitiesCount(project);

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
          count: count,
          type: project.name,
          dirty: project.dirty,
          state: state,
          // State.valueOf(state.name),
          // hasOverdueEvent: hasOverdue,
          // filtersAreActive: filtersAreActive,
          downloadState: ProjectDownloadState.NONE);

      programModles = programModles.add(programModel);
    }
    return programModles;
  }

  IList<DashboardItemModel> applyFilters(IList<DashboardItemModel> models) {
    // TODO(NMC): implement filtering
    return models;
  }

  IList<DashboardItemModel> applySync(
      IList<DashboardItemModel> models, SyncStatusData syncStatusData) {
    return models
        .map((dashboardModel) => dashboardModel.copyWith(
            downloadState: when<bool, ProjectDownloadState>(true, {
              syncStatusData.hasDownloadError(dashboardModel.uid): () =>
                  ProjectDownloadState.ERROR,
              syncStatusData.isProgramDownloading(dashboardModel.uid): () =>
                  ProjectDownloadState.DOWNLOADING,
              syncStatusData.wasProgramDownloading(
                  lastSyncStatus, dashboardModel.uid): () => when(
                      syncStatusData
                          .programSyncStatusMap[dashboardModel.uid]?.syncStatus,
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
