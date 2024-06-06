import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/data_run/screens/general/view_base.dart';
import 'package:mass_pro/data_run/screens/project/project_deck/project_item.model.dart';

mixin ProjectDeckView implements ViewBase {
  void swapProgramModelData(IList<ProjectItemModel> programs);

  void showFilterProgress();

  void openOrgUnitTreeSelector();

  void showHideFilter();

  void clearFilters();

  void navigateTo(ProjectItemModel dh);

  @override
  Future<void> showSyncDialog<T>([T? program]);
}

