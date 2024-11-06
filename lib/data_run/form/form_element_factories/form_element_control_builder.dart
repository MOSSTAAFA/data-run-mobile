import 'dart:async';

import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
import 'package:datarun/data_run/screens/form/element/form_metadata.dart';
import 'package:datarun/data_run/screens/form/element/providers/form_instance.provider.dart';
import 'package:datarun/data_run/screens/form/element/service/form_instance_service.dart';
import 'package:datarun/data_run/screens/form/element/validation/form_element_validator.dart';
import 'package:datarun/data_run/screens/form_module/form_template/form_element_template.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'form_element_control_builder.g.dart';

@riverpod
Future<FormElementControlBuilder> formElementControlBuilder(
    FormElementControlBuilderRef ref,
    {required FormMetadata formMetadata}) async {
  final formFlatTemplate = await ref
      .watch(formFlatTemplateProvider(formMetadata: formMetadata).future);
  final formInstanceService = await ref
      .watch(formInstanceServiceProvider(formMetadata: formMetadata).future);

  return FormElementControlBuilder(
      formFlatTemplate: formFlatTemplate,
      formInstanceService: formInstanceService);
}

class FormElementControlBuilder {
  FormElementControlBuilder(
      {required this.formInstanceService, required this.formFlatTemplate});

  final FormFlatTemplate formFlatTemplate;
  final FormInstanceService formInstanceService;

  Future<Map<String, AbstractControl<dynamic>>> formDataControls(
      initialValue) async {
    final Map<String, AbstractControl<dynamic>> controls =
        await formInstanceService.formAttributesControls(initialValue);

    for (var element in formFlatTemplate.formTemplate.fields) {
      controls[element.name] = createElementControl(element,
          savedValue: initialValue?[element.name]);
    }

    return controls;
  }

  AbstractControl<dynamic> createElementControl(FieldTemplate fieldTemplate,
      {savedValue}) {
    if (fieldTemplate.type.isSection) {
      return createSectionFormGroup(fieldTemplate, savedValue: savedValue);
    } else if (fieldTemplate.type.isRepeatSection) {
      return createRepeatFormArray(fieldTemplate, savedValue: savedValue);
    } else {
      return createFieldFormControl(fieldTemplate, savedValue: savedValue);
    }
  }

  FormGroup createSectionFormGroup<T>(FieldTemplate fieldTemplate,
      {dynamic savedValue}) {
    final Map<String, AbstractControl<dynamic>> controls = {};
    fieldTemplate.fields.sort((a, b) => (a.order).compareTo(b.order));

    for (var childTemplate in fieldTemplate.fields) {
      controls[childTemplate.name] = createElementControl(childTemplate,
          savedValue: savedValue?[childTemplate.name]);
    }
    return FormGroup(controls);
  }

  FormArray<Map<String, Object?>> createRepeatFormArray(
      FieldTemplate fieldTemplate,
      {dynamic savedValue}) {
    final formArray = FormArray<Map<String, Object?>>((savedValue ?? [])
        .map<FormGroup>(
            (e) => createSectionFormGroup(fieldTemplate, savedValue: e))
        .toList());

    return formArray;
  }

  AbstractControl<dynamic> createFieldFormControl(FieldTemplate fieldTemplate,
      {savedValue}) {
    switch (fieldTemplate.type) {
      case ValueType.Text:
      case ValueType.OrganisationUnit:
        return FormControl<String>(
          value: savedValue ?? fieldTemplate.defaultValue,
          validators: FieldValidators.getValidators(fieldTemplate),
        );
      case ValueType.LongText:
      case ValueType.Letter:
        return FormControl<String>(
          value: savedValue ?? fieldTemplate.defaultValue,
          validators: FieldValidators.getValidators(fieldTemplate),
        );
      case ValueType.FullName:
        return FormControl<String>(
          value: savedValue ?? fieldTemplate.defaultValue,
          validators: FieldValidators.getValidators(fieldTemplate),
        );
      case ValueType.Email:
        return FormControl<String>(
          value: savedValue ?? fieldTemplate.defaultValue,
          validators: FieldValidators.getValidators(fieldTemplate),
        );
      case ValueType.Boolean:
      case ValueType.TrueOnly:
      case ValueType.YesNo:
        return FormControl<bool>(
          value: savedValue ?? fieldTemplate.defaultValue,
          validators: FieldValidators.getValidators(fieldTemplate),
        );
      case ValueType.Date:
      case ValueType.DateTime:
        return FormControl<String>(
          value: savedValue ?? fieldTemplate.defaultValue,
          validators: FieldValidators.getValidators(fieldTemplate),
        );
      case ValueType.Integer:
      case ValueType.IntegerPositive:
      case ValueType.IntegerNegative:
      case ValueType.IntegerZeroOrPositive:
        return FormControl<int>(
          value: savedValue ?? int.tryParse(fieldTemplate.defaultValue ?? ''),
          validators: FieldValidators.getValidators(fieldTemplate),
        );
      case ValueType.Number:
      case ValueType.Age:
      case ValueType.Percentage:
        return FormControl<double>(
          value:
              savedValue ?? double.tryParse(fieldTemplate.defaultValue ?? ''),
          validators: FieldValidators.getValidators(fieldTemplate),
        );
      case ValueType.SelectOne:
        return FormControl<String>(
          value: savedValue ?? fieldTemplate.defaultValue,
          validators: FieldValidators.getValidators(fieldTemplate),
        );
      case ValueType.SelectMulti:
        return FormControl<List<String>>(value: savedValue ?? []);
      default:
        throw UnsupportedError(
            'Template: ${fieldTemplate.name}, unsupported element type: ${fieldTemplate.type}');
    }
  }
}
