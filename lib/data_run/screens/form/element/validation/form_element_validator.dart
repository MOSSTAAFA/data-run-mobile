import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
import 'package:datarun/generated/l10n.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class FieldValidators {
  static List<Validator<dynamic>> getValidators(ElementAttributesMixin element) {
    Set<Validator<dynamic>> validators = Set();

    if (element.mandatory) validators.add(Validators.required);
    if (element.type == ValueType.Email) validators.add(Validators.email);
    if (element.type == ValueType.Age)
      validators
          .add(Validators.number(allowedDecimals: 2, allowNegatives: false));
    if (element.type.isInteger) validators.add(Validators.number());
    if (element.type == ValueType.IntegerZeroOrPositive)
      validators.addAll(
          [Validators.number(allowNegatives: false), Validators.min(0)]);
    if (element.type == ValueType.IntegerNegative)
      validators.addAll([Validators.number(), Validators.max(-1)]);
    if (element.type == ValueType.IntegerPositive)
      validators.add(Validators.min(1));
    if (element.type == ValueType.Percentage)
      validators.addAll([Validators.min(0), Validators.maxLength(100)]);
    return validators.toList();
  }

  static Map<String, String Function(Object error)> getValidationMessages(
      ElementAttributesMixin element) {
    final Map<String, String Function(Object error)> messages = {};

    if (element.mandatory) messages['required'] = (error) => 'This field is mandatory.';
    if (element.type == ValueType.Email) messages['email'] = (error) => 'Invalid email format.';
    if (element.type == ValueType.Age) {
      messages['number'] = (error) => 'Age must be a valid number.';
      messages['min'] = (error) => 'Age cannot be negative.';
    }
    if (element.type.isInteger) {
      messages['number'] = (error) => 'Please enter an integer.';
    }
    if (element.type == ValueType.IntegerZeroOrPositive) {
      messages['number'] = (error) => 'Only zero or positive numbers allowed.';
      messages['min'] = (error) => 'Value cannot be less than 0.';
    }
    if (element.type == ValueType.IntegerNegative) {
      messages['number'] = (error) => 'Please enter an integer.';
      messages['max'] = (error) => 'Value cannot be greater than -1.';
    }
    if (element.type == ValueType.IntegerPositive) {
      messages['min'] = (error) => 'Value must be greater than 0.';
    }
    if (element.type == ValueType.Percentage) {
      messages['min'] = (error) => 'Percentage cannot be negative.';
      messages['maxLength'] = (error) => 'Percentage cannot exceed 100%.';
    }

    return messages;
  }
}


Map<String, ValidationMessageFunction> validationMessages(BuildContext context) => {
  'required': (error) => S.of(context).thisFieldIsRequired,
  'email': (error) => S.of(context).pleaseEnterAValidEmailAddress,
  'number': (error) => S.of(context).enterAValidNumber,
  'min': (error) => S.of(context).valueMustBeGreaterThanOrEqualToError(error),
  'max': (error) => S.of(context).valueMustBeLessThanOrEqualToError(error),
  'maxLength': (error) => S.of(context).maximumAllowedLengthIsError(error),
};