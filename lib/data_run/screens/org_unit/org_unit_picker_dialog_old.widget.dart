// import 'package:flutter/material.dart';
// import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:mass_pro/data_run/screens/org_unit/model/tree_node.dart';
// import 'package:mass_pro/data_run/screens/org_unit/model/tree_node_data_source.dart';
// import 'package:mass_pro/data_run/screens/org_unit/settings/controller.dart';
// import 'package:mass_pro/data_run/screens/org_unit/tree_tile.widget.dart';
//
// class OrgUnitPicker extends ConsumerStatefulWidget {
//   const OrgUnitPicker(
//       {super.key,
//       required this.dataSource,
//       this.onSelect,
//       this.selectedUid,
//       this.restorationId});
//
//   final TreeNodeDataSource dataSource;
//   final void Function(String?)? onSelect;
//   final String? selectedUid;
//
//   final String? restorationId;
//
//   @override
//   ConsumerState<OrgUnitPicker> createState() => _OrgUnitPickerDialogState();
// }
//
// class _OrgUnitPickerDialogState extends ConsumerState<OrgUnitPicker>
//     with RestorationMixin {
//   final TextEditingController searchBarTextEditingController =
//       TextEditingController();
//   late final TreeController<TreeNode> treeController;
//
//   final RestorableStringN _selectedNodeId = RestorableStringN('');
//
//   final GlobalKey _treeNodePickerKey = GlobalKey();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   @override
//   String? get restorationId => widget.restorationId;
//
//   @override
//   void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
//     registerForRestoration(_selectedNodeId, 'selected_tree_node_id');
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _selectedNodeId.value = widget.selectedUid;
//   }
//
//   @override
//   void dispose() {
//     _selectedNodeId.dispose();
//     super.dispose();
//   }
//
//   void _handleCancel() {
//     Navigator.pop(context);
//   }
//
//   void _handleOk() {
//     Navigator.pop(context, _selectedNodeId.value);
//   }
//
//   void _handleNodeChanged(String id) {
//     setState(() {
//       _selectedNodeId.value = id;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8),
//           child: SearchBar(
//             controller: searchBarTextEditingController,
//             hintText: 'Type to Filter',
//             leading: const Padding(
//               padding: EdgeInsets.all(8),
//               child: Icon(Icons.filter_list),
//             ),
//             trailing: [
//               Badge(
//                 isLabelVisible: filter != null,
//                 label: Text(
//                   '${filter?.totalMatchCount}/${filter?.totalNodeCount}',
//                 ),
//               ),
//               IconButton(
//                 icon: const Icon(Icons.clear),
//                 onPressed: clearSearch,
//               )
//             ],
//           ),
//         ),
//         Expanded(
//           child: AnimatedTreeView<TreeNode>(
//             treeController: treeController,
//             nodeBuilder: (BuildContext context, TreeEntry<TreeNode> entry) {
//               return TreeTile(
//                 entry: entry,
//                 match: filter?.matches[entry.node],
//                 searchPattern: searchPattern,
//                 onSelect: entry.node.selectable
//                     ? (node) {
//                         setState(() {
//                           _selectedNode = node;
//                         });
//                         widget.onSelect != null
//                             ? widget.onSelect!.call(node?.data.uid)
//                             : Navigator.of(context).pop(node?.data.uid);
//                       }
//                     : null,
//                 isSelected: entry.node.data.uid == _selectedNode?.data.uid,
//               );
//             },
//             duration: ref.watch(watchAnimationDurationSettingProvider),
//           ),
//         ),
//       ],
//     );
//   }
// }
