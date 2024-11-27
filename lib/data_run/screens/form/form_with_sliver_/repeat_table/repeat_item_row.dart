// import 'package:datarun/data_run/screens/form/element/providers/form_instance.provider.dart';
// import 'package:datarun/data_run/screens/form/inherited_widgets/form_metadata_inherit_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
//
// class RepeatItemRow extends HookConsumerWidget {
//   final int index;
//
//   RepeatItemRow({required this.index});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final formInstance = ref
//         .watch(
//             formInstanceProvider(formMetadata: FormMetadataWidget.of(context)))
//         .requireValue;
//
//
//     final control =
//     formInstance.of(context)!.form.itemFormGroup('rows.$index') as FormGroup;
//
//     return ListTile(
//       title: Text('Row $index'),
//       subtitle: Text('Details: ${control.value}'),
//       trailing: IconButton(
//         icon: Icon(Icons.edit),
//         onPressed: () =>
//             FormInstance.of(context)!.showEditPanel(context, control, index),
//       ),
//     );
//   }
// }
