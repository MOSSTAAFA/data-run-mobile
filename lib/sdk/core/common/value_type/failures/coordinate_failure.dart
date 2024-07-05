import 'package:freezed_annotation/freezed_annotation.dart';

import '../../exception/validation_exception.dart';

part 'coordinate_failure.freezed.dart';

@freezed
class CoordinateFailure with _$CoordinateFailure implements ValidationException {
  @Implements<ValidationException>()
  const factory CoordinateFailure.coordinateMalformedException(
      [@Default('ValidationException') String message]) = CoordinateMalformedException;
}
