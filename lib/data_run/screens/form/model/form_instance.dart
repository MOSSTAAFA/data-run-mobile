import 'package:d2_remote/modules/datarun/form/entities/data_form_submission.entity.dart';
import 'package:d2_remote/modules/datarun/form/entities/form_definition.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/attribute_type.dart';
import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:mass_pro/data_run/screens/form/model/form_element_model.dart';
import 'package:mass_pro/data_run/screens/form/model/form_instance.provider.dart';
import 'package:mass_pro/data_run/screens/form/model/form_instance_service.dart';
import 'package:mass_pro/data_run/screens/form/model/form_metadata.dart';
import 'package:mass_pro/data_run/screens/form_submission_list/model/submission_list.provider.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class FormInstance {
  FormInstance(
    this.ref, {
    required FormInstanceService formInstanceService,
    required this.form,
    Map<String, FormElementInstance<dynamic>> elements = const {},
    required this.enabled,
  }) : _formInstanceService = formInstanceService {
    _elements.addAll(elements);
  }

  /// the root reactive form group
  final FormInstanceRef ref;
  final FormGroup form;
  final FormInstanceService _formInstanceService;

  final bool enabled;

  /// hierarchical model, or the instance of the form template
  /// that will store the values, and values will be saved or loaded to it
  final Map<String, FormElementInstance<dynamic>> _elements = {};

  // final Map<String, FormElementInstance<dynamic>> _attributeElements = {};

  /// the form Template, dynamically describes the form
  /// elements and their configurations
  FormTemplateV get template => _formInstanceService.template;

  FormMetadata get metadata => _formInstanceService.formMetadata;

  String? get submissionUid => metadata.submission;

  Map<String, List<FormOption>> get formOptionsMap =>
      _formInstanceService.formOptionsMapCache;

  Map<String, FormElementInstance<dynamic>> get elements =>
      Map.unmodifiable(_elements);

  // Map<String, FormElementInstance<dynamic>> get attributeElements =>
  //     Map.unmodifiable(_attributeElements);

  FormSubmissionList get formSubmissionList => ref
      .read(formSubmissionListProvider(form: template.formTemplate).notifier);

  List<String> get selectableOrgUnits => template.orgUnits;

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
}
