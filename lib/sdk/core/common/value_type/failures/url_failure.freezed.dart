// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'url_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UrlFailure {
  String get message => throw _privateConstructorUsedError;
  CaughtException? get cause => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, CaughtException? cause)
        malformedUrlException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, CaughtException? cause)?
        malformedUrlException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, CaughtException? cause)?
        malformedUrlException,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MalformedUrlException value)
        malformedUrlException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MalformedUrlException value)? malformedUrlException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MalformedUrlException value)? malformedUrlException,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UrlFailureCopyWith<UrlFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UrlFailureCopyWith<$Res> {
  factory $UrlFailureCopyWith(
          UrlFailure value, $Res Function(UrlFailure) then) =
      _$UrlFailureCopyWithImpl<$Res, UrlFailure>;
  @useResult
  $Res call({String message, CaughtException? cause});
}

/// @nodoc
class _$UrlFailureCopyWithImpl<$Res, $Val extends UrlFailure>
    implements $UrlFailureCopyWith<$Res> {
  _$UrlFailureCopyWithImpl(this._value, this._then);

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
abstract class _$$MalformedUrlExceptionImplCopyWith<$Res>
    implements $UrlFailureCopyWith<$Res> {
  factory _$$MalformedUrlExceptionImplCopyWith(
          _$MalformedUrlExceptionImpl value,
          $Res Function(_$MalformedUrlExceptionImpl) then) =
      __$$MalformedUrlExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, CaughtException? cause});
}

/// @nodoc
class __$$MalformedUrlExceptionImplCopyWithImpl<$Res>
    extends _$UrlFailureCopyWithImpl<$Res, _$MalformedUrlExceptionImpl>
    implements _$$MalformedUrlExceptionImplCopyWith<$Res> {
  __$$MalformedUrlExceptionImplCopyWithImpl(_$MalformedUrlExceptionImpl _value,
      $Res Function(_$MalformedUrlExceptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? cause = freezed,
  }) {
    return _then(_$MalformedUrlExceptionImpl(
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

class _$MalformedUrlExceptionImpl implements MalformedUrlException {
  const _$MalformedUrlExceptionImpl([this.message = 'Exception', this.cause]);

  @override
  @JsonKey()
  final String message;
  @override
  final CaughtException? cause;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MalformedUrlExceptionImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.cause, cause) || other.cause == cause));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, cause);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MalformedUrlExceptionImplCopyWith<_$MalformedUrlExceptionImpl>
      get copyWith => __$$MalformedUrlExceptionImplCopyWithImpl<
          _$MalformedUrlExceptionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, CaughtException? cause)
        malformedUrlException,
  }) {
    return malformedUrlException(message, cause);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, CaughtException? cause)?
        malformedUrlException,
  }) {
    return malformedUrlException?.call(message, cause);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, CaughtException? cause)?
        malformedUrlException,
    required TResult orElse(),
  }) {
    if (malformedUrlException != null) {
      return malformedUrlException(message, cause);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MalformedUrlException value)
        malformedUrlException,
  }) {
    return malformedUrlException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MalformedUrlException value)? malformedUrlException,
  }) {
    return malformedUrlException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MalformedUrlException value)? malformedUrlException,
    required TResult orElse(),
  }) {
    if (malformedUrlException != null) {
      return malformedUrlException(this);
    }
    return orElse();
  }
}

abstract class MalformedUrlException implements UrlFailure, ThrowableException {
  const factory MalformedUrlException(
      [final String message,
      final CaughtException? cause]) = _$MalformedUrlExceptionImpl;

  @override
  String get message;
  @override
  CaughtException? get cause;
  @override
  @JsonKey(ignore: true)
  _$$MalformedUrlExceptionImplCopyWith<_$MalformedUrlExceptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
