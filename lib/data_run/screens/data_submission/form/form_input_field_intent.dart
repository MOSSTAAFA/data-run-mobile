import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mass_pro/sdk/core/common/value_type.dart';

part 'form_input_field_intent.freezed.dart';

@freezed
class FormInputFieldIntent with _$FormInputFieldIntent {
  // NMC
  const factory FormInputFieldIntent.init() = Init;

  const factory FormInputFieldIntent.onFinish([String? extraData]) = OnFinish;

  const factory FormInputFieldIntent.onClear([String? extraData]) = OnClear;

  const factory FormInputFieldIntent.onFocus(
      {required String key, String? uid, String? value}) = OnFocus;

  const factory FormInputFieldIntent.onNext(
      {required String key,
      String? uid,
      String? value,
      int? position}) = OnNext;

  const factory FormInputFieldIntent.onSave(
      {required String key,
      String? uid,
      String? value,
      ValueType? valueType,
      String? fieldMask}) = OnSave;

  const factory FormInputFieldIntent.onTextChange(
      {required String key, String? uid, String? value}) = OnTextChange;

  const factory FormInputFieldIntent.clearValue(
      {required String key, String? uid}) = ClearValue;

  const factory FormInputFieldIntent.selectLocationFromCoordinates({
    required String key,
    String? uid,
    String? coordinates,
    required String extraData,
  }) = SelectLocationFromCoordinates;

  const factory FormInputFieldIntent.selectLocationFromMap(
      {required String key,
      String? uid,
      required String featureType,
      String? coordinates}) = SelectLocationFromMap;

  const factory FormInputFieldIntent.saveCurrentLocation({
    required String key,
    String? uid,
    String? value,
    required String featureType,
  }) = SaveCurrentLocation;

  // const factory FormInputFieldIntent.onSection(String sectionUid) = OnSection;

  // const factory FormInputFieldIntent.onRequestCoordinates(String uid) =
  //     OnRequestCoordinates;
  //
  // const factory FormInputFieldIntent.onCancelRequestCoordinates({required String uid}) =
  //     OnCancelRequestCoordinates;

  const FormInputFieldIntent._();
}
