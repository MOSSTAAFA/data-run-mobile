import 'package:freezed_annotation/freezed_annotation.dart';

import '../../exception/exception.dart';

part 'coordinate_failure.freezed.dart';

@freezed
class CoordinateFailure with _$CoordinateFailure implements ThrowableException {
  @Implements<ThrowableException>()
  const factory CoordinateFailure.coordinateMalformedException(
      [@Default('Exception') String message,
      CaughtException? cause]) = CoordinateMalformedException;
}
