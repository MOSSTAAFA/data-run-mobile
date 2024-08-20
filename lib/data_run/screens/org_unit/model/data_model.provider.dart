import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/data_run/screens/org_unit/model/tree_node_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'data_model.provider.g.dart';

@riverpod
Future<TreeNodeDataSource> treeNodeDataSource(TreeNodeDataSourceRef ref,
    {required IList<String> selectableUids}) async {
  final TreeNodeDataSource tree =
      TreeNodeDataSource(selectableNodesUids: selectableUids.unlock);
  await tree.initTreeNodeMap();
  return tree;
}
