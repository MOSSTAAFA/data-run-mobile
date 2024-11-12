// import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
// import 'package:datarun/data_run/form_reactive/form_element/form_element_members.dart';
// import 'package:datarun/data_run/form_reactive/form_element/form_element_model.dart';
// import 'package:datarun/data_run/form_reactive/form_element/repeat_section.dart';
// import 'package:test/test.dart';
//
// void main() {
//   group('FormInstance Tests', () {
//     test(
//         'Test FormInstance with different elements including repeated sections',
//         () {
//       // Setup form elements
//       final textField = FieldInstance(
//         name: 'name',
//         type: ValueType.Text,
//         value: 'John Doe',
//         properties: FormElementState(),
//       );
//
//       final dropdownField = FieldInstance(
//         name: 'country',
//         type: ValueType.SelectOne,
//         value: 'USA',
//         options: [
//           OptionConfig(label: 'USA', name: 'USA', listName: 'listName'),
//           OptionConfig(label: 'Canada', name: 'Canada', listName: 'listName'),
//           OptionConfig(label: 'UK', name: 'UK', listName: 'listName'),
//         ],
//         properties: FormElementState(),
//       );
//
//       final section = SectionInstance(
//         name: 'addressSection',
//         type: ValueType.Section,
//         elements: [
//           FieldInstance(
//             name: 'street',
//             type: ValueType.Text,
//             value: '123 Elm St',
//             properties: FormElementState(),
//           ),
//           FieldInstance(
//             name: 'city',
//             type: ValueType.Text,
//             value: 'New York',
//             properties: FormElementState(),
//           ),
//         ],
//         properties: FormElementState(),
//       );
//
//       // Repeated section with two instances
//       final repeatSection = RepeatSectionInstance(
//         name: 'familyMembers',
//         type: ValueType.RepeatableSection,
//         elements: {
//           0: RepeatSection(
//             name: 'firstName',
//             type: ValueType.Text,
//             elements: [
//               FieldInstance(
//                 name: 'street',
//                 type: ValueType.Text,
//                 value: 'street 0',
//                 properties: FormElementState(),
//               ),
//               FieldInstance(
//                 name: 'city',
//                 type: ValueType.Text,
//                 value: 'city 0',
//                 properties: FormElementState(),
//               ),
//             ],
//             properties: FormElementState(),
//           ),
//           1: RepeatSection(
//             name: 'relation',
//             type: ValueType.Text,
//             elements: [
//               FieldInstance(
//                 name: 'street',
//                 type: ValueType.Text,
//                 value: 'street 1',
//                 properties: FormElementState(),
//               ),
//               FieldInstance(
//                 name: 'city',
//                 type: ValueType.Text,
//                 value: 'city 1',
//                 properties: FormElementState(),
//               ),
//             ],
//             properties: FormElementState(),
//           ),
//           2: RepeatSection(
//             name: 'firstName',
//             type: ValueType.Text,
//             elements: [
//               FieldInstance(
//                 name: 'street',
//                 type: ValueType.Text,
//                 value: 'street 2',
//                 properties: FormElementState(),
//               ),
//               FieldInstance(
//                 name: 'city',
//                 type: ValueType.Text,
//                 value: 'city 2',
//                 properties: FormElementState(),
//               ),
//             ],
//             properties: FormElementState(),
//           ),
//           3: RepeatSection(
//             name: 'relation',
//             type: ValueType.Text,
//             elements: [
//               FieldInstance(
//                 name: 'street',
//                 type: ValueType.Text,
//                 value: 'street 3',
//                 properties: FormElementState(),
//               ),
//               FieldInstance(
//                 name: 'city',
//                 type: ValueType.Text,
//                 value: 'city 3',
//                 properties: FormElementState(),
//               ),
//             ],
//             properties: FormElementState(),
//           ),
//         },
//         properties: FormElementState(),
//       );
//
//       // Form with fields, section, and repeated section
//
//       // Assert initial values
//       expect(formInstance.getRawValue()['name'], 'John Doe');
//       expect(formInstance.getRawValue()['country'], 'USA');
//       expect(formInstance.getRawValue()['addressSection.street'], '123 Elm St');
//       expect(formInstance.getRawValue()['addressSection.city'], 'New York');
//       expect(formInstance.getRawValue()['familyMembers.0.firstName'], 'Jane');
//       expect(formInstance.getRawValue()['familyMembers.0.relation'], 'Wife');
//       expect(formInstance.getRawValue()['familyMembers.1.firstName'], 'Johnny');
//       expect(formInstance.getRawValue()['familyMembers.1.relation'], 'Son');
//
//       // Update a field value and verify
//       formInstance.element('name').updateValue('John Smith');
//       expect(formInstance.getRawValue()['name'], 'John Smith');
//
//       // Add a new repeated section instance
//       repeatSection.addInstance([
//         FieldInstance(
//           name: 'firstName',
//           type: ValueType.text,
//           value: 'Jill',
//           properties: FormElementState(),
//         ),
//         FieldInstance(
//           name: 'relation',
//           type: ValueType.text,
//           value: 'Daughter',
//           properties: FormElementState(),
//         ),
//       ]);
//
//       // Verify the repeated section contains three instances now
//       expect(formInstance.getRawValue()['familyMembers.2.firstName'], 'Jill');
//       expect(
//           formInstance.getRawValue()['familyMembers.2.relation'], 'Daughter');
//     });
//   });
// }
