// ignore_for_file: avoid_dynamic_calls

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/commons/extensions/standard_extensions.dart';
import 'package:mass_pro/commons/resources/resource_manager.dart';
import 'package:mass_pro/core/arch/call/d2_progress_status.dart';
import 'package:mass_pro/core/common/state.dart';
import 'package:mass_pro/data_run/screens/dashboard/dashboard_deck/dashboard_deck.providers.dart';
import 'package:mass_pro/data_run/screens/dashboard/dashboard_deck/dashboard_deck_repository.dart';
import 'package:mass_pro/data_run/screens/dashboard/dashboard_deck/dashboard_item.model.dart';
import 'package:mass_pro/data_run/screens/dashboard/dashboard_deck/dashboard_item_model_mapper.dart';
import 'package:mass_pro/main/data/service/sync_status_controller.dart';
import 'package:mass_pro/main/data/service/sync_status_data.dart';

class DashboardDeckRepositoryImpl implements DashboardDeckRepository {
  DashboardDeckRepositoryImpl(
      this.ref /*, this.mpProgramUtils, this.resourceManager*/) {
    // programViewModelMapper = ProgramViewModelMapper(resourceManager);
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

  // final MpProgramUtils mpProgramUtils;
  //
  // // final DhisTrackedEntityInstanceUtils dhisTeiUtils;
  // final ResourceManager resourceManager;

  late final DashboardItemModelMapper dashboardItemModelMapper;
  IList<DashboardItemModel> baseProgramCache = IList<DashboardItemModel>();
  SyncStatusData? lastSyncStatus;

  @override
  Future<IList<DashboardItemModel>> homeItems(
      SyncStatusData syncStatusData) async {
    IList<DashboardItemModel> programViewModels = await programModels(
        syncStatusData) /* .catchError((onError) => IList<ProgramViewModel>()) */;
    programViewModels = programViewModels
        .addAll(await aggregatesModels(
            syncStatusData) /* .catchError((onError) => IList<ProgramViewModel>()) */)
        .sort((p1, p2) =>
            p1.title.toLowerCase().compareTo(p2.title.toLowerCase()));

    return programViewModels;
  }

  @override
  Future<IList<DashboardItemModel>> aggregatesModels(
      SyncStatusData syncStatusData) {
    // TODO: implement aggregatesModels
    return Future.value(IList<DashboardItemModel>());
  }

  @override
  Future<IList<DashboardItemModel>> programModels(
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
    final projects = await mpProgramUtils.getProgramsInCaptureOrgUnits();
    IList<DashboardItemModel> programModles = IList<DashboardItemModel>();
    for (final project in projects) {
      final String recordLabel = await mpProgramUtils.getProgramRecordLabel(
          project,
          resourceManager.defaultTeiLabel(),
          resourceManager.defaultEventLabel());
      final State state = await mpProgramUtils.getProgramState(project);

      final DashboardItemModel programModel = dashboardItemModelMapper.map(
          project, 0, recordLabel, state,
          hasOverdue: false, filtersAreActive: false);
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
        .map((programModel) => programModel.copyWith(
            downloadState: when<bool, ProjectDownloadState>(true, {
              syncStatusData.hasDownloadError(programModel.uid): () =>
                  ProjectDownloadState.ERROR,
              syncStatusData.isProgramDownloading(programModel.uid): () =>
                  ProjectDownloadState.DOWNLOADING,
              syncStatusData.wasProgramDownloading(
                  lastSyncStatus, programModel.uid): () => when(
                      syncStatusData
                          .programSyncStatusMap[programModel.uid]?.syncStatus,
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
