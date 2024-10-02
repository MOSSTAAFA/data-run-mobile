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
          savedValue: savedValue?[childTemplate.name]);
    }
    section.addAll(elements);

    return section;

    // final Map<String, FormElementInstance<dynamic>> elements = {};
    //
    // for (var element in templateElement.fields) {
    //   elements[element.name] = createElement(form, element,
    //       savedValue: savedValue?[element.name],
    //       formOptionsMap: formOptionsMap);
    // }
    //
    // return SectionInstance(
    //     form: form, template: templateElement, elements: elements);
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
          savedValue: savedValue?[childTemplate.name]);
    }
    repeatedSection.addAll(elements);

    // repeatedSection.buildElement(savedValue);

    // repeatedSection.buildElement(savedValue);
    return repeatedSection;
  }

  static RepeatInstance createRepeatInstance(
      FormGroup form, FieldTemplate template,
      {List<dynamic>? savedValue,
      Map<String, List<FormOption>> formOptionsMap = const {}}) {
    final repeatInstance = RepeatInstance(template: template, form: form);

    repeatInstance.addAll(savedValue
            ?.map<RepeatItemInstance>(
                (value) => createRepeatItem(form, template, savedValue: value))
            .toList() ??
        []);

    return repeatInstance;

    // final Map<String, FormElementInstance<dynamic>> initialGroups = {};
    // if (savedValue != null) {
    //   template.fields.sort((a, b) => (a.order).compareTo(b.order));
    //
    //   for (var element in template.fields) {
    //     initialGroups[element.name] = createElement(form, element,
    //         savedValue: savedValue[element.name],
    //         formOptionsMap: formOptionsMap);
    //   }
    // }
    //
    // final SectionInstance sectionInstance = SectionInstance(
    //     elements: initialGroups, template: template, form: form);
    //
    // return RepeatInstance(
    //     form: form,
    //     template: template,
    //     elements: initialGroups.isNotEmpty ? [sectionInstance] : []);
  }

  /// Helper method to create form elements (FieldInstance, SectionInstance, RepeatSectionInstance)
  static FieldInstance<dynamic> createFieldInstance(
      FormGroup form, FieldTemplate templateElement,
      {dynamic savedValue,
      List<FormOption> fieldOptions = const [],
      FormAttributes? formAttributes}) {
    late final FieldInstance<dynamic> fieldInstance;
    switch (templateElement.type) {
      case ValueType.Attribute:
        fieldInstance = FieldInstance<String?>(
            form: form,
            properties: ElementProperties(hidden: true, mandatory: false),
            template: templateElement);
      case ValueType.Text:
      case ValueType.LongText:
      case ValueType.Letter:
      case ValueType.FullName:
        fieldInstance = FieldInstance<String?>(
            form: form,
            properties: elementProperties(templateElement),
            template: templateElement);
      case ValueType.Date:
      case ValueType.Time:
      case ValueType.DateTime:
        fieldInstance = FieldInstance<String?>(
            form: form,
            properties: elementProperties(templateElement),
            template: templateElement);

      case ValueType.OrganisationUnit:
        fieldInstance = FieldInstance<String?>(
            form: form,
            properties: elementProperties(templateElement),
            template: templateElement);

      case ValueType.Integer:
      case ValueType.IntegerPositive:
      case ValueType.IntegerNegative:
      case ValueType.IntegerZeroOrPositive:
        fieldInstance = FieldInstance<int?>(
            form: form,
            properties: elementProperties(templateElement),
            template: templateElement);

      case ValueType.Number:
      case ValueType.UnitInterval:
      case ValueType.Percentage:
      case ValueType.Age:
        fieldInstance = FieldInstance<double?>(
          form: form,
          properties: elementProperties(templateElement),
          template: templateElement,
        );
      case ValueType.Boolean:
      case ValueType.TrueOnly:
      case ValueType.YesNo:
        fieldInstance = FieldInstance<bool>(
          form: form,
          properties: elementProperties(templateElement),
          template: templateElement,
        );
      case ValueType.SelectOne:
        // templateElement.options.clear();
        // templateElement.options
        //     .addAll(fieldOptions[templateElement.listName] ?? []);

        fieldInstance = FieldInstance<String?>(
          form: form,
          properties: elementProperties(templateElement),
          template: templateElement,
          options: fieldOptions /*[templateElement.listName] ?? []*/,
        );
      case ValueType.SelectMulti:
        // templateElement.options.clear();
        // templateElement.options
        //     .addAll(fieldOptions[templateElement.listName] ?? []);
        fieldInstance = FieldInstance<List<String>>(
          form: form,
          properties: elementProperties(templateElement),
          template: templateElement,
          // value: savedValue != null
          //     ? (savedValue is List)
          //         ? savedValue.cast<String>()
          //         : <String>[savedValue]
          //     : <String>[],
          options: fieldOptions /*[templateElement.listName] ?? []*/,
        );
      default:
        throw Exception('Unsupported element type: ${templateElement.type}');
    }
    return fieldInstance;
  }

  static ElementProperties elementProperties(FieldTemplate templateElement) {
    return ElementProperties(
        mandatory: templateElement.mandatory,
        label: getItemLocalString(templateElement.label,
            defaultString: templateElement.name));
  }
}
