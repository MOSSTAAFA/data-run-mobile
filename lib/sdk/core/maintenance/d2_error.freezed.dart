// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'd2_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$D2Error {
  String? get url => throw _privateConstructorUsedError;
  D2ErrorComponent? get errorComponent => throw _privateConstructorUsedError;
  D2ErrorCode get errorCode => throw _privateConstructorUsedError;
  String get errorDescription => throw _privateConstructorUsedError;
  int? get httpErrorCode => throw _privateConstructorUsedError;
  Exception? get originalException => throw _privateConstructorUsedError;
  DateTime? get created => throw _privateConstructorUsedError;
  StackTrace? get stackTrace => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $D2ErrorCopyWith<D2Error> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $D2ErrorCopyWith<$Res> {
  factory $D2ErrorCopyWith(D2Error value, $Res Function(D2Error) then) =
      _$D2ErrorCopyWithImpl<$Res, D2Error>;
  @useResult
  $Res call(
      {String? url,
      D2ErrorComponent? errorComponent,
      D2ErrorCode errorCode,
      String errorDescription,
      int? httpErrorCode,
      Exception? originalException,
      DateTime? created,
      StackTrace? stackTrace});
}

/// @nodoc
class _$D2ErrorCopyWithImpl<$Res, $Val extends D2Error>
    implements $D2ErrorCopyWith<$Res> {
  _$D2ErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? errorComponent = freezed,
    Object? errorCode = null,
    Object? errorDescription = null,
    Object? httpErrorCode = freezed,
    Object? originalException = freezed,
    Object? created = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_value.copyWith(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      errorComponent: freezed == errorComponent
          ? _value.errorComponent
          : errorComponent // ignore: cast_nullable_to_non_nullable
              as D2ErrorComponent?,
      errorCode: null == errorCode
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as D2ErrorCode,
      errorDescription: null == errorDescription
          ? _value.errorDescription
          : errorDescription // ignore: cast_nullable_to_non_nullable
              as String,
      httpErrorCode: freezed == httpErrorCode
          ? _value.httpErrorCode
          : httpErrorCode // ignore: cast_nullable_to_non_nullable
              as int?,
      originalException: freezed == originalException
          ? _value.originalException
          : originalException // ignore: cast_nullable_to_non_nullable
              as Exception?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$D2ErrorImplCopyWith<$Res> implements $D2ErrorCopyWith<$Res> {
  factory _$$D2ErrorImplCopyWith(
          _$D2ErrorImpl value, $Res Function(_$D2ErrorImpl) then) =
      __$$D2ErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? url,
      D2ErrorComponent? errorComponent,
      D2ErrorCode errorCode,
      String errorDescription,
      int? httpErrorCode,
      Exception? originalException,
      DateTime? created,
      StackTrace? stackTrace});
}

/// @nodoc
class __$$D2ErrorImplCopyWithImpl<$Res>
    extends _$D2ErrorCopyWithImpl<$Res, _$D2ErrorImpl>
    implements _$$D2ErrorImplCopyWith<$Res> {
  __$$D2ErrorImplCopyWithImpl(
      _$D2ErrorImpl _value, $Res Function(_$D2ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? errorComponent = freezed,
    Object? errorCode = null,
    Object? errorDescription = null,
    Object? httpErrorCode = freezed,
    Object? originalException = freezed,
    Object? created = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$D2ErrorImpl(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      errorComponent: freezed == errorComponent
          ? _value.errorComponent
          : errorComponent // ignore: cast_nullable_to_non_nullable
              as D2ErrorComponent?,
      errorCode: null == errorCode
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as D2ErrorCode,
      errorDescription: null == errorDescription
          ? _value.errorDescription
          : errorDescription // ignore: cast_nullable_to_non_nullable
              as String,
      httpErrorCode: freezed == httpErrorCode
          ? _value.httpErrorCode
          : httpErrorCode // ignore: cast_nullable_to_non_nullable
              as int?,
      originalException: freezed == originalException
          ? _value.originalException
          : originalException // ignore: cast_nullable_to_non_nullable
              as Exception?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$D2ErrorImpl extends _D2Error {
  const _$D2ErrorImpl(
      {this.url,
      this.errorComponent,
      required this.errorCode,
      required this.errorDescription,
      this.httpErrorCode,
      this.originalException,
      this.created,
      this.stackTrace})
      : super._();

  @override
  final String? url;
  @override
  final D2ErrorComponent? errorComponent;
  @override
  final D2ErrorCode errorCode;
  @override
  final String errorDescription;
  @override
  final int? httpErrorCode;
  @override
  final Exception? originalException;
  @override
  final DateTime? created;
  @override
  final StackTrace? stackTrace;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$D2ErrorImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.errorComponent, errorComponent) ||
                other.errorComponent == errorComponent) &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode) &&
            (identical(other.errorDescription, errorDescription) ||
                other.errorDescription == errorDescription) &&
            (identical(other.httpErrorCode, httpErrorCode) ||
                other.httpErrorCode == httpErrorCode) &&
            (identical(other.originalException, originalException) ||
                other.originalException == originalException) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, url, errorComponent, errorCode,
      errorDescription, httpErrorCode, originalException, created, stackTrace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$D2ErrorImplCopyWith<_$D2ErrorImpl> get copyWith =>
      __$$D2ErrorImplCopyWithImpl<_$D2ErrorImpl>(this, _$identity);
}

abstract class _D2Error extends D2Error {
  const factory _D2Error(
      {final String? url,
      final D2ErrorComponent? errorComponent,
      required final D2ErrorCode errorCode,
      required final String errorDescription,
      final int? httpErrorCode,
      final Exception? originalException,
      final DateTime? created,
      final StackTrace? stackTrace}) = _$D2ErrorImpl;
  const _D2Error._() : super._();

  @override
  String? get url;
  @override
  D2ErrorComponent? get errorComponent;
  @override
  D2ErrorCode get errorCode;
  @override
  String get errorDescription;
  @override
  int? get httpErrorCode;
  @override
  Exception? get originalException;
  @override
  DateTime? get created;
  @override
  StackTrace? get stackTrace;
  @override
  @JsonKey(ignore: true)
  _$$D2ErrorImplCopyWith<_$D2ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
