import 'ou_tree_node.model.dart';

/// MVP: this is implemented by the view (widget) and then referenced by
/// the presenter, the presenter take to view through this interface
/// in widget contructor
/// this.presenter.OuSelectorView = this;
abstract class OuTreeListView {
  void setOrgUnits(List<OuTreeNodeModel> organisationUnits);

  List<OuTreeNodeModel> getCurrentList();
}
