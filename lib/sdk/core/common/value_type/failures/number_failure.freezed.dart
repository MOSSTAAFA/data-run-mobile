// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'number_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NumberFailure {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) scientificNotationException,
    required TResult Function(String message) numberFormatException,
    required TResult Function(String message) leadingZeroException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? scientificNotationException,
    TResult? Function(String message)? numberFormatException,
    TResult? Function(String message)? leadingZeroException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? scientificNotationException,
    TResult Function(String message)? numberFormatException,
    TResult Function(String message)? leadingZeroException,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScientificNotationException value)
        scientificNotationException,
    required TResult Function(NumberFormatException value)
        numberFormatException,
    required TResult Function(LeadingZeroException value) leadingZeroException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScientificNotationException value)?
        scientificNotationException,
    TResult? Function(NumberFormatException value)? numberFormatException,
    TResult? Function(LeadingZeroException value)? leadingZeroException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScientificNotationException value)?
        scientificNotationException,
    TResult Function(NumberFormatException value)? numberFormatException,
    TResult Function(LeadingZeroException value)? leadingZeroException,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NumberFailureCopyWith<NumberFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NumberFailureCopyWith<$Res> {
  factory $NumberFailureCopyWith(
          NumberFailure value, $Res Function(NumberFailure) then) =
      _$NumberFailureCopyWithImpl<$Res, NumberFailure>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$NumberFailureCopyWithImpl<$Res, $Val extends NumberFailure>
    implements $NumberFailureCopyWith<$Res> {
  _$NumberFailureCopyWithImpl(this._value, this._then);

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
abstract class _$$ScientificNotationExceptionImplCopyWith<$Res>
    implements $NumberFailureCopyWith<$Res> {
  factory _$$ScientificNotationExceptionImplCopyWith(
          _$ScientificNotationExceptionImpl value,
          $Res Function(_$ScientificNotationExceptionImpl) then) =
      __$$ScientificNotationExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ScientificNotationExceptionImplCopyWithImpl<$Res>
    extends _$NumberFailureCopyWithImpl<$Res, _$ScientificNotationExceptionImpl>
    implements _$$ScientificNotationExceptionImplCopyWith<$Res> {
  __$$ScientificNotationExceptionImplCopyWithImpl(
      _$ScientificNotationExceptionImpl _value,
      $Res Function(_$ScientificNotationExceptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ScientificNotationExceptionImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ScientificNotationExceptionImpl implements ScientificNotationException {
  const _$ScientificNotationExceptionImpl(
      [this.message = 'ValidationException']);

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'NumberFailure.scientificNotationException(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScientificNotationExceptionImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScientificNotationExceptionImplCopyWith<_$ScientificNotationExceptionImpl>
      get copyWith => __$$ScientificNotationExceptionImplCopyWithImpl<
          _$ScientificNotationExceptionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) scientificNotationException,
    required TResult Function(String message) numberFormatException,
    required TResult Function(String message) leadingZeroException,
  }) {
    return scientificNotationException(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? scientificNotationException,
    TResult? Function(String message)? numberFormatException,
    TResult? Function(String message)? leadingZeroException,
  }) {
    return scientificNotationException?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? scientificNotationException,
    TResult Function(String message)? numberFormatException,
    TResult Function(String message)? leadingZeroException,
    required TResult orElse(),
  }) {
    if (scientificNotationException != null) {
      return scientificNotationException(message);
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
    required TResult Function(LeadingZeroException value) leadingZeroException,
  }) {
    return scientificNotationException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScientificNotationException value)?
        scientificNotationException,
    TResult? Function(NumberFormatException value)? numberFormatException,
    TResult? Function(LeadingZeroException value)? leadingZeroException,
  }) {
    return scientificNotationException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScientificNotationException value)?
        scientificNotationException,
    TResult Function(NumberFormatException value)? numberFormatException,
    TResult Function(LeadingZeroException value)? leadingZeroException,
    required TResult orElse(),
  }) {
    if (scientificNotationException != null) {
      return scientificNotationException(this);
    }
    return orElse();
  }
}

abstract class ScientificNotationException
    implements NumberFailure, ValidationException {
  const factory ScientificNotationException([final String message]) =
      _$ScientificNotationExceptionImpl;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$ScientificNotationExceptionImplCopyWith<_$ScientificNotationExceptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NumberFormatExceptionImplCopyWith<$Res>
    implements $NumberFailureCopyWith<$Res> {
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
    extends _$NumberFailureCopyWithImpl<$Res, _$NumberFormatExceptionImpl>
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
    return 'NumberFailure.numberFormatException(message: $message)';
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
    required TResult Function(String message) scientificNotationException,
    required TResult Function(String message) numberFormatException,
    required TResult Function(String message) leadingZeroException,
  }) {
    return numberFormatException(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? scientificNotationException,
    TResult? Function(String message)? numberFormatException,
    TResult? Function(String message)? leadingZeroException,
  }) {
    return numberFormatException?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? scientificNotationException,
    TResult Function(String message)? numberFormatException,
    TResult Function(String message)? leadingZeroException,
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
    required TResult Function(ScientificNotationException value)
        scientificNotationException,
    required TResult Function(NumberFormatException value)
        numberFormatException,
    required TResult Function(LeadingZeroException value) leadingZeroException,
  }) {
    return numberFormatException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScientificNotationException value)?
        scientificNotationException,
    TResult? Function(NumberFormatException value)? numberFormatException,
    TResult? Function(LeadingZeroException value)? leadingZeroException,
  }) {
    return numberFormatException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScientificNotationException value)?
        scientificNotationException,
    TResult Function(NumberFormatException value)? numberFormatException,
    TResult Function(LeadingZeroException value)? leadingZeroException,
    required TResult orElse(),
  }) {
    if (numberFormatException != null) {
      return numberFormatException(this);
    }
    return orElse();
  }
}

abstract class NumberFormatException
    implements NumberFailure, ValidationException {
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
abstract class _$$LeadingZeroExceptionImplCopyWith<$Res>
    implements $NumberFailureCopyWith<$Res> {
  factory _$$LeadingZeroExceptionImplCopyWith(_$LeadingZeroExceptionImpl value,
          $Res Function(_$LeadingZeroExceptionImpl) then) =
      __$$LeadingZeroExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$LeadingZeroExceptionImplCopyWithImpl<$Res>
    extends _$NumberFailureCopyWithImpl<$Res, _$LeadingZeroExceptionImpl>
    implements _$$LeadingZeroExceptionImplCopyWith<$Res> {
  __$$LeadingZeroExceptionImplCopyWithImpl(_$LeadingZeroExceptionImpl _value,
      $Res Function(_$LeadingZeroExceptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$LeadingZeroExceptionImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LeadingZeroExceptionImpl implements LeadingZeroException {
  const _$LeadingZeroExceptionImpl([this.message = 'ValidationException']);

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'NumberFailure.leadingZeroException(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadingZeroExceptionImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadingZeroExceptionImplCopyWith<_$LeadingZeroExceptionImpl>
      get copyWith =>
          __$$LeadingZeroExceptionImplCopyWithImpl<_$LeadingZeroExceptionImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) scientificNotationException,
    required TResult Function(String message) numberFormatException,
    required TResult Function(String message) leadingZeroException,
  }) {
    return leadingZeroException(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? scientificNotationException,
    TResult? Function(String message)? numberFormatException,
    TResult? Function(String message)? leadingZeroException,
  }) {
    return leadingZeroException?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? scientificNotationException,
    TResult Function(String message)? numberFormatException,
    TResult Function(String message)? leadingZeroException,
    required TResult orElse(),
  }) {
    if (leadingZeroException != null) {
      return leadingZeroException(message);
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
    required TResult Function(LeadingZeroException value) leadingZeroException,
  }) {
    return leadingZeroException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScientificNotationException value)?
        scientificNotationException,
    TResult? Function(NumberFormatException value)? numberFormatException,
    TResult? Function(LeadingZeroException value)? leadingZeroException,
  }) {
    return leadingZeroException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScientificNotationException value)?
        scientificNotationException,
    TResult Function(NumberFormatException value)? numberFormatException,
    TResult Function(LeadingZeroException value)? leadingZeroException,
    required TResult orElse(),
  }) {
    if (leadingZeroException != null) {
      return leadingZeroException(this);
    }
    return orElse();
  }
}

abstract class LeadingZeroException
    implements NumberFailure, ValidationException {
  const factory LeadingZeroException([final String message]) =
      _$LeadingZeroExceptionImpl;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$LeadingZeroExceptionImplCopyWith<_$LeadingZeroExceptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
