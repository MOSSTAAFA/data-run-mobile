import 'package:d2_remote/modules/datarun/form/entities/data_form_submission.entity.dart';
import 'package:d2_remote/modules/datarun/form/entities/form_definition.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/attribute_type.dart';
import 'package:mass_pro/data_run/screens/form/element/factories/form_element_factory.dart';
import 'package:mass_pro/data_run/screens/form_module/model/form_element.dart';
import 'package:mass_pro/data_run/screens/form/element/providers/form_instance.provider.dart';
import 'package:mass_pro/data_run/screens/form/element/service/form_instance_service.dart';
import 'package:mass_pro/data_run/screens/form/element/form_metadata.dart';
import 'package:mass_pro/data_run/screens/form_submission_list/model/submission_list.provider.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class FormInstance implements FormModel<Map<String, dynamic>> {
  FormInstance(
    this.ref, {
    required FormInstanceService formInstanceService,
    required this.form,
    required this.enabled,
    required this.template,
  }) : _formInstanceService = formInstanceService {
    _elements.addAll(elements);
    if (!enabled) {
      form.markAsDisabled();
    }
  }

  /// the root reactive form group
  final FormInstanceRef ref;
  final FormGroup form;
  final FormInstanceService _formInstanceService;

  final bool enabled;

  /// hierarchical model, or the instance of the form template
  /// that will store the values, and values will be saved or loaded to it
  final Map<String, FormElementInstance<dynamic>> _elements = {};

  /// the form Template, dynamically describes the form's
  /// elements and their configurations
  FormTemplateV template;

  FormMetadata get metadata => _formInstanceService.formMetadata;

  String? get submissionUid => metadata.submission;

  Map<String, FormElementInstance<dynamic>> get elements =>
      Map.unmodifiable(_elements);

  // Map<String, FormElementInstance<dynamic>> get attributeElements =>
  //     Map.unmodifiable(_attributeElements);

  FormSubmissionList get formSubmissionList => ref
      .read(formSubmissionListProvider(form: template.formTemplate).notifier);

  List<String> get selectableOrgUnits => template.orgUnits;

  Future<Map<String, FormElementInstance<dynamic>>> formDataElements(
      FormGroup form) async {
    final Map<String, FormElementInstance<dynamic>> elements = {};

    final savedValue = await loadFormData();
    for (var element in template.fields) {
      elements[element.name] = FromElementFactory.createFormElement(
          form, element,
          formOptionsMap: formOptionsMapCache,
          initialValue: savedValue?[element.name]);
    }
    return elements;
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

  @override
  Map<String, dynamic> get model {
    Map<String, dynamic> valuesMap =
        elements.map<String, Object?>((key, element) {
      if (element is FormCollectionElement<dynamic>) {
        return MapEntry(key, element.rawValue);
      }

      return MapEntry(key, element.value);
    });

    return {'formData': valuesMap};
  }

  @override
  reset(
      {Map<String, dynamic>? value,
      bool updateParent = true,
      bool emitEvent = true}) {
    // TODO: implement reset
    throw UnimplementedError();
  }

  @override
  void submit(
      {required void Function(Map<String, dynamic> model) onValid,
      void Function()? onNotValid}) {
    // TODO: implement submit
  }

  @override
  void toggleDisabled({bool updateParent = true, bool emitEvent = true}) {
    // TODO: implement toggleDisabled
  }

  @override
  void updateValue(Map<String, dynamic>? value,
      {bool updateParent = true, bool emitEvent = true}) {
    // TODO: implement updateValue
  }
}
