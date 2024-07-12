// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'field_mask_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FieldMaskFailure {
  String get message => throw _privateConstructorUsedError;
  Object? get source => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, Object? source)
        wrongPatternException,
    required TResult Function(String message, Object? source)
        invalidPatternException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, Object? source)? wrongPatternException,
    TResult? Function(String message, Object? source)? invalidPatternException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, Object? source)? wrongPatternException,
    TResult Function(String message, Object? source)? invalidPatternException,
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
  $Res call({String message, Object? source});
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
    Object? source = freezed,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      source: freezed == source ? _value.source : source,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WrongPatternExceptionImplCopyWith<$Res>
    implements $FieldMaskFailureCopyWith<$Res> {
  factory _$$WrongPatternExceptionImplCopyWith(
          _$WrongPatternExceptionImpl value,
          $Res Function(_$WrongPatternExceptionImpl) then) =
      __$$WrongPatternExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, Object? source});
}

/// @nodoc
class __$$WrongPatternExceptionImplCopyWithImpl<$Res>
    extends _$FieldMaskFailureCopyWithImpl<$Res, _$WrongPatternExceptionImpl>
    implements _$$WrongPatternExceptionImplCopyWith<$Res> {
  __$$WrongPatternExceptionImplCopyWithImpl(_$WrongPatternExceptionImpl _value,
      $Res Function(_$WrongPatternExceptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? source = freezed,
  }) {
    return _then(_$WrongPatternExceptionImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == source ? _value.source : source,
    ));
  }
}

/// @nodoc

class _$WrongPatternExceptionImpl extends WrongPatternException {
  const _$WrongPatternExceptionImpl([this.message = 'dException', this.source])
      : super._();

  @override
  @JsonKey()
  final String message;
  @override
  final Object? source;

  @override
  String toString() {
    return 'FieldMaskFailure.wrongPatternException(message: $message, source: $source)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WrongPatternExceptionImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.source, source));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(source));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WrongPatternExceptionImplCopyWith<_$WrongPatternExceptionImpl>
      get copyWith => __$$WrongPatternExceptionImplCopyWithImpl<
          _$WrongPatternExceptionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, Object? source)
        wrongPatternException,
    required TResult Function(String message, Object? source)
        invalidPatternException,
  }) {
    return wrongPatternException(message, source);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, Object? source)? wrongPatternException,
    TResult? Function(String message, Object? source)? invalidPatternException,
  }) {
    return wrongPatternException?.call(message, source);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, Object? source)? wrongPatternException,
    TResult Function(String message, Object? source)? invalidPatternException,
    required TResult orElse(),
  }) {
    if (wrongPatternException != null) {
      return wrongPatternException(message, source);
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
    implements DException {
  const factory WrongPatternException(
      [final String message,
      final Object? source]) = _$WrongPatternExceptionImpl;
  const WrongPatternException._() : super._();

  @override
  String get message;
  @override
  Object? get source;
  @override
  @JsonKey(ignore: true)
  _$$WrongPatternExceptionImplCopyWith<_$WrongPatternExceptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InvalidPatternExceptionImplCopyWith<$Res>
    implements $FieldMaskFailureCopyWith<$Res> {
  factory _$$InvalidPatternExceptionImplCopyWith(
          _$InvalidPatternExceptionImpl value,
          $Res Function(_$InvalidPatternExceptionImpl) then) =
      __$$InvalidPatternExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, Object? source});
}

/// @nodoc
class __$$InvalidPatternExceptionImplCopyWithImpl<$Res>
    extends _$FieldMaskFailureCopyWithImpl<$Res, _$InvalidPatternExceptionImpl>
    implements _$$InvalidPatternExceptionImplCopyWith<$Res> {
  __$$InvalidPatternExceptionImplCopyWithImpl(
      _$InvalidPatternExceptionImpl _value,
      $Res Function(_$InvalidPatternExceptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? source = freezed,
  }) {
    return _then(_$InvalidPatternExceptionImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == source ? _value.source : source,
    ));
  }
}

/// @nodoc

class _$InvalidPatternExceptionImpl extends InvalidPatternException {
  const _$InvalidPatternExceptionImpl(
      [this.message = 'dException', this.source])
      : super._();

  @override
  @JsonKey()
  final String message;
  @override
  final Object? source;

  @override
  String toString() {
    return 'FieldMaskFailure.invalidPatternException(message: $message, source: $source)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidPatternExceptionImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.source, source));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(source));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvalidPatternExceptionImplCopyWith<_$InvalidPatternExceptionImpl>
      get copyWith => __$$InvalidPatternExceptionImplCopyWithImpl<
          _$InvalidPatternExceptionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, Object? source)
        wrongPatternException,
    required TResult Function(String message, Object? source)
        invalidPatternException,
  }) {
    return invalidPatternException(message, source);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, Object? source)? wrongPatternException,
    TResult? Function(String message, Object? source)? invalidPatternException,
  }) {
    return invalidPatternException?.call(message, source);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, Object? source)? wrongPatternException,
    TResult Function(String message, Object? source)? invalidPatternException,
    required TResult orElse(),
  }) {
    if (invalidPatternException != null) {
      return invalidPatternException(message, source);
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

abstract class InvalidPatternException extends FieldMaskFailure
    implements DException {
  const factory InvalidPatternException(
      [final String message,
      final Object? source]) = _$InvalidPatternExceptionImpl;
  const InvalidPatternException._() : super._();

  @override
  String get message;
  @override
  Object? get source;
  @override
  @JsonKey(ignore: true)
  _$$InvalidPatternExceptionImplCopyWith<_$InvalidPatternExceptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
