// // dynamic_form_page.dart
// import 'package:flutter/material.dart';
// import 'package:mass_pro/data_run/form/form_model/form_builder_service.dart';
// import 'package:mass_pro/data_run/form_reactive/form_element/form_element.dart';
// import 'package:reactive_forms/reactive_forms.dart';
//
// class FormTemplatePage extends StatefulWidget {
//   final Map<String, dynamic> formJson;
//
//   FormTemplatePage({required this.formJson});
//
//   @override
//   _FormTemplatePageState createState() => _FormTemplatePageState();
// }
//
// class _FormTemplatePageState extends State<FormTemplatePage> {
//   late FormGroup formGroup;
//   final FormBuilderService _formBuilderService = FormBuilderService();
//
//   @override
//   void initState() async {
//     super.initState();
//     final formModel = FormModel.fromJson(widget.formJson);
//     formGroup = await _formBuilderService.buildForm(formModel);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dynamic Form'),
//       ),
//       body: ReactiveForm(
//         formGroup: formGroup,
//         child: SingleChildScrollView(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             children: _buildFormFields(formGroup, widget.formJson['fields']),
//           ),
//         ),
//       ),
//     );
//   }
//
//   List<Widget> _buildFormFields(FormGroup group, List<dynamic> fieldsJson) {
//     List<Widget> widgets = [];
//     for (var fieldJson in fieldsJson) {
//       final field = FieldModel.fromJson(fieldJson);
//       widgets.add(_buildField(group, field));
//     }
//     return widgets;
//   }
//
//   Widget _buildField(FormGroup group, FieldModel field) {
//     switch (field.type) {
//       case 'Text':
//         return ReactiveTextField<String>(
//           formControlName: field.name,
//           decoration: InputDecoration(labelText: field.name),
//         );
//       case 'Integer':
//         return ReactiveTextField<int>(
//           formControlName: field.name,
//           decoration: InputDecoration(labelText: field.name),
//           keyboardType: TextInputType.number,
//         );
//       case 'SelectOne':
//         return ReactiveDropdownField<String>(
//           formControlName: field.name,
//           decoration: InputDecoration(labelText: field.name),
//           items: _getDropdownOptions(field),
//         );
//       case 'Section':
//         return SectionWidget(sectionField: field, formBuilderService: _formBuilderService);
//       case 'RepeatableSection':
//         return RepeatableSectionWidget(repeatableField: field, formBuilderService: _formBuilderService);
//       default:
//         return SizedBox.shrink();
//     }
//   }
//
//   List<DropdownMenuItem<String>> _getDropdownOptions(FieldModel field) {
//     // Implement as before
//     return [];
//   }
// }
//
// class SectionWidget extends StatelessWidget {
//   final SectionInstance sectionField;
//   final FormBuilderService formBuilderService;
//
//   SectionWidget({required this.sectionField, required this.formBuilderService});
//
//   @override
//   Widget build(BuildContext context) {
//     return ReactiveFormConfig(
//       formGroupName: sectionField.name,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             sectionField.name,
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           ...?sectionField.fields?.map((field) {
//             return _buildNestedField(context, field);
//           }).toList(),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildNestedField(BuildContext context, FieldModel field) {
//     // Implement similar to _buildField in FormTemplatePage
//     // Possibly use a helper or pass the formBuilderService
//     return SizedBox.shrink(); // Placeholder
//   }
// }
//
// class RepeatableSectionWidget extends StatelessWidget {
//   final FieldModel repeatableField;
//   final FormBuilderService formBuilderService;
//
//   RepeatableSectionWidget({required this.repeatableField, required this.formBuilderService});
//
//   @override
//   Widget build(BuildContext context) {
//     return ReactiveFormArray(
//       formArrayName: repeatableField.name,
//       builder: (context, formArray, child) {
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               repeatableField.name,
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             ListView.builder(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               itemCount: formArray.controls.length,
//               itemBuilder: (context, index) {
//                 final group = formArray.controls[index] as FormGroup;
//                 return ReactiveFormGroup(
//                   formGroup: group,
//                   child: Column(
//                     children: repeatableField.fields!.map((field) {
//                       return FormTemplateFieldWidget(field: field);
//                     }).toList(),
//                   ),
//                 );
//               },
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 formArray.add(formBuilderService._buildSection(repeatableField));
//               },
//               child: Text('Add ${repeatableField.name}'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
//
// class FormTemplateFieldWidget extends StatelessWidget {
//   final FieldModel field;
//
//   FormTemplateFieldWidget({required this.field});
//
//   @override
//   Widget build(BuildContext context) {
//     switch (field.type) {
//       case 'Text':
//         return ReactiveTextField<String>(
//           formControlName: field.name,
//           decoration: InputDecoration(labelText: field.name),
//         );
//       case 'Integer':
//         return ReactiveTextField<int>(
//           formControlName: field.name,
//           decoration: InputDecoration(labelText: field.name),
//           keyboardType: TextInputType.number,
//         );
//       case 'SelectOne':
//         return ReactiveDropdownField<String>(
//           formControlName: field.name,
//           decoration: InputDecoration(labelText: field.name),
//           items: [], // Implement accordingly
//         );
//       default:
//         return SizedBox.shrink();
//     }
//   }
// }
