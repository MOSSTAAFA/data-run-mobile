import 'package:d2_remote/modules/datarun/form/entities/form_version.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
import 'package:datarun/data_run/screens/form_module/form_element_model/form_element_model.dart';

class FormElementModelFactory {
  static Map<String, FormElementModel<dynamic>> buildFormElements(
      FormVersion formFlatTemplate,
      {dynamic initialValue}) {
    final Map<String, FormElementModel<dynamic>> elements = {};

    for (var template in formFlatTemplate.fields) {
      elements[template.name] = buildFormElement(template,
          initialValue: initialValue?[template.name]);
    }

    return elements;
  }

  static FormElementModel<dynamic> buildFormElement(
      FieldTemplate elementTemplate,
      {dynamic initialValue}) {
    if (elementTemplate.type.isSection) {
      return buildSectionModel(elementTemplate, initialValue: initialValue);
    } else if (elementTemplate.type.isRepeatSection) {
      return buildRepeatModel(elementTemplate, initialValue: initialValue);
    } else {
      return buildFieldModel(elementTemplate, initialValue: initialValue);
    }
  }

  static SectionElementModel buildSectionModel(FieldTemplate elementTemplate,
      {dynamic initialValue}) {
    final Map<String, FormElementModel<dynamic>> elements = {};
    elementTemplate.fields.sort((a, b) => (a.order).compareTo(b.order));

    final section = SectionElementModel(templatePath: elementTemplate.path!);

    for (var childTemplate in elementTemplate.fields) {
      elements[childTemplate.name] = buildFormElement(childTemplate,
          initialValue: initialValue?[childTemplate.name]);
    }
    section.addAll(elements);

    return section;
  }

  static RepeatItemElementModel buildRepeatItem(FieldTemplate elementTemplate,
      {Map<String, Object?>? initialValue}) {
    final Map<String, FormElementModel<dynamic>> elements = {};

    elementTemplate.fields.sort((a, b) => (a.order).compareTo(b.order));
    for (var childTemplate in elementTemplate.fields) {
      elements[childTemplate.name] = buildFormElement(childTemplate,
          initialValue: initialValue?[childTemplate.name]);
    }
    final repeatedSection = RepeatItemElementModel(
        templatePath: elementTemplate.path!, elements: elements);

    return repeatedSection;
  }

  static RepeatElementModel buildRepeatModel(FieldTemplate elementTemplate,
      {List<dynamic>? initialValue}) {
    final repeatInstance = RepeatElementModel(
        templatePath: elementTemplate.path!,
        elements: initialValue
                ?.map<RepeatItemElementModel>((value) =>
                    buildRepeatItem(elementTemplate, initialValue: value))
                .toList() ??
            []);

    return repeatInstance;
  }

  static FieldElementModel<dynamic> buildFieldModel(
      FieldTemplate elementTemplate,
      {dynamic initialValue}) {
    switch (elementTemplate.type) {
      case ValueType.Text:
      case ValueType.LongText:
      case ValueType.Letter:
      case ValueType.FullName:
      case ValueType.Date:
      case ValueType.Time:
      case ValueType.DateTime:
      case ValueType.OrganisationUnit:
        return FieldElementModel<String>(
          templatePath: elementTemplate.path!,
          mandatory: elementTemplate.mandatory,
          value: initialValue ?? elementTemplate.defaultValue,
        );
      case ValueType.Integer:
      case ValueType.IntegerPositive:
      case ValueType.IntegerNegative:
      case ValueType.IntegerZeroOrPositive:
        return FieldElementModel<int>(
          templatePath: elementTemplate.path!,
          mandatory: elementTemplate.mandatory,
          value: initialValue ?? elementTemplate.defaultValue,
        );

      case ValueType.Number:
      case ValueType.UnitInterval:
      case ValueType.Percentage:
      case ValueType.Age:
        return FieldElementModel<double>(
          templatePath: elementTemplate.path!,
          mandatory: elementTemplate.mandatory,
          value: initialValue ?? elementTemplate.defaultValue,
        );
      case ValueType.Boolean:
      case ValueType.TrueOnly:
      case ValueType.YesNo:
        return FieldElementModel<bool>(
          templatePath: elementTemplate.path!,
          mandatory: elementTemplate.mandatory,
          value: initialValue ?? elementTemplate.defaultValue,
        );
      case ValueType.SelectOne:
        return FieldElementModel<String>(
            templatePath: elementTemplate.path!,
            mandatory: elementTemplate.mandatory,
            value: initialValue ?? elementTemplate.defaultValue);
      case ValueType.SelectMulti:
        return FieldElementModel<List<String>>(
            templatePath: elementTemplate.path!,
            mandatory: elementTemplate.mandatory,
            value: initialValue ?? elementTemplate.defaultValue);
      default:
        throw Exception('Unsupported element type: ${elementTemplate.type}');
    }
  }
}