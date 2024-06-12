// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coordinate_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CoordinateFailure {
  String get message => throw _privateConstructorUsedError;
  CaughtException? get cause => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, CaughtException? cause)
        coordinateMalformedException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, CaughtException? cause)?
        coordinateMalformedException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, CaughtException? cause)?
        coordinateMalformedException,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CoordinateMalformedException value)
        coordinateMalformedException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CoordinateMalformedException value)?
        coordinateMalformedException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CoordinateMalformedException value)?
        coordinateMalformedException,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CoordinateFailureCopyWith<CoordinateFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoordinateFailureCopyWith<$Res> {
  factory $CoordinateFailureCopyWith(
          CoordinateFailure value, $Res Function(CoordinateFailure) then) =
      _$CoordinateFailureCopyWithImpl<$Res, CoordinateFailure>;
  @useResult
  $Res call({String message, CaughtException? cause});
}

/// @nodoc
class _$CoordinateFailureCopyWithImpl<$Res, $Val extends CoordinateFailure>
    implements $CoordinateFailureCopyWith<$Res> {
  _$CoordinateFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? cause = freezed,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      cause: freezed == cause
          ? _value.cause
          : cause // ignore: cast_nullable_to_non_nullable
              as CaughtException?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoordinateMalformedExceptionImplCopyWith<$Res>
    implements $CoordinateFailureCopyWith<$Res> {
  factory _$$CoordinateMalformedExceptionImplCopyWith(
          _$CoordinateMalformedExceptionImpl value,
          $Res Function(_$CoordinateMalformedExceptionImpl) then) =
      __$$CoordinateMalformedExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, CaughtException? cause});
}

/// @nodoc
class __$$CoordinateMalformedExceptionImplCopyWithImpl<$Res>
    extends _$CoordinateFailureCopyWithImpl<$Res,
        _$CoordinateMalformedExceptionImpl>
    implements _$$CoordinateMalformedExceptionImplCopyWith<$Res> {
  __$$CoordinateMalformedExceptionImplCopyWithImpl(
      _$CoordinateMalformedExceptionImpl _value,
      $Res Function(_$CoordinateMalformedExceptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? cause = freezed,
  }) {
    return _then(_$CoordinateMalformedExceptionImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == cause
          ? _value.cause
          : cause // ignore: cast_nullable_to_non_nullable
              as CaughtException?,
    ));
  }
}

/// @nodoc

class _$CoordinateMalformedExceptionImpl
    implements CoordinateMalformedException {
  const _$CoordinateMalformedExceptionImpl(
      [this.message = 'Exception', this.cause]);

  @override
  @JsonKey()
  final String message;
  @override
  final CaughtException? cause;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoordinateMalformedExceptionImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.cause, cause) || other.cause == cause));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, cause);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CoordinateMalformedExceptionImplCopyWith<
          _$CoordinateMalformedExceptionImpl>
      get copyWith => __$$CoordinateMalformedExceptionImplCopyWithImpl<
          _$CoordinateMalformedExceptionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, CaughtException? cause)
        coordinateMalformedException,
  }) {
    return coordinateMalformedException(message, cause);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, CaughtException? cause)?
        coordinateMalformedException,
  }) {
    return coordinateMalformedException?.call(message, cause);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, CaughtException? cause)?
        coordinateMalformedException,
    required TResult orElse(),
  }) {
    if (coordinateMalformedException != null) {
      return coordinateMalformedException(message, cause);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CoordinateMalformedException value)
        coordinateMalformedException,
  }) {
    return coordinateMalformedException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CoordinateMalformedException value)?
        coordinateMalformedException,
  }) {
    return coordinateMalformedException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CoordinateMalformedException value)?
        coordinateMalformedException,
    required TResult orElse(),
  }) {
    if (coordinateMalformedException != null) {
      return coordinateMalformedException(this);
    }
    return orElse();
  }
}

abstract class CoordinateMalformedException
    implements CoordinateFailure, ThrowableException {
  const factory CoordinateMalformedException(
      [final String message,
      final CaughtException? cause]) = _$CoordinateMalformedExceptionImpl;

  @override
  String get message;
  @override
  CaughtException? get cause;
  @override
  @JsonKey(ignore: true)
  _$$CoordinateMalformedExceptionImplCopyWith<
          _$CoordinateMalformedExceptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
