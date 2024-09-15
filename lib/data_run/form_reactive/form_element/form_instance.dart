import 'package:d2_remote/modules/datarun/form/entities/form_definition.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:mass_pro/data_run/form_reactive/form_element/form_control_factory.dart';
import 'package:mass_pro/data_run/form_reactive/form_element/form_element_factory.dart';
import 'package:mass_pro/data_run/form_reactive/form_element/form_element_model.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class FormInstance {
  FormInstance({
    required this.template,
    Map<String, FormElementInstance<dynamic>> elements = const {},
  }) : formOptionsMap = Map.fromIterable(template.options,
            key: (option) => option.listName,
            value: (option) => template.options
                .where((o) => o.listName == option.listName)
                .toList()) {
    _elements.addAll(elements);
  }

  late final FormGroup form;
  final FormDefinition template;
  final Map<String, List<FormOption>> formOptionsMap;
  final Map<String, FormElementInstance<dynamic>> _elements = {};

  Map<String, FormElementInstance<dynamic>> get elements =>
      Map.unmodifiable(_elements);

  /// Initialize the form elements based on the template or previously saved data
  void initializeForm() {
    final Map<String, AbstractControl<dynamic>> controls = {};
    final Map<String, FormElementInstance<dynamic>> formElements = {};

    for (var element in template.fields) {
      controls[element.name] = FormTemplateControlFactory.createControl(element,
          formOptionsMap: formOptionsMap);
    }

    form = FormGroup(controls);

    for (var element in template.fields) {
      formElements[element.name] = FromElementFactory.createElement(
          form, element,
          formOptionsMap: formOptionsMap);
    }

    _elements.addAll(formElements);
  }

  Map<String, dynamic> get rawValue {
    Map<String, dynamic> valuesMap =
        elements.map<String, Object?>((key, element) {
      if (element is SectionElement<dynamic>) {
        return MapEntry(key, element.rawValue);
      }

      return MapEntry(key, element.value);
    });

    return {'formData': valuesMap};
  }

  Map<String, dynamic> get rawValueFormGroup {
    Map<String, dynamic> valuesMap =
        elements.map<String, Object?>((key, element) {
      if (element is SectionElement<dynamic>) {
        return MapEntry(key, element.rawValue);
      }

      return MapEntry(key, element.value);
    });

    return {'formData': valuesMap};
  }

  /// Update the form data with new values (for patching or rehydration)
  void updateFormData(Map<String, dynamic> savedData) {
    for (var element in elements.values) {
      _updateElementValue(element, savedData[element.name]);
    }
  }

  /// Helper to update the element value based on savedData
  void _updateElementValue(
      FormElementInstance<dynamic> element, dynamic savedValue) {
    if (element is FieldInstance) {
      element.updateFieldValue(FromElementFactory.createFormField(
        form,
        element.template,
        savedValue: savedValue,
        formOptionsMap: formOptionsMap,
      ));
    } else if (element is SectionInstance) {
      element.updateSectionValue(FromElementFactory.createSectionInstance(
        form,
        element.template,
        savedValue: savedValue,
        formOptionsMap: formOptionsMap,
      ));
    } else if (element is RepeatSectionInstance) {
      final ee = createRepeatedSectionSections(element.template,
          savedValue: savedValue ?? []);
      element.updateRepeatSectionValue(ee);
    }
  }

  List<SectionInstance> createRepeatedSectionSections(FieldTemplate template,
      {List<Map<String, Object?>> savedValue = const []}) {
    return savedValue
        .map((savedValue) => FromElementFactory.createSectionInstance(
            form, template,
            savedValue: savedValue, formOptionsMap: formOptionsMap))
        .toList();
  }
}
