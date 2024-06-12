// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'letter_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LetterFailure {
  String get message => throw _privateConstructorUsedError;
  CaughtException? get cause => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, CaughtException? cause)
        stringIsNotALetterException,
    required TResult Function(String message, CaughtException? cause)
        moreThanOneLetterException,
    required TResult Function(String message, CaughtException? cause)
        emptyStringException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, CaughtException? cause)?
        stringIsNotALetterException,
    TResult? Function(String message, CaughtException? cause)?
        moreThanOneLetterException,
    TResult? Function(String message, CaughtException? cause)?
        emptyStringException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, CaughtException? cause)?
        stringIsNotALetterException,
    TResult Function(String message, CaughtException? cause)?
        moreThanOneLetterException,
    TResult Function(String message, CaughtException? cause)?
        emptyStringException,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StringIsNotALetterException value)
        stringIsNotALetterException,
    required TResult Function(MoreThanOneLetterException value)
        moreThanOneLetterException,
    required TResult Function(EmptyStringException value) emptyStringException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StringIsNotALetterException value)?
        stringIsNotALetterException,
    TResult? Function(MoreThanOneLetterException value)?
        moreThanOneLetterException,
    TResult? Function(EmptyStringException value)? emptyStringException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StringIsNotALetterException value)?
        stringIsNotALetterException,
    TResult Function(MoreThanOneLetterException value)?
        moreThanOneLetterException,
    TResult Function(EmptyStringException value)? emptyStringException,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LetterFailureCopyWith<LetterFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LetterFailureCopyWith<$Res> {
  factory $LetterFailureCopyWith(
          LetterFailure value, $Res Function(LetterFailure) then) =
      _$LetterFailureCopyWithImpl<$Res, LetterFailure>;
  @useResult
  $Res call({String message, CaughtException? cause});
}

/// @nodoc
class _$LetterFailureCopyWithImpl<$Res, $Val extends LetterFailure>
    implements $LetterFailureCopyWith<$Res> {
  _$LetterFailureCopyWithImpl(this._value, this._then);

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
abstract class _$$StringIsNotALetterExceptionImplCopyWith<$Res>
    implements $LetterFailureCopyWith<$Res> {
  factory _$$StringIsNotALetterExceptionImplCopyWith(
          _$StringIsNotALetterExceptionImpl value,
          $Res Function(_$StringIsNotALetterExceptionImpl) then) =
      __$$StringIsNotALetterExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, CaughtException? cause});
}

/// @nodoc
class __$$StringIsNotALetterExceptionImplCopyWithImpl<$Res>
    extends _$LetterFailureCopyWithImpl<$Res, _$StringIsNotALetterExceptionImpl>
    implements _$$StringIsNotALetterExceptionImplCopyWith<$Res> {
  __$$StringIsNotALetterExceptionImplCopyWithImpl(
      _$StringIsNotALetterExceptionImpl _value,
      $Res Function(_$StringIsNotALetterExceptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? cause = freezed,
  }) {
    return _then(_$StringIsNotALetterExceptionImpl(
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

class _$StringIsNotALetterExceptionImpl implements StringIsNotALetterException {
  const _$StringIsNotALetterExceptionImpl(
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
            other is _$StringIsNotALetterExceptionImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.cause, cause) || other.cause == cause));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, cause);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StringIsNotALetterExceptionImplCopyWith<_$StringIsNotALetterExceptionImpl>
      get copyWith => __$$StringIsNotALetterExceptionImplCopyWithImpl<
          _$StringIsNotALetterExceptionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, CaughtException? cause)
        stringIsNotALetterException,
    required TResult Function(String message, CaughtException? cause)
        moreThanOneLetterException,
    required TResult Function(String message, CaughtException? cause)
        emptyStringException,
  }) {
    return stringIsNotALetterException(message, cause);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, CaughtException? cause)?
        stringIsNotALetterException,
    TResult? Function(String message, CaughtException? cause)?
        moreThanOneLetterException,
    TResult? Function(String message, CaughtException? cause)?
        emptyStringException,
  }) {
    return stringIsNotALetterException?.call(message, cause);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, CaughtException? cause)?
        stringIsNotALetterException,
    TResult Function(String message, CaughtException? cause)?
        moreThanOneLetterException,
    TResult Function(String message, CaughtException? cause)?
        emptyStringException,
    required TResult orElse(),
  }) {
    if (stringIsNotALetterException != null) {
      return stringIsNotALetterException(message, cause);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StringIsNotALetterException value)
        stringIsNotALetterException,
    required TResult Function(MoreThanOneLetterException value)
        moreThanOneLetterException,
    required TResult Function(EmptyStringException value) emptyStringException,
  }) {
    return stringIsNotALetterException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StringIsNotALetterException value)?
        stringIsNotALetterException,
    TResult? Function(MoreThanOneLetterException value)?
        moreThanOneLetterException,
    TResult? Function(EmptyStringException value)? emptyStringException,
  }) {
    return stringIsNotALetterException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StringIsNotALetterException value)?
        stringIsNotALetterException,
    TResult Function(MoreThanOneLetterException value)?
        moreThanOneLetterException,
    TResult Function(EmptyStringException value)? emptyStringException,
    required TResult orElse(),
  }) {
    if (stringIsNotALetterException != null) {
      return stringIsNotALetterException(this);
    }
    return orElse();
  }
}

abstract class StringIsNotALetterException
    implements LetterFailure, ThrowableException {
  const factory StringIsNotALetterException(
      [final String message,
      final CaughtException? cause]) = _$StringIsNotALetterExceptionImpl;

  @override
  String get message;
  @override
  CaughtException? get cause;
  @override
  @JsonKey(ignore: true)
  _$$StringIsNotALetterExceptionImplCopyWith<_$StringIsNotALetterExceptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MoreThanOneLetterExceptionImplCopyWith<$Res>
    implements $LetterFailureCopyWith<$Res> {
  factory _$$MoreThanOneLetterExceptionImplCopyWith(
          _$MoreThanOneLetterExceptionImpl value,
          $Res Function(_$MoreThanOneLetterExceptionImpl) then) =
      __$$MoreThanOneLetterExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, CaughtException? cause});
}

/// @nodoc
class __$$MoreThanOneLetterExceptionImplCopyWithImpl<$Res>
    extends _$LetterFailureCopyWithImpl<$Res, _$MoreThanOneLetterExceptionImpl>
    implements _$$MoreThanOneLetterExceptionImplCopyWith<$Res> {
  __$$MoreThanOneLetterExceptionImplCopyWithImpl(
      _$MoreThanOneLetterExceptionImpl _value,
      $Res Function(_$MoreThanOneLetterExceptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? cause = freezed,
  }) {
    return _then(_$MoreThanOneLetterExceptionImpl(
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

class _$MoreThanOneLetterExceptionImpl implements MoreThanOneLetterException {
  const _$MoreThanOneLetterExceptionImpl(
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
            other is _$MoreThanOneLetterExceptionImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.cause, cause) || other.cause == cause));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, cause);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MoreThanOneLetterExceptionImplCopyWith<_$MoreThanOneLetterExceptionImpl>
      get copyWith => __$$MoreThanOneLetterExceptionImplCopyWithImpl<
          _$MoreThanOneLetterExceptionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, CaughtException? cause)
        stringIsNotALetterException,
    required TResult Function(String message, CaughtException? cause)
        moreThanOneLetterException,
    required TResult Function(String message, CaughtException? cause)
        emptyStringException,
  }) {
    return moreThanOneLetterException(message, cause);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, CaughtException? cause)?
        stringIsNotALetterException,
    TResult? Function(String message, CaughtException? cause)?
        moreThanOneLetterException,
    TResult? Function(String message, CaughtException? cause)?
        emptyStringException,
  }) {
    return moreThanOneLetterException?.call(message, cause);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, CaughtException? cause)?
        stringIsNotALetterException,
    TResult Function(String message, CaughtException? cause)?
        moreThanOneLetterException,
    TResult Function(String message, CaughtException? cause)?
        emptyStringException,
    required TResult orElse(),
  }) {
    if (moreThanOneLetterException != null) {
      return moreThanOneLetterException(message, cause);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StringIsNotALetterException value)
        stringIsNotALetterException,
    required TResult Function(MoreThanOneLetterException value)
        moreThanOneLetterException,
    required TResult Function(EmptyStringException value) emptyStringException,
  }) {
    return moreThanOneLetterException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StringIsNotALetterException value)?
        stringIsNotALetterException,
    TResult? Function(MoreThanOneLetterException value)?
        moreThanOneLetterException,
    TResult? Function(EmptyStringException value)? emptyStringException,
  }) {
    return moreThanOneLetterException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StringIsNotALetterException value)?
        stringIsNotALetterException,
    TResult Function(MoreThanOneLetterException value)?
        moreThanOneLetterException,
    TResult Function(EmptyStringException value)? emptyStringException,
    required TResult orElse(),
  }) {
    if (moreThanOneLetterException != null) {
      return moreThanOneLetterException(this);
    }
    return orElse();
  }
}

abstract class MoreThanOneLetterException
    implements LetterFailure, ThrowableException {
  const factory MoreThanOneLetterException(
      [final String message,
      final CaughtException? cause]) = _$MoreThanOneLetterExceptionImpl;

  @override
  String get message;
  @override
  CaughtException? get cause;
  @override
  @JsonKey(ignore: true)
  _$$MoreThanOneLetterExceptionImplCopyWith<_$MoreThanOneLetterExceptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmptyStringExceptionImplCopyWith<$Res>
    implements $LetterFailureCopyWith<$Res> {
  factory _$$EmptyStringExceptionImplCopyWith(_$EmptyStringExceptionImpl value,
          $Res Function(_$EmptyStringExceptionImpl) then) =
      __$$EmptyStringExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, CaughtException? cause});
}

/// @nodoc
class __$$EmptyStringExceptionImplCopyWithImpl<$Res>
    extends _$LetterFailureCopyWithImpl<$Res, _$EmptyStringExceptionImpl>
    implements _$$EmptyStringExceptionImplCopyWith<$Res> {
  __$$EmptyStringExceptionImplCopyWithImpl(_$EmptyStringExceptionImpl _value,
      $Res Function(_$EmptyStringExceptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? cause = freezed,
  }) {
    return _then(_$EmptyStringExceptionImpl(
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

class _$EmptyStringExceptionImpl implements EmptyStringException {
  const _$EmptyStringExceptionImpl([this.message = 'Exception', this.cause]);

  @override
  @JsonKey()
  final String message;
  @override
  final CaughtException? cause;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmptyStringExceptionImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.cause, cause) || other.cause == cause));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, cause);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmptyStringExceptionImplCopyWith<_$EmptyStringExceptionImpl>
      get copyWith =>
          __$$EmptyStringExceptionImplCopyWithImpl<_$EmptyStringExceptionImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, CaughtException? cause)
        stringIsNotALetterException,
    required TResult Function(String message, CaughtException? cause)
        moreThanOneLetterException,
    required TResult Function(String message, CaughtException? cause)
        emptyStringException,
  }) {
    return emptyStringException(message, cause);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, CaughtException? cause)?
        stringIsNotALetterException,
    TResult? Function(String message, CaughtException? cause)?
        moreThanOneLetterException,
    TResult? Function(String message, CaughtException? cause)?
        emptyStringException,
  }) {
    return emptyStringException?.call(message, cause);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, CaughtException? cause)?
        stringIsNotALetterException,
    TResult Function(String message, CaughtException? cause)?
        moreThanOneLetterException,
    TResult Function(String message, CaughtException? cause)?
        emptyStringException,
    required TResult orElse(),
  }) {
    if (emptyStringException != null) {
      return emptyStringException(message, cause);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StringIsNotALetterException value)
        stringIsNotALetterException,
    required TResult Function(MoreThanOneLetterException value)
        moreThanOneLetterException,
    required TResult Function(EmptyStringException value) emptyStringException,
  }) {
    return emptyStringException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StringIsNotALetterException value)?
        stringIsNotALetterException,
    TResult? Function(MoreThanOneLetterException value)?
        moreThanOneLetterException,
    TResult? Function(EmptyStringException value)? emptyStringException,
  }) {
    return emptyStringException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StringIsNotALetterException value)?
        stringIsNotALetterException,
    TResult Function(MoreThanOneLetterException value)?
        moreThanOneLetterException,
    TResult Function(EmptyStringException value)? emptyStringException,
    required TResult orElse(),
  }) {
    if (emptyStringException != null) {
      return emptyStringException(this);
    }
    return orElse();
  }
}

abstract class EmptyStringException
    implements LetterFailure, ThrowableException {
  const factory EmptyStringException(
      [final String message,
      final CaughtException? cause]) = _$EmptyStringExceptionImpl;

  @override
  String get message;
  @override
  CaughtException? get cause;
  @override
  @JsonKey(ignore: true)
  _$$EmptyStringExceptionImplCopyWith<_$EmptyStringExceptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
