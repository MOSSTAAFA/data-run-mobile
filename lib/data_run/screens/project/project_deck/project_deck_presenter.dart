import 'package:d2_remote/modules/metadata/organisation_unit/entities/organisation_unit.entity.dart';

import 'package:mass_pro/commons/extensions/string_extension.dart';
import 'package:mass_pro/data_run/screens/project/project_deck/project_deck.providers.dart';
import 'package:mass_pro/data_run/screens/project/project_deck/project_deck.view.dart';
import 'package:mass_pro/data_run/screens/project/project_deck/project_deck_repository.dart';
import 'package:mass_pro/data_run/screens/project/project_deck/project_item.model.dart';

class ProjectDeckPresenter {
  ProjectDeckPresenter(this.ref, this.view, this.programRepository);

  final ProjectDeckPresenterRef ref;
  final ProjectDeckView view;
  final ProjectDeckRepository programRepository;

  // final ThemeManager themeManager;
  // final FilterManager filterManager;
  // final MatomoAnalyticsController matomoAnalyticsController;
  // final SyncStatusController syncStatusController;

  void onSyncStatusClick(ProjectItemModel projectItemModel) {
    // val programTitle = "$CLICK_ON${program.title}"
    // matomoAnalyticsController.trackEvent(HOME, SYNC_BTN, programTitle)
    view.showSyncDialog(projectItemModel);
  }

  void updateProgramQueries() {
    // filterManager.publishData();
  }

  void onItemClick(ProjectItemModel projectItemModel) {
    if (projectItemModel.programType.isNotEmpty) {
      // themeManager.setProgramTheme(programModel.uid)
    } else {
      // themeManager.setDataSetTheme(programModel.uid)
    }
    view.navigateTo(projectItemModel);
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
