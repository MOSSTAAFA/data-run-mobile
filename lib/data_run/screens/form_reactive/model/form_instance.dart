import 'package:d2_remote/modules/datarun/form/entities/data_form_submission.entity.dart';
import 'package:d2_remote/modules/datarun/form/entities/form_definition.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:mass_pro/data_run/screens/form_reactive/model/form_control_factory.dart';
import 'package:mass_pro/data_run/screens/form_reactive/model/form_element_factory.dart';
import 'package:mass_pro/data_run/screens/form_reactive/model/form_element_model.dart';
import 'package:mass_pro/data_run/screens/form_reactive/model/form_instance.provider.dart';
import 'package:mass_pro/data_run/screens/form_submission_list/model/submission_list.provider.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class FormInstance {
  FormInstance(
    this.ref, {
    required FormTemplateV template,
    DataFormSubmission? submission,
    required this.enabled,
  })  : _template = template,
        _submission = submission {
    _formOptionsMap.addAll(Map.fromIterable(
        template.options..sort((a, b) => (a.order).compareTo(b.order)),
        key: (option) => option.listName,
        value: (option) => template.options
            .where((o) => o.listName == option.listName)
            .toList()));
    initializeForm();
  }

  /// the root reactive form group
  final FormInstanceRef ref;
  late final FormGroup formInit;
  late final FormGroup form;
  final bool enabled;

  /// hierarchical model, or the instance of the form template
  /// that will store the values, and values will be saved or loaded to it
  final Map<String, FormElementInstance<dynamic>> _elements = {};

  /// the form Template, dynamically describes the form
  /// elements and their configurations
  final FormTemplateV _template;
  DataFormSubmission? _submission;
  final Map<String, List<FormOption>> _formOptionsMap = {};

  FormTemplateV get template => _template;

  DataFormSubmission? get submission => _submission;

  Map<String, List<FormOption>> get formOptionsMap =>
      Map.unmodifiable(_formOptionsMap);

  Map<String, FormElementInstance<dynamic>> get elements =>
      Map.unmodifiable(_elements);

  FormSubmissionList get formSubmissionList => ref
      .watch(formSubmissionListProvider(form: template.formTemplate).notifier);

  List<String> get selectableOrgUnits => template.orgUnits;

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
    formInit = FormGroup({
      'orgUnit': FormControl<String>(
          value: submission?.orgUnit ??
              (selectableOrgUnits.length == 1
                  ? selectableOrgUnits.first
                  : null))
    }, disabled: !enabled);

    for (var element in template.fields) {
      formElements[element.name] = FromElementFactory.createElement(
          form, element,
          formOptionsMap: formOptionsMap);
    }

    _elements.addAll(formElements);

    if (submission != null) {
      updateFormData(submission!.formData);
    }
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
    return formSubmissionList.markSubmissionAsFinal(submission!.uid!);
  }

  Future<DataFormSubmission> saveFormData() async {
    final value2 = form.value;
    if (_submission != null) {
      _submission!.orgUnit = formInit.control('orgUnit').value;
      _submission!.formData.clear();
      _submission!.formData.addAll(value2);
      return formSubmissionList.saveSubmission(_submission!);
    } else {
      _submission = await formSubmissionList.createSubmission(
        activityUid: _template.activity,
        orgUnit: formInit.control('orgUnit').value,
        formData: value2,
      );
      return _submission!;
    }
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

}
