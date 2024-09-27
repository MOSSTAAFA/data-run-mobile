// import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
// import 'package:flutter/material.dart';
// import 'package:mass_pro/data_run/form_reactive/form_builder/form_element_factory.dart';
// import 'package:mass_pro/data_run/form_reactive/form_element/form_element.dart';
// import 'package:mass_pro/data_run/form_reactive/form_element/form_instance.dart';
// import 'package:reactive_forms/reactive_forms.dart';
//
// class FormTemplatePage extends StatefulWidget {
//   final SectionInstance formModel;
//
//   FormTemplatePage({required this.formModel});
//
//   @override
//   _FormTemplatePageState createState() => _FormTemplatePageState();
// }
//
// class _FormTemplatePageState extends State<FormTemplatePage> {
//   late FormGroup formGroup;
//
//   @override
//   void initState() {
//     super.initState();
//     formGroup = FormInstanceFactory.createSectionControl(widget.formModel);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ReactiveForm(
//       formGroup: formGroup,
//       child: SingleChildScrollView(
//         child: FormElementWidgetFactory.createWidget(widget.formModel),
//       ),
//     );
//   }
//
//   List<Widget> _buildFormFields(List<FieldInstance> fields) {
//     List<Widget> widgets = [];
//     for (var field in fields) {
//       widgets.add(_buildField(field));
//     }
//     return widgets;
//   }
//
//   Widget _buildField(FieldInstance field) {
//     switch (field.type) {
//       case ValueType.Text:
//         return ReactiveTextField<String>(
//           formControlName: field.name,
//           decoration: InputDecoration(labelText: field.name),
//         );
//       case ValueType.Integer:
//         return ReactiveTextField<int>(
//           formControlName: field.name,
//           decoration: InputDecoration(labelText: field.name),
//           keyboardType: TextInputType.number,
//         );
//       case ValueType.SelectOne:
//         return ReactiveDropdownField<String>(
//           formControlName: field.name,
//           decoration: InputDecoration(labelText: field.name),
//           items: _getDropdownOptions(field),
//           onChanged: (value) {
//             // Handle any side-effects or rule evaluations
//           },
//         );
//       case ValueType.Section:
//         return Reactive(
//           formGroupName: field.name,
//           child: Column(
//             children: _buildFormFields(field.fields ?? []),
//           ),
//         );
//       case ValueType.RepeatableSection:
//         return ReactiveFormArray(
//           formArrayName: field.name,
//           builder: (context, formArray, child) {
//             return Column(
//               children: [
//                 ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: formArray.controls.length,
//                   itemBuilder: (context, index) {
//                     return ReactiveFormGroup(
//                       formGroup: formArray.controls[index] as FormGroup,
//                       child: Column(
//                         children: _buildFormFields(field.fields ?? []),
//                       ),
//                     );
//                   },
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     formArray.add(_formBuilderService._buildSection(field));
//                   },
//                   child: Text('Add ${field.name}'),
//                 ),
//               ],
//             );
//           },
//         );
//       default:
//         return SizedBox.shrink();
//     }
//   }
// }
