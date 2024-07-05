// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'percentage_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PercentageFailure {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) numberFormatException,
    required TResult Function(String message) valueGreaterThan100,
    required TResult Function(String message) valueIsNegative,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? numberFormatException,
    TResult? Function(String message)? valueGreaterThan100,
    TResult? Function(String message)? valueIsNegative,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? numberFormatException,
    TResult Function(String message)? valueGreaterThan100,
    TResult Function(String message)? valueIsNegative,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NumberFormatException value)
        numberFormatException,
    required TResult Function(ValueGreaterThan100 value) valueGreaterThan100,
    required TResult Function(ValueIsNegative value) valueIsNegative,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NumberFormatException value)? numberFormatException,
    TResult? Function(ValueGreaterThan100 value)? valueGreaterThan100,
    TResult? Function(ValueIsNegative value)? valueIsNegative,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NumberFormatException value)? numberFormatException,
    TResult Function(ValueGreaterThan100 value)? valueGreaterThan100,
    TResult Function(ValueIsNegative value)? valueIsNegative,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PercentageFailureCopyWith<PercentageFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PercentageFailureCopyWith<$Res> {
  factory $PercentageFailureCopyWith(
          PercentageFailure value, $Res Function(PercentageFailure) then) =
      _$PercentageFailureCopyWithImpl<$Res, PercentageFailure>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$PercentageFailureCopyWithImpl<$Res, $Val extends PercentageFailure>
    implements $PercentageFailureCopyWith<$Res> {
  _$PercentageFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NumberFormatExceptionImplCopyWith<$Res>
    implements $PercentageFailureCopyWith<$Res> {
  factory _$$NumberFormatExceptionImplCopyWith(
          _$NumberFormatExceptionImpl value,
          $Res Function(_$NumberFormatExceptionImpl) then) =
      __$$NumberFormatExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NumberFormatExceptionImplCopyWithImpl<$Res>
    extends _$PercentageFailureCopyWithImpl<$Res, _$NumberFormatExceptionImpl>
    implements _$$NumberFormatExceptionImplCopyWith<$Res> {
  __$$NumberFormatExceptionImplCopyWithImpl(_$NumberFormatExceptionImpl _value,
      $Res Function(_$NumberFormatExceptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$NumberFormatExceptionImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NumberFormatExceptionImpl implements NumberFormatException {
  const _$NumberFormatExceptionImpl([this.message = 'ValidationException']);

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'PercentageFailure.numberFormatException(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NumberFormatExceptionImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NumberFormatExceptionImplCopyWith<_$NumberFormatExceptionImpl>
      get copyWith => __$$NumberFormatExceptionImplCopyWithImpl<
          _$NumberFormatExceptionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) numberFormatException,
    required TResult Function(String message) valueGreaterThan100,
    required TResult Function(String message) valueIsNegative,
  }) {
    return numberFormatException(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? numberFormatException,
    TResult? Function(String message)? valueGreaterThan100,
    TResult? Function(String message)? valueIsNegative,
  }) {
    return numberFormatException?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? numberFormatException,
    TResult Function(String message)? valueGreaterThan100,
    TResult Function(String message)? valueIsNegative,
    required TResult orElse(),
  }) {
    if (numberFormatException != null) {
      return numberFormatException(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NumberFormatException value)
        numberFormatException,
    required TResult Function(ValueGreaterThan100 value) valueGreaterThan100,
    required TResult Function(ValueIsNegative value) valueIsNegative,
  }) {
    return numberFormatException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NumberFormatException value)? numberFormatException,
    TResult? Function(ValueGreaterThan100 value)? valueGreaterThan100,
    TResult? Function(ValueIsNegative value)? valueIsNegative,
  }) {
    return numberFormatException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NumberFormatException value)? numberFormatException,
    TResult Function(ValueGreaterThan100 value)? valueGreaterThan100,
    TResult Function(ValueIsNegative value)? valueIsNegative,
    required TResult orElse(),
  }) {
    if (numberFormatException != null) {
      return numberFormatException(this);
    }
    return orElse();
  }
}

abstract class NumberFormatException
    implements PercentageFailure, ValidationException {
  const factory NumberFormatException([final String message]) =
      _$NumberFormatExceptionImpl;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$NumberFormatExceptionImplCopyWith<_$NumberFormatExceptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ValueGreaterThan100ImplCopyWith<$Res>
    implements $PercentageFailureCopyWith<$Res> {
  factory _$$ValueGreaterThan100ImplCopyWith(_$ValueGreaterThan100Impl value,
          $Res Function(_$ValueGreaterThan100Impl) then) =
      __$$ValueGreaterThan100ImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ValueGreaterThan100ImplCopyWithImpl<$Res>
    extends _$PercentageFailureCopyWithImpl<$Res, _$ValueGreaterThan100Impl>
    implements _$$ValueGreaterThan100ImplCopyWith<$Res> {
  __$$ValueGreaterThan100ImplCopyWithImpl(_$ValueGreaterThan100Impl _value,
      $Res Function(_$ValueGreaterThan100Impl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ValueGreaterThan100Impl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ValueGreaterThan100Impl implements ValueGreaterThan100 {
  const _$ValueGreaterThan100Impl([this.message = 'ValidationException']);

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'PercentageFailure.valueGreaterThan100(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValueGreaterThan100Impl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ValueGreaterThan100ImplCopyWith<_$ValueGreaterThan100Impl> get copyWith =>
      __$$ValueGreaterThan100ImplCopyWithImpl<_$ValueGreaterThan100Impl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) numberFormatException,
    required TResult Function(String message) valueGreaterThan100,
    required TResult Function(String message) valueIsNegative,
  }) {
    return valueGreaterThan100(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? numberFormatException,
    TResult? Function(String message)? valueGreaterThan100,
    TResult? Function(String message)? valueIsNegative,
  }) {
    return valueGreaterThan100?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? numberFormatException,
    TResult Function(String message)? valueGreaterThan100,
    TResult Function(String message)? valueIsNegative,
    required TResult orElse(),
  }) {
    if (valueGreaterThan100 != null) {
      return valueGreaterThan100(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NumberFormatException value)
        numberFormatException,
    required TResult Function(ValueGreaterThan100 value) valueGreaterThan100,
    required TResult Function(ValueIsNegative value) valueIsNegative,
  }) {
    return valueGreaterThan100(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NumberFormatException value)? numberFormatException,
    TResult? Function(ValueGreaterThan100 value)? valueGreaterThan100,
    TResult? Function(ValueIsNegative value)? valueIsNegative,
  }) {
    return valueGreaterThan100?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NumberFormatException value)? numberFormatException,
    TResult Function(ValueGreaterThan100 value)? valueGreaterThan100,
    TResult Function(ValueIsNegative value)? valueIsNegative,
    required TResult orElse(),
  }) {
    if (valueGreaterThan100 != null) {
      return valueGreaterThan100(this);
    }
    return orElse();
  }
}

abstract class ValueGreaterThan100
    implements PercentageFailure, ValidationException {
  const factory ValueGreaterThan100([final String message]) =
      _$ValueGreaterThan100Impl;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$ValueGreaterThan100ImplCopyWith<_$ValueGreaterThan100Impl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ValueIsNegativeImplCopyWith<$Res>
    implements $PercentageFailureCopyWith<$Res> {
  factory _$$ValueIsNegativeImplCopyWith(_$ValueIsNegativeImpl value,
          $Res Function(_$ValueIsNegativeImpl) then) =
      __$$ValueIsNegativeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ValueIsNegativeImplCopyWithImpl<$Res>
    extends _$PercentageFailureCopyWithImpl<$Res, _$ValueIsNegativeImpl>
    implements _$$ValueIsNegativeImplCopyWith<$Res> {
  __$$ValueIsNegativeImplCopyWithImpl(
      _$ValueIsNegativeImpl _value, $Res Function(_$ValueIsNegativeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ValueIsNegativeImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ValueIsNegativeImpl implements ValueIsNegative {
  const _$ValueIsNegativeImpl([this.message = 'ValidationException']);

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'PercentageFailure.valueIsNegative(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValueIsNegativeImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ValueIsNegativeImplCopyWith<_$ValueIsNegativeImpl> get copyWith =>
      __$$ValueIsNegativeImplCopyWithImpl<_$ValueIsNegativeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) numberFormatException,
    required TResult Function(String message) valueGreaterThan100,
    required TResult Function(String message) valueIsNegative,
  }) {
    return valueIsNegative(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? numberFormatException,
    TResult? Function(String message)? valueGreaterThan100,
    TResult? Function(String message)? valueIsNegative,
  }) {
    return valueIsNegative?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? numberFormatException,
    TResult Function(String message)? valueGreaterThan100,
    TResult Function(String message)? valueIsNegative,
    required TResult orElse(),
  }) {
    if (valueIsNegative != null) {
      return valueIsNegative(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NumberFormatException value)
        numberFormatException,
    required TResult Function(ValueGreaterThan100 value) valueGreaterThan100,
    required TResult Function(ValueIsNegative value) valueIsNegative,
  }) {
    return valueIsNegative(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NumberFormatException value)? numberFormatException,
    TResult? Function(ValueGreaterThan100 value)? valueGreaterThan100,
    TResult? Function(ValueIsNegative value)? valueIsNegative,
  }) {
    return valueIsNegative?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NumberFormatException value)? numberFormatException,
    TResult Function(ValueGreaterThan100 value)? valueGreaterThan100,
    TResult Function(ValueIsNegative value)? valueIsNegative,
    required TResult orElse(),
  }) {
    if (valueIsNegative != null) {
      return valueIsNegative(this);
    }
    return orElse();
  }
}

abstract class ValueIsNegative
    implements PercentageFailure, ValidationException {
  const factory ValueIsNegative([final String message]) = _$ValueIsNegativeImpl;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$ValueIsNegativeImplCopyWith<_$ValueIsNegativeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
