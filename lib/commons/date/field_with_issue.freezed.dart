// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'field_with_issue.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FieldWithIssue {
  String get fieldUid => throw _privateConstructorUsedError;
  String get fieldName => throw _privateConstructorUsedError;
  IssueType get issueType => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FieldWithIssueCopyWith<FieldWithIssue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FieldWithIssueCopyWith<$Res> {
  factory $FieldWithIssueCopyWith(
          FieldWithIssue value, $Res Function(FieldWithIssue) then) =
      _$FieldWithIssueCopyWithImpl<$Res, FieldWithIssue>;
  @useResult
  $Res call(
      {String fieldUid, String fieldName, IssueType issueType, String message});
}

/// @nodoc
class _$FieldWithIssueCopyWithImpl<$Res, $Val extends FieldWithIssue>
    implements $FieldWithIssueCopyWith<$Res> {
  _$FieldWithIssueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fieldUid = null,
    Object? fieldName = null,
    Object? issueType = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      fieldUid: null == fieldUid
          ? _value.fieldUid
          : fieldUid // ignore: cast_nullable_to_non_nullable
              as String,
      fieldName: null == fieldName
          ? _value.fieldName
          : fieldName // ignore: cast_nullable_to_non_nullable
              as String,
      issueType: null == issueType
          ? _value.issueType
          : issueType // ignore: cast_nullable_to_non_nullable
              as IssueType,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FieldWithIssueCopyWith<$Res>
    implements $FieldWithIssueCopyWith<$Res> {
  factory _$$_FieldWithIssueCopyWith(
          _$_FieldWithIssue value, $Res Function(_$_FieldWithIssue) then) =
      __$$_FieldWithIssueCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String fieldUid, String fieldName, IssueType issueType, String message});
}

/// @nodoc
class __$$_FieldWithIssueCopyWithImpl<$Res>
    extends _$FieldWithIssueCopyWithImpl<$Res, _$_FieldWithIssue>
    implements _$$_FieldWithIssueCopyWith<$Res> {
  __$$_FieldWithIssueCopyWithImpl(
      _$_FieldWithIssue _value, $Res Function(_$_FieldWithIssue) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fieldUid = null,
    Object? fieldName = null,
    Object? issueType = null,
    Object? message = null,
  }) {
    return _then(_$_FieldWithIssue(
      fieldUid: null == fieldUid
          ? _value.fieldUid
          : fieldUid // ignore: cast_nullable_to_non_nullable
              as String,
      fieldName: null == fieldName
          ? _value.fieldName
          : fieldName // ignore: cast_nullable_to_non_nullable
              as String,
      issueType: null == issueType
          ? _value.issueType
          : issueType // ignore: cast_nullable_to_non_nullable
              as IssueType,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FieldWithIssue extends _FieldWithIssue {
  const _$_FieldWithIssue(
      {required this.fieldUid,
      required this.fieldName,
      required this.issueType,
      required this.message})
      : super._();

  @override
  final String fieldUid;
  @override
  final String fieldName;
  @override
  final IssueType issueType;
  @override
  final String message;

  @override
  String toString() {
    return 'FieldWithIssue(fieldUid: $fieldUid, fieldName: $fieldName, issueType: $issueType, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FieldWithIssue &&
            (identical(other.fieldUid, fieldUid) ||
                other.fieldUid == fieldUid) &&
            (identical(other.fieldName, fieldName) ||
                other.fieldName == fieldName) &&
            (identical(other.issueType, issueType) ||
                other.issueType == issueType) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, fieldUid, fieldName, issueType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FieldWithIssueCopyWith<_$_FieldWithIssue> get copyWith =>
      __$$_FieldWithIssueCopyWithImpl<_$_FieldWithIssue>(this, _$identity);
}

abstract class _FieldWithIssue extends FieldWithIssue {
  const factory _FieldWithIssue(
      {required final String fieldUid,
      required final String fieldName,
      required final IssueType issueType,
      required final String message}) = _$_FieldWithIssue;
  const _FieldWithIssue._() : super._();

  @override
  String get fieldUid;
  @override
  String get fieldName;
  @override
  IssueType get issueType;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_FieldWithIssueCopyWith<_$_FieldWithIssue> get copyWith =>
      throw _privateConstructorUsedError;
}
