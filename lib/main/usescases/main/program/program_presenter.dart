import 'package:d2_remote/modules/metadata/organisation_unit/entities/organisation_unit.entity.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../commons/extensions/string_extension.dart';
import 'program_repository.dart';
import 'program_repository_impl.dart';
import 'program_view.dart';
import 'program_view_model.dart';
part 'program_presenter.g.dart';

@riverpod
class ProgramViewModels extends _$ProgramViewModels {
  @override
  IList<ProgramViewModel> build() {
    return IList<ProgramViewModel>();
  }

  void setValue(IList<ProgramViewModel> value) {
    state = value;
  }
}

@Riverpod(keepAlive: true)
ProgramPresenter programPresenter(ProgramPresenterRef ref, ProgramView view) {
  return ProgramPresenter(ref, view, ref.read(programRepositoryProvider));
}

class ProgramPresenter {
  ProgramPresenter(this.ref, this.view, this.programRepository);
  final ProgramPresenterRef ref;
  final ProgramView view;
  final ProgramRepository programRepository;
  // final ThemeManager themeManager;
  // final FilterManager filterManager;
  // final MatomoAnalyticsController matomoAnalyticsController;
  // final SyncStatusController syncStatusController;
  void init() {
    programRepository.homeItems().then((programs) {
      ref.read(programViewModelsProvider.notifier).setValue(programs);
      view.swapProgramModelData(programs);
    });
  }

  void onSyncStatusClick(ProgramViewModel program) {
    // val programTitle = "$CLICK_ON${program.title}"
    // matomoAnalyticsController.trackEvent(HOME, SYNC_BTN, programTitle)
    view.showSyncDialog(program);
  }

  void updateProgramQueries() {
    // filterManager.publishData();
  }

  void onItemClick(ProgramViewModel programModel) {
    if (programModel.programType.isNotEmpty) {
      // themeManager.setProgramTheme(programModel.uid)
    } else {
      // themeManager.setDataSetTheme(programModel.uid)
    }
    view.navigateTo(programModel);
  }

  void showDescription(String? description) {
    if (!description.isNullOrEmpty) {
      view.showDescription(description!);
    }
  }

  void showHideFilterClick() {
    view.showHideFilter();
  }

  void clearFilterClick() {
    // filterManager.clearAllFilters();
    view.clearFilters();
  }

  void setOrgUnitFilters(List<OrganisationUnit> selectedOrgUnits) {
    // filterManager.addOrgUnits(selectedOrgUnits);
  }

  // fun programs() => programs

  // fun downloadState() = syncStatusController.observeDownloadProcess()

  // fun setIsDownloading() {
  //     refreshData.onNext(Unit)
  // }
}
