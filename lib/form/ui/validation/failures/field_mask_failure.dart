import 'package:freezed_annotation/freezed_annotation.dart';

part 'field_mask_failure.freezed.dart';

@freezed
class FieldMaskFailure with _$FieldMaskFailure implements Exception {
  @Implements<Exception>()
  const factory FieldMaskFailure.wrongPatternException([dynamic message]) =
      WrongPatternException;

  const factory FieldMaskFailure.invalidPatternException([dynamic message]) =
      InvalidPatternException;

  const FieldMaskFailure._();
}
