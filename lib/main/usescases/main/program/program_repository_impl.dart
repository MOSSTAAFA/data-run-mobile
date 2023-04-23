import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import '../../../../commons/resources/resource_manager.dart';
import '../../../../core/common/state.dart';
import '../../../mp_logic/mp_program_utils.dart';
import 'program_repository.dart';
import 'program_view_model.dart';
import 'program_view_model_mapper.dart';

class ProgramRepositoryImpl implements ProgramRepository {
  ProgramRepositoryImpl(this.mpProgramUtils, this.resourceManager) {
    programViewModelMapper = ProgramViewModelMapper(resourceManager);
  }
  // final FilterPresenter filterPresenter;
  final MpProgramUtils mpProgramUtils;
  // final DhisTrackedEntityInstanceUtils dhisTeiUtils;
  final ResourceManager resourceManager;

  late final ProgramViewModelMapper programViewModelMapper;
  // SyncStatusData? lastSyncStatus = null;
  IList<ProgramViewModel> baseProgramCache = IList<ProgramViewModel>();

  @override
  Future<IList<ProgramViewModel>> homeItems() async {
    IList<ProgramViewModel> programViewModels = await programModels();
    programViewModels = programViewModels.addAll(await aggregatesModels()).sort(
        (p1, p2) => p1.title.toLowerCase().compareTo(p2.title.toLowerCase()));

    return programViewModels;
    // return programModels(syncStatusData).onErrorReturn { arrayListOf() }
    //         .mergeWith(aggregatesModels(syncStatusData).onErrorReturn { arrayListOf() })
    //         .flatMapIterable { data -> data }
    //         .sorted { p1, p2 -> p1.title.compareTo(p2.title, ignoreCase = true) }
    //         .toList().toFlowable()
    //         .subscribeOn(schedulerProvider.io())
    //         .onErrorReturn { arrayListOf() }
    //         .doOnNext {
    //             lastSyncStatus = syncStatusData
    //         }
  }

  @override
  Future<IList<ProgramViewModel>> aggregatesModels() {
    // TODO: implement aggregatesModels
    return Future.value(IList<ProgramViewModel>());
  }

  @override
  Future<IList<ProgramViewModel>> programModels() async {
    if (baseProgramCache.isEmpty) {
      baseProgramCache = await _basePrograms();
    }
    return baseProgramCache;
    // return Flowable.fromCallable {
    //         baseProgramCache.ifEmpty {
    //             baseProgramCache = basePrograms()
    //             baseProgramCache
    //         }.applyFilters()
    //             .applySync(syncStatusData)
    //     }
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
}
