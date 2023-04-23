import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import '../../general/view_base.dart';
import 'program_view_model.dart';

abstract class ProgramView with ViewBase {
  void swapProgramModelData(IList<ProgramViewModel> programs);

  void showFilterProgress();

  void openOrgUnitTreeSelector();

  void showHideFilter();

  void clearFilters();

  void navigateTo(ProgramViewModel program);

  /// T -> ProgramViewModel
  @override
  Future<void> showSyncDialog<T>([T? program]);
}
