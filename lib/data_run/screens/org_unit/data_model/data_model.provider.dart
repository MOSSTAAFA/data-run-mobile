import 'package:d2_remote/shared/entities/identifiable_tree_node.entity.dart';
import 'package:d2_remote/shared/queries/base.query.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/data_run/screens/org_unit/data_model/tree_node_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'data_model.provider.g.dart';

@riverpod
Future<TreeNodeDataSource<T, Q>>
    treeNodeDataSource<T extends IdentifiableTreeNode, Q extends BaseQuery>(
        TreeNodeDataSourceRef ref,
        {required Q query,
        required IList<String> selectableUids}) async {
  final TreeNodeDataSource<T, Q> tree = TreeNodeDataSource(
      query: query, selectableNodesUids: selectableUids.unlock);
  await tree.initTreeNodeMap();
  return tree;
}
