import 'package:d2_remote/shared/entities/identifiable_tree_node.entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/data_run/screens/org_unit/data_model/tree_node.dart';
import 'package:mass_pro/data_run/screens/org_unit/data_model/tree_node_data_source.dart';
import 'package:mass_pro/data_run/screens/org_unit/settings/controller.dart';
import 'package:mass_pro/data_run/screens/org_unit/tree_tile.widget.dart';

class OrgUnitTreeViewPicker<T extends IdentifiableTreeNode>
    extends ConsumerStatefulWidget {
  const OrgUnitTreeViewPicker(
      {super.key,
      required this.dataSource,
      this.onSelect,
      this.selectedUid,
      this.restorationId});

  final TreeNodeDataSource dataSource;
  final void Function(String?)? onSelect;
  final String? selectedUid;

  final String? restorationId;

  @override
  ConsumerState<OrgUnitTreeViewPicker<T>> createState() =>
      _OrgUnitTreeViewPickerState();
}

class _OrgUnitTreeViewPickerState<T extends IdentifiableTreeNode>
    extends ConsumerState<OrgUnitTreeViewPicker<T>> /*with RestorationMixin*/ {
  late final TextEditingController searchBarTextEditingController;
  late final TreeController<TreeNode<T>> treeController;

  /// NMC
  TreeNode<T>? _selectedNode;

  void expandAndScrollToSelectedNode() {
    if (_selectedNode == null) return;

    // Expand the tree to the selected node
    treeController.expand(_selectedNode!);

    // Rebuild the tree to reflect the expansion
    treeController.rebuild();

    // Optionally, scroll to the selected node
    // final nodeIndex = treeController.getVisibleNodes().indexOf(selectedNode!);
    // if (nodeIndex != -1) {
    //   // Scroll the tree view to the selected node's position
    //   Scrollable.ensureVisible(
    //     context.findRenderObject()!,
    //     alignment: 0.5,
    //     duration: Duration(milliseconds: 300),
    //   );
    // }
  }

  /// END NMC
  TreeSearchResult<TreeNode<T>>? filter;
  Pattern? searchPattern;

  Iterable<TreeNode<T>> getChildren(TreeNode<T> node) {
    if (filter case TreeSearchResult<TreeNode<T>> filter?) {
      return node.children.where(filter.hasMatch);
    }
    return node.children;
  }

  void search(String query) {
    filter = null;

    Pattern pattern;
    try {
      pattern = RegExp(query, caseSensitive: false); // case-insensitive search
    } on FormatException {
      pattern = query;
    }
    searchPattern = pattern;

    filter = treeController.search((TreeNode<T> node) {
      // Check if either `code` or `name` contains the search pattern
      return node.data.code?.contains(pattern) == true ||
          node.data.name?.contains(pattern) == true;
    });

    treeController.rebuild();

    if (mounted) {
      setState(() {});
    }
  }

  void clearSearch() {
    if (filter == null) return;

    setState(() {
      filter = null;
      searchPattern = null;
      treeController.rebuild();
      searchBarTextEditingController.clear();
    });
  }

  void onSearchQueryChanged() {
    final String query = searchBarTextEditingController.text.trim();

    if (query.isEmpty) {
      clearSearch();
      return;
    }

    search(query);
  }

  TreeNode<T> _getNode(String? uid) {
    return widget.dataSource.getNode(uid) as TreeNode<T>;
  }

  @override
  void initState() {
    super.initState();
    _selectedNode =
        widget.selectedUid != null ? _getNode(widget.selectedUid) : null;
    // populateExampleTree(root);

    treeController = TreeController<TreeNode<T>>(
      roots: (widget.dataSource.getRootNode() as TreeNode<T>?)?.children ?? [],
      childrenProvider: getChildren,
    ) /*..expandAll()*/;
    expandAndScrollToSelectedNode();
  }

  @override
  void dispose() {
    filter = null;
    searchPattern = null;
    treeController.dispose();
    searchBarTextEditingController.dispose();
    super.dispose();
  }

  // void _handleCancel() {
  //   Navigator.pop(context);
  // }
  //
  // void _handleOk() {
  //   Navigator.pop(context, _selectedNode);
  // }

  // void _handleNodeChanged(OrgUnitNode date) {
  //   setState(() {
  //     _selectedNode = date;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: SearchBar(
            controller: searchBarTextEditingController,
            hintText: 'Type to Filter',
            leading: const Padding(
              padding: EdgeInsets.all(8),
              child: Icon(Icons.filter_list),
            ),
            trailing: [
              Badge(
                isLabelVisible: filter != null,
                label: Text(
                  '${filter?.totalMatchCount}/${filter?.totalNodeCount}',
                ),
              ),
              IconButton(
                icon: const Icon(Icons.clear),
                onPressed: clearSearch,
              )
            ],
          ),
        ),
        Expanded(
          child: AnimatedTreeView<TreeNode<T>>(
            treeController: treeController,
            nodeBuilder: (BuildContext context, TreeEntry<TreeNode<T>> entry) {
              return TreeTile(
                entry: entry,
                match: filter?.matches[entry.node],
                searchPattern: searchPattern,
                onSelect: (node) {
                  widget.onSelect != null
                      ? widget.onSelect!.call(node?.data.uid)
                      : Navigator.of(context).pop(node?.data.uid);
                },
                isSelected: entry.node.data.uid == widget.selectedUid,
              );
            },
            duration: ref.watch(watchAnimationDurationSettingProvider),
          ),
        ),
      ],
    );
  }
}
