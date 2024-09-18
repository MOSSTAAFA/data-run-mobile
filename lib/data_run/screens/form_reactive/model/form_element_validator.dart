import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
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
    return validators.toList();
  }
}
