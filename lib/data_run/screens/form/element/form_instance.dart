import 'package:d2_remote/modules/datarun/form/entities/data_form_submission.entity.dart';
import 'package:d2_remote/modules/datarun/form/entities/form_definition.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/attribute_type.dart';
import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
import 'package:mass_pro/commons/logging/logging.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/element/form_value_map.dart';
import 'package:mass_pro/data_run/screens/form/element/providers/form_instance.provider.dart';
import 'package:mass_pro/data_run/screens/form/element/service/form_instance_service.dart';
import 'package:mass_pro/data_run/screens/form/element/form_metadata.dart';
import 'package:mass_pro/data_run/screens/form_module/form_template/form_element_template.dart';
import 'package:mass_pro/data_run/screens/form_submission_list/model/submission_list.provider.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class FormInstance {
  FormInstance(FormInstanceRef ref,
      {required FormInstanceService formInstanceService,
      required this.form,
      Map<String, FormElementInstance<dynamic>> elements = const {},
      required this.enabled,
      required FormValueMap formValueMap})
      : _ref = ref,
        _formSection = SectionInstance(
            template: FieldTemplate(
                mandatory: false,
                mainField: false,
                type: ValueType.Unknown,
                name: '',
                path: null),
            form: form,
            path: null,
            formValueMap: formValueMap)
          ..addAll(elements),
        _formInstanceService = formInstanceService,
        _formContainerTemplate =
            FormFlatTemplate.fromTemplate(formInstanceService.template),
        formValueMap = formValueMap {
    _elements.addAll(elements);
    if (!enabled) {
      form.markAsDisabled();
    }
  }

  FormValueMap formValueMap;
  final FormGroup form;
  final bool enabled;

  final FormInstanceRef _ref;
  final FormInstanceService _formInstanceService;
  final FormFlatTemplate _formContainerTemplate;
  final Map<String, FormElementInstance<dynamic>> _elements = {};
  final SectionInstance _formSection;

  FormFlatTemplate get formContainerTemplate => _formContainerTemplate;

  Map<String, FormElementInstance<dynamic>> get elements =>
      Map.unmodifiable(_elements);

  SectionInstance get formSection => _formSection;

  FormSubmissionList get formSubmissionList => _ref
      .read(formSubmissionListProvider(form: template.formTemplate).notifier);

  List<String> get selectableOrgUnits => template.orgUnits;

  FormTemplateV get template => _formInstanceService.template;

  FormMetadata get metadata => _formInstanceService.formMetadata;

  String? get submissionUid => metadata.submission;

  Map<String, List<FormOption>> get formOptionsMap =>
      _formInstanceService.formOptionsMapCache;

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
    return formSubmissionList.markSubmissionAsFinal(submissionUid!);
  }

  Future<DataFormSubmission> saveFormData() async {
    final formValue = form.value;
    DataFormSubmission? formSubmission;
    formSubmission = await formSubmissionList.getSubmission(submissionUid!);
    formSubmission!.orgUnit =
        form.control('_${AttributeType.orgUnit.name}').value;
    formSubmission.formData.clear();
    formSubmission.formData.addAll(formValue);
    return formSubmissionList.saveSubmission(formSubmission);
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

  Map<String, dynamic> toHierarchical(
      List<FormElementTemplate> templates, FormValueMap valueMap) {
    Map<String, dynamic> hierarchicalData = {};
    for (var template in templates) {
      String path = template.path!;
      // section or repeat
      if (template.type.isSectionType) {
        // Recursively call to construct sub-structure
        hierarchicalData[template.name] = toHierarchical(
            _formContainerTemplate.getDescendants(path), valueMap);
        // } else if (template.type.isRepeatSection) {
        //   hierarchicalData[template.name] =
        //       toHierarchical(formTemplate.getDescendants(path), valueMap);
      } else {
        // Direct assignment from flat map
        hierarchicalData[template.name] = valueMap.getValue(path);
      }
    }
    return hierarchicalData;
  }
}
