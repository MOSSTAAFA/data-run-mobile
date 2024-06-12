import 'package:mass_pro/commons/extensions/string_extension.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_deck/project_detail_deck.providers.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_deck/project_detail_deck.view.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_deck/project_detail_item.model.dart';

class ProjectDetailDeckPresenter {
  ProjectDetailDeckPresenter(this.ref, this.view);

  final ProjectDetailDeckPresenterRef ref;
  final ProjectDetailDeckView view;

  // final ThemeManager themeManager;
  // final FilterManager filterManager;
  // final MatomoAnalyticsController matomoAnalyticsController;
  // final SyncStatusController syncStatusController;

  void onSyncStatusClick(ProjectDetailItemModel projectDetailItemModel) {
    view.showSyncDialog(projectDetailItemModel);
  }

  void updateProgramQueries() {
    // filterManager.publishData();
  }

  void onItemClick(ProjectDetailItemModel projectDetailItemModel) {
    if (projectDetailItemModel.programType.isNotEmpty) {
      // themeManager.setProgramTheme(programModel.uid)
    } else {
      // themeManager.setDataSetTheme(programModel.uid)
    }
    view.navigateTo(projectDetailItemModel);
  }

  void showDescription(String? description) {
    if (!description.isNullOrEmpty) {
      view.showDescription(description!);
    }
  }

// fun projectDetailsActivities() => programs

// fun downloadState() = syncStatusController.observeDownloadProcess()

// fun setIsDownloading() {
//     refreshData.onNext(Unit)
// }
}
