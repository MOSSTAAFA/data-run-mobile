// import 'dart:io';
//
// import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
// import 'package:flutter/material.dart';
// import 'package:mass_pro/commons/extensions/standard_extensions.dart';
// import 'package:mass_pro/data_run/form/form_model/form_model.dart';
// import 'package:mass_pro/data_run/screens/form/model/q_field.model.builder.dart';
// import 'package:mass_pro/form/model/key_board_action_type.dart';
// import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
// import 'package:mass_pro/form/ui/intent/form_intent.dart';
// import 'package:d2_remote/core/datarun/utilities/date_utils.dart' as sdk;
//
// extension FormFieldModelExtensions on QFieldModel {
//   TextInputType? get inputType {
//     return when(valueType, <Object, TextInputType Function()>{
//       ValueType.Text: () => TextInputType.text,
//       ValueType.LongText: () => TextInputType.multiline,
//       ValueType.Letter: () => TextInputType.text,
//       ValueType.Number: () =>
//           const TextInputType.numberWithOptions(decimal: true, signed: true),
//       ValueType.UnitInterval: () =>
//           const TextInputType.numberWithOptions(decimal: true),
//       ValueType.Percentage: () => TextInputType.number,
//       <ValueType>[ValueType.IntegerNegative, ValueType.Integer]: () =>
//           const TextInputType.numberWithOptions(signed: true),
//       <ValueType>[ValueType.IntegerPositive, ValueType.IntegerZeroOrPositive]:
//           () => TextInputType.number,
//       ValueType.PhoneNumber: () => TextInputType.phone,
//       ValueType.Email: () => TextInputType.emailAddress,
//       ValueType.URL: () => TextInputType.url,
//     });
//   }
//
//   TextInputAction? get inputAction {
//     return TextInputAction.none;
//     // return when(
//     //     keyboardActionType, <KeyboardActionType, TextInputAction Function()>{
//     //   KeyboardActionType.NEXT: () => TextInputAction.next,
//     //   KeyboardActionType.DONE: () => TextInputAction.done,
//     //   KeyboardActionType.ENTER: () => TextInputAction.none,
//     // });
//   }
//
//   int? get maxLength {
//     switch (valueType) {
//       case ValueType.Text:
//         return 255;
//       case ValueType.LongText:
//       case ValueType.Letter:
//         return 2000;
//       default:
//         return null;
//     }
//   }
//
//   //
//   TextInputAction? get textInputAction {
//     // if (keyboardActionType != null) {
//     //   return when(
//     //       keyboardActionType, <KeyboardActionType, TextInputAction Function()>{
//     //     KeyboardActionType.NEXT: () => TextInputAction.next,
//     //     KeyboardActionType.DONE: () => TextInputAction.done,
//     //     KeyboardActionType.ENTER: () => TextInputAction.none
//     //   });
//     // }
//     return null;
//   }
//
//   QFieldModel setValue(String? value) => builder().setValue(value).build();
//
//   QFieldModel setPath(String? path) => builder().setValue(path).build();
//
//   QFieldModel setSection(String? section) {
//     return builder().setSection(section).build();
//   }
//
//   QFieldModel setValues(List<String>? values) =>
//       builder().setValues(values).build();
//
//   QFieldModel setIsVisible(bool isVisible) =>
//       builder().setIsVisible(isVisible).build();
//
//   QFieldModel setError(String? error) => builder().setError(error).build();
//
//   QFieldModel setEditable(bool editable) =>
//       builder().setIsEditable(editable).build();
//
//   QFieldModel setFieldMandatory(bool? isMandatory) =>
//       builder().setIsMandatory(isMandatory).build();
//
//   QFieldModel setKeyBoardActionDone() =>
//       builder().setKeyboardActionType(KeyboardActionType.DONE).build();
//
//   QFieldModel setCallback({IntentCallback? intentCallback}) {
//     return builder().setIntentCallback(intentCallback).build();
//   }
//
//   bool _valueIsEmpty() => (value ?? '').isEmpty;
//
//   /// invoke FormInputFieldIntent.onFocus
//   void onFieldClick() {
//     intentCallback?.call(FormIntent.onFocus(name, value));
//   }
//
//   /// invoke FormInputFieldIntent.onNext
//   void onNext() {
//     intentCallback?.call(FormIntent.onNext(uid: name, value: value));
//   }
//
//   /// invoke FormInputFieldIntent.onTextChange whenever the
//   /// text or value of the field is changed
//   void onTextChange(String? value) {
//     intentCallback?.call(FormIntent.onTextChange(
//         uid: name,
//         value: (value ?? '').isEmpty == true ? null : value,
//         valueType: valueType));
//   }
//
//   /// invoke FormInputFieldIntent.clearValue
//   void onClear() {
//     onFieldClick();
//     intentCallback?.call(FormIntent.clearValue(name));
//   }
//
//   /// invoke FormInputFieldIntent.onSave for with value
//   void onSave(String? value) {
//     onFieldClick();
//     intentCallback
//         ?.call(FormIntent.onSave(uid: name, value: value, valueType: valueType));
//   }
//
//   /// invoke FormInputFieldIntent.onSave  for Boolean type field
//   void onSaveBoolean(bool? boolean) {
//     final String? result = _valueIsEmpty() || value != boolean.toString()
//         ? boolean.toString()
//         : null;
//     intentCallback?.call(
//         FormIntent.onSave(uid: name, value: result, valueType: valueType));
//   }
//
//   FormOption? getOption() {
//     return null; /*optionConfiguration?.optionsToDisplay
//         .where((FormOption option) => option.name == value)
//         .firstOrNull;*/
//   }
//
//   List<FormOption>? getOptions() {
//     // return optionConfiguration?.optionsToDisplay
//     //     .where((FormOption option) => values?.contains(option.name) == true)
//     //     .toList();
//     return [];
//   }
//
//   List<FormOption>? getOptionsToDisplay() {
//     return []; // optionConfiguration?.optionsToDisplay.toList();
//   }
//
//   /// invoke FormInputFieldIntent.onSave
//   void onSaveOption(FormOption? option) {
//     String? nextValue;
//     if (value == option?.name) {
//       nextValue = null;
//     } else {
//       nextValue = option?.name;
//     }
//     intentCallback?.call(
//         FormIntent.onSave(uid: name, value: nextValue, valueType: valueType));
//   }
//
//   /// invoke FormInputFieldIntent.onSave
//   void onSaveOptions(List<FormOption>? option) {
//     intentCallback?.call(FormIntent.onSave(
//         uid: name,
//         values: option?.map((FormOption option) => option.name).toList(),
//         valueType: valueType));
//   }
//
//   /// invoke FormInputFieldIntent.onSave
//   void onSaveDate(DateTime? date) {
//     String? nextValue;
//     if (date != null) {
//       nextValue = sdk.DateUtils.databaseDateFormat().format(date.toUtc());
//     }
//
//     intentCallback?.call(
//         FormIntent.onSave(uid: name, value: nextValue, valueType: valueType));
//   }
//
//   void invokeIntent(FormIntent intent) {
//     intentCallback?.call(intent);
//   }
//
//   /// if the field is of type image of file
//   bool get hasImage {
//     return !_valueIsEmpty() && File(value ?? '').existsSync();
//   }
//
//   bool isSection() => valueType?.isSectionType == true;
//
//   bool isRepeatableSection() => valueType == ValueType.RepeatableSection;
//
//   QFieldModelBuilder builder() => QFieldModelBuilder(this);
// }
