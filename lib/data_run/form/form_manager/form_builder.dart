// import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
// import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
// import 'package:expression_language/expression_language.dart';
// import 'package:mass_pro/data_run/form/form_element/form_element_iterators/form_element_iterator.dart';
// import 'package:mass_pro/data_run/form/form_element_factories/form_element_builder.dart';
// import 'package:mass_pro/data_run/form/form_element_factories/form_element_control_builder.dart';
// import 'package:mass_pro/data_run/form/form_manager/form_data.dart';
// import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
// import 'package:reactive_forms/reactive_forms.dart';
//
// class FormBuilder {
//   FormBuilder(
//       {required this.elementBuilder, required this.elementControlBuilder});
//
//   final FormElementBuilder elementBuilder;
//   final FormElementControlBuilder elementControlBuilder;
//
//   Future<FormData> build(Map<String, dynamic> initialValue) async {
//     final formControls =
//         await elementControlBuilder.formDataControls(initialValue);
//     final formRootGroup = FormGroup(formControls);
//     final formElements = elementBuilder.buildFormElements(formRootGroup,
//         initialFormValue: initialValue);
//
//     var root = SectionInstance(
//         template: FieldTemplate(
//             mandatory: false,
//             mainField: false,
//             type: ValueType.Unknown,
//             name: '',
//             path: null),
//         form: formRootGroup)
//       ..addAll(formElements);
//
//     var formElementMap = {
//       for (var x in getFormElementIterator<FormElementInstance<dynamic>>(root))
//         x.pathRecursive: x
//     };
//
//     return _build(root, formElementMap);
//   }
//
//   FormData buildFromForm(SectionInstance root) {
//     var clonedForm = root.clone(null);
//     var formElementMap = {
//       for (var x
//           in getFormElementIterator<FormElement>(clonedForm as FormElement)
//               .where((e) => e.id != null))
//         x.id!: x
//     };
//     return _build(clonedForm, formElementMap);
//   }
//
//   FormData _build(SectionInstance root,
//       Map<String, FormElementInstance<dynamic>> formElementMap) {
//
//     return FormData(
//         form: root,
//         formElementMap: formElementMap);
//   }
//
// }
