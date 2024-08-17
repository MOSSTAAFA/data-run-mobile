import 'package:d2_remote/shared/entities/identifiable_tree_node.entity.dart';
import 'package:d2_remote/shared/queries/base.query.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/data_run/screens/org_unit/data_model/tree_node.extension.dart';
import 'package:mass_pro/data_run/screens/org_unit/data_model/tree_node.dart';

class TreeNodeDataSource<T extends IdentifiableTreeNode, Q extends BaseQuery> {
  TreeNodeDataSource(
      {required Q query, required List<String> selectableNodesUids})
      : _selectableNodesUids = selectableNodesUids,
        _query = query;

  IMap<String, TreeNode<T>> _treeNodeCache = IMap();
  TreeNode<T>? _rootNode;
  Q _query;

  List<String> _selectableNodesUids;

  Q getQuery() {
    return _query;
  }

  List<String> getSelectableNodesUids() {
    return _selectableNodesUids;
  }

  IMap<String, TreeNode<T>> getTreeNodeMap() => _treeNodeCache;

  TreeNode<T>? getNode(String? uid) {
    return uid != null ? _treeNodeCache.get(uid) : null;
  }

  T? fetchEntityByUid(String uid) {
    return _treeNodeCache.get(uid)?.data;
  }

  TreeNode<T>? getRootNode() {
    return _rootNode;
  }

  Future<IMap<String, TreeNode<T>>> initTreeNodeMap() async {
    final list = await fetchTreeNodeList();

    _treeNodeCache = _composeTreeMap(list).lock;

    final commonAncestorUid = list.getCommonAncestorUid();

    if (_treeNodeCache.isNotEmpty && commonAncestorUid == null) {
      throw Exception("No common ancestor found");
    }

    _rootNode = _treeNodeCache.get(commonAncestorUid!);
    return _treeNodeCache;
  }

  Future<List<T>> fetchTreeNodeList() async {
    final List<T> selectedOrgUnits =
        await _query.byIds(_selectableNodesUids).get();
    final allUids = selectedOrgUnits.getPathsUids();

    final List<T> combinedUnits = await _query.byIds(allUids.toList()).get();
    return combinedUnits;
  }

  Map<String, TreeNode<T>> _composeTreeMap(List<T> nodes) {
    final selectedOrgUnitsUids = nodes.getPathsUids();

    final IMap<String, TreeNode<T>> nodeMap =
        IMap.fromIterable<String, TreeNode<T>, T>(nodes,
            keyMapper: (o) => o.uid!,
            valueMapper: (o) =>
                o.toTreeNode(selectable: selectedOrgUnitsUids.contains(o.uid)));

    // Build the tree structure
    final Map<String, TreeNode<T>> tree = {};
    for (final node in nodeMap.values) {
      if (node.parent == null) {
        tree[node.data.uid!] = node;
      } else {
        final parent = nodeMap[node.parent!];
        parent?.children.add(node);
      }
    }

    return tree;
  }
}
