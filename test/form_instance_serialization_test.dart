// import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
// import 'package:d2_remote/modules/datarun/form_data/entities/entities.dart';
// import 'package:flutter/foundation.dart';
// import 'package:test/test.dart';
//
// void main() {
//   group('FormElementInstance serialization tests', () {
//     test('FieldInstance serialization and deserialization', () {
//       final fieldInstance = FieldInstance(
//         name: 'field1',
//         type: ValueType.Text,
//         section: 'section1',
//         value: 'test value',
//       );
//
//       final json = fieldInstance.toJson();
//       final fromJson = FieldInstance.fromJson(json);
//
//       expect(fromJson.name, fieldInstance.name);
//       expect(fromJson.type, fieldInstance.type);
//       expect(fromJson.section, fieldInstance.section);
//       expect(fromJson.value, fieldInstance.value);
//     });
//
//     test('SectionInstance serialization and deserialization', () {
//       final sectionInstance = SectionInstance(
//         name: 'section1',
//         type: ValueType.Section,
//         section: null,
//         value: {
//           'field1': FieldInstance(
//             name: 'field1',
//             type: ValueType.Integer,
//             section: 'section1',
//             value: 42,
//           ),
//         },
//       );
//
//       final json = sectionInstance.toJson();
//       final fromJson = SectionInstance.fromJson(json);
//
//       expect(fromJson.name, sectionInstance.name);
//       expect(fromJson.type, sectionInstance.type);
//       expect(fromJson.section, sectionInstance.section);
//       expect(fromJson.value?.length, sectionInstance.value?.length);
//       expect(fromJson.value?.values.first.name, sectionInstance.value?.values.first.name);
//       expect(fromJson.value?.values.first.value, sectionInstance.value?.values.first.value);
//     });
//
//     test('RepeatableSectionInstance serialization and deserialization', () {
//       final repeatableSectionInstance = RepeatableSectionInstance(
//         name: 'repeatableSection1',
//         type: ValueType.RepeatableSection,
//         section: null,
//         value: [
//           SectionInstance(
//             name: 'section1',
//             type: ValueType.Section,
//             section: 'repeatableSection1',
//             value: {
//               'field1': FieldInstance(
//                 name: 'field1',
//                 type: ValueType.Boolean,
//                 section: 'section1',
//                 value: true,
//               ),
//             },
//           ),
//         ],
//       );
//
//       final json = repeatableSectionInstance.toJson();
//       final fromJson = RepeatableSectionInstance.fromJson(json);
//
//       expect(fromJson.name, repeatableSectionInstance.name);
//       expect(fromJson.type, repeatableSectionInstance.type);
//       expect(fromJson.section, repeatableSectionInstance.section);
//       expect(fromJson.value?.length, repeatableSectionInstance.value?.length);
//       expect(fromJson.value?.first.name,
//           repeatableSectionInstance.value?.first.name);
//       expect(fromJson.value?.first.value?.length,
//           repeatableSectionInstance.value?.first.value?.length);
//       expect(fromJson.value?.first.value?.values.first.name,
//           repeatableSectionInstance.value?.first.value?.values.first.name);
//       expect(fromJson.value?.first.value?.values.first.value,
//           repeatableSectionInstance.value?.first.value?.values.first.value);
//     });
//
//     test('FormInstance serialization and deserialization', () {
//       final formInstance = FormInstance(
//         name: 'form1',
//         uid: 'uid',
//         version: 0,
//         fields: [
//           FieldInstance(
//             name: 'field1',
//             type: ValueType.Text,
//             section: 'section1',
//             value: 'test value',
//           ),
//           SectionInstance(
//             name: 'section1',
//             type: ValueType.Section,
//             value: {
//               'field2': FieldInstance(
//                 name: 'field2',
//                 type: ValueType.Integer,
//                 section: 'section1',
//                 value: 42,
//               ),
//             },
//           ),
//           RepeatableSectionInstance(
//             name: 'repeatableSection1',
//             type: ValueType.RepeatableSection,
//             value: [
//               SectionInstance(
//                 name: 'section2',
//                 type: ValueType.Section,
//                 value: {
//                   'field3': FieldInstance(
//                     name: 'field3',
//                     type: ValueType.Boolean,
//                     value: true,
//                   ),
//                 },
//               ),
//             ],
//           ),
//         ],
//         orgUnit: 'orgUnit1',
//         form: 'formDef',
//         status: 'COMPLETED',
//         dirty: false,
//       );
//
//       final json = formInstance.toJson();
//       final fromJson = FormInstance.fromJson(json);
//
//       final jsonRawValue = extractRawValues(fromJson);
//
//       debugPrint('$jsonRawValue');
//       expect(fromJson.name, formInstance.name);
//       expect(fromJson.fields?.length, formInstance.fields?.length);
//
//       final field1 = fromJson.fields?.firstWhere((f) => f.name == 'field1');
//       expect(field1?.type, ValueType.Text);
//       expect(field1?.value, 'test value');
//
//       final section1 = fromJson.fields?.firstWhere((f) => f.name == 'section1');
//       expect(section1?.type, ValueType.Section);
//       expect((section1 as SectionInstance).value?.length, 1);
//       expect(section1.value?.values.first.name, 'field2');
//       expect(section1.value?.values.first.value, 42);
//
//       final repeatableSection1 =
//           fromJson.fields?.firstWhere((f) => f.name == 'repeatableSection1');
//       expect(repeatableSection1?.type, ValueType.RepeatableSection);
//       expect(
//           (repeatableSection1 as RepeatableSectionInstance).value?.length, 1);
//       final section2 = repeatableSection1.value?.first;
//       expect(section2?.name, 'section2');
//       expect(section2?.value?.values.first.name, 'field3');
//       expect(section2?.value?.values.first.value, true);
//     });
//   });
// }
