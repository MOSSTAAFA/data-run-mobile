import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
import 'package:mass_pro/data_run/screens/form/element/members/form_attributes.dart';
import 'package:mass_pro/data_run/screens/form/element/members/form_element_members.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:mass_pro/data_run/utils/get_item_local_string.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

/// from template wit value, use [FormTemplateControlFactory]
/// for adding new control with saved value

/// Form Elements Factory form elements
/// ([FieldInstance], [SectionInstance], [RepeatSectionInstance],
/// and [RepeatItemInstance])
extension FromElementFactory<T> on FormElementInstance<T?> {
  static FormElementInstance<dynamic> createElementInstance(
      FormGroup form, FieldTemplate template,
      {dynamic savedValue,
      Map<String, List<FormOption>> formOptionsMap = const {}}) {
    if (template.type.isSection) {
      return createSectionInstance(form, template,
          savedValue: savedValue, formOptionsMap: formOptionsMap);
    } else if (template.type.isRepeatSection) {
      return createRepeatInstance(form, template,
          savedValue: savedValue, formOptionsMap: formOptionsMap);
    } else {
      return createFieldInstance(form, template,
          savedValue: savedValue,
          fieldOptions: formOptionsMap[template.listName] ?? []);
    }
  }

  static SectionInstance createSectionInstance(
      FormGroup form, FieldTemplate template,
      {dynamic savedValue,
      Map<String, List<FormOption>> formOptionsMap = const {}}) {
    final Map<String, FormElementInstance<dynamic>> elements = {};
    template.fields.sort((a, b) => (a.order).compareTo(b.order));

    final section = SectionInstance(form: form, template: template);

    for (var childTemplate in template.fields) {
      elements[childTemplate.name] = FromElementFactory.createElementInstance(
          form, childTemplate,
          savedValue: savedValue?[childTemplate.name],
          formOptionsMap: formOptionsMap);
    }
    section.addAll(elements);

    return section;
  }

  static RepeatItemInstance createRepeatItem(
      FormGroup form, FieldTemplate template,
      {Map<String, Object?>? savedValue,
      Map<String, List<FormOption>> formOptionsMap = const {}}) {
    final Map<String, FormElementInstance<dynamic>> elements = {};

    template.fields.sort((a, b) => (a.order).compareTo(b.order));
    final repeatedSection = RepeatItemInstance(template: template, form: form);
    for (var childTemplate in template.fields) {
      elements[childTemplate.name] = FromElementFactory.createElementInstance(
          form, childTemplate,
          savedValue: savedValue?[childTemplate.name],
          formOptionsMap: formOptionsMap);
    }
    repeatedSection.addAll(elements);
    return repeatedSection;
  }

  static RepeatInstance createRepeatInstance(
      FormGroup form, FieldTemplate template,
      {List<dynamic>? savedValue,
      Map<String, List<FormOption>> formOptionsMap = const {}}) {
    final repeatInstance = RepeatInstance(template: template, form: form);

    repeatInstance.addAll(savedValue
            ?.map<RepeatItemInstance>((value) => createRepeatItem(
                form, template,
                savedValue: value, formOptionsMap: formOptionsMap))
            .toList() ??
        []);

    return repeatInstance;
  }

  static FieldInstance<dynamic> createFieldInstance(
      FormGroup form, FieldTemplate templateElement,
      {dynamic savedValue,
      List<FormOption> fieldOptions = const [],
      FormAttributes? formAttributes}) {
    switch (templateElement.type) {
      case ValueType.SelectOne:
        templateElement.options.addAll(fieldOptions);

        return FieldInstance<String?>(
          form: form,
          template: templateElement
        );
      case ValueType.SelectMulti:
        templateElement.options.addAll(fieldOptions);
        return FieldInstance<List<String>>(
          form: form,
          template: templateElement
        );
      case ValueType.Attribute:
        return FieldInstance<String?>(
            form: form,
            hidden: true,
            template: templateElement);
      case ValueType.Text:
      case ValueType.LongText:
      case ValueType.Letter:
      case ValueType.FullName:
        return FieldInstance<String?>(
            form: form,
            template: templateElement);
      case ValueType.Date:
      case ValueType.Time:
      case ValueType.DateTime:
        return FieldInstance<String?>(
            form: form,
            template: templateElement);

      case ValueType.OrganisationUnit:
        return FieldInstance<String?>(
            form: form,
            template: templateElement);

      case ValueType.Integer:
      case ValueType.IntegerPositive:
      case ValueType.IntegerNegative:
      case ValueType.IntegerZeroOrPositive:
        return FieldInstance<int?>(
            form: form,
            template: templateElement);

      case ValueType.Number:
      case ValueType.UnitInterval:
      case ValueType.Percentage:
      case ValueType.Age:
        return FieldInstance<double?>(
          form: form,
          template: templateElement,
        );
      case ValueType.Boolean:
      case ValueType.TrueOnly:
      case ValueType.YesNo:
        return FieldInstance<bool>(
          form: form,
          template: templateElement,
        );
      default:
        throw Exception('Unsupported element type: ${templateElement.type}');
    }
  }
}
