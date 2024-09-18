// import 'package:mass_pro/data_run/form/reactive_form/model.dart';
// import 'package:mass_pro/data_run/screens/form_section/model/q_repeatable_section_field_model.dart';
//
// class SectionUtility {
//   void addRepeatableInstance(
//       {required int index,
//       required QRepeatableSectionFieldModel section}) {
//     var newInstance = QRepeatableSectionFieldModel(
//       uid: section.uid,
//       path: '${section.path}[$index]',
//       fields: section.fields.map((field) {
//         return QFieldModel(
//           uid: field.uid,
//           valueType: field.valueType,
//           path: '${section.path}[$index].${field.uid}',
//           label: field.label,
//         );
//       }).toList(),
//       label: '',
//     );
//
//     section.fields.add(newInstance);
//   }
// }
