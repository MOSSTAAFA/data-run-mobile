// import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
// import 'package:d2_remote/modules/datarun/form/shared/rule/choice_filter.dart';
// import 'package:d2_remote/modules/datarun/form/shared/rule/rule_parse_extension.dart';
// import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
// import 'package:mass_pro/data_run/screens/form/element/members/form_element_members.dart';
// import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
// import 'package:mass_pro/data_run/screens/form/element/members/form_element_state.dart';
// import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
//
// /// from template wit value, use [FormTemplateControlFactory]
// /// for adding new control with saved value
// extension FromElementFactory<T> on FormElementInstance<T> {
//   static FormElementInstance<dynamic> createElementInstance(
//       FormGroup form, FieldTemplate template,
//       {dynamic savedValue}) {
//     // String fullPrefix =
//     //     pathPrefix != null ? '$pathPrefix.${template.name}' : template.name;
//
//     if (template.type.isSection) {
//       return createSectionInstance(form, template, savedValue: savedValue);
//     } else if (template.type.isRepeatSection) {
//       return createRepeatInstance(form, template, savedValue: savedValue);
//     } else {
//       return createFieldInstance(form, template, savedValue: savedValue);
//     }
//   }
//
//   static SectionInstance createSectionInstance(
//       FormGroup form, FieldTemplate template,
//       {dynamic savedValue}) {
//     final Map<String, FormElementInstance<dynamic>> elements = {};
//
//     template.fields.sort((a, b) => (a.order).compareTo(b.order));
//
//     for (var childTemplate in template.fields) {
//       elements[childTemplate.name] = FromElementFactory.createElementInstance(
//           form, childTemplate,
//           savedValue: savedValue?[childTemplate.name]);
//     }
//
//     final section =
//         SectionInstance(form: form, template: template, elements: elements);
//
//     return section;
//   }
//
//   static RepeatItemInstance createRepeatItem(
//       FormGroup form, FieldTemplate template,
//       {Map<String, Object?>? savedValue}) {
//     final Map<String, FormElementInstance<dynamic>> elements = {};
//
//     template.fields.sort((a, b) => (a.order).compareTo(b.order));
//     for (var childTemplate in template.fields) {
//       elements[childTemplate.name] = FromElementFactory.createElementInstance(
//           form, childTemplate,
//           savedValue: savedValue?[childTemplate.name]);
//     }
//
//     final repeatedSection =
//         RepeatItemInstance(template: template, form: form, elements: elements);
//     return repeatedSection;
//   }
//
//   static RepeatInstance createRepeatInstance(
//       FormGroup form, FieldTemplate template,
//       {List<dynamic>? savedValue}) {
//     final repeatInstance = RepeatInstance(
//         template: template,
//         form: form,
//         elements: savedValue
//                 ?.map((value) =>
//                     createRepeatItem(form, template, savedValue: value))
//                 .toList() ??
//             []);
//
//     return repeatInstance;
//   }
//
//   /// Helper method to create form elements (FieldInstance, SectionInstance, RepeatSectionInstance)
//   static FieldInstance<dynamic> createFieldInstance(
//       FormGroup form, FieldTemplate templateElement,
//       {dynamic savedValue}) {
//     switch (templateElement.type) {
//       case ValueType.Text:
//       case ValueType.LongText:
//       case ValueType.Letter:
//       case ValueType.FullName:
//         return FieldInstance<String>(
//             form: form,
//             elementProperties: FieldElementState(
//                 value: savedValue, mandatory: templateElement.mandatory),
//             template: templateElement);
//       case ValueType.Date:
//       case ValueType.Time:
//       case ValueType.DateTime:
//         return FieldInstance<String>(
//             form: form,
//             elementProperties: FieldElementState(
//                 value: savedValue, mandatory: templateElement.mandatory),
//             template: templateElement);
//
//       case ValueType.OrganisationUnit:
//         return FieldInstance<String>(
//             form: form,
//             elementProperties: FieldElementState(
//                 value: savedValue, mandatory: templateElement.mandatory),
//             template: templateElement);
//
//       case ValueType.Integer:
//       case ValueType.IntegerPositive:
//       case ValueType.IntegerNegative:
//       case ValueType.IntegerZeroOrPositive:
//         return FieldInstance<int>(
//             form: form,
//             elementProperties: FieldElementState(
//                 value: savedValue, mandatory: templateElement.mandatory),
//             template: templateElement);
//
//       case ValueType.Number:
//       case ValueType.UnitInterval:
//       case ValueType.Percentage:
//       case ValueType.Age:
//         return FieldInstance<double>(
//           form: form,
//           elementProperties: FieldElementState(
//               value: savedValue, mandatory: templateElement.mandatory),
//           template: templateElement,
//         );
//       case ValueType.Boolean:
//       case ValueType.TrueOnly:
//       case ValueType.YesNo:
//         return FieldInstance<bool>(
//           form: form,
//           elementProperties: FieldElementState(
//               value: savedValue, mandatory: templateElement.mandatory),
//           template: templateElement,
//         );
//       case ValueType.SelectOne:
//         return FieldWithOptionsInstance<String>(
//           form: form,
//           choiceFilter: templateElement.choiceFilter != null
//               ? ChoiceFilter(
//                   expression: templateElement.evalChoiceFilterExpression!,
//                   options: templateElement.options)
//               : null,
//           elementProperties: FieldElementWithOptionsState(
//               value: savedValue,
//               mandatory: templateElement.mandatory,
//               visibleOptions: templateElement.options),
//           template: templateElement,
//         );
//       case ValueType.SelectMulti:
//         return FieldWithOptionsInstance<List<String>>(
//             form: form,
//             choiceFilter: templateElement.choiceFilter != null
//                 ? ChoiceFilter(
//                     expression: templateElement.evalChoiceFilterExpression!,
//                     options: templateElement.options)
//                 : null,
//             elementProperties: FieldElementWithOptionsState(
//                 value: savedValue != null
//                     ? (savedValue is List)
//                         ? savedValue.cast<String>()
//                         : <String>[savedValue]
//                     : <String>[],
//                 mandatory: templateElement.mandatory,
//                 visibleOptions: templateElement.options),
//             template: templateElement);
//       default:
//         throw Exception('Unsupported element type: ${templateElement.type}');
//     }
//   }
// }
