// ignore_for_file: avoid_dynamic_calls

import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import '../../../../commons/extensions/standard_extensions.dart';
import '../../../../commons/resources/resource_manager.dart';
import '../../../../core/arch/call/d2_progress_status.dart';
import '../../../../core/common/state.dart';
import '../../../data/service/sync_status_controller.dart';
import '../../../data/service/sync_status_data.dart';
import '../../../mp_logic/mp_program_utils.dart';
import 'di/program_providers.dart';
import 'program_repository.dart';
import 'program_view.model.dart';
import 'program_view_model_mapper.dart';

class ProgramRepositoryImpl implements ProgramRepository {
  ProgramRepositoryImpl(this.ref, this.mpProgramUtils, this.resourceManager) {
    programViewModelMapper = ProgramViewModelMapper(resourceManager);
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
  final ProgramRepositoryRef ref;
  final MpProgramUtils mpProgramUtils;

  // final DhisTrackedEntityInstanceUtils dhisTeiUtils;
  final ResourceManager resourceManager;

  late final ProgramViewModelMapper programViewModelMapper;
  IList<ProgramViewModel> baseProgramCache = IList<ProgramViewModel>();
  SyncStatusData? lastSyncStatus;

  @override
  Future<IList<ProgramViewModel>> homeItems(
      SyncStatusData syncStatusData) async {
    IList<ProgramViewModel> programViewModels = await programModels(
        syncStatusData) /* .catchError((onError) => IList<ProgramViewModel>()) */;
    programViewModels = programViewModels
        .addAll(await aggregatesModels(
            syncStatusData) /* .catchError((onError) => IList<ProgramViewModel>()) */)
        .sort((p1, p2) =>
            p1.title.toLowerCase().compareTo(p2.title.toLowerCase()));

    return programViewModels;
  }

  @override
  Future<IList<ProgramViewModel>> aggregatesModels(
      SyncStatusData syncStatusData) {
    // TODO: implement aggregatesModels
    return Future.value(IList<ProgramViewModel>());
  }

  @override
  Future<IList<ProgramViewModel>> programModels(
      SyncStatusData syncStatusData) async {
    if (baseProgramCache.isEmpty) {
      baseProgramCache = await _basePrograms();
    }
    return baseProgramCache
        .let((it) => applyFilters(it))
        .let((it) => applySync(it, syncStatusData));
  }

  Future<IList<ProgramViewModel>> _basePrograms() async {
    final programs = await mpProgramUtils.getProgramsInCaptureOrgUnits();
    IList<ProgramViewModel> programModles = IList<ProgramViewModel>();
    for (final program in programs) {
      final String recordLabel = await mpProgramUtils.getProgramRecordLabel(
          program,
          resourceManager.defaultTeiLabel(),
          resourceManager.defaultEventLabel());
      final State state = await mpProgramUtils.getProgramState(program);

      final ProgramViewModel programModel = programViewModelMapper.map(
          program, 0, recordLabel, state,
          hasOverdue: false, filtersAreActive: false);
      programModles = programModles.add(programModel);
    }
    return programModles;
  }

  IList<ProgramViewModel> applyFilters(IList<ProgramViewModel> models) {
    // TODO(NMC): implement filtering
    return models;
  }

  IList<ProgramViewModel> applySync(
      IList<ProgramViewModel> models, SyncStatusData syncStatusData) {
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
