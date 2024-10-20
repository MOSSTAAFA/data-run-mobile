import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
import 'package:mass_pro/data_run/screens/form/element/form_value_map.dart';
import 'package:mass_pro/data_run/screens/form/element/members/form_element_members.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:mass_pro/data_run/utils/get_item_local_string.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

/// from template wit value, use [FormTemplateControlFactory]
/// for adding new control with saved value
extension FromElementFactory<T> on FormElementInstance<T> {
  static FormElementInstance<dynamic> createElementInstance(
      FormGroup form, FieldTemplate template,
      {dynamic savedValue,
      String? pathPrefix,
      required FormValueMap formValueMap}) {
    String fullPrefix =
        pathPrefix != null ? '$pathPrefix.${template.name}' : template.name;

    if (template.type.isSection) {
      return createSectionInstance(form, template,
          savedValue: savedValue,
          pathPrefix: fullPrefix,
          formValueMap: formValueMap);
    } else if (template.type.isRepeatSection) {
      return createRepeatInstance(form, template,
          savedValue: savedValue,
          pathPrefix: fullPrefix,
          formValueMap: formValueMap);
    } else {
      return createFieldInstance(form, template,
          savedValue: savedValue,
          pathPrefix: fullPrefix,
          formValueMap: formValueMap);
    }
  }

  static SectionInstance createSectionInstance(
      FormGroup form, FieldTemplate template,
      {dynamic savedValue,
      String? pathPrefix,
      required FormValueMap formValueMap}) {
    final Map<String, FormElementInstance<dynamic>> elements = {};
    // final Map<String, AbstractControl<dynamic>> controls = {};

    template.fields.sort((a, b) => (a.order).compareTo(b.order));

    for (var childTemplate in template.fields) {
      // controls[childTemplate.name] =
      //     FromElementControlFactory.createTemplateControl(childTemplate,
      //         savedValue: savedValue?[childTemplate.name]);
      elements[childTemplate.name] = FromElementFactory.createElementInstance(
          form, childTemplate,
          savedValue: savedValue?[childTemplate.name],
          pathPrefix: pathPrefix,
          formValueMap: formValueMap);
    }

    // final sectionControl = FormGroup(controls);
    // (form.control(pathPrefix!) as FormGroup)
    //     .addAll({template.name: FormGroup(controls)});

    final section = SectionInstance(
        form: form,
        template: template,
        path: pathPrefix,
        formValueMap: formValueMap);
    section.addAll(elements);

    return section;
  }

  static RepeatItemInstance createRepeatItem(
      FormGroup form, FieldTemplate template,
      {Map<String, Object?>? savedValue,
      String? pathPrefix,
      required FormValueMap formValueMap}) {
    final Map<String, FormElementInstance<dynamic>> elements = {};

    template.fields.sort((a, b) => (a.order).compareTo(b.order));
    for (var childTemplate in template.fields) {
      elements[childTemplate.name] = FromElementFactory.createElementInstance(
          form, childTemplate,
          savedValue: savedValue?[childTemplate.name],
          pathPrefix: pathPrefix,
          formValueMap: formValueMap);
    }

    final repeatedSection = RepeatItemInstance(
        template: template,
        form: form,
        path: pathPrefix,
        formValueMap: formValueMap);
    repeatedSection.addAll(elements);
    return repeatedSection;
  }

  static RepeatInstance createRepeatInstance(
      FormGroup form, FieldTemplate template,
      {List<dynamic>? savedValue,
      String? pathPrefix,
      required FormValueMap formValueMap}) {
    final repeatInstance = RepeatInstance(
        template: template,
        form: form,
        path: pathPrefix,
        formValueMap: formValueMap);

    repeatInstance.addAll(savedValue
            ?.asMap()
            .map((i, value) => MapEntry(
                i,
                createRepeatItem(form, template,
                    savedValue: value,
                    pathPrefix: 'pathPrefix.$i',
                    formValueMap: formValueMap)))
            .values
            .toList() ??
        []);

    return repeatInstance;
  }

  /// Helper method to create form elements (FieldInstance, SectionInstance, RepeatSectionInstance)
  static FieldInstance<dynamic> createFieldInstance(
      FormGroup form, FieldTemplate templateElement,
      {dynamic savedValue,
      String? pathPrefix,
      required FormValueMap formValueMap}) {
    switch (templateElement.type) {
      case ValueType.Attribute:
        return FieldInstance<String>(
            form: form,
            formValueMap: formValueMap..setValue(pathPrefix!, savedValue),
            properties: ElementProperties(
              hidden: true,
              mandatory: false,
            ),
            path: pathPrefix,
            template: templateElement);
      case ValueType.Text:
      case ValueType.LongText:
      case ValueType.Letter:
      case ValueType.FullName:
        return FieldInstance<String>(
            form: form,
            formValueMap: formValueMap..setValue(pathPrefix!, savedValue),
            path: pathPrefix,
            properties: elementProperties(templateElement),
            template: templateElement);
      case ValueType.Date:
      case ValueType.Time:
      case ValueType.DateTime:
        return FieldInstance<String>(
            form: form,
            formValueMap: formValueMap..setValue(pathPrefix!, savedValue),
            path: pathPrefix,
            properties: elementProperties(templateElement),
            template: templateElement);

      case ValueType.OrganisationUnit:
        return FieldInstance<String>(
            form: form,
            formValueMap: formValueMap..setValue(pathPrefix!, savedValue),
            path: pathPrefix,
            properties: elementProperties(templateElement),
            template: templateElement);

      case ValueType.Integer:
      case ValueType.IntegerPositive:
      case ValueType.IntegerNegative:
      case ValueType.IntegerZeroOrPositive:
        return FieldInstance<int>(
            form: form,
            formValueMap: formValueMap..setValue(pathPrefix!, savedValue),
            path: pathPrefix,
            properties: elementProperties(templateElement),
            template: templateElement);

      case ValueType.Number:
      case ValueType.UnitInterval:
      case ValueType.Percentage:
      case ValueType.Age:
        return FieldInstance<double>(
          form: form,
          formValueMap: formValueMap..setValue(pathPrefix!, savedValue),
          path: pathPrefix,
          properties: elementProperties(templateElement),
          template: templateElement,
        );
      case ValueType.Boolean:
      case ValueType.TrueOnly:
      case ValueType.YesNo:
        return FieldInstance<bool>(
          form: form,
          formValueMap: formValueMap..setValue(pathPrefix!, savedValue),
          path: pathPrefix,
          properties: elementProperties(templateElement),
          template: templateElement,
        );
      case ValueType.SelectOne:
        // templateElement.options.clear();
        // templateElement.options
        //     .addAll(fieldOptions[templateElement.listName] ?? []);

        return FieldInstance<String>(
          form: form,
          formValueMap: formValueMap..setValue(pathPrefix!, savedValue),
          path: pathPrefix,
          properties: elementProperties(templateElement),
          template: templateElement,
        );
      case ValueType.SelectMulti:
        return FieldInstance<List<String>>(
            form: form,
            formValueMap: formValueMap
              ..setValue(
                  pathPrefix!,
                  savedValue != null
                      ? (savedValue is List)
                          ? savedValue.cast<String>()
                          : <String>[savedValue]
                      : <String>[]),
            path: pathPrefix,
            properties: elementProperties(templateElement),
            template: templateElement);
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
