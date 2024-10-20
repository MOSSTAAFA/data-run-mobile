// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:mass_pro/data_run/screens/form/hooks/register_dependencies.dart';
// import 'package:mass_pro/data_run/screens/form_ui_elements/get_error_widget.dart';
// import 'package:mass_pro/generated/l10n.dart';
// import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
//
// class ElementSectionRepeatItemSection extends HookWidget {
//   const ElementSectionRepeatItemSection({
//     super.key,
//     required this.repeatedItemElement,
//     this.onDeleteItem,
//     required this.index,
//   });
//
//   final FormRepeatItemElement repeatedItemElement;
//   final Function(int index)? onDeleteItem;
//   final int index;
//
//   @override
//   Widget build(BuildContext context) {
//     // final expanded = useState(element.expanded);
//     // final initRepeatItemElement = useRegisterDependencies(repeatedItemElement);
//
//     return ReactiveForm(
//       formGroup: repeatedItemElement.elementControl,
//       child: ImprovedExpansionTile(
//         leading: Icon(Icons.table_rows),
//         maintainState: true,
//         enabled: repeatedItemElement.form.enabled,
//         initiallyExpanded: false,
//         // onExpansionChanged: (ex) {
//         //   expanded.value = ex;
//         // },
//         titleWidget: Row(
//           children: [
//             Expanded(
//               child: Text(
//                 '${index + 1}. ${repeatedItemElement.label}',
//                 overflow: TextOverflow.fade,
//                 maxLines: 1,
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blue,
//                 ),
//               ),
//             ),
//             const Spacer(),
//             IconButton(
//               tooltip: S.of(context).remove,
//               icon: const Icon(Icons.delete, color: Colors.red),
//               onPressed: () {
//                 _confirmDelete(context, index);
//               },
//             ),
//           ],
//         ),
//         child: ElementSectionInstanceWidget(
//           section: repeatedItemElement,
//         ),
//       ),
//     );
//   }
//
//   Future<void> _confirmDelete(BuildContext context, int index) async {
//     final confirmed = await showDialog<bool>(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(S.of(context).confirm),
//           content: Text(
//             S.of(context).conformDeleteMsg,
//           ),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(false);
//               },
//               child: Text(S.of(context).cancel),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(true);
//               },
//               child: Text(S.of(context).confirm),
//             ),
//           ],
//         );
//       },
//     );
//
//     if (confirmed == true) {
//       _showUndoSnackBar(context, index);
//     }
//   }
//
//   void _showUndoSnackBar(BuildContext context, int index) {
//     final scaffoldMessenger = ScaffoldMessenger.of(context);
//
//     Future.delayed(const Duration(milliseconds: 300), () {
//       onDeleteItem?.call(index);
//     });
//
//     scaffoldMessenger.showSnackBar(
//       SnackBar(
//         content: Text(S.of(context).itemRemoved),
//         action: SnackBarAction(
//           label: S.of(context).undo,
//           onPressed: () {
//             // Code to undo deletion
//           },
//         ),
//       ),
//     );
//   }
// }
