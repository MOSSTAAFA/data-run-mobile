// import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
// import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
// import 'package:mass_pro/data_run/screens/form/element/form_value_map.dart';
//
// import 'form_element_node.dart';
//
// /// from template wit value, use [FormTemplateControlFactory]
// /// for adding new control with saved value
//
// /// Form Elements Factory form elements
// /// ([FieldInstance], [SectionInstance], [RepeatSectionInstance],
// /// and [RepeatItemInstance])
// class FromElementNodeFactory {
//   static Map<String, FormElementNode<dynamic>> formElementsNodes(
//       List<FieldTemplate> templates,
//       {Map<String, dynamic>? savedValue,
//       FormValueMap? formValueMap}) {
//     final Map<String, FormElementNode<dynamic>> elements = {};
//     for (var template in templates) {
//       elements[template.name] = createElementNode(template,
//           savedValue: savedValue?[template.name], formValueMap: formValueMap);
//     }
//     return elements;
//   }
//
//   static FormElementNode<dynamic> createElementNode(FieldTemplate template,
//       {dynamic savedValue, FormValueMap? formValueMap}) {
//     if (template.type.isSection) {
//       return createSectionNode(template,
//           savedValue: savedValue, formValueMap: formValueMap);
//     } else if (template.type.isRepeatSection) {
//       return createRepeatNode(template,
//           savedValue: savedValue, formValueMap: formValueMap);
//     } else {
//       return createFieldNode(template,
//           savedValue: savedValue, formValueMap: formValueMap);
//     }
//   }
//
//   static SectionNode createSectionNode(FieldTemplate template,
//       {dynamic savedValue, FormValueMap? formValueMap}) {
//     final Map<String, FormElementNode<dynamic>> elements = {};
//     template.fields.sort((a, b) => (a.order).compareTo(b.order));
//
//     final section =
//         SectionNode(name: template.name);
//
//     for (var childTemplate in template.fields) {
//       elements[childTemplate.name] = createElementNode(childTemplate,
//           savedValue: savedValue?[childTemplate.name],
//           formValueMap: formValueMap);
//     }
//     section.addAll(elements);
//
//     return section;
//   }
//
//   static RepeatItemNode createRepeatItemNode(FieldTemplate template,
//       {Map<String, Object?>? savedValue, FormValueMap? formValueMap}) {
//     final Map<String, FormElementNode<dynamic>> elements = {};
//
//     template.fields.sort((a, b) => (a.order).compareTo(b.order));
//     for (var childTemplate in template.fields) {
//       elements[childTemplate.name] = createElementNode(childTemplate,
//           savedValue: savedValue?[childTemplate.name],
//           formValueMap: formValueMap);
//     }
//     final repeatedSection =
//         RepeatItemNode(name: template.name, elements: elements);
//
//     return repeatedSection;
//   }
//
//   static RepeatNode createRepeatNode(FieldTemplate template,
//       {List<dynamic>? savedValue, FormValueMap? formValueMap}) {
//     final repeatInstance = RepeatNode(
//         name: template.name,
//         elements: savedValue
//                 ?.map<RepeatItemNode>((value) => createRepeatItemNode(template,
//                     savedValue: value, formValueMap: formValueMap))
//                 .toList() ??
//             []);
//
//     return repeatInstance;
//   }
//
//   static FieldNode<dynamic> createFieldNode(FieldTemplate templateElement,
//       {dynamic savedValue, FormValueMap? formValueMap}) {
//     switch (templateElement.type) {
//       case ValueType.SelectOne:
//         return FieldNode<String>(name: templateElement.name, value: savedValue);
//       case ValueType.SelectMulti:
//         return FieldNode<List<String>>(
//             name: templateElement.name, value: savedValue);
//       case ValueType.Attribute:
//         return FieldNode<String>(name: templateElement.name, value: savedValue);
//       case ValueType.Text:
//       case ValueType.LongText:
//       case ValueType.Letter:
//       case ValueType.FullName:
//         return FieldNode<String>(name: templateElement.name, value: savedValue);
//       case ValueType.Date:
//       case ValueType.Time:
//       case ValueType.DateTime:
//         return FieldNode<String>(name: templateElement.name, value: savedValue);
//
//       case ValueType.OrganisationUnit:
//         return FieldNode<String>(name: templateElement.name, value: savedValue);
//
//       case ValueType.Integer:
//       case ValueType.IntegerPositive:
//       case ValueType.IntegerNegative:
//       case ValueType.IntegerZeroOrPositive:
//         return FieldNode<int>(name: templateElement.name, value: savedValue);
//
//       case ValueType.Number:
//       case ValueType.UnitInterval:
//       case ValueType.Percentage:
//       case ValueType.Age:
//         return FieldNode<double>(name: templateElement.name, value: savedValue);
//       case ValueType.Boolean:
//       case ValueType.TrueOnly:
//       case ValueType.YesNo:
//         return FieldNode<bool>(name: templateElement.name, value: savedValue);
//       default:
//         throw Exception('Unsupported element type: ${templateElement.type}');
//     }
//   }
// }
