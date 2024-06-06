import 'package:d2_remote/modules/metadata/organisation_unit/entities/organisation_unit.entity.dart';
import 'package:mass_pro/commons/extensions/string_extension.dart';
import 'package:mass_pro/data_run/screens/dashboard/dashboard_deck/dashboard_deck.providers.dart';
import 'package:mass_pro/data_run/screens/dashboard/dashboard_deck/dashboard_deck.view.dart';
import 'package:mass_pro/data_run/screens/dashboard/dashboard_deck/dashboard_deck_repository.dart';
import 'package:mass_pro/data_run/screens/dashboard/dashboard_deck/dashboard_item.model.dart';

class DashboardDeckPresenter {
  DashboardDeckPresenter(this.ref, this.view, this.programRepository);

  final DashboardDeckPresenterRef ref;
  final DashboardDeckView view;
  final DashboardDeckRepository programRepository;

  // final ThemeManager themeManager;
  // final FilterManager filterManager;
  // final MatomoAnalyticsController matomoAnalyticsController;
  // final SyncStatusController syncStatusController;

  void onSyncStatusClick(DashboardItemModel dashboardItemModel) {
    // val programTitle = "$CLICK_ON${program.title}"
    // matomoAnalyticsController.trackEvent(HOME, SYNC_BTN, programTitle)
    view.showSyncDialog(dashboardItemModel);
  }

  void updateProgramQueries() {
    // filterManager.publishData();
  }

  void onItemClick(DashboardItemModel dashboardItemModel) {
    view.navigateTo(dashboardItemModel);
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
