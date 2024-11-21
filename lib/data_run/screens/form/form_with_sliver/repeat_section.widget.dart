// import 'package:datarun/data_run/screens/form/element/form_element.dart';
// import 'package:datarun/data_run/screens/form/element/providers/form_instance.provider.dart';
// import 'package:datarun/data_run/screens/form/form_with_sliver/repeat_table_view.dart';
// import 'package:datarun/data_run/screens/form/form_with_sliver/table_item_edit_panel.dart';
// import 'package:datarun/data_run/screens/form/hooks/register_dependencies.dart';
// import 'package:datarun/data_run/screens/form/inherited_widgets/form_metadata_inherit_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
//
// class RepeatSectionWidget extends HookConsumerWidget {
//   const RepeatSectionWidget({Key? key, required this.element}) : super(key: key);
//
//   final RepeatInstance element;
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     useRegisterDependencies(element);
//
//     final elementPropertiesSnapshot = useStream(element.propertiesChanged);
//
//
//     if (!elementPropertiesSnapshot.hasData) {
//       return const SliverToBoxAdapter(child: CircularProgressIndicator());
//     }
//
//     if (elementPropertiesSnapshot.data!.hidden) {
//       return const SliverToBoxAdapter(child: SizedBox.shrink());
//     }
//
//     final formInstance = ref
//         .watch(
//         formInstanceProvider(formMetadata: FormMetadataWidget.of(context)))
//         .requireValue;
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(element.label, style: Theme.of(context).textTheme.titleMedium),
//         RepeatInstanceDataTable(
//           key: ValueKey('${element.elementPath}_RepeatSectionWidget'),
//           repeatInstance: element,
//           onAdd: () => onAdd(context, ref, formInstance.onAddRepeatedItem(element), true),
//           onDelete: (index) => formInstance.onRemoveRepeatedItem(index, element),
//           onEdit: (index) => onAdd(context, ref, element.elements[index], false),
//         )
//       ],
//     );
//   }
//
//   Future<int> onAdd(BuildContext context, WidgetRef ref,
//       RepeatItemInstance item, bool isNew) async {
//     final formMetadata = FormMetadataWidget.of(context);
//
//     await showModalBottomSheet(
//       isScrollControlled: true,
//       context: context,
//       builder: (BuildContext context) {
//         return FormMetadataWidget(
//           formMetadata: formMetadata,
//           child: EditPanel(
//             repeatItemInstance: item,
//             isNew: isNew,
//             onSave: () {
//               if (item.elementControl.dirty) {
//                 element.elementControl.markAsTouched();
//               }
//               if (context.mounted) Navigator.pop(context);
//             },
//             onCancel: () {
//               if (item.elementControl.dirty) {
//                 element.elementControl.markAsTouched();
//               }
//               if (context.mounted) Navigator.pop(context);
//             },
//           ),
//         );
//       },
//     );
//     return int.tryParse(item.name)!;
//   }
// }