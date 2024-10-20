// import 'package:d2_remote/modules/datarun/form/shared/form_element_template.dart';
// import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
// import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
// import 'package:mass_pro/data_run/screens/form/element/members/form_attributes.dart';
// import 'package:mass_pro/data_run/screens/form_module/model/form_element.dart';
// import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
//
// /// from template wit value, use [FormTemplateControlFactory]
// /// for adding new control with saved value
//
// /// Form Elements Factory form elements
// /// ([FormFieldElement], [FormSectionElement], [FormRepeatElement],
// /// and [FormRepeatItemElement])
// extension FromElementFactory<T> on FormElementInstance<T?> {
//   static FormElementInstance<dynamic> createFormElement(
//       FormElementTemplate template,
//       {dynamic initialValue}) {
//     if (template.type.isSection) {
//       return createFormSectionElement(template, initialValue: initialValue);
//     } else if (template.type.isRepeatSection) {
//       return createFormRepeatElement(template, initialValue: initialValue);
//     } else {
//       return createFormFieldElement(template, initialValue: initialValue);
//     }
//   }
//
//   static FormSectionElement createFormSectionElement(
//       FormElementTemplate template,
//       {dynamic initialValue}) {
//     template as SectionTemplate;
//     final Map<String, FormElementInstance<dynamic>> elements = {};
//     template.fields.sort((a, b) => (a.order).compareTo(b.order));
//
//     final section = FormSectionElement(form: control, template: template);
//
//     for (var childTemplate in template.fields) {
//       elements[childTemplate.name] = FromElementFactory.createFormElement(
//           control, childTemplate,
//           initialValue: initialValue?[childTemplate.name]);
//     }
//     section.addAll(elements);
//
//     return section;
//   }
//
//   static FormRepeatItemElement createRepeatItem(FormElementTemplate template,
//       {Map<String, Object?>? initialValue}) {
//     template as SectionTemplate;
//
//     final Map<String, FormElementInstance<dynamic>> elements = {};
//
//     template.fields.sort((a, b) => (a.order).compareTo(b.order));
//     final repeatedSection =
//     FormRepeatItemElement(template: template, form: control);
//     for (var childTemplate in template.fields) {
//       elements[childTemplate.name] = FromElementFactory.createFormElement(
//           control, childTemplate,
//           initialValue: initialValue?[childTemplate.name],
//           formOptionsMap: formOptionsMap);
//     }
//     repeatedSection.addAll(elements);
//     return repeatedSection;
//   }
//
//   static RepeatInstance createFormRepeatElement(FormElementTemplate template,
//       {List<dynamic>? initialValue}) {
//     final repeatInstance = RepeatInstance(template: template, form: control);
//
//     repeatInstance.addAll(initialValue
//         ?.map<FormRepeatItemElement>((value) => createRepeatItem(
//         control, template,
//         initialValue: value, formOptionsMap: formOptionsMap))
//         .toList() ??
//         []);
//
//     return repeatInstance;
//   }
//
//   static FormFieldElement<dynamic> createFormFieldElement(
//       FormElementTemplate templateElement,
//       {dynamic initialValue}) {
//     templateElement as FieldTemplate;
//
//     switch (templateElement.type) {
//       case ValueType.SelectOne:
//         templateElement.options.addAll(fieldOptions);
//         return FormFieldElement<String>(
//             elementControl: control as FormControl<String>,
//             template: templateElement);
//       case ValueType.SelectMulti:
//         templateElement.options.addAll(fieldOptions);
//         return FormFieldElement<List<String>>(
//             elementControl: control as FormControl<List<String>>,
//             template: templateElement);
//       case ValueType.Attribute:
//         return FormFieldElement<String>(
//             elementControl: control as FormControl<String>,
//             template: templateElement);
//       case ValueType.Text:
//       case ValueType.LongText:
//       case ValueType.Letter:
//       case ValueType.FullName:
//         return FormFieldElement<String>(
//             elementControl: control as FormControl<String>,
//             template: templateElement);
//       case ValueType.Date:
//       case ValueType.Time:
//       case ValueType.DateTime:
//         return FormFieldElement<String>(
//             elementControl: control as FormControl<String>,
//             template: templateElement);
//
//       case ValueType.OrganisationUnit:
//         return FormFieldElement<String>(
//             elementControl: control as FormControl<String>,
//             template: templateElement);
//
//       case ValueType.Integer:
//       case ValueType.IntegerPositive:
//       case ValueType.IntegerNegative:
//       case ValueType.IntegerZeroOrPositive:
//         return FormFieldElement<int>(
//             elementControl: control as FormControl<int>,
//             template: templateElement);
//
//       case ValueType.Number:
//       case ValueType.UnitInterval:
//       case ValueType.Percentage:
//       case ValueType.Age:
//         return FormFieldElement<double>(
//           elementControl: control as FormControl<double>,
//           template: templateElement,
//         );
//       case ValueType.Boolean:
//       case ValueType.TrueOnly:
//       case ValueType.YesNo:
//         return FormFieldElement<bool>(
//           elementControl: control as FormControl<bool>,
//           template: templateElement,
//         );
//       default:
//         throw Exception('Unsupported element type: ${templateElement.type}');
//     }
//   }
// }
