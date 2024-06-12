// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'phone_number_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PhoneNumberFailure {
  String get message => throw _privateConstructorUsedError;
  CaughtException? get cause => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, CaughtException? cause)
        malformedPhoneNumberException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, CaughtException? cause)?
        malformedPhoneNumberException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, CaughtException? cause)?
        malformedPhoneNumberException,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MalformedPhoneNumberException value)
        malformedPhoneNumberException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MalformedPhoneNumberException value)?
        malformedPhoneNumberException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MalformedPhoneNumberException value)?
        malformedPhoneNumberException,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PhoneNumberFailureCopyWith<PhoneNumberFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneNumberFailureCopyWith<$Res> {
  factory $PhoneNumberFailureCopyWith(
          PhoneNumberFailure value, $Res Function(PhoneNumberFailure) then) =
      _$PhoneNumberFailureCopyWithImpl<$Res, PhoneNumberFailure>;
  @useResult
  $Res call({String message, CaughtException? cause});
}

/// @nodoc
class _$PhoneNumberFailureCopyWithImpl<$Res, $Val extends PhoneNumberFailure>
    implements $PhoneNumberFailureCopyWith<$Res> {
  _$PhoneNumberFailureCopyWithImpl(this._value, this._then);

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
abstract class _$$MalformedPhoneNumberExceptionImplCopyWith<$Res>
    implements $PhoneNumberFailureCopyWith<$Res> {
  factory _$$MalformedPhoneNumberExceptionImplCopyWith(
          _$MalformedPhoneNumberExceptionImpl value,
          $Res Function(_$MalformedPhoneNumberExceptionImpl) then) =
      __$$MalformedPhoneNumberExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, CaughtException? cause});
}

/// @nodoc
class __$$MalformedPhoneNumberExceptionImplCopyWithImpl<$Res>
    extends _$PhoneNumberFailureCopyWithImpl<$Res,
        _$MalformedPhoneNumberExceptionImpl>
    implements _$$MalformedPhoneNumberExceptionImplCopyWith<$Res> {
  __$$MalformedPhoneNumberExceptionImplCopyWithImpl(
      _$MalformedPhoneNumberExceptionImpl _value,
      $Res Function(_$MalformedPhoneNumberExceptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? cause = freezed,
  }) {
    return _then(_$MalformedPhoneNumberExceptionImpl(
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

class _$MalformedPhoneNumberExceptionImpl
    implements MalformedPhoneNumberException {
  const _$MalformedPhoneNumberExceptionImpl(
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
            other is _$MalformedPhoneNumberExceptionImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.cause, cause) || other.cause == cause));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, cause);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MalformedPhoneNumberExceptionImplCopyWith<
          _$MalformedPhoneNumberExceptionImpl>
      get copyWith => __$$MalformedPhoneNumberExceptionImplCopyWithImpl<
          _$MalformedPhoneNumberExceptionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, CaughtException? cause)
        malformedPhoneNumberException,
  }) {
    return malformedPhoneNumberException(message, cause);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, CaughtException? cause)?
        malformedPhoneNumberException,
  }) {
    return malformedPhoneNumberException?.call(message, cause);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, CaughtException? cause)?
        malformedPhoneNumberException,
    required TResult orElse(),
  }) {
    if (malformedPhoneNumberException != null) {
      return malformedPhoneNumberException(message, cause);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MalformedPhoneNumberException value)
        malformedPhoneNumberException,
  }) {
    return malformedPhoneNumberException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MalformedPhoneNumberException value)?
        malformedPhoneNumberException,
  }) {
    return malformedPhoneNumberException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MalformedPhoneNumberException value)?
        malformedPhoneNumberException,
    required TResult orElse(),
  }) {
    if (malformedPhoneNumberException != null) {
      return malformedPhoneNumberException(this);
    }
    return orElse();
  }
}

abstract class MalformedPhoneNumberException
    implements PhoneNumberFailure, ThrowableException {
  const factory MalformedPhoneNumberException(
      [final String message,
      final CaughtException? cause]) = _$MalformedPhoneNumberExceptionImpl;

  @override
  String get message;
  @override
  CaughtException? get cause;
  @override
  @JsonKey(ignore: true)
  _$$MalformedPhoneNumberExceptionImplCopyWith<
          _$MalformedPhoneNumberExceptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
