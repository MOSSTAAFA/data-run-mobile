import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
import 'package:mass_pro/data_run/screens/form_reactive/model/form_element_members.dart';
import 'package:mass_pro/data_run/screens/form_reactive/model/form_element_model.dart';
import 'package:mass_pro/data_run/utils/get_item_local_string.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

/// from template wit value, use [FormTemplateControlFactory]
/// for adding new control with saved value
extension FromElementFactory<T> on FormElementInstance<T?> {
  static SectionInstance createSectionInstance(
      FormGroup form, FieldTemplate templateElement,
      {dynamic savedValue,
      Map<String, List<FormOption>> formOptionsMap = const {},
      String? path}) {
    final Map<String, FormElementInstance<dynamic>> elements = {};
    templateElement.fields.sort((a, b) => (a.order).compareTo(b.order));

    for (var element in templateElement.fields) {
      elements[element.name] = createElement(form, element,
          savedValue: savedValue?[element.name],
          formOptionsMap: formOptionsMap);
    }

    return SectionInstance(
        form: form,
        template: templateElement,
        name: templateElement.name,
        type: ValueType.Section,
        path: path,
        properties: elementProperties(templateElement),
        elements: elements);
  }

  static RepeatSectionInstance createRepeatSectionInstance(
      FormGroup form, FieldTemplate fieldTemplate,
      {Map<String, Object?>? savedValue,
      Map<String, List<FormOption>> formOptionsMap = const {}}) {
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
        form: form,
        name: '',
        type: fieldTemplate.type,
        properties: elementProperties(fieldTemplate));

    return RepeatSectionInstance(
        form: form,
        name: fieldTemplate.name,
        type: fieldTemplate.type,
        template: fieldTemplate,
        properties: elementProperties(fieldTemplate),
        elements: initialGroups.isNotEmpty ? [sectionInstance] : []);
  }

  static FormElementInstance<dynamic> createElement(
      FormGroup form, FieldTemplate templateElement,
      {dynamic savedValue,
      Map<String, List<FormOption>> formOptionsMap = const {}}) {
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
      Map<String, List<FormOption>> formOptionsMap = const {}}) {
    switch (templateElement.type) {
      case ValueType.Text:
      case ValueType.LongText:
      case ValueType.Letter:
      case ValueType.FullName:
        return FieldInstance<String?>(
            form: form,
            name: templateElement.name,
            type: templateElement.type,
            properties: elementProperties(templateElement),
            defaultValue: templateElement.defaultValue,
            listName: templateElement.listName,
            template: templateElement,
            value: savedValue ?? templateElement.defaultValue);
      case ValueType.Date:
      case ValueType.Time:
      case ValueType.DateTime:
        return FieldInstance<String?>(
            form: form,
            name: templateElement.name,
            type: templateElement.type,
            properties: elementProperties(templateElement),
            defaultValue: templateElement.defaultValue,
            listName: templateElement.listName,
            template: templateElement,
            value: savedValue ?? templateElement.defaultValue);

      case ValueType.OrganisationUnit:
        return FieldInstance<String?>(
            form: form,
            name: templateElement.name,
            type: templateElement.type,
            properties: elementProperties(templateElement),
            defaultValue: templateElement.defaultValue,
            listName: templateElement.listName,
            template: templateElement,
            value: savedValue ?? templateElement.defaultValue);

      case ValueType.Integer:
      case ValueType.IntegerPositive:
      case ValueType.IntegerNegative:
      case ValueType.IntegerZeroOrPositive:
        return FieldInstance<int?>(
            form: form,
            name: templateElement.name,
            type: templateElement.type,
            properties: elementProperties(templateElement),
            defaultValue: templateElement.defaultValue,
            listName: templateElement.listName,
            template: templateElement,
            value: savedValue ?? templateElement.defaultValue);

      case ValueType.Number:
      case ValueType.UnitInterval:
      case ValueType.Percentage:
      case ValueType.Age:
        return FieldInstance<double?>(
          form: form,
          name: templateElement.name,
          type: templateElement.type,
          properties: elementProperties(templateElement),
          listName: templateElement.listName,
          defaultValue: templateElement.defaultValue,
          template: templateElement,
          value: savedValue ?? templateElement.defaultValue,
        );
      case ValueType.Boolean:
      case ValueType.TrueOnly:
      case ValueType.YesNo:
        return FieldInstance<bool>(
          form: form,
          name: templateElement.name,
          type: templateElement.type,
          properties: elementProperties(templateElement),
          listName: templateElement.listName,
          defaultValue: templateElement.defaultValue,
          template: templateElement,
          value: savedValue ?? templateElement.defaultValue ?? false,
        );
      case ValueType.SelectOne:
        return FieldInstance<String?>(
          form: form,
          name: templateElement.name,
          type: templateElement.type,
          properties: elementProperties(templateElement),
          defaultValue: templateElement.defaultValue,
          listName: templateElement.listName,
          choiceFilter: templateElement.choiceFilter,
          template: templateElement,
          value: savedValue ?? templateElement.defaultValue,
          options: formOptionsMap[templateElement.listName] ?? [],
        );
      case ValueType.SelectMulti:
        return FieldInstance<List<String>>(
          form: form,
          name: templateElement.name,
          type: templateElement.type,
          properties: elementProperties(templateElement),
          defaultValue: templateElement.defaultValue,
          listName: templateElement.listName,
          choiceFilter: templateElement.choiceFilter,
          template: templateElement,
          value: savedValue != null
              ? (savedValue is List)
                  ? savedValue.cast<String>()
                  : <String>[savedValue]
              : <String>[],
          options: formOptionsMap[templateElement.listName] ?? [],
        );
      default:
        throw Exception('Unsupported element type');
    }
  }

  static ElementProperties elementProperties(FieldTemplate templateElement) {
    return ElementProperties(
        mandatory: templateElement.mandatory,
        label: getItemLocalString(templateElement.label,
            defaultString: templateElement.name));
  }
}
