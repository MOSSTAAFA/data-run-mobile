// import 'package:d2_remote/modules/datarun/form/shared/rule.dart';
// import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
// import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
//
// import 'form_element/form_element.dart';
//
// @immutable
// class FormConfig {
//   FormConfig({
//     required this.formName,
//     List<FormElement> fields = const [],
//     Map<String, List<OptionConfig>> options = const {},
//     Map<String, List<Rule>> rules = const {},
//   }) {
//     this.options.addAll(options);
//     this.fields.addAll(fields);
//     this.rules.addAll(rules);
//     // this.formControls = buildForm(fields, options: options)
//   }
//
//   // final Map<String, AbstractControl> formControls;
//
//   final String formName;
//
//   /// all form fields Configuration Parsed from form Submission
//   final List<FormElement> fields = [];
//
//   /// {fieldName:Rules}
//   final Map<String, List<Rule>> rules = {};
//
//   /// {listName:optionConfigs}
//   final Map<String, List<OptionConfig>> options = {};
//
//   /// dependencyMap example:
//   /// helps trigger only dependent fields' rules, Maybe needs topological
//   /// sorted, or a queue to dispatch action in order
//   ///
//   ///```dart
//   ///   final Map<String, List<String>> dependencyMap = {
//   ///   'continentQ': ['countryQ'],
//   ///   'transaction': ['voucherId', 'receivedQuantity'],
//   ///   'anotherFieldName1': ['voucherId'],
//   ///   'anotherFieldName2': ['voucherId'],
//   ///   'this': ['voucherId'],
//   /// };
//   ///```
//   final Map<String, List<String>> dependencyGraph = {};
//
//   FormGroup buildDynamicForm() {
//     // Parse JSON and create FormGroup with FormControls/FormArrays
//     final formControls = parseFormElements(fields, options: options);
//     return FormGroup(formControls);
//   }
//
//   static Map<String, AbstractControl> parseFormElements(
//       List<FormElement> fields,
//       {Map<String, List<OptionConfig>> options = const {}}) {
//     final Map<String, AbstractControl> controls = {};
//
//     for (var field in fields ?? []) {
//       controls[field.name] = _buildControl(field, optionsList: options);
//     }
//
//     return controls;
//   }
//
//   static AbstractControl _buildBasicControl(FieldElement element,
//       {Map<String, List<OptionConfig>> options = const {}}) {
//     switch (element.type) {
//       case ValueType.Text:
//       case ValueType.LongText:
//       case ValueType.Letter:
//       case ValueType.Email:
//       case ValueType.FullName:
//       case ValueType.SelectOne:
//         return FormControl<String>(
//           disabled: element.properties.disabled,
//         );
//       case ValueType.Date:
//       case ValueType.DateTime:
//         return FormControl<DateTime>(
//           disabled: element.properties.disabled,
//         );
//       case ValueType.Boolean:
//         return FormControl<bool>(
//           disabled: element.properties.disabled,
//         );
//       case ValueType.Integer:
//         return FormControl<int>(
//           disabled: element.properties.disabled,
//         );
//       case ValueType.Number:
//       case ValueType.Age:
//         return FormControl<double>(
//           disabled: element.properties.disabled,
//         );
//       case ValueType.SelectMulti:
//         return FormArray<String>(
//           disabled: element.properties.disabled,
//           options[element.listName]
//                   ?.map((option) => FormControl<String>())
//                   .toList() ??
//               [],
//         );
//       default:
//         throw UnsupportedError('Unsupported element type: ${element}');
//     }
//   }
//
//   static AbstractControl _buildControl(FormElement element,
//       {Map<String, List<OptionConfig>> optionsList = const {}}) {
//     return element.map(
//         fieldElement: (fieldElement) =>
//             _buildBasicControl(fieldElement, options: optionsList),
//         sectionElement: (sectionElement) => _buildSection(sectionElement),
//         repeatableElement: (repeatableElement) =>
//             _buildRepeatableSection(repeatableElement));
//   }
//
//   static FormGroup _buildSection(SectionElement section) {
//     final Map<String, AbstractControl> controls = {};
//
//     for (var field in section.formElements.values) {
//       controls[field.name] = _buildControl(field);
//     }
//     return FormGroup(controls);
//   }
//
//   static FormArray _buildRepeatableSection(
//       RepeatableElement repeatableSection) {
//     final List<AbstractControl> initialGroups = [];
//
//     for (var field in repeatableSection.formElements) {
//       initialGroups.add(_buildControl(field));
//     }
//     return FormArray(initialGroups);
//   }
// }
//
//
