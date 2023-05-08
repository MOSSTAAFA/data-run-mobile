import 'package:d2_remote/modules/metadata/organisation_unit/entities/organisation_unit.entity.dart';

import '../../../../commons/extensions/string_extension.dart';
import 'di/program_providers.dart';
import 'program.view.dart';
import 'program_repository.dart';
import 'program_view.model.dart';

class ProgramPresenter {
  ProgramPresenter(this.ref, this.view, this.programRepository);

  final ProgramPresenterRef ref;
  final ProgramView view;
  final ProgramRepository programRepository;

  // final ThemeManager themeManager;
  // final FilterManager filterManager;
  // final MatomoAnalyticsController matomoAnalyticsController;
  // final SyncStatusController syncStatusController;

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
