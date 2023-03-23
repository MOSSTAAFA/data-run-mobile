// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'field_mask_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FieldMaskFailure {
  dynamic get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic message) wrongPatternException,
    required TResult Function(dynamic message) invalidPatternException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(dynamic message)? wrongPatternException,
    TResult? Function(dynamic message)? invalidPatternException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic message)? wrongPatternException,
    TResult Function(dynamic message)? invalidPatternException,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WrongPatternException value)
        wrongPatternException,
    required TResult Function(InvalidPatternException value)
        invalidPatternException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WrongPatternException value)? wrongPatternException,
    TResult? Function(InvalidPatternException value)? invalidPatternException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WrongPatternException value)? wrongPatternException,
    TResult Function(InvalidPatternException value)? invalidPatternException,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FieldMaskFailureCopyWith<FieldMaskFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FieldMaskFailureCopyWith<$Res> {
  factory $FieldMaskFailureCopyWith(
          FieldMaskFailure value, $Res Function(FieldMaskFailure) then) =
      _$FieldMaskFailureCopyWithImpl<$Res, FieldMaskFailure>;
  @useResult
  $Res call({dynamic message});
}

/// @nodoc
class _$FieldMaskFailureCopyWithImpl<$Res, $Val extends FieldMaskFailure>
    implements $FieldMaskFailureCopyWith<$Res> {
  _$FieldMaskFailureCopyWithImpl(this._value, this._then);

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
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WrongPatternExceptionCopyWith<$Res>
    implements $FieldMaskFailureCopyWith<$Res> {
  factory _$$WrongPatternExceptionCopyWith(_$WrongPatternException value,
          $Res Function(_$WrongPatternException) then) =
      __$$WrongPatternExceptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic message});
}

/// @nodoc
class __$$WrongPatternExceptionCopyWithImpl<$Res>
    extends _$FieldMaskFailureCopyWithImpl<$Res, _$WrongPatternException>
    implements _$$WrongPatternExceptionCopyWith<$Res> {
  __$$WrongPatternExceptionCopyWithImpl(_$WrongPatternException _value,
      $Res Function(_$WrongPatternException) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$WrongPatternException(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$WrongPatternException extends WrongPatternException {
  const _$WrongPatternException([this.message]) : super._();

  @override
  final dynamic message;

  @override
  String toString() {
    return 'FieldMaskFailure.wrongPatternException(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WrongPatternException &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WrongPatternExceptionCopyWith<_$WrongPatternException> get copyWith =>
      __$$WrongPatternExceptionCopyWithImpl<_$WrongPatternException>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic message) wrongPatternException,
    required TResult Function(dynamic message) invalidPatternException,
  }) {
    return wrongPatternException(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(dynamic message)? wrongPatternException,
    TResult? Function(dynamic message)? invalidPatternException,
  }) {
    return wrongPatternException?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic message)? wrongPatternException,
    TResult Function(dynamic message)? invalidPatternException,
    required TResult orElse(),
  }) {
    if (wrongPatternException != null) {
      return wrongPatternException(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WrongPatternException value)
        wrongPatternException,
    required TResult Function(InvalidPatternException value)
        invalidPatternException,
  }) {
    return wrongPatternException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WrongPatternException value)? wrongPatternException,
    TResult? Function(InvalidPatternException value)? invalidPatternException,
  }) {
    return wrongPatternException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WrongPatternException value)? wrongPatternException,
    TResult Function(InvalidPatternException value)? invalidPatternException,
    required TResult orElse(),
  }) {
    if (wrongPatternException != null) {
      return wrongPatternException(this);
    }
    return orElse();
  }
}

abstract class WrongPatternException extends FieldMaskFailure
    implements Exception {
  const factory WrongPatternException([final dynamic message]) =
      _$WrongPatternException;
  const WrongPatternException._() : super._();

  @override
  dynamic get message;
  @override
  @JsonKey(ignore: true)
  _$$WrongPatternExceptionCopyWith<_$WrongPatternException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InvalidPatternExceptionCopyWith<$Res>
    implements $FieldMaskFailureCopyWith<$Res> {
  factory _$$InvalidPatternExceptionCopyWith(_$InvalidPatternException value,
          $Res Function(_$InvalidPatternException) then) =
      __$$InvalidPatternExceptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic message});
}

/// @nodoc
class __$$InvalidPatternExceptionCopyWithImpl<$Res>
    extends _$FieldMaskFailureCopyWithImpl<$Res, _$InvalidPatternException>
    implements _$$InvalidPatternExceptionCopyWith<$Res> {
  __$$InvalidPatternExceptionCopyWithImpl(_$InvalidPatternException _value,
      $Res Function(_$InvalidPatternException) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$InvalidPatternException(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$InvalidPatternException extends InvalidPatternException {
  const _$InvalidPatternException([this.message]) : super._();

  @override
  final dynamic message;

  @override
  String toString() {
    return 'FieldMaskFailure.invalidPatternException(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidPatternException &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvalidPatternExceptionCopyWith<_$InvalidPatternException> get copyWith =>
      __$$InvalidPatternExceptionCopyWithImpl<_$InvalidPatternException>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic message) wrongPatternException,
    required TResult Function(dynamic message) invalidPatternException,
  }) {
    return invalidPatternException(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(dynamic message)? wrongPatternException,
    TResult? Function(dynamic message)? invalidPatternException,
  }) {
    return invalidPatternException?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic message)? wrongPatternException,
    TResult Function(dynamic message)? invalidPatternException,
    required TResult orElse(),
  }) {
    if (invalidPatternException != null) {
      return invalidPatternException(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WrongPatternException value)
        wrongPatternException,
    required TResult Function(InvalidPatternException value)
        invalidPatternException,
  }) {
    return invalidPatternException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WrongPatternException value)? wrongPatternException,
    TResult? Function(InvalidPatternException value)? invalidPatternException,
  }) {
    return invalidPatternException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WrongPatternException value)? wrongPatternException,
    TResult Function(InvalidPatternException value)? invalidPatternException,
    required TResult orElse(),
  }) {
    if (invalidPatternException != null) {
      return invalidPatternException(this);
    }
    return orElse();
  }
}

abstract class InvalidPatternException extends FieldMaskFailure {
  const factory InvalidPatternException([final dynamic message]) =
      _$InvalidPatternException;
  const InvalidPatternException._() : super._();

  @override
  dynamic get message;
  @override
  @JsonKey(ignore: true)
  _$$InvalidPatternExceptionCopyWith<_$InvalidPatternException> get copyWith =>
      throw _privateConstructorUsedError;
}
