import 'package:mass_pro/data_run/screens/general/view_base.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_deck/project_detail_item.model.dart';

mixin ProjectDetailDeckView implements ViewBase {
  void navigateTo(ProjectDetailItemModel dh);

  @override
  Future<void> showSyncDialog<T>([T? program]);
}
