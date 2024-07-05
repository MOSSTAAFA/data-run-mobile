// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'uid_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UidFailure {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) moreThanElevenCharsException,
    required TResult Function(String message) lessThanElevenCharsException,
    required TResult Function(String message) malformedUidException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? moreThanElevenCharsException,
    TResult? Function(String message)? lessThanElevenCharsException,
    TResult? Function(String message)? malformedUidException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? moreThanElevenCharsException,
    TResult Function(String message)? lessThanElevenCharsException,
    TResult Function(String message)? malformedUidException,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MoreThanElevenCharsException value)
        moreThanElevenCharsException,
    required TResult Function(LessThanElevenCharsException value)
        lessThanElevenCharsException,
    required TResult Function(MalformedUidException value)
        malformedUidException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MoreThanElevenCharsException value)?
        moreThanElevenCharsException,
    TResult? Function(LessThanElevenCharsException value)?
        lessThanElevenCharsException,
    TResult? Function(MalformedUidException value)? malformedUidException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MoreThanElevenCharsException value)?
        moreThanElevenCharsException,
    TResult Function(LessThanElevenCharsException value)?
        lessThanElevenCharsException,
    TResult Function(MalformedUidException value)? malformedUidException,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UidFailureCopyWith<UidFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UidFailureCopyWith<$Res> {
  factory $UidFailureCopyWith(
          UidFailure value, $Res Function(UidFailure) then) =
      _$UidFailureCopyWithImpl<$Res, UidFailure>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$UidFailureCopyWithImpl<$Res, $Val extends UidFailure>
    implements $UidFailureCopyWith<$Res> {
  _$UidFailureCopyWithImpl(this._value, this._then);

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
abstract class _$$MoreThanElevenCharsExceptionImplCopyWith<$Res>
    implements $UidFailureCopyWith<$Res> {
  factory _$$MoreThanElevenCharsExceptionImplCopyWith(
          _$MoreThanElevenCharsExceptionImpl value,
          $Res Function(_$MoreThanElevenCharsExceptionImpl) then) =
      __$$MoreThanElevenCharsExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$MoreThanElevenCharsExceptionImplCopyWithImpl<$Res>
    extends _$UidFailureCopyWithImpl<$Res, _$MoreThanElevenCharsExceptionImpl>
    implements _$$MoreThanElevenCharsExceptionImplCopyWith<$Res> {
  __$$MoreThanElevenCharsExceptionImplCopyWithImpl(
      _$MoreThanElevenCharsExceptionImpl _value,
      $Res Function(_$MoreThanElevenCharsExceptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$MoreThanElevenCharsExceptionImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MoreThanElevenCharsExceptionImpl
    implements MoreThanElevenCharsException {
  const _$MoreThanElevenCharsExceptionImpl(
      [this.message = 'ValidationException']);

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'UidFailure.moreThanElevenCharsException(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoreThanElevenCharsExceptionImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MoreThanElevenCharsExceptionImplCopyWith<
          _$MoreThanElevenCharsExceptionImpl>
      get copyWith => __$$MoreThanElevenCharsExceptionImplCopyWithImpl<
          _$MoreThanElevenCharsExceptionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) moreThanElevenCharsException,
    required TResult Function(String message) lessThanElevenCharsException,
    required TResult Function(String message) malformedUidException,
  }) {
    return moreThanElevenCharsException(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? moreThanElevenCharsException,
    TResult? Function(String message)? lessThanElevenCharsException,
    TResult? Function(String message)? malformedUidException,
  }) {
    return moreThanElevenCharsException?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? moreThanElevenCharsException,
    TResult Function(String message)? lessThanElevenCharsException,
    TResult Function(String message)? malformedUidException,
    required TResult orElse(),
  }) {
    if (moreThanElevenCharsException != null) {
      return moreThanElevenCharsException(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MoreThanElevenCharsException value)
        moreThanElevenCharsException,
    required TResult Function(LessThanElevenCharsException value)
        lessThanElevenCharsException,
    required TResult Function(MalformedUidException value)
        malformedUidException,
  }) {
    return moreThanElevenCharsException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MoreThanElevenCharsException value)?
        moreThanElevenCharsException,
    TResult? Function(LessThanElevenCharsException value)?
        lessThanElevenCharsException,
    TResult? Function(MalformedUidException value)? malformedUidException,
  }) {
    return moreThanElevenCharsException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MoreThanElevenCharsException value)?
        moreThanElevenCharsException,
    TResult Function(LessThanElevenCharsException value)?
        lessThanElevenCharsException,
    TResult Function(MalformedUidException value)? malformedUidException,
    required TResult orElse(),
  }) {
    if (moreThanElevenCharsException != null) {
      return moreThanElevenCharsException(this);
    }
    return orElse();
  }
}

abstract class MoreThanElevenCharsException
    implements UidFailure, ValidationException {
  const factory MoreThanElevenCharsException([final String message]) =
      _$MoreThanElevenCharsExceptionImpl;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$MoreThanElevenCharsExceptionImplCopyWith<
          _$MoreThanElevenCharsExceptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LessThanElevenCharsExceptionImplCopyWith<$Res>
    implements $UidFailureCopyWith<$Res> {
  factory _$$LessThanElevenCharsExceptionImplCopyWith(
          _$LessThanElevenCharsExceptionImpl value,
          $Res Function(_$LessThanElevenCharsExceptionImpl) then) =
      __$$LessThanElevenCharsExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$LessThanElevenCharsExceptionImplCopyWithImpl<$Res>
    extends _$UidFailureCopyWithImpl<$Res, _$LessThanElevenCharsExceptionImpl>
    implements _$$LessThanElevenCharsExceptionImplCopyWith<$Res> {
  __$$LessThanElevenCharsExceptionImplCopyWithImpl(
      _$LessThanElevenCharsExceptionImpl _value,
      $Res Function(_$LessThanElevenCharsExceptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$LessThanElevenCharsExceptionImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LessThanElevenCharsExceptionImpl
    implements LessThanElevenCharsException {
  const _$LessThanElevenCharsExceptionImpl(
      [this.message = 'ValidationException']);

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'UidFailure.lessThanElevenCharsException(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessThanElevenCharsExceptionImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LessThanElevenCharsExceptionImplCopyWith<
          _$LessThanElevenCharsExceptionImpl>
      get copyWith => __$$LessThanElevenCharsExceptionImplCopyWithImpl<
          _$LessThanElevenCharsExceptionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) moreThanElevenCharsException,
    required TResult Function(String message) lessThanElevenCharsException,
    required TResult Function(String message) malformedUidException,
  }) {
    return lessThanElevenCharsException(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? moreThanElevenCharsException,
    TResult? Function(String message)? lessThanElevenCharsException,
    TResult? Function(String message)? malformedUidException,
  }) {
    return lessThanElevenCharsException?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? moreThanElevenCharsException,
    TResult Function(String message)? lessThanElevenCharsException,
    TResult Function(String message)? malformedUidException,
    required TResult orElse(),
  }) {
    if (lessThanElevenCharsException != null) {
      return lessThanElevenCharsException(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MoreThanElevenCharsException value)
        moreThanElevenCharsException,
    required TResult Function(LessThanElevenCharsException value)
        lessThanElevenCharsException,
    required TResult Function(MalformedUidException value)
        malformedUidException,
  }) {
    return lessThanElevenCharsException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MoreThanElevenCharsException value)?
        moreThanElevenCharsException,
    TResult? Function(LessThanElevenCharsException value)?
        lessThanElevenCharsException,
    TResult? Function(MalformedUidException value)? malformedUidException,
  }) {
    return lessThanElevenCharsException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MoreThanElevenCharsException value)?
        moreThanElevenCharsException,
    TResult Function(LessThanElevenCharsException value)?
        lessThanElevenCharsException,
    TResult Function(MalformedUidException value)? malformedUidException,
    required TResult orElse(),
  }) {
    if (lessThanElevenCharsException != null) {
      return lessThanElevenCharsException(this);
    }
    return orElse();
  }
}

abstract class LessThanElevenCharsException
    implements UidFailure, ValidationException {
  const factory LessThanElevenCharsException([final String message]) =
      _$LessThanElevenCharsExceptionImpl;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$LessThanElevenCharsExceptionImplCopyWith<
          _$LessThanElevenCharsExceptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MalformedUidExceptionImplCopyWith<$Res>
    implements $UidFailureCopyWith<$Res> {
  factory _$$MalformedUidExceptionImplCopyWith(
          _$MalformedUidExceptionImpl value,
          $Res Function(_$MalformedUidExceptionImpl) then) =
      __$$MalformedUidExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$MalformedUidExceptionImplCopyWithImpl<$Res>
    extends _$UidFailureCopyWithImpl<$Res, _$MalformedUidExceptionImpl>
    implements _$$MalformedUidExceptionImplCopyWith<$Res> {
  __$$MalformedUidExceptionImplCopyWithImpl(_$MalformedUidExceptionImpl _value,
      $Res Function(_$MalformedUidExceptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$MalformedUidExceptionImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MalformedUidExceptionImpl implements MalformedUidException {
  const _$MalformedUidExceptionImpl([this.message = 'ValidationException']);

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'UidFailure.malformedUidException(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MalformedUidExceptionImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MalformedUidExceptionImplCopyWith<_$MalformedUidExceptionImpl>
      get copyWith => __$$MalformedUidExceptionImplCopyWithImpl<
          _$MalformedUidExceptionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) moreThanElevenCharsException,
    required TResult Function(String message) lessThanElevenCharsException,
    required TResult Function(String message) malformedUidException,
  }) {
    return malformedUidException(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? moreThanElevenCharsException,
    TResult? Function(String message)? lessThanElevenCharsException,
    TResult? Function(String message)? malformedUidException,
  }) {
    return malformedUidException?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? moreThanElevenCharsException,
    TResult Function(String message)? lessThanElevenCharsException,
    TResult Function(String message)? malformedUidException,
    required TResult orElse(),
  }) {
    if (malformedUidException != null) {
      return malformedUidException(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MoreThanElevenCharsException value)
        moreThanElevenCharsException,
    required TResult Function(LessThanElevenCharsException value)
        lessThanElevenCharsException,
    required TResult Function(MalformedUidException value)
        malformedUidException,
  }) {
    return malformedUidException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MoreThanElevenCharsException value)?
        moreThanElevenCharsException,
    TResult? Function(LessThanElevenCharsException value)?
        lessThanElevenCharsException,
    TResult? Function(MalformedUidException value)? malformedUidException,
  }) {
    return malformedUidException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MoreThanElevenCharsException value)?
        moreThanElevenCharsException,
    TResult Function(LessThanElevenCharsException value)?
        lessThanElevenCharsException,
    TResult Function(MalformedUidException value)? malformedUidException,
    required TResult orElse(),
  }) {
    if (malformedUidException != null) {
      return malformedUidException(this);
    }
    return orElse();
  }
}

abstract class MalformedUidException
    implements UidFailure, ValidationException {
  const factory MalformedUidException([final String message]) =
      _$MalformedUidExceptionImpl;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$MalformedUidExceptionImplCopyWith<_$MalformedUidExceptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
