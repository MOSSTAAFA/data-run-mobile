// ignore_for_file: avoid_dynamic_calls

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/commons/extensions/standard_extensions.dart';
import 'package:mass_pro/commons/resources/resource_manager.dart';
import 'package:mass_pro/core/arch/call/d2_progress_status.dart';
import 'package:mass_pro/core/common/state.dart';
import 'package:mass_pro/main/data/service/sync_status_controller.dart';
import 'package:mass_pro/main/data/service/sync_status_data.dart';
import 'package:mass_pro/data_run/screens/project/project_deck/project_deck.providers.dart';
import 'package:mass_pro/data_run/screens/project/project_deck/project_deck_repository.dart';
import 'package:mass_pro/data_run/screens/project/project_deck/project_item.model.dart';

class ProjectDeckRepositoryImpl implements ProjectDeckRepository {
  ProjectDeckRepositoryImpl(
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
  final ProjectDeckRepositoryRef ref;

  // final MpProgramUtils mpProgramUtils;
  //
  // // final DhisTrackedEntityInstanceUtils dhisTeiUtils;
  // final ResourceManager resourceManager;

  late final ProjectItemModel programViewModelMapper;
  IList<ProjectItemModel> baseProgramCache = IList<ProjectItemModel>();
  SyncStatusData? lastSyncStatus;

  @override
  Future<IList<ProjectItemModel>> homeItems(
      SyncStatusData syncStatusData) async {
    IList<ProjectItemModel> programViewModels = await programModels(
        syncStatusData) /* .catchError((onError) => IList<ProgramViewModel>()) */;
    programViewModels = programViewModels
        .addAll(await aggregatesModels(
            syncStatusData) /* .catchError((onError) => IList<ProgramViewModel>()) */)
        .sort((p1, p2) =>
            p1.title.toLowerCase().compareTo(p2.title.toLowerCase()));

    return programViewModels;
  }

  @override
  Future<IList<ProjectItemModel>> aggregatesModels(
      SyncStatusData syncStatusData) {
    // TODO: implement aggregatesModels
    return Future.value(IList<ProjectItemModel>());
  }

  @override
  Future<IList<ProjectItemModel>> programModels(
      SyncStatusData syncStatusData) async {
    if (baseProgramCache.isEmpty) {
      baseProgramCache = await _basePrograms();
    }
    return baseProgramCache
        .let((it) => applyFilters(it))
        .let((it) => applySync(it, syncStatusData));
  }

  Future<IList<ProjectItemModel>> _basePrograms() async {
    final programs = await mpProgramUtils.getProgramsInCaptureOrgUnits();
    IList<ProjectItemModel> programModles = IList<ProjectItemModel>();
    for (final program in programs) {
      final String recordLabel = await mpProgramUtils.getProgramRecordLabel(
          program,
          resourceManager.defaultTeiLabel(),
          resourceManager.defaultEventLabel());
      final State state = await mpProgramUtils.getProgramState(program);

      final ProjectItemModel programModel = programViewModelMapper.map(
          program, 0, recordLabel, state,
          hasOverdue: false, filtersAreActive: false);
      programModles = programModles.add(programModel);
    }
    return programModles;
  }

  IList<ProjectItemModel> applyFilters(IList<ProjectItemModel> models) {
    // TODO(NMC): implement filtering
    return models;
  }

  IList<ProjectItemModel> applySync(
      IList<ProjectItemModel> models, SyncStatusData syncStatusData) {
    return models
        .map((programModel) => programModel.copyWith(
            downloadState: when<bool, ProgramDownloadState>(true, {
              syncStatusData.hasDownloadError(programModel.uid): () =>
                  ProgramDownloadState.ERROR,
              syncStatusData.isProgramDownloading(programModel.uid): () =>
                  ProgramDownloadState.DOWNLOADING,
              syncStatusData.wasProgramDownloading(
                  lastSyncStatus, programModel.uid): () => when(
                      syncStatusData
                          .programSyncStatusMap[programModel.uid]?.syncStatus,
                      {
                        [
                          D2ProgressSyncStatus.SUCCESS,
                          D2ProgressSyncStatus.ERROR
                        ]: () => ProgramDownloadState.DOWNLOADED,
                        D2ProgressSyncStatus.PARTIAL_ERROR: () =>
                            ProgramDownloadState.ERROR,
                      }).orElse(() => ProgramDownloadState.DOWNLOADED),
            }).orElse(() => ProgramDownloadState.NONE),
            downloadActive: syncStatusData.running))
        .toIList();
  }
}
