// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unit_interval_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UnitIntervalFailure {
  String get message => throw _privateConstructorUsedError;
  CaughtException? get cause => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, CaughtException? cause)
        scientificNotationException,
    required TResult Function(String message, CaughtException? cause)
        numberFormatException,
    required TResult Function(String message, CaughtException? cause)
        greaterThanOneException,
    required TResult Function(String message, CaughtException? cause)
        smallerThanZeroException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, CaughtException? cause)?
        scientificNotationException,
    TResult? Function(String message, CaughtException? cause)?
        numberFormatException,
    TResult? Function(String message, CaughtException? cause)?
        greaterThanOneException,
    TResult? Function(String message, CaughtException? cause)?
        smallerThanZeroException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, CaughtException? cause)?
        scientificNotationException,
    TResult Function(String message, CaughtException? cause)?
        numberFormatException,
    TResult Function(String message, CaughtException? cause)?
        greaterThanOneException,
    TResult Function(String message, CaughtException? cause)?
        smallerThanZeroException,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScientificNotationException value)
        scientificNotationException,
    required TResult Function(NumberFormatException value)
        numberFormatException,
    required TResult Function(GreaterThanOneException value)
        greaterThanOneException,
    required TResult Function(SmallerThanZeroException value)
        smallerThanZeroException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScientificNotationException value)?
        scientificNotationException,
    TResult? Function(NumberFormatException value)? numberFormatException,
    TResult? Function(GreaterThanOneException value)? greaterThanOneException,
    TResult? Function(SmallerThanZeroException value)? smallerThanZeroException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScientificNotationException value)?
        scientificNotationException,
    TResult Function(NumberFormatException value)? numberFormatException,
    TResult Function(GreaterThanOneException value)? greaterThanOneException,
    TResult Function(SmallerThanZeroException value)? smallerThanZeroException,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UnitIntervalFailureCopyWith<UnitIntervalFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnitIntervalFailureCopyWith<$Res> {
  factory $UnitIntervalFailureCopyWith(
          UnitIntervalFailure value, $Res Function(UnitIntervalFailure) then) =
      _$UnitIntervalFailureCopyWithImpl<$Res, UnitIntervalFailure>;
  @useResult
  $Res call({String message, CaughtException? cause});
}

/// @nodoc
class _$UnitIntervalFailureCopyWithImpl<$Res, $Val extends UnitIntervalFailure>
    implements $UnitIntervalFailureCopyWith<$Res> {
  _$UnitIntervalFailureCopyWithImpl(this._value, this._then);

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
abstract class _$$ScientificNotationExceptionImplCopyWith<$Res>
    implements $UnitIntervalFailureCopyWith<$Res> {
  factory _$$ScientificNotationExceptionImplCopyWith(
          _$ScientificNotationExceptionImpl value,
          $Res Function(_$ScientificNotationExceptionImpl) then) =
      __$$ScientificNotationExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, CaughtException? cause});
}

/// @nodoc
class __$$ScientificNotationExceptionImplCopyWithImpl<$Res>
    extends _$UnitIntervalFailureCopyWithImpl<$Res,
        _$ScientificNotationExceptionImpl>
    implements _$$ScientificNotationExceptionImplCopyWith<$Res> {
  __$$ScientificNotationExceptionImplCopyWithImpl(
      _$ScientificNotationExceptionImpl _value,
      $Res Function(_$ScientificNotationExceptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? cause = freezed,
  }) {
    return _then(_$ScientificNotationExceptionImpl(
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

class _$ScientificNotationExceptionImpl implements ScientificNotationException {
  const _$ScientificNotationExceptionImpl(
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
            other is _$ScientificNotationExceptionImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.cause, cause) || other.cause == cause));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, cause);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScientificNotationExceptionImplCopyWith<_$ScientificNotationExceptionImpl>
      get copyWith => __$$ScientificNotationExceptionImplCopyWithImpl<
          _$ScientificNotationExceptionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, CaughtException? cause)
        scientificNotationException,
    required TResult Function(String message, CaughtException? cause)
        numberFormatException,
    required TResult Function(String message, CaughtException? cause)
        greaterThanOneException,
    required TResult Function(String message, CaughtException? cause)
        smallerThanZeroException,
  }) {
    return scientificNotationException(message, cause);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, CaughtException? cause)?
        scientificNotationException,
    TResult? Function(String message, CaughtException? cause)?
        numberFormatException,
    TResult? Function(String message, CaughtException? cause)?
        greaterThanOneException,
    TResult? Function(String message, CaughtException? cause)?
        smallerThanZeroException,
  }) {
    return scientificNotationException?.call(message, cause);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, CaughtException? cause)?
        scientificNotationException,
    TResult Function(String message, CaughtException? cause)?
        numberFormatException,
    TResult Function(String message, CaughtException? cause)?
        greaterThanOneException,
    TResult Function(String message, CaughtException? cause)?
        smallerThanZeroException,
    required TResult orElse(),
  }) {
    if (scientificNotationException != null) {
      return scientificNotationException(message, cause);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScientificNotationException value)
        scientificNotationException,
    required TResult Function(NumberFormatException value)
        numberFormatException,
    required TResult Function(GreaterThanOneException value)
        greaterThanOneException,
    required TResult Function(SmallerThanZeroException value)
        smallerThanZeroException,
  }) {
    return scientificNotationException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScientificNotationException value)?
        scientificNotationException,
    TResult? Function(NumberFormatException value)? numberFormatException,
    TResult? Function(GreaterThanOneException value)? greaterThanOneException,
    TResult? Function(SmallerThanZeroException value)? smallerThanZeroException,
  }) {
    return scientificNotationException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScientificNotationException value)?
        scientificNotationException,
    TResult Function(NumberFormatException value)? numberFormatException,
    TResult Function(GreaterThanOneException value)? greaterThanOneException,
    TResult Function(SmallerThanZeroException value)? smallerThanZeroException,
    required TResult orElse(),
  }) {
    if (scientificNotationException != null) {
      return scientificNotationException(this);
    }
    return orElse();
  }
}

abstract class ScientificNotationException
    implements UnitIntervalFailure, ThrowableException {
  const factory ScientificNotationException(
      [final String message,
      final CaughtException? cause]) = _$ScientificNotationExceptionImpl;

  @override
  String get message;
  @override
  CaughtException? get cause;
  @override
  @JsonKey(ignore: true)
  _$$ScientificNotationExceptionImplCopyWith<_$ScientificNotationExceptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NumberFormatExceptionImplCopyWith<$Res>
    implements $UnitIntervalFailureCopyWith<$Res> {
  factory _$$NumberFormatExceptionImplCopyWith(
          _$NumberFormatExceptionImpl value,
          $Res Function(_$NumberFormatExceptionImpl) then) =
      __$$NumberFormatExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, CaughtException? cause});
}

/// @nodoc
class __$$NumberFormatExceptionImplCopyWithImpl<$Res>
    extends _$UnitIntervalFailureCopyWithImpl<$Res, _$NumberFormatExceptionImpl>
    implements _$$NumberFormatExceptionImplCopyWith<$Res> {
  __$$NumberFormatExceptionImplCopyWithImpl(_$NumberFormatExceptionImpl _value,
      $Res Function(_$NumberFormatExceptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? cause = freezed,
  }) {
    return _then(_$NumberFormatExceptionImpl(
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

class _$NumberFormatExceptionImpl implements NumberFormatException {
  const _$NumberFormatExceptionImpl([this.message = 'Exception', this.cause]);

  @override
  @JsonKey()
  final String message;
  @override
  final CaughtException? cause;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NumberFormatExceptionImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.cause, cause) || other.cause == cause));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, cause);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NumberFormatExceptionImplCopyWith<_$NumberFormatExceptionImpl>
      get copyWith => __$$NumberFormatExceptionImplCopyWithImpl<
          _$NumberFormatExceptionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, CaughtException? cause)
        scientificNotationException,
    required TResult Function(String message, CaughtException? cause)
        numberFormatException,
    required TResult Function(String message, CaughtException? cause)
        greaterThanOneException,
    required TResult Function(String message, CaughtException? cause)
        smallerThanZeroException,
  }) {
    return numberFormatException(message, cause);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, CaughtException? cause)?
        scientificNotationException,
    TResult? Function(String message, CaughtException? cause)?
        numberFormatException,
    TResult? Function(String message, CaughtException? cause)?
        greaterThanOneException,
    TResult? Function(String message, CaughtException? cause)?
        smallerThanZeroException,
  }) {
    return numberFormatException?.call(message, cause);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, CaughtException? cause)?
        scientificNotationException,
    TResult Function(String message, CaughtException? cause)?
        numberFormatException,
    TResult Function(String message, CaughtException? cause)?
        greaterThanOneException,
    TResult Function(String message, CaughtException? cause)?
        smallerThanZeroException,
    required TResult orElse(),
  }) {
    if (numberFormatException != null) {
      return numberFormatException(message, cause);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScientificNotationException value)
        scientificNotationException,
    required TResult Function(NumberFormatException value)
        numberFormatException,
    required TResult Function(GreaterThanOneException value)
        greaterThanOneException,
    required TResult Function(SmallerThanZeroException value)
        smallerThanZeroException,
  }) {
    return numberFormatException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScientificNotationException value)?
        scientificNotationException,
    TResult? Function(NumberFormatException value)? numberFormatException,
    TResult? Function(GreaterThanOneException value)? greaterThanOneException,
    TResult? Function(SmallerThanZeroException value)? smallerThanZeroException,
  }) {
    return numberFormatException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScientificNotationException value)?
        scientificNotationException,
    TResult Function(NumberFormatException value)? numberFormatException,
    TResult Function(GreaterThanOneException value)? greaterThanOneException,
    TResult Function(SmallerThanZeroException value)? smallerThanZeroException,
    required TResult orElse(),
  }) {
    if (numberFormatException != null) {
      return numberFormatException(this);
    }
    return orElse();
  }
}

abstract class NumberFormatException
    implements UnitIntervalFailure, ThrowableException {
  const factory NumberFormatException(
      [final String message,
      final CaughtException? cause]) = _$NumberFormatExceptionImpl;

  @override
  String get message;
  @override
  CaughtException? get cause;
  @override
  @JsonKey(ignore: true)
  _$$NumberFormatExceptionImplCopyWith<_$NumberFormatExceptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GreaterThanOneExceptionImplCopyWith<$Res>
    implements $UnitIntervalFailureCopyWith<$Res> {
  factory _$$GreaterThanOneExceptionImplCopyWith(
          _$GreaterThanOneExceptionImpl value,
          $Res Function(_$GreaterThanOneExceptionImpl) then) =
      __$$GreaterThanOneExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, CaughtException? cause});
}

/// @nodoc
class __$$GreaterThanOneExceptionImplCopyWithImpl<$Res>
    extends _$UnitIntervalFailureCopyWithImpl<$Res,
        _$GreaterThanOneExceptionImpl>
    implements _$$GreaterThanOneExceptionImplCopyWith<$Res> {
  __$$GreaterThanOneExceptionImplCopyWithImpl(
      _$GreaterThanOneExceptionImpl _value,
      $Res Function(_$GreaterThanOneExceptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? cause = freezed,
  }) {
    return _then(_$GreaterThanOneExceptionImpl(
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

class _$GreaterThanOneExceptionImpl implements GreaterThanOneException {
  const _$GreaterThanOneExceptionImpl([this.message = 'Exception', this.cause]);

  @override
  @JsonKey()
  final String message;
  @override
  final CaughtException? cause;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GreaterThanOneExceptionImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.cause, cause) || other.cause == cause));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, cause);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GreaterThanOneExceptionImplCopyWith<_$GreaterThanOneExceptionImpl>
      get copyWith => __$$GreaterThanOneExceptionImplCopyWithImpl<
          _$GreaterThanOneExceptionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, CaughtException? cause)
        scientificNotationException,
    required TResult Function(String message, CaughtException? cause)
        numberFormatException,
    required TResult Function(String message, CaughtException? cause)
        greaterThanOneException,
    required TResult Function(String message, CaughtException? cause)
        smallerThanZeroException,
  }) {
    return greaterThanOneException(message, cause);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, CaughtException? cause)?
        scientificNotationException,
    TResult? Function(String message, CaughtException? cause)?
        numberFormatException,
    TResult? Function(String message, CaughtException? cause)?
        greaterThanOneException,
    TResult? Function(String message, CaughtException? cause)?
        smallerThanZeroException,
  }) {
    return greaterThanOneException?.call(message, cause);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, CaughtException? cause)?
        scientificNotationException,
    TResult Function(String message, CaughtException? cause)?
        numberFormatException,
    TResult Function(String message, CaughtException? cause)?
        greaterThanOneException,
    TResult Function(String message, CaughtException? cause)?
        smallerThanZeroException,
    required TResult orElse(),
  }) {
    if (greaterThanOneException != null) {
      return greaterThanOneException(message, cause);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScientificNotationException value)
        scientificNotationException,
    required TResult Function(NumberFormatException value)
        numberFormatException,
    required TResult Function(GreaterThanOneException value)
        greaterThanOneException,
    required TResult Function(SmallerThanZeroException value)
        smallerThanZeroException,
  }) {
    return greaterThanOneException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScientificNotationException value)?
        scientificNotationException,
    TResult? Function(NumberFormatException value)? numberFormatException,
    TResult? Function(GreaterThanOneException value)? greaterThanOneException,
    TResult? Function(SmallerThanZeroException value)? smallerThanZeroException,
  }) {
    return greaterThanOneException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScientificNotationException value)?
        scientificNotationException,
    TResult Function(NumberFormatException value)? numberFormatException,
    TResult Function(GreaterThanOneException value)? greaterThanOneException,
    TResult Function(SmallerThanZeroException value)? smallerThanZeroException,
    required TResult orElse(),
  }) {
    if (greaterThanOneException != null) {
      return greaterThanOneException(this);
    }
    return orElse();
  }
}

abstract class GreaterThanOneException
    implements UnitIntervalFailure, ThrowableException {
  const factory GreaterThanOneException(
      [final String message,
      final CaughtException? cause]) = _$GreaterThanOneExceptionImpl;

  @override
  String get message;
  @override
  CaughtException? get cause;
  @override
  @JsonKey(ignore: true)
  _$$GreaterThanOneExceptionImplCopyWith<_$GreaterThanOneExceptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SmallerThanZeroExceptionImplCopyWith<$Res>
    implements $UnitIntervalFailureCopyWith<$Res> {
  factory _$$SmallerThanZeroExceptionImplCopyWith(
          _$SmallerThanZeroExceptionImpl value,
          $Res Function(_$SmallerThanZeroExceptionImpl) then) =
      __$$SmallerThanZeroExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, CaughtException? cause});
}

/// @nodoc
class __$$SmallerThanZeroExceptionImplCopyWithImpl<$Res>
    extends _$UnitIntervalFailureCopyWithImpl<$Res,
        _$SmallerThanZeroExceptionImpl>
    implements _$$SmallerThanZeroExceptionImplCopyWith<$Res> {
  __$$SmallerThanZeroExceptionImplCopyWithImpl(
      _$SmallerThanZeroExceptionImpl _value,
      $Res Function(_$SmallerThanZeroExceptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? cause = freezed,
  }) {
    return _then(_$SmallerThanZeroExceptionImpl(
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

class _$SmallerThanZeroExceptionImpl implements SmallerThanZeroException {
  const _$SmallerThanZeroExceptionImpl(
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
            other is _$SmallerThanZeroExceptionImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.cause, cause) || other.cause == cause));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, cause);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SmallerThanZeroExceptionImplCopyWith<_$SmallerThanZeroExceptionImpl>
      get copyWith => __$$SmallerThanZeroExceptionImplCopyWithImpl<
          _$SmallerThanZeroExceptionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, CaughtException? cause)
        scientificNotationException,
    required TResult Function(String message, CaughtException? cause)
        numberFormatException,
    required TResult Function(String message, CaughtException? cause)
        greaterThanOneException,
    required TResult Function(String message, CaughtException? cause)
        smallerThanZeroException,
  }) {
    return smallerThanZeroException(message, cause);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, CaughtException? cause)?
        scientificNotationException,
    TResult? Function(String message, CaughtException? cause)?
        numberFormatException,
    TResult? Function(String message, CaughtException? cause)?
        greaterThanOneException,
    TResult? Function(String message, CaughtException? cause)?
        smallerThanZeroException,
  }) {
    return smallerThanZeroException?.call(message, cause);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, CaughtException? cause)?
        scientificNotationException,
    TResult Function(String message, CaughtException? cause)?
        numberFormatException,
    TResult Function(String message, CaughtException? cause)?
        greaterThanOneException,
    TResult Function(String message, CaughtException? cause)?
        smallerThanZeroException,
    required TResult orElse(),
  }) {
    if (smallerThanZeroException != null) {
      return smallerThanZeroException(message, cause);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScientificNotationException value)
        scientificNotationException,
    required TResult Function(NumberFormatException value)
        numberFormatException,
    required TResult Function(GreaterThanOneException value)
        greaterThanOneException,
    required TResult Function(SmallerThanZeroException value)
        smallerThanZeroException,
  }) {
    return smallerThanZeroException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScientificNotationException value)?
        scientificNotationException,
    TResult? Function(NumberFormatException value)? numberFormatException,
    TResult? Function(GreaterThanOneException value)? greaterThanOneException,
    TResult? Function(SmallerThanZeroException value)? smallerThanZeroException,
  }) {
    return smallerThanZeroException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScientificNotationException value)?
        scientificNotationException,
    TResult Function(NumberFormatException value)? numberFormatException,
    TResult Function(GreaterThanOneException value)? greaterThanOneException,
    TResult Function(SmallerThanZeroException value)? smallerThanZeroException,
    required TResult orElse(),
  }) {
    if (smallerThanZeroException != null) {
      return smallerThanZeroException(this);
    }
    return orElse();
  }
}

abstract class SmallerThanZeroException
    implements UnitIntervalFailure, ThrowableException {
  const factory SmallerThanZeroException(
      [final String message,
      final CaughtException? cause]) = _$SmallerThanZeroExceptionImpl;

  @override
  String get message;
  @override
  CaughtException? get cause;
  @override
  @JsonKey(ignore: true)
  _$$SmallerThanZeroExceptionImplCopyWith<_$SmallerThanZeroExceptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
