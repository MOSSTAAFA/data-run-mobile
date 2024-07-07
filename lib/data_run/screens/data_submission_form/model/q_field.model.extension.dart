import 'package:flutter/material.dart';
import 'package:mass_pro/commons/extensions/standard_extensions.dart';
import 'package:mass_pro/data_run/screens/data_submission_form/model/q_field.model.dart';
import 'package:mass_pro/form/model/key_board_action_type.dart';
import 'package:mass_pro/sdk/core/common/value_type.dart';

extension FormFieldModelExtensions on QFieldModel {
  TextInputType? get inputType {
    return when(valueType, {
      ValueType.Text: () => TextInputType.text,
      ValueType.LongText: () => TextInputType.multiline,
      ValueType.Letter: () => TextInputType.text,
      ValueType.Number: () =>
          const TextInputType.numberWithOptions(decimal: true, signed: true),
      ValueType.UnitInterval: () =>
          const TextInputType.numberWithOptions(decimal: true),
      ValueType.Percentage: () => TextInputType.number,
      [ValueType.IntegerNegative, ValueType.Integer]: () =>
          const TextInputType.numberWithOptions(signed: true),
      [ValueType.IntegerPositive, ValueType.IntegerZeroOrPositive]: () =>
          TextInputType.number,
      ValueType.PhoneNumber: () => TextInputType.phone,
      ValueType.Email: () => TextInputType.emailAddress,
      ValueType.URL: () => TextInputType.url,
    });
  }

  TextInputAction? get inputAction {
    return when(keyboardActionType, {
      KeyboardActionType.NEXT: () => TextInputAction.next,
      KeyboardActionType.DONE: () => TextInputAction.done,
      KeyboardActionType.ENTER: () => TextInputAction.none,
    });
  }

  int? get maxLength {
    switch (valueType) {
      case ValueType.Text:
        return 255;
      case ValueType.LongText:
      case ValueType.Letter:
        return 2000;
      default:
        return null;
    }
  }

  //
  TextInputAction? get textInputAction {
    if (keyboardActionType != null) {
      return when(keyboardActionType, {
        KeyboardActionType.NEXT: () => TextInputAction.next,
        KeyboardActionType.DONE: () => TextInputAction.done,
        KeyboardActionType.ENTER: () => TextInputAction.none
      });
    }
    return null;
  }
}
