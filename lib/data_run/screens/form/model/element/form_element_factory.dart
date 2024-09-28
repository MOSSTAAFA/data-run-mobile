import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/rule_parse_extension.dart';
import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
import 'package:mass_pro/data_run/screens/form/model/element/form_attributes.dart';
import 'package:mass_pro/data_run/screens/form/model/element/form_element_members.dart';
import 'package:mass_pro/data_run/screens/form/model/element/form_element.dart';
import 'package:mass_pro/data_run/utils/get_item_local_string.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

/// from template wit value, use [FormTemplateControlFactory]
/// for adding new control with saved value
extension FromElementFactory<T> on FormElementInstance<T?> {
  static SectionInstance createSectionInstance(
      FormGroup form, FieldTemplate templateElement,
      {dynamic savedValue,
      Map<String, List<FormOption>> formOptionsMap = const {},
      FormAttributes? formAttributes,
      String? path}) {
    final dependencies = templateElement.dependencies;
    final Map<String, FormElementInstance<dynamic>> elements = {};

    for (var element in templateElement.fields) {
      elements[element.name] = createElement(form, element,
          savedValue: savedValue?[element.name],
          formOptionsMap: formOptionsMap);
    }

    templateElement.fields.sort((a, b) => (a.order).compareTo(b.order));

    return SectionInstance(
        form: form,
        template: templateElement,
        path: path,
        elements: elements);
  }

  static RepeatSectionInstance createRepeatSectionInstance(
      FormGroup form, FieldTemplate fieldTemplate,
      {Map<String, Object?>? savedValue,
      Map<String, List<FormOption>> formOptionsMap = const {},
      FormAttributes? formAttributes}) {
    final Map<String, FormElementInstance<dynamic>> initialGroups = {};
    if (savedValue != null) {
      fieldTemplate.fields.sort((a, b) => (a.order).compareTo(b.order));

      for (var element in fieldTemplate.fields) {
        initialGroups[element.name] = createElement(form, element,
            savedValue: savedValue[element.name],
            formOptionsMap: formOptionsMap);
      }
    }

    final SectionInstance sectionInstance = SectionInstance(
        elements: initialGroups,
        template: fieldTemplate,
        form: form);

    return RepeatSectionInstance(
        form: form,
        template: fieldTemplate,
        elements: initialGroups.isNotEmpty ? [sectionInstance] : []);
  }

  static FormElementInstance<dynamic> createElement(
      FormGroup form, FieldTemplate templateElement,
      {dynamic savedValue,
      Map<String, List<FormOption>> formOptionsMap = const {},
      FormAttributes? formAttributes}) {
    if (templateElement.type.isSection) {
      return createSectionInstance(form, templateElement,
          savedValue: savedValue, formOptionsMap: formOptionsMap);
    } else if (templateElement.type.isRepeatSection) {
      return createRepeatSectionInstance(form, templateElement,
          savedValue: savedValue, formOptionsMap: formOptionsMap);
    } else {
      return createFormField(form, templateElement,
          savedValue: savedValue, formOptionsMap: formOptionsMap);
    }
  }

  /// Helper method to create form elements (FieldInstance, SectionInstance, RepeatSectionInstance)
  static FieldInstance<dynamic> createFormField(
      FormGroup form, FieldTemplate templateElement,
      {dynamic savedValue,
      Map<String, List<FormOption>> formOptionsMap = const {},
      FormAttributes? formAttributes}) {
    final dependencies = templateElement.dependencies;
    switch (templateElement.type) {
      case ValueType.Attribute:
        return FieldInstance<String?>(
            form: form,
            properties: ElementProperties(hidden: true, mandatory: false),
            template: templateElement,
            value: savedValue ??
                formAttributes?.attribute(templateElement.attributeType));
      case ValueType.Text:
      case ValueType.LongText:
      case ValueType.Letter:
      case ValueType.FullName:
        return FieldInstance<String?>(
            form: form,
            properties: elementProperties(templateElement),
            template: templateElement,
            value: savedValue ?? templateElement.defaultValue);
      case ValueType.Date:
      case ValueType.Time:
      case ValueType.DateTime:
        return FieldInstance<String?>(
            form: form,
            properties: elementProperties(templateElement),
            template: templateElement,
            value: savedValue ?? templateElement.defaultValue);

      case ValueType.OrganisationUnit:
        return FieldInstance<String?>(
            form: form,
            properties: elementProperties(templateElement),
            template: templateElement,
            value: savedValue ?? templateElement.defaultValue);

      case ValueType.Integer:
      case ValueType.IntegerPositive:
      case ValueType.IntegerNegative:
      case ValueType.IntegerZeroOrPositive:
        return FieldInstance<int?>(
            form: form,
            properties: elementProperties(templateElement),
            template: templateElement,
            value: savedValue ?? templateElement.defaultValue);

      case ValueType.Number:
      case ValueType.UnitInterval:
      case ValueType.Percentage:
      case ValueType.Age:
        return FieldInstance<double?>(
          form: form,
          properties: elementProperties(templateElement),
          template: templateElement,
          value: savedValue ?? templateElement.defaultValue,
        );
      case ValueType.Boolean:
      case ValueType.TrueOnly:
      case ValueType.YesNo:
        return FieldInstance<bool>(
          form: form,
          properties: elementProperties(templateElement),
          template: templateElement,
          value: savedValue ?? templateElement.defaultValue ?? false,
        );
      case ValueType.SelectOne:
        templateElement.options.clear();
        templateElement.options
            .addAll(formOptionsMap[templateElement.listName] ?? []);

        return FieldInstance<String?>(
          form: form,
          properties: elementProperties(templateElement),
          template: templateElement,
          value: savedValue ?? templateElement.defaultValue,
          options: formOptionsMap[templateElement.listName] ?? [],
        );
      case ValueType.SelectMulti:
        templateElement.options.clear();
        templateElement.options
            .addAll(formOptionsMap[templateElement.listName] ?? []);
        return FieldInstance<List<String>>(
          form: form,
          properties: elementProperties(templateElement),
          template: templateElement,
          value: savedValue != null
              ? (savedValue is List)
                  ? savedValue.cast<String>()
                  : <String>[savedValue]
              : <String>[],
          options: formOptionsMap[templateElement.listName] ?? [],
        );
      default:
        throw Exception('Unsupported element type: ${templateElement.type}');
    }
  }

  static ElementProperties elementProperties(FieldTemplate templateElement) {
    return ElementProperties(
        mandatory: templateElement.mandatory,
        label: getItemLocalString(templateElement.label,
            defaultString: templateElement.name));
  }
}
