// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:datarun/data_run/screens/form/element/providers/form_instance.provider.dart';
// import 'package:datarun/data_run/screens/form/element_widgets/repeat_item.widget.dart';
// import 'package:datarun/data_run/screens/form/element/form_element.dart';
// import 'package:datarun/data_run/screens/form/inherited_widgets/form_metadata_inherit_widget.dart';
// import 'package:datarun/generated/l10n.dart';
// import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
//
// class RepeatSectionWidget extends HookConsumerWidget {
//   const RepeatSectionWidget({super.key, required this.element});
//
//   final RepeatInstance element;
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final formMetadata = FormMetadataWidget.of(context);
//     final formInstance = ref
//         .watch(
//         formInstanceProvider(formMetadata: formMetadata))
//         .requireValue;
//     return ReactiveFormArray(
//       formArray: formInstance.form.control(element.pathRecursive) as FormArray,
//       builder:
//           (BuildContext context, FormArray<dynamic> formArray, Widget? child) {
//         return Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               ...element.elements.asMap().entries.map((entry) {
//                 final index = entry.key;
//                 final repeatItemInstance = entry.value;
//
//                 return RepeatItem(
//                   element: repeatItemInstance,
//                   onDeleteItem: (index) {
//                     ref
//                         .watch(formInstanceProvider(
//                             formMetadata: formMetadata))
//                         .requireValue
//                         .onRemoveRepeatedItem(index, element);
//                   },
//                   index: index,
//                 );
//               }).toList(),
//               ElevatedButton.icon(
//                 onPressed: element.form.enabled
//                     ? () {
//                         ref
//                             .watch(formInstanceProvider(
//                                 formMetadata: formMetadata))
//                             .requireValue
//                             .onAddRepeatedItem(element);
//                       }
//                     : null,
//                 icon: const Icon(Icons.add),
//                 label: Text(S.of(context).addNew),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.green,
//                   foregroundColor: Colors.white,
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
// // onRemoveItem(int index, BuildContext context, WidgetRef ref) {
// //   // final elementPath = element.elements[index].elementPath;
// //   element.removeAt(index);
// //   element.elementControl.markAsDirty();
// //   onRemove?.call(index);
// // }
// //
// // void onAddItem(BuildContext context, WidgetRef ref) {
// //   final instanceBuilder = ref.read(formInstanceBuilderProvider(formMetadata: FormMetadataWidget.of(context))).requireValue;
// //   final instanceControllerBuilder = ref.read(formInstanceControlBuilderProvider(formMetadata: FormMetadataWidget.of(context))).requireValue;
// //   final itemInstanceController = instanceControllerBuilder.createSectionFormGroup(element.template);
// //   final itemInstance = instanceBuilder.buildRepeatItem(element.form, element.template);
// //
// //   final formInstance = ref.read(formInstanceProvider(formMetadata: FormMetadataWidget.of(context))).requireValue;
// //   formInstance.form.control(element.elementPath) as FormArray<Map<String, Object?>>;
// //
// //   element.elementControl.add(itemInstanceController);
// //   element.add(itemInstance);
// // }
// }
