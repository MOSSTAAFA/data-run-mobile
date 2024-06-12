// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'true_only_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TrueOnlyFailure {
  String get message => throw _privateConstructorUsedError;
  CaughtException? get cause => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, CaughtException? cause)
        oneIsNotTrueException,
    required TResult Function(String message, CaughtException? cause)
        falseIsNotAValidValueException,
    required TResult Function(String message, CaughtException? cause)
        booleanMalformedException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, CaughtException? cause)?
        oneIsNotTrueException,
    TResult? Function(String message, CaughtException? cause)?
        falseIsNotAValidValueException,
    TResult? Function(String message, CaughtException? cause)?
        booleanMalformedException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, CaughtException? cause)?
        oneIsNotTrueException,
    TResult Function(String message, CaughtException? cause)?
        falseIsNotAValidValueException,
    TResult Function(String message, CaughtException? cause)?
        booleanMalformedException,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OneIsNotTrueException value)
        oneIsNotTrueException,
    required TResult Function(FalseIsNotAValidValueException value)
        falseIsNotAValidValueException,
    required TResult Function(BooleanMalformedException value)
        booleanMalformedException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OneIsNotTrueException value)? oneIsNotTrueException,
    TResult? Function(FalseIsNotAValidValueException value)?
        falseIsNotAValidValueException,
    TResult? Function(BooleanMalformedException value)?
        booleanMalformedException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OneIsNotTrueException value)? oneIsNotTrueException,
    TResult Function(FalseIsNotAValidValueException value)?
        falseIsNotAValidValueException,
    TResult Function(BooleanMalformedException value)?
        booleanMalformedException,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TrueOnlyFailureCopyWith<TrueOnlyFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrueOnlyFailureCopyWith<$Res> {
  factory $TrueOnlyFailureCopyWith(
          TrueOnlyFailure value, $Res Function(TrueOnlyFailure) then) =
      _$TrueOnlyFailureCopyWithImpl<$Res, TrueOnlyFailure>;
  @useResult
  $Res call({String message, CaughtException? cause});
}

/// @nodoc
class _$TrueOnlyFailureCopyWithImpl<$Res, $Val extends TrueOnlyFailure>
    implements $TrueOnlyFailureCopyWith<$Res> {
  _$TrueOnlyFailureCopyWithImpl(this._value, this._then);

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
abstract class _$$OneIsNotTrueExceptionImplCopyWith<$Res>
    implements $TrueOnlyFailureCopyWith<$Res> {
  factory _$$OneIsNotTrueExceptionImplCopyWith(
          _$OneIsNotTrueExceptionImpl value,
          $Res Function(_$OneIsNotTrueExceptionImpl) then) =
      __$$OneIsNotTrueExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, CaughtException? cause});
}

/// @nodoc
class __$$OneIsNotTrueExceptionImplCopyWithImpl<$Res>
    extends _$TrueOnlyFailureCopyWithImpl<$Res, _$OneIsNotTrueExceptionImpl>
    implements _$$OneIsNotTrueExceptionImplCopyWith<$Res> {
  __$$OneIsNotTrueExceptionImplCopyWithImpl(_$OneIsNotTrueExceptionImpl _value,
      $Res Function(_$OneIsNotTrueExceptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? cause = freezed,
  }) {
    return _then(_$OneIsNotTrueExceptionImpl(
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

class _$OneIsNotTrueExceptionImpl implements OneIsNotTrueException {
  const _$OneIsNotTrueExceptionImpl([this.message = 'Exception', this.cause]);

  @override
  @JsonKey()
  final String message;
  @override
  final CaughtException? cause;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OneIsNotTrueExceptionImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.cause, cause) || other.cause == cause));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, cause);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OneIsNotTrueExceptionImplCopyWith<_$OneIsNotTrueExceptionImpl>
      get copyWith => __$$OneIsNotTrueExceptionImplCopyWithImpl<
          _$OneIsNotTrueExceptionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, CaughtException? cause)
        oneIsNotTrueException,
    required TResult Function(String message, CaughtException? cause)
        falseIsNotAValidValueException,
    required TResult Function(String message, CaughtException? cause)
        booleanMalformedException,
  }) {
    return oneIsNotTrueException(message, cause);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, CaughtException? cause)?
        oneIsNotTrueException,
    TResult? Function(String message, CaughtException? cause)?
        falseIsNotAValidValueException,
    TResult? Function(String message, CaughtException? cause)?
        booleanMalformedException,
  }) {
    return oneIsNotTrueException?.call(message, cause);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, CaughtException? cause)?
        oneIsNotTrueException,
    TResult Function(String message, CaughtException? cause)?
        falseIsNotAValidValueException,
    TResult Function(String message, CaughtException? cause)?
        booleanMalformedException,
    required TResult orElse(),
  }) {
    if (oneIsNotTrueException != null) {
      return oneIsNotTrueException(message, cause);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OneIsNotTrueException value)
        oneIsNotTrueException,
    required TResult Function(FalseIsNotAValidValueException value)
        falseIsNotAValidValueException,
    required TResult Function(BooleanMalformedException value)
        booleanMalformedException,
  }) {
    return oneIsNotTrueException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OneIsNotTrueException value)? oneIsNotTrueException,
    TResult? Function(FalseIsNotAValidValueException value)?
        falseIsNotAValidValueException,
    TResult? Function(BooleanMalformedException value)?
        booleanMalformedException,
  }) {
    return oneIsNotTrueException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OneIsNotTrueException value)? oneIsNotTrueException,
    TResult Function(FalseIsNotAValidValueException value)?
        falseIsNotAValidValueException,
    TResult Function(BooleanMalformedException value)?
        booleanMalformedException,
    required TResult orElse(),
  }) {
    if (oneIsNotTrueException != null) {
      return oneIsNotTrueException(this);
    }
    return orElse();
  }
}

abstract class OneIsNotTrueException
    implements TrueOnlyFailure, ThrowableException {
  const factory OneIsNotTrueException(
      [final String message,
      final CaughtException? cause]) = _$OneIsNotTrueExceptionImpl;

  @override
  String get message;
  @override
  CaughtException? get cause;
  @override
  @JsonKey(ignore: true)
  _$$OneIsNotTrueExceptionImplCopyWith<_$OneIsNotTrueExceptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FalseIsNotAValidValueExceptionImplCopyWith<$Res>
    implements $TrueOnlyFailureCopyWith<$Res> {
  factory _$$FalseIsNotAValidValueExceptionImplCopyWith(
          _$FalseIsNotAValidValueExceptionImpl value,
          $Res Function(_$FalseIsNotAValidValueExceptionImpl) then) =
      __$$FalseIsNotAValidValueExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, CaughtException? cause});
}

/// @nodoc
class __$$FalseIsNotAValidValueExceptionImplCopyWithImpl<$Res>
    extends _$TrueOnlyFailureCopyWithImpl<$Res,
        _$FalseIsNotAValidValueExceptionImpl>
    implements _$$FalseIsNotAValidValueExceptionImplCopyWith<$Res> {
  __$$FalseIsNotAValidValueExceptionImplCopyWithImpl(
      _$FalseIsNotAValidValueExceptionImpl _value,
      $Res Function(_$FalseIsNotAValidValueExceptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? cause = freezed,
  }) {
    return _then(_$FalseIsNotAValidValueExceptionImpl(
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

class _$FalseIsNotAValidValueExceptionImpl
    implements FalseIsNotAValidValueException {
  const _$FalseIsNotAValidValueExceptionImpl(
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
            other is _$FalseIsNotAValidValueExceptionImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.cause, cause) || other.cause == cause));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, cause);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FalseIsNotAValidValueExceptionImplCopyWith<
          _$FalseIsNotAValidValueExceptionImpl>
      get copyWith => __$$FalseIsNotAValidValueExceptionImplCopyWithImpl<
          _$FalseIsNotAValidValueExceptionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, CaughtException? cause)
        oneIsNotTrueException,
    required TResult Function(String message, CaughtException? cause)
        falseIsNotAValidValueException,
    required TResult Function(String message, CaughtException? cause)
        booleanMalformedException,
  }) {
    return falseIsNotAValidValueException(message, cause);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, CaughtException? cause)?
        oneIsNotTrueException,
    TResult? Function(String message, CaughtException? cause)?
        falseIsNotAValidValueException,
    TResult? Function(String message, CaughtException? cause)?
        booleanMalformedException,
  }) {
    return falseIsNotAValidValueException?.call(message, cause);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, CaughtException? cause)?
        oneIsNotTrueException,
    TResult Function(String message, CaughtException? cause)?
        falseIsNotAValidValueException,
    TResult Function(String message, CaughtException? cause)?
        booleanMalformedException,
    required TResult orElse(),
  }) {
    if (falseIsNotAValidValueException != null) {
      return falseIsNotAValidValueException(message, cause);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OneIsNotTrueException value)
        oneIsNotTrueException,
    required TResult Function(FalseIsNotAValidValueException value)
        falseIsNotAValidValueException,
    required TResult Function(BooleanMalformedException value)
        booleanMalformedException,
  }) {
    return falseIsNotAValidValueException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OneIsNotTrueException value)? oneIsNotTrueException,
    TResult? Function(FalseIsNotAValidValueException value)?
        falseIsNotAValidValueException,
    TResult? Function(BooleanMalformedException value)?
        booleanMalformedException,
  }) {
    return falseIsNotAValidValueException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OneIsNotTrueException value)? oneIsNotTrueException,
    TResult Function(FalseIsNotAValidValueException value)?
        falseIsNotAValidValueException,
    TResult Function(BooleanMalformedException value)?
        booleanMalformedException,
    required TResult orElse(),
  }) {
    if (falseIsNotAValidValueException != null) {
      return falseIsNotAValidValueException(this);
    }
    return orElse();
  }
}

abstract class FalseIsNotAValidValueException
    implements TrueOnlyFailure, ThrowableException {
  const factory FalseIsNotAValidValueException(
      [final String message,
      final CaughtException? cause]) = _$FalseIsNotAValidValueExceptionImpl;

  @override
  String get message;
  @override
  CaughtException? get cause;
  @override
  @JsonKey(ignore: true)
  _$$FalseIsNotAValidValueExceptionImplCopyWith<
          _$FalseIsNotAValidValueExceptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BooleanMalformedExceptionImplCopyWith<$Res>
    implements $TrueOnlyFailureCopyWith<$Res> {
  factory _$$BooleanMalformedExceptionImplCopyWith(
          _$BooleanMalformedExceptionImpl value,
          $Res Function(_$BooleanMalformedExceptionImpl) then) =
      __$$BooleanMalformedExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, CaughtException? cause});
}

/// @nodoc
class __$$BooleanMalformedExceptionImplCopyWithImpl<$Res>
    extends _$TrueOnlyFailureCopyWithImpl<$Res, _$BooleanMalformedExceptionImpl>
    implements _$$BooleanMalformedExceptionImplCopyWith<$Res> {
  __$$BooleanMalformedExceptionImplCopyWithImpl(
      _$BooleanMalformedExceptionImpl _value,
      $Res Function(_$BooleanMalformedExceptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? cause = freezed,
  }) {
    return _then(_$BooleanMalformedExceptionImpl(
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

class _$BooleanMalformedExceptionImpl implements BooleanMalformedException {
  const _$BooleanMalformedExceptionImpl(
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
            other is _$BooleanMalformedExceptionImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.cause, cause) || other.cause == cause));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, cause);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BooleanMalformedExceptionImplCopyWith<_$BooleanMalformedExceptionImpl>
      get copyWith => __$$BooleanMalformedExceptionImplCopyWithImpl<
          _$BooleanMalformedExceptionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, CaughtException? cause)
        oneIsNotTrueException,
    required TResult Function(String message, CaughtException? cause)
        falseIsNotAValidValueException,
    required TResult Function(String message, CaughtException? cause)
        booleanMalformedException,
  }) {
    return booleanMalformedException(message, cause);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, CaughtException? cause)?
        oneIsNotTrueException,
    TResult? Function(String message, CaughtException? cause)?
        falseIsNotAValidValueException,
    TResult? Function(String message, CaughtException? cause)?
        booleanMalformedException,
  }) {
    return booleanMalformedException?.call(message, cause);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, CaughtException? cause)?
        oneIsNotTrueException,
    TResult Function(String message, CaughtException? cause)?
        falseIsNotAValidValueException,
    TResult Function(String message, CaughtException? cause)?
        booleanMalformedException,
    required TResult orElse(),
  }) {
    if (booleanMalformedException != null) {
      return booleanMalformedException(message, cause);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OneIsNotTrueException value)
        oneIsNotTrueException,
    required TResult Function(FalseIsNotAValidValueException value)
        falseIsNotAValidValueException,
    required TResult Function(BooleanMalformedException value)
        booleanMalformedException,
  }) {
    return booleanMalformedException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OneIsNotTrueException value)? oneIsNotTrueException,
    TResult? Function(FalseIsNotAValidValueException value)?
        falseIsNotAValidValueException,
    TResult? Function(BooleanMalformedException value)?
        booleanMalformedException,
  }) {
    return booleanMalformedException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OneIsNotTrueException value)? oneIsNotTrueException,
    TResult Function(FalseIsNotAValidValueException value)?
        falseIsNotAValidValueException,
    TResult Function(BooleanMalformedException value)?
        booleanMalformedException,
    required TResult orElse(),
  }) {
    if (booleanMalformedException != null) {
      return booleanMalformedException(this);
    }
    return orElse();
  }
}

abstract class BooleanMalformedException
    implements TrueOnlyFailure, ThrowableException {
  const factory BooleanMalformedException(
      [final String message,
      final CaughtException? cause]) = _$BooleanMalformedExceptionImpl;

  @override
  String get message;
  @override
  CaughtException? get cause;
  @override
  @JsonKey(ignore: true)
  _$$BooleanMalformedExceptionImplCopyWith<_$BooleanMalformedExceptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
