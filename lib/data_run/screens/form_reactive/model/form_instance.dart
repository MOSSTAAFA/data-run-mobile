import 'package:d2_remote/modules/datarun/form/entities/data_form_submission.entity.dart';
import 'package:d2_remote/modules/datarun/form/entities/form_definition.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:mass_pro/data_run/screens/form_reactive/model/form_control_factory.dart';
import 'package:mass_pro/data_run/screens/form_reactive/model/form_element_factory.dart';
import 'package:mass_pro/data_run/screens/form_reactive/model/form_element_model.dart';
import 'package:mass_pro/data_run/screens/form_submission_list/model/submission_list.provider.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class FormInstance {
  FormInstance({
    required this.template,
    required this.submission,
    required this.formSubmissionList,
    required this.enabled,
  }) : formOptionsMap = Map.fromIterable(
            template.options
              ..sort((a, b) => (a.order).compareTo(b.order)),
            key: (option) => option.listName,
            value: (option) => template.options
                .where((o) => o.listName == option.listName)
                .toList()) {
    initializeForm();
  }

  /// the root reactive form group
  late final FormGroup formInit;
  late final FormGroup form;
  final bool enabled;

  /// hierarchical model, or the instance of the form template
  /// that will store the values, and values will be saved or loaded to it
  final Map<String, FormElementInstance<dynamic>> _elements = {};

  /// the form Template, dynamically describes the form
  /// elements and their configurations
  final FormDefinition template;
  final DataFormSubmission submission;
  final Map<String, List<FormOption>> formOptionsMap;
  final FormSubmissionList formSubmissionList;

  Map<String, FormElementInstance<dynamic>> get elements =>
      Map.unmodifiable(_elements);

  /// Initialize/instantiate the form elements based on the template
  /// and/or load previous saved data to it
  void initializeForm() {
    final Map<String, AbstractControl<dynamic>> controls = {};
    final Map<String, FormElementInstance<dynamic>> formElements = {};

    template.fields.sort((a, b) => (a.order).compareTo(b.order));
    for (var element in template.fields) {
      if (element.listName != null) {
        element.options.clear();
        element.options.addAll(formOptionsMap[element.listName]!.toList());
      }
      controls[element.name] = FormTemplateControlFactory.createControl(element,
          formOptionsMap: formOptionsMap);
    }

    form = FormGroup(controls, disabled: !enabled);
    formInit = FormGroup(
        {'orgUnit': FormControl<String>(value: submission.orgUnit)},
        disabled: !enabled);

    for (var element in template.fields) {
      formElements[element.name] = FromElementFactory.createElement(
          form, element,
          formOptionsMap: formOptionsMap);
    }

    _elements.addAll(formElements);

    updateFormData(submission.formData);
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
        elements.map<String, dynamic>((key, element) {
      if (element is SectionElement<dynamic>) {
        return MapEntry(key, element.rawValue);
      }

      return MapEntry(key, element.value);
    });

    return valuesMap;
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
      {List<dynamic> savedValue = const []}) {
    return savedValue
        .map((savedValue) => FromElementFactory.createSectionInstance(
            form, template,
            savedValue: savedValue, formOptionsMap: formOptionsMap))
        .toList();
  }

  void submit({
    required void Function(Map<String, dynamic> model) onValid,
    void Function()? onNotValid,
  }) {
    if (form.valid) {
      onValid(rawValue);
    } else {
      onNotValid?.call();
    }
  }

  Future<void> markSubmissionAsFinal() {
    return formSubmissionList.markSubmissionAsFinal(submission.uid!);
  }

  Future<void> saveFormData() {
    final value1 = rawValue;
    final value2 = form.value;
    submission.orgUnit = formInit.control('orgUnit').value;
    submission.formData.clear();
    submission.formData.addAll(value2);
    return formSubmissionList.saveSubmission(submission);
  }
}
