import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
import 'package:datarun/data_run/screens/form/element/form_element.dart';
import 'package:datarun/data_run/screens/form_module/form_element_model/form_element_model.dart';

/// from template wit value, use [FormTemplateControlFactory]
/// for adding new control with saved value

/// Form Elements Factory form elements
/// ([FieldInstance], [SectionInstance], [RepeatSectionInstance],
/// and [RepeatItemInstance])
class FromElementModelFactory {
  static Map<String, FormElementModel<dynamic>> formElementsModels(
      List<FieldTemplate> templates, Map<String, dynamic>? savedValue) {
    final Map<String, FormElementModel<dynamic>> elements = {};
    for (var template in templates) {
      elements[template.name] =
          createElementModel(template, savedValue: savedValue?[template.name]);
    }
    return elements;
  }

  static FormElementModel<dynamic> createElementModel(FieldTemplate template,
      {dynamic savedValue}) {
    if (template.type.isSection) {
      return createSectionElementModel(template, savedValue: savedValue);
    } else if (template.type.isRepeatSection) {
      return createRepeatElementModel(template, savedValue: savedValue);
    } else {
      return createFieldInstance(template, savedValue: savedValue);
    }
  }

  static SectionElementModel createSectionElementModel(FieldTemplate template,
      {dynamic savedValue}) {
    final Map<String, FormElementModel<dynamic>> elements = {};
    template.fields.sort((a, b) => (a.order).compareTo(b.order));

    final section =
        SectionElementModel(name: template.name, mandatory: template.mandatory);

    for (var childTemplate in template.fields) {
      elements[childTemplate.name] = createElementModel(childTemplate,
          savedValue: savedValue?[childTemplate.name]);
    }
    section.addAll(elements);

    return section;
  }

  static RepeatItemElementModel createRepeatItem(FieldTemplate template,
      {Map<String, Object?>? savedValue}) {
    final Map<String, FormElementModel<dynamic>> elements = {};

    template.fields.sort((a, b) => (a.order).compareTo(b.order));
    for (var childTemplate in template.fields) {
      elements[childTemplate.name] = createElementModel(childTemplate,
          savedValue: savedValue?[childTemplate.name]);
    }
    final repeatedSection =
        RepeatItemElementModel(name: template.name, elements: elements);

    return repeatedSection;
  }

  static RepeatElementModel createRepeatElementModel(FieldTemplate template,
      {List<dynamic>? savedValue}) {
    final repeatInstance = RepeatElementModel(
        name: template.name,
        elements: savedValue
                ?.map<RepeatItemElementModel>(
                    (value) => createRepeatItem(template, savedValue: value))
                .toList() ??
            []);

    return repeatInstance;
  }

  static FieldElementModel<dynamic> createFieldInstance(
      FieldTemplate templateElement,
      {dynamic savedValue}) {
    switch (templateElement.type) {
      case ValueType.SelectOne:
        return FieldElementModel<String>(
            name: templateElement.name, value: savedValue);
      case ValueType.SelectMulti:
        return FieldElementModel<List<String>>(
            name: templateElement.name, value: savedValue);
      case ValueType.Attribute:
        return FieldElementModel<String>(
            name: templateElement.name, value: savedValue);
      case ValueType.Text:
      case ValueType.LongText:
      case ValueType.Letter:
      case ValueType.FullName:
        return FieldElementModel<String>(
            name: templateElement.name, value: savedValue);
      case ValueType.Date:
      case ValueType.Time:
      case ValueType.DateTime:
        return FieldElementModel<String>(
            name: templateElement.name, value: savedValue);

      case ValueType.OrganisationUnit:
        return FieldElementModel<String>(
            name: templateElement.name, value: savedValue);

      case ValueType.Integer:
      case ValueType.IntegerPositive:
      case ValueType.IntegerNegative:
      case ValueType.IntegerZeroOrPositive:
        return FieldElementModel<int>(
            name: templateElement.name, value: savedValue);

      case ValueType.Number:
      case ValueType.UnitInterval:
      case ValueType.Percentage:
      case ValueType.Age:
        return FieldElementModel<double>(
            name: templateElement.name, value: savedValue);
      case ValueType.Boolean:
      case ValueType.TrueOnly:
      case ValueType.YesNo:
        return FieldElementModel<bool>(
            name: templateElement.name, value: savedValue);
      default:
        throw Exception('Unsupported element type: ${templateElement.type}');
    }
  }
}
