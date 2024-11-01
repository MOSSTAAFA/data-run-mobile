import 'package:d2_remote/modules/datarun/form/entities/data_form_submission.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/commons/logging/logging.dart';
import 'package:mass_pro/data_run/form/form_element_factories/form_element_builder.dart';
import 'package:mass_pro/data_run/form/form_element_factories/form_element_control_builder.dart';
import 'package:mass_pro/data_run/form/form_submission/submission_list.provider.dart';
import 'package:mass_pro/data_run/form/shared/form_configuration.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/element/providers/form_instance.provider.dart';
import 'package:mass_pro/data_run/screens/form/element/service/form_instance_service.dart';
import 'package:mass_pro/data_run/screens/form/element/form_metadata.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

const orgUnitControlName = 'orgUnit';
const formAttributesGroupName = 'attributes';
const formDataGroupName = 'formData';

const formControlName = 'formData';
const activityControlName = 'formData';
const teamControlName = 'formData';
const versionControlName = 'formData';

class FormInstance {
  FormInstance(FormInstanceRef ref,
      {required FormInstanceService formInstanceService,
      required this.form,
        required String? orgUnit,
      required this.formMetadata,
      required this.formConfiguration,
      Map<String, FormElementInstance<dynamic>> elements = const {},
      required this.enabled})
      : _ref = ref,
        _formSection = SectionInstance(
            template: FieldTemplate(
                mandatory: false,
                mainField: false,
                type: ValueType.Unknown,
                name: '',
                path: null),
            form: form)
          ..addAll(elements) {
    form.addAll({
      '_${orgUnitControlName}':
          FormControl<String>(value: orgUnit, validators: [Validators.required])
    });
    _elements.addAll(elements);
    if (!enabled) {
      form.markAsDisabled();
    }
  }

  final FormGroup form;
  final bool enabled;

  final FormInstanceRef _ref;
  final Map<String, FormElementInstance<dynamic>> _elements = {};
  final SectionInstance _formSection;

  final FormConfiguration formConfiguration;

  Map<String, FormElementInstance<dynamic>> get elements =>
      Map.unmodifiable(_elements);

  SectionInstance get formSection => _formSection;

  FormSubmissions get formSubmissionList =>
      _ref.read(formSubmissionsProvider(formMetadata.form).notifier);

  final FormMetadata formMetadata;

  String? get submissionUid => formMetadata.submission;

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
    final Map<String, Object?> formValue = form.value;
    final Map<String, Object?> formValue3 = _formSection.value!;
    final Map<String, dynamic> value = formValue3 ?? {};
    logDebug(info: '${value}');
    DataFormSubmission? formSubmission;
    formSubmission = await formSubmissionList.getSubmission(submissionUid!);
    formSubmission!.orgUnit = form.control('_${orgUnitControlName}').value;
    formSubmission.formData.clear();
    formSubmission.formData.addAll(formValue);
    return formSubmissionList.updateSubmission(formSubmission);
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

  RepeatItemInstance onAddRepeatedItem(RepeatInstance parent) {
    final instanceBuilder = _ref
        .read(formInstanceBuilderProvider(formMetadata: formMetadata))
        .requireValue;
    final instanceControllerBuilder = _ref
        .read(formInstanceControlBuilderProvider(formMetadata: formMetadata))
        .requireValue;
    final itemInstanceController =
        instanceControllerBuilder.createSectionFormGroup(parent.template);
    final itemInstance = instanceBuilder.buildRepeatItem(form, parent.template);
    parent.elementControl.add(itemInstanceController);
    parent.add(itemInstance);
    parent.elementControl.markAsDirty();
    return itemInstance;
  }

  void onRemoveRepeatedItem(int index, RepeatInstance parent) {
    parent.removeAt(index);
    parent.elementControl.removeAt(index);
    parent.elementControl.markAsDirty();
  }

//
// Map<String, dynamic> toHierarchical(
//     List<FormElementTemplate> templates, FormValueMap valueMap) {
//   Map<String, dynamic> hierarchicalData = {};
//   for (var template in templates) {
//     String path = template.path!;
//     // section or repeat
//     if (template.type.isSectionType) {
//       // Recursively call to construct sub-structure
//       hierarchicalData[template.name] = toHierarchical(
//           _formContainerTemplate.getDescendants(path), valueMap);
//       // } else if (template.type.isRepeatSection) {
//       //   hierarchicalData[template.name] =
//       //       toHierarchical(formTemplate.getDescendants(path), valueMap);
//     } else {
//       // Direct assignment from flat map
//       hierarchicalData[template.name] = valueMap.getValue(path);
//     }
//   }
//   return hierarchicalData;
// }
}
