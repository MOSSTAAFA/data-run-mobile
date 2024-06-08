// ignore_for_file: avoid_dynamic_calls

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/commons/extensions/standard_extensions.dart';
import 'package:mass_pro/core/arch/call/d2_progress_status.dart';
import 'package:mass_pro/data_run/screens/project/project_deck/project_deck.providers.dart';
import 'package:mass_pro/data_run/screens/project/project_deck/project_deck_repository.dart';
import 'package:mass_pro/data_run/screens/project/project_deck/project_item.model.dart';
import 'package:mass_pro/main/data/service/sync_status_controller.dart';
import 'package:mass_pro/main/data/service/sync_status_data.dart';

class ProjectDeckRepositoryImpl implements ProjectDeckRepository {
  ProjectDeckRepositoryImpl(this.ref) {
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

  late final ProjectItemModel programViewModelMapper;
  IList<ProjectItemModel> baseProgramCache = IList<ProjectItemModel>();
  SyncStatusData? lastSyncStatus;

  @override
  Future<IList<ProjectItemModel>> projectItems(
      SyncStatusData syncStatusData) async {
    IList<ProjectItemModel> programViewModels = await projectCachedItems(
        syncStatusData) /* .catchError((onError) => IList<ProgramViewModel>()) */;
    programViewModels = programViewModels.sort(
        (p1, p2) => p1.title.toLowerCase().compareTo(p2.title.toLowerCase()));

    return programViewModels;
  }

  @override
  Future<IList<ProjectItemModel>> projectCachedItems(
      SyncStatusData syncStatusData) async {
    if (baseProgramCache.isEmpty) {
      baseProgramCache = await _baseProjectItems();
    }
    return baseProgramCache
        .let((it) => applyFilters(it))
        .let((it) => applySync(it, syncStatusData));
  }

  Future<IList<ProjectItemModel>> _baseProjectItems() async {
    // final programs = await mpProgramUtils.getProgramsInCaptureOrgUnits();
    // IList<ProjectItemModel> programModles = IList<ProjectItemModel>();
    // for (final program in programs) {
    //   final String recordLabel = await mpProgramUtils.getProgramRecordLabel(
    //       program,
    //       resourceManager.defaultTeiLabel(),
    //       resourceManager.defaultEventLabel());
    //   final State state = await mpProgramUtils.getProgramState(program);
    //
    //   final ProjectItemModel programModel = programViewModelMapper.map(
    //       program, 0, recordLabel, state,
    //       hasOverdue: false, filtersAreActive: false);
    //   programModles = programModles.add(programModel);
    // }
    // return programModles;
    return Future.value(IList());
  }

  IList<ProjectItemModel> applyFilters(IList<ProjectItemModel> models) {
    // TODO(NMC): implement filtering
    return models;
  }

  IList<ProjectItemModel> applySync(
      IList<ProjectItemModel> models, SyncStatusData syncStatusData) {
    return models
        .map((projectModel) => projectModel.copyWith(
            downloadState: when<bool, ProgramDownloadState>(true, {
              syncStatusData.hasDownloadError(projectModel.uid): () =>
                  ProgramDownloadState.ERROR,
              syncStatusData.isProgramDownloading(projectModel.uid): () =>
                  ProgramDownloadState.DOWNLOADING,
              syncStatusData.wasProgramDownloading(
                  lastSyncStatus, projectModel.uid): () => when(
                      syncStatusData
                          .programSyncStatusMap[projectModel.uid]?.syncStatus,
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
