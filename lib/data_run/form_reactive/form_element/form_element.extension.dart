import 'package:flutter/material.dart';
import 'package:mass_pro/data_run/form_reactive/form_element/form_element_model.dart';
import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';

extension FormFieldModelExtensions on FieldInstance {
  TextInputType? get inputType {
    return switch (type) {
      ValueType.Text => TextInputType.text,
      ValueType.LongText => TextInputType.multiline,
      ValueType.Letter => TextInputType.text,
      ValueType.Number =>
        const TextInputType.numberWithOptions(decimal: true, signed: true),
      ValueType.UnitInterval =>
        const TextInputType.numberWithOptions(decimal: true),
      ValueType.Percentage => TextInputType.number,
      ValueType.IntegerNegative ||
      ValueType.Integer =>
        const TextInputType.numberWithOptions(signed: true),
      ValueType.IntegerPositive ||
      ValueType.IntegerZeroOrPositive =>
        TextInputType.number,
      ValueType.PhoneNumber => TextInputType.phone,
      ValueType.Email => TextInputType.emailAddress,
      ValueType.URL => TextInputType.url,
      _ => TextInputType.text
    };
  }

  TextInputAction? get inputAction {
    return TextInputAction.none;
    // return when(
    //     keyboardActionType, <KeyboardActionType, TextInputAction Function()>{
    //   KeyboardActionType.NEXT: () => TextInputAction.next,
    //   KeyboardActionType.DONE: () => TextInputAction.done,
    //   KeyboardActionType.ENTER: () => TextInputAction.none,
    // });
  }

  int? get maxLength {
    switch (type) {
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
    // if (keyboardActionType != null) {
    //   return when(
    //       keyboardActionType, <KeyboardActionType, TextInputAction Function()>{
    //     KeyboardActionType.NEXT: () => TextInputAction.next,
    //     KeyboardActionType.DONE: () => TextInputAction.done,
    //     KeyboardActionType.ENTER: () => TextInputAction.none
    //   });
    // }
    return null;
  }
}
