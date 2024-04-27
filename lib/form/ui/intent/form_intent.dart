import 'package:d2_remote/core/common/value_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_intent.freezed.dart';

@freezed
class FormIntent with _$FormIntent {
  // NMC
  const factory FormIntent.init() = Init;

  const factory FormIntent.onFinish([String? extraData]) = OnFinish;

  const factory FormIntent.onClear([String? extraData]) = OnClear;

  const factory FormIntent.onFocus(String uid, String? value) = OnFocus;

  const factory FormIntent.onNext(
      {required String uid, String? value, int? position}) = OnNext;

  const factory FormIntent.onSave(
      {required String uid,
      String? value,
      ValueType? valueType,
      String? fieldMask}) = OnSave;

  const factory FormIntent.onTextChange(String uid, String? value) =
      OnTextChange;

  const factory FormIntent.clearValue(String uid) = ClearValue;

  const factory FormIntent.selectLocationFromCoordinates({
    required String uid,
    String? coordinates,
    required String extraData,
  }) = SelectLocationFromCoordinates;

  const factory FormIntent.selectLocationFromMap(
      {required String uid,
      required String featureType,
      String? coordinates}) = SelectLocationFromMap;

  const factory FormIntent.saveCurrentLocation({
    required String uid,
    String? value,
    required String featureType,
  }) = SaveCurrentLocation;

  const factory FormIntent.onSection(String sectionUid) = OnSection;

  const factory FormIntent.onRequestCoordinates(String uid) =
      OnRequestCoordinates;

  const factory FormIntent.onCancelRequestCoordinates({required String uid}) =
      OnCancelRequestCoordinates;

  const FormIntent._();
}
