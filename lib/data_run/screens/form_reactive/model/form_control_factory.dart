import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
import 'package:mass_pro/data_run/screens/form_reactive/model/form_element_model.dart';
import 'package:mass_pro/data_run/screens/form_reactive/model/form_element_validator.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

/// from template wit value, use [FormTemplateControlFactory]
/// for adding new control with saved value
extension FromElementControlFactory<T> on FormElementInstance<T?> {
  static FormGroup createSectionControl<T>(SectionInstance section) {
    final Map<String, AbstractControl<dynamic>> controls = {};
    for (var element in section.elements.values) {
      controls[element.name] = createElementControl(element);
    }
    return FormGroup(controls);
  }

  static FormArray<Map<String, Object?>> createRepeatSectionControl(
      RepeatSectionInstance section) {
    final Map<String, AbstractControl<dynamic>> initialGroups = {};

    for (var element in section.elements) {
      initialGroups[element.name] = createElementControl(element);
    }
    final FormGroup formGroup = FormGroup(initialGroups);
    return FormArray<Map<String, Object?>>([formGroup]);
  }

  static AbstractControl<dynamic> createElementControl(
      FormElementInstance<dynamic> element) {
    return switch (element) {
      FieldInstance() => createFieldControl(element),
      SectionInstance() => createSectionControl(element),
      RepeatSectionInstance() => createRepeatSectionControl(element),
    };
  }

  static AbstractControl<dynamic> createFieldControl(
      FieldInstance<dynamic> element) {
    switch (element.type) {
      case ValueType.Text:
      case ValueType.LongText:
      case ValueType.Letter:
      case ValueType.FullName:
      case ValueType.Email:
      case ValueType.OrganisationUnit:
        return FormControl<String>(
          value: element.value ?? element.defaultValue,
          validators: FieldValidators.getValidators(element),
        );
      case ValueType.Boolean:
      case ValueType.TrueOnly:
      case ValueType.YesNo:
        return FormControl<bool>(
          value: element.value ?? element.defaultValue,
          validators: FieldValidators.getValidators(element),
        );
      case ValueType.Date:
      case ValueType.Time:
      case ValueType.DateTime:
        return FormControl<String?>(
          value: element.value ?? element.defaultValue,
          validators: FieldValidators.getValidators(element),
        );
      case ValueType.Integer:
      case ValueType.IntegerPositive:
      case ValueType.IntegerNegative:
      case ValueType.IntegerZeroOrPositive:
        return FormControl<int?>(
          value: element.value ?? element.defaultValue,
          validators: FieldValidators.getValidators(element),
        );
      case ValueType.Number:
      case ValueType.Age:
      case ValueType.Percentage:
        return FormControl<double?>(
          value: element.value ?? element.defaultValue,
          validators: FieldValidators.getValidators(element),
        );
      case ValueType.SelectOne:
        return FormControl<String>(
          value: element.value ?? element.defaultValue,
          validators: FieldValidators.getValidators(element),
        );
      case ValueType.SelectMulti:
        // return FormArray<String>(
        //   fieldTemplate.options.map((option) => FormControl<String>()).toList(),
        // );
        return FormControl<List<String>>(
          value:
              element.value is String ? [element.value] : element.value ?? [],
        );
      default:
        throw UnsupportedError('Unsupported element type: ${element}');
    }
  }
}

/// from template without values, use [FromElementControlFactory]
/// for adding new control with no value but the defaultValue
extension FormTemplateControlFactory<T> on FormElementInstance<T?> {
  static FormGroup createSectionControl<T>(FieldTemplate fieldTemplate,
      {Map<String, List<FormOption>> formOptionsMap = const {}}) {
    final Map<String, AbstractControl<dynamic>> controls = {};
    fieldTemplate.fields.sort((a, b) => (a.order).compareTo(b.order));

    for (var element in fieldTemplate.fields) {
      controls[element.name] =
          createControl(element, formOptionsMap: formOptionsMap);
    }
    return FormGroup(controls);
  }

  static FormArray<Map<String, Object?>> createRepeatSectionControl(
      FieldTemplate fieldTemplate,
      {Map<String, List<FormOption>> formOptionsMap = const {}}) {
    final Map<String, AbstractControl<dynamic>> initialGroups = {};
    fieldTemplate.fields.sort((a, b) => (a.order).compareTo(b.order));

    for (var element in fieldTemplate.fields) {
      initialGroups[element.name] =
          createControl(element, formOptionsMap: formOptionsMap);
    }
    final FormGroup formGroup = FormGroup(initialGroups);
    return FormArray<Map<String, Object?>>([formGroup]);
  }

  static AbstractControl<dynamic> createControl(FieldTemplate fieldTemplate,
      {Map<String, List<FormOption>> formOptionsMap = const {}}) {
    if (fieldTemplate.type.isSection) {
      return createSectionControl(fieldTemplate,
          formOptionsMap: formOptionsMap);
    } else if (fieldTemplate.type.isRepeatSection) {
      return createRepeatSectionControl(fieldTemplate,
          formOptionsMap: formOptionsMap);
    } else {
      final fieldOptions = fieldTemplate.type.isSelectType
          ? formOptionsMap[fieldTemplate.listName] ?? []
          : <FormOption>[];
      return createFormControl(fieldTemplate, fieldOptions: fieldOptions);
    }
  }

  static AbstractControl<dynamic> createFormControl(FieldTemplate fieldTemplate,
      {List<FormOption> fieldOptions = const []}) {
    switch (fieldTemplate.type) {
      case ValueType.Text:
      case ValueType.OrganisationUnit:
        return FormControl<String>(
          value: fieldTemplate.defaultValue,
          validators: FieldValidators.getValidators(fieldTemplate),
        );
      case ValueType.LongText:
      case ValueType.Letter:
        return FormControl<String>(
          value: fieldTemplate.defaultValue,
          validators: FieldValidators.getValidators(fieldTemplate),
        );
      case ValueType.FullName:
        return FormControl<String>(
          value: fieldTemplate.defaultValue,
          validators: FieldValidators.getValidators(fieldTemplate),
        );
      case ValueType.Email:
        return FormControl<String>(
          value: fieldTemplate.defaultValue,
          validators: FieldValidators.getValidators(fieldTemplate),
        );
      case ValueType.Boolean:
      case ValueType.TrueOnly:
      case ValueType.YesNo:
        return FormControl<bool>(
          value: fieldTemplate.defaultValue,
          validators: FieldValidators.getValidators(fieldTemplate),
        );
      case ValueType.Date:
      case ValueType.DateTime:
        return FormControl<String>(
          value: fieldTemplate.defaultValue,
          validators: FieldValidators.getValidators(fieldTemplate),
        );
      case ValueType.Integer:
      case ValueType.IntegerPositive:
      case ValueType.IntegerNegative:
      case ValueType.IntegerZeroOrPositive:
        return FormControl<int>(
          value: fieldTemplate.defaultValue,
          validators: FieldValidators.getValidators(fieldTemplate),
        );
      case ValueType.Number:
      case ValueType.Age:
      case ValueType.Percentage:
        return FormControl<double>(
          value: fieldTemplate.defaultValue,
          validators: FieldValidators.getValidators(fieldTemplate),
        );
      case ValueType.SelectOne:
        return FormControl<String>(
          value: fieldTemplate.defaultValue,
          validators: FieldValidators.getValidators(fieldTemplate),
        );
      case ValueType.SelectMulti:
        return FormControl<List<String>>(value: []);
      default:
        throw UnsupportedError(
            'Unsupported element type: ${fieldTemplate.type}');
    }
  }
}
