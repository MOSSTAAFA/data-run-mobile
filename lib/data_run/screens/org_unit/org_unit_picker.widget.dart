// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:mass_pro/data_run/screens/org_unit/model/tree_node.dart';
// import 'package:mass_pro/data_run/screens/org_unit/model/tree_node_data_source.dart';
// import 'package:mass_pro/data_run/screens/org_unit/settings/controller.dart';
// import 'package:mass_pro/data_run/screens/org_unit/tree_tile.widget.dart';
//
// // The M3 sizes are coming from the tokens, but are hand coded,
// // as the current token DB does not contain landscape versions.
// const Size _inputPortraitDialogSizeM2 = Size(330.0, 270.0);
// const Size _inputPortraitDialogSizeM3 = Size(328.0, 270.0);
// const Size _inputLandscapeDialogSize = Size(496, 160.0);
//
// class OrgUnitPickerDialog extends ConsumerStatefulWidget {
//   const OrgUnitPickerDialog(
//       {super.key,
//       required this.dataSource,
//       this.onSelect,
//       this.initialNode,
//       this.restorationId,
//       this.cancelText,
//       this.confirmText,
//       this.helpText});
//
//   final TreeNodeDataSource dataSource;
//
//   final void Function(String?)? onSelect;
//
//   final String? initialNode;
//
//   final String? restorationId;
//
//   /// The text that is displayed on the cancel button.
//   final String? cancelText;
//
//   /// The text that is displayed on the confirm button.
//   final String? confirmText;
//
//   /// The text that is displayed at the top of the header.
//   ///
//   /// This is used to indicate to the user what they are selecting a date for.
//   final String? helpText;
//
//   @override
//   ConsumerState<OrgUnitPickerDialog> createState() =>
//       _OrgUnitPickerDialogState();
// }
//
// class _OrgUnitPickerDialogState extends ConsumerState<OrgUnitPickerDialog>
//     with RestorationMixin {
//
//   late final RestorableStringN _selectedNode =
//       RestorableStringN(widget.initialNode);
//
//   final GlobalKey _treeNodePickerKey = GlobalKey();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   @override
//   String? get restorationId => widget.restorationId;
//
//   @override
//   void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
//     registerForRestoration(_selectedNode, 'selected_tree_node_id');
//   }
//
//   void _handleOk() {
//     Navigator.pop(context, _selectedNode.value);
//   }
//
//   void _handleCancel() {
//     Navigator.pop(context);
//   }
//
//   void _handleDateChanged(String id) {
//     _vibrate();
//     setState(() {
//       _isSelectable(id);
//       _selectedNode.value = id;
//     });
//   }
//
//   Size _dialogSize(BuildContext context) {
//     final bool useMaterial3 = Theme.of(context).useMaterial3;
//     final Orientation orientation = MediaQuery.orientationOf(context);
//
//     return switch (orientation) {
//       (Orientation.portrait) when useMaterial3 => _inputPortraitDialogSizeM3,
//       (Orientation.portrait) => _inputPortraitDialogSizeM2,
//       (Orientation.landscape) => _inputLandscapeDialogSize,
//     };
//   }
//
//   TreeNode? _getSelectedNode() {
//     return widget.dataSource.getNode(_selectedNode.value);
//   }
//
//   @override
//   void dispose() {
//     _selectedNode.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final ThemeData theme = Theme.of(context);
//     final bool useMaterial3 = theme.useMaterial3;
//     final MaterialLocalizations localizations =
//         MaterialLocalizations.of(context);
//     final Orientation orientation = MediaQuery.orientationOf(context);
//     final DatePickerThemeData datePickerTheme = DatePickerTheme.of(context);
//     final DatePickerThemeData defaults = DatePickerTheme.defaults(context);
//     final TextTheme textTheme = theme.textTheme;
//
//     final Widget actions = Container(
//       alignment: AlignmentDirectional.centerEnd,
//       constraints: const BoxConstraints(minHeight: 52.0),
//       padding: const EdgeInsets.symmetric(horizontal: 8),
//       child: OverflowBar(
//         spacing: 8,
//         children: <Widget>[
//           TextButton(
//             style:
//                 datePickerTheme.cancelButtonStyle ?? defaults.cancelButtonStyle,
//             onPressed: _handleCancel,
//             child: Text(widget.cancelText ??
//                 (useMaterial3
//                     ? localizations.cancelButtonLabel
//                     : localizations.cancelButtonLabel.toUpperCase())),
//           ),
//           TextButton(
//             style: datePickerTheme.confirmButtonStyle ??
//                 defaults.confirmButtonStyle,
//             onPressed: _handleOk,
//             child: Text(widget.confirmText ?? localizations.okButtonLabel),
//           ),
//         ],
//       ),
//     );
//
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
//                 onTap: entry.node.selectable
//                     ? (node) {
//                         setState(() {
//                           _selectedNode = node;
//                         });
//                         widget.onSelect != null
//                             ? widget.onSelect!.call(node?.uid.uid)
//                             : Navigator.of(context).pop(node?.uid.uid);
//                       }
//                     : null,
//                 isSelected: entry.node.uid.uid == _selectedNode?.uid.uid,
//               );
//             },
//             duration: ref.watch(watchAnimationDurationSettingProvider),
//           ),
//         ),
//       ],
//     );
//   }
// }
