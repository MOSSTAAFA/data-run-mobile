import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mass_pro/data_run/screens/data_submission_form/model/q_field.model.dart';
import 'package:mass_pro/sdk/core/common/value_type.dart';

class QFieldValidators {
  static FormFieldValidator<String> getValidators(QFieldModel fieldModel) {
    return FormBuilderValidators.compose([
      if (fieldModel.isMandatory) FormBuilderValidators.required(),
      if (fieldModel.valueType?.isNumeric ?? false)
        FormBuilderValidators.numeric(),
      if (fieldModel.valueType == ValueType.IntegerZeroOrPositive)
        FormBuilderValidators.min(0),
      if (fieldModel.valueType == ValueType.IntegerNegative)
        FormBuilderValidators.max(0),
      if (fieldModel.valueType == ValueType.IntegerPositive)
        FormBuilderValidators.max(1),
    ]);
  }
}
