// import 'package:datarun/data_run/screens/form/element/control_model/element_extended_control.dart';
// import 'package:datarun/data_run/screens/form/element/form_element.dart';
// import 'package:datarun/data_run/screens/form/element/form_instance.dart';
// import 'package:datarun/data_run/screens/form/form_with_sliver/repeat_table/edit_panel.dart';
// import 'package:datarun/data_run/screens/form/inherited_widgets/form_instance_inherit_widget.dart';
// import 'package:datarun/data_run/screens/form/inherited_widgets/form_metadata_inherit_widget.dart';
// import 'package:datarun/generated/l10n.dart';
// import 'package:flutter/material.dart';
// import 'package:reactive_forms/reactive_forms.dart';
//
// Future<bool> _showEditPanel(BuildContext context, RepeatInstance repeatInstance,
//     [ElementExtendedControl? control, int? index]) async {
//   final formInstance = FormInstanceInheritWidget.of(context);
//
//   String title = control == null
//       ? '${S.of(context).newItem}: ${repeatInstance.label}'
//       : '${S.of(context).editItem}: ${repeatInstance.label}';
//
//   if (control == null) {
//     control = formInstance.createNewItemExtendedControl(repeatInstance);
//   }
//
//   bool itemSaved = false;
//
//   await showDialog(
//     context: context,
//     barrierDismissible: false, // Prevent dismissing by tapping outside
//     builder: (BuildContext context) {
//       return WillPopScope(
//         onWillPop: () async {
//           // Handle back button press
//           return await _onTryToClose(context, control!, itemSaved);
//         },
//         child: Dialog(
//           child: FormMetadataWidget(
//             formMetadata: formInstance.formMetadata,
//             child: FormInstanceInheritWidget(
//               formInstance: formInstance,
//               child: EditPanel(
//                 title: title,
//                 repeatInstance: repeatInstance,
//                 control: control!,
//                 onSave: (formGroup, action) {
//                   formGroup.markAsTouched();
//                   if (formGroup.valid) {
//                     itemSaved = true;
//                     _handleSave(context, formInstance, repeatInstance,
//                         formGroup, action);
//                   }
//                 },
//                 onClose: () async {
//                   if (await _onTryToClose(context, repeatInstance, control!, itemSaved)) {
//                     Navigator.of(context).pop();
//                   }
//                 },
//               ),
//             ),
//           ),
//         ),
//       );
//     },
//   );
//
//   return itemSaved;
// }
//
// Future<bool> _onTryToClose(BuildContext context, RepeatInstance repeatInstance,
//     ElementExtendedControl control, bool itemSaved) async {
//   if (control.itemFormGroup.dirty && !itemSaved) {
//     final bool? confirmClose = await showDialog<bool>(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(S.of(context).unsavedChangesWarning),
//           content: Text(S.of(context).closeThisItemWithoutSaving),
//           actions: <Widget>[
//             TextButton(
//               child: Text(S.of(context).cancel),
//               onPressed: () => Navigator.of(context).pop(false),
//             ),
//             TextButton(
//               child: Text(S.of(context).closeThisItemWithoutSaving),
//               onPressed: () => Navigator.of(context).pop(true),
//             ),
//           ],
//         );
//       },
//     );
//
//     if (confirmClose == true) {
//       // Remove the unsaved item
//       if (control.item.name == null) {
//         // This is a new item, remove it from the repeat instance
//         repeatInstance.elements.removeLast();
//       }
//       return true;
//     }
//     return false;
//   }
//   return true;
// }
//
// void _handleSave(BuildContext context, FormInstance formInstance,
//     RepeatInstance repeatInstance, FormGroup formGroup, EditActionType action) {
//   if (formGroup.valid) {
//     Navigator.of(context).pop(); // Close the current dialog
//
//     if (action == EditActionType.SAVE_AND_ADD_ANOTHER) {
//       // microtask to ensure the current dialog is closed before
//       // showing a new one
//       Future.microtask(() => _showEditPanel(context, repeatInstance));
//     } else if (action == EditActionType.SAVE_AND_CLOSE) {
//       // Do nothing, as we've already closed the dialog
//     }
//   }
// }
