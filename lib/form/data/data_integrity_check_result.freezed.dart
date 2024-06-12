// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_integrity_check_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DataIntegrityCheckResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            IMap<String, String> mandatoryFields,
            IList<FieldWithIssue> errorFields,
            IList<FieldWithIssue> warningFields,
            bool canComplete,
            String? onCompleteMessage,
            bool allowDiscard)
        missingMandatoryResult,
    required TResult Function(
            IMap<String, String> mandatoryFields,
            IList<FieldWithIssue> fieldUidErrorList,
            IList<FieldWithIssue> warningFields,
            bool canComplete,
            String? onCompleteMessage,
            bool allowDiscard)
        fieldsWithErrorResult,
    required TResult Function(IList<FieldWithIssue> fieldUidWarningList,
            bool canComplete, String? onCompleteMessage, bool allowDiscard)
        fieldsWithWarningResult,
    required TResult Function(String? extraData, bool canComplete,
            String? onCompleteMessage, bool allowDiscard)
        successfulResult,
    required TResult Function() notSavedResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            IMap<String, String> mandatoryFields,
            IList<FieldWithIssue> errorFields,
            IList<FieldWithIssue> warningFields,
            bool canComplete,
            String? onCompleteMessage,
            bool allowDiscard)?
        missingMandatoryResult,
    TResult? Function(
            IMap<String, String> mandatoryFields,
            IList<FieldWithIssue> fieldUidErrorList,
            IList<FieldWithIssue> warningFields,
            bool canComplete,
            String? onCompleteMessage,
            bool allowDiscard)?
        fieldsWithErrorResult,
    TResult? Function(IList<FieldWithIssue> fieldUidWarningList,
            bool canComplete, String? onCompleteMessage, bool allowDiscard)?
        fieldsWithWarningResult,
    TResult? Function(String? extraData, bool canComplete,
            String? onCompleteMessage, bool allowDiscard)?
        successfulResult,
    TResult? Function()? notSavedResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            IMap<String, String> mandatoryFields,
            IList<FieldWithIssue> errorFields,
            IList<FieldWithIssue> warningFields,
            bool canComplete,
            String? onCompleteMessage,
            bool allowDiscard)?
        missingMandatoryResult,
    TResult Function(
            IMap<String, String> mandatoryFields,
            IList<FieldWithIssue> fieldUidErrorList,
            IList<FieldWithIssue> warningFields,
            bool canComplete,
            String? onCompleteMessage,
            bool allowDiscard)?
        fieldsWithErrorResult,
    TResult Function(IList<FieldWithIssue> fieldUidWarningList,
            bool canComplete, String? onCompleteMessage, bool allowDiscard)?
        fieldsWithWarningResult,
    TResult Function(String? extraData, bool canComplete,
            String? onCompleteMessage, bool allowDiscard)?
        successfulResult,
    TResult Function()? notSavedResult,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MissingMandatoryResult value)
        missingMandatoryResult,
    required TResult Function(FieldsWithErrorResult value)
        fieldsWithErrorResult,
    required TResult Function(FieldsWithWarningResult value)
        fieldsWithWarningResult,
    required TResult Function(SuccessfulResult value) successfulResult,
    required TResult Function(NotSavedResult value) notSavedResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MissingMandatoryResult value)? missingMandatoryResult,
    TResult? Function(FieldsWithErrorResult value)? fieldsWithErrorResult,
    TResult? Function(FieldsWithWarningResult value)? fieldsWithWarningResult,
    TResult? Function(SuccessfulResult value)? successfulResult,
    TResult? Function(NotSavedResult value)? notSavedResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MissingMandatoryResult value)? missingMandatoryResult,
    TResult Function(FieldsWithErrorResult value)? fieldsWithErrorResult,
    TResult Function(FieldsWithWarningResult value)? fieldsWithWarningResult,
    TResult Function(SuccessfulResult value)? successfulResult,
    TResult Function(NotSavedResult value)? notSavedResult,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataIntegrityCheckResultCopyWith<$Res> {
  factory $DataIntegrityCheckResultCopyWith(DataIntegrityCheckResult value,
          $Res Function(DataIntegrityCheckResult) then) =
      _$DataIntegrityCheckResultCopyWithImpl<$Res, DataIntegrityCheckResult>;
}

/// @nodoc
class _$DataIntegrityCheckResultCopyWithImpl<$Res,
        $Val extends DataIntegrityCheckResult>
    implements $DataIntegrityCheckResultCopyWith<$Res> {
  _$DataIntegrityCheckResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MissingMandatoryResultImplCopyWith<$Res> {
  factory _$$MissingMandatoryResultImplCopyWith(
          _$MissingMandatoryResultImpl value,
          $Res Function(_$MissingMandatoryResultImpl) then) =
      __$$MissingMandatoryResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {IMap<String, String> mandatoryFields,
      IList<FieldWithIssue> errorFields,
      IList<FieldWithIssue> warningFields,
      bool canComplete,
      String? onCompleteMessage,
      bool allowDiscard});
}

/// @nodoc
class __$$MissingMandatoryResultImplCopyWithImpl<$Res>
    extends _$DataIntegrityCheckResultCopyWithImpl<$Res,
        _$MissingMandatoryResultImpl>
    implements _$$MissingMandatoryResultImplCopyWith<$Res> {
  __$$MissingMandatoryResultImplCopyWithImpl(
      _$MissingMandatoryResultImpl _value,
      $Res Function(_$MissingMandatoryResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mandatoryFields = null,
    Object? errorFields = null,
    Object? warningFields = null,
    Object? canComplete = null,
    Object? onCompleteMessage = freezed,
    Object? allowDiscard = null,
  }) {
    return _then(_$MissingMandatoryResultImpl(
      mandatoryFields: null == mandatoryFields
          ? _value.mandatoryFields
          : mandatoryFields // ignore: cast_nullable_to_non_nullable
              as IMap<String, String>,
      errorFields: null == errorFields
          ? _value.errorFields
          : errorFields // ignore: cast_nullable_to_non_nullable
              as IList<FieldWithIssue>,
      warningFields: null == warningFields
          ? _value.warningFields
          : warningFields // ignore: cast_nullable_to_non_nullable
              as IList<FieldWithIssue>,
      canComplete: null == canComplete
          ? _value.canComplete
          : canComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      onCompleteMessage: freezed == onCompleteMessage
          ? _value.onCompleteMessage
          : onCompleteMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      allowDiscard: null == allowDiscard
          ? _value.allowDiscard
          : allowDiscard // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MissingMandatoryResultImpl
    with DiagnosticableTreeMixin
    implements MissingMandatoryResult {
  const _$MissingMandatoryResultImpl(
      {required this.mandatoryFields,
      required this.errorFields,
      required this.warningFields,
      this.canComplete = false,
      this.onCompleteMessage,
      this.allowDiscard = false});

  @override
  final IMap<String, String> mandatoryFields;
  @override
  final IList<FieldWithIssue> errorFields;
  @override
  final IList<FieldWithIssue> warningFields;
// override
  @override
  @JsonKey()
  final bool canComplete;
  @override
  final String? onCompleteMessage;
  @override
  @JsonKey()
  final bool allowDiscard;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DataIntegrityCheckResult.missingMandatoryResult(mandatoryFields: $mandatoryFields, errorFields: $errorFields, warningFields: $warningFields, canComplete: $canComplete, onCompleteMessage: $onCompleteMessage, allowDiscard: $allowDiscard)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'DataIntegrityCheckResult.missingMandatoryResult'))
      ..add(DiagnosticsProperty('mandatoryFields', mandatoryFields))
      ..add(DiagnosticsProperty('errorFields', errorFields))
      ..add(DiagnosticsProperty('warningFields', warningFields))
      ..add(DiagnosticsProperty('canComplete', canComplete))
      ..add(DiagnosticsProperty('onCompleteMessage', onCompleteMessage))
      ..add(DiagnosticsProperty('allowDiscard', allowDiscard));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MissingMandatoryResultImpl &&
            (identical(other.mandatoryFields, mandatoryFields) ||
                other.mandatoryFields == mandatoryFields) &&
            const DeepCollectionEquality()
                .equals(other.errorFields, errorFields) &&
            const DeepCollectionEquality()
                .equals(other.warningFields, warningFields) &&
            (identical(other.canComplete, canComplete) ||
                other.canComplete == canComplete) &&
            (identical(other.onCompleteMessage, onCompleteMessage) ||
                other.onCompleteMessage == onCompleteMessage) &&
            (identical(other.allowDiscard, allowDiscard) ||
                other.allowDiscard == allowDiscard));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      mandatoryFields,
      const DeepCollectionEquality().hash(errorFields),
      const DeepCollectionEquality().hash(warningFields),
      canComplete,
      onCompleteMessage,
      allowDiscard);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MissingMandatoryResultImplCopyWith<_$MissingMandatoryResultImpl>
      get copyWith => __$$MissingMandatoryResultImplCopyWithImpl<
          _$MissingMandatoryResultImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            IMap<String, String> mandatoryFields,
            IList<FieldWithIssue> errorFields,
            IList<FieldWithIssue> warningFields,
            bool canComplete,
            String? onCompleteMessage,
            bool allowDiscard)
        missingMandatoryResult,
    required TResult Function(
            IMap<String, String> mandatoryFields,
            IList<FieldWithIssue> fieldUidErrorList,
            IList<FieldWithIssue> warningFields,
            bool canComplete,
            String? onCompleteMessage,
            bool allowDiscard)
        fieldsWithErrorResult,
    required TResult Function(IList<FieldWithIssue> fieldUidWarningList,
            bool canComplete, String? onCompleteMessage, bool allowDiscard)
        fieldsWithWarningResult,
    required TResult Function(String? extraData, bool canComplete,
            String? onCompleteMessage, bool allowDiscard)
        successfulResult,
    required TResult Function() notSavedResult,
  }) {
    return missingMandatoryResult(mandatoryFields, errorFields, warningFields,
        canComplete, onCompleteMessage, allowDiscard);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            IMap<String, String> mandatoryFields,
            IList<FieldWithIssue> errorFields,
            IList<FieldWithIssue> warningFields,
            bool canComplete,
            String? onCompleteMessage,
            bool allowDiscard)?
        missingMandatoryResult,
    TResult? Function(
            IMap<String, String> mandatoryFields,
            IList<FieldWithIssue> fieldUidErrorList,
            IList<FieldWithIssue> warningFields,
            bool canComplete,
            String? onCompleteMessage,
            bool allowDiscard)?
        fieldsWithErrorResult,
    TResult? Function(IList<FieldWithIssue> fieldUidWarningList,
            bool canComplete, String? onCompleteMessage, bool allowDiscard)?
        fieldsWithWarningResult,
    TResult? Function(String? extraData, bool canComplete,
            String? onCompleteMessage, bool allowDiscard)?
        successfulResult,
    TResult? Function()? notSavedResult,
  }) {
    return missingMandatoryResult?.call(mandatoryFields, errorFields,
        warningFields, canComplete, onCompleteMessage, allowDiscard);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            IMap<String, String> mandatoryFields,
            IList<FieldWithIssue> errorFields,
            IList<FieldWithIssue> warningFields,
            bool canComplete,
            String? onCompleteMessage,
            bool allowDiscard)?
        missingMandatoryResult,
    TResult Function(
            IMap<String, String> mandatoryFields,
            IList<FieldWithIssue> fieldUidErrorList,
            IList<FieldWithIssue> warningFields,
            bool canComplete,
            String? onCompleteMessage,
            bool allowDiscard)?
        fieldsWithErrorResult,
    TResult Function(IList<FieldWithIssue> fieldUidWarningList,
            bool canComplete, String? onCompleteMessage, bool allowDiscard)?
        fieldsWithWarningResult,
    TResult Function(String? extraData, bool canComplete,
            String? onCompleteMessage, bool allowDiscard)?
        successfulResult,
    TResult Function()? notSavedResult,
    required TResult orElse(),
  }) {
    if (missingMandatoryResult != null) {
      return missingMandatoryResult(mandatoryFields, errorFields, warningFields,
          canComplete, onCompleteMessage, allowDiscard);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MissingMandatoryResult value)
        missingMandatoryResult,
    required TResult Function(FieldsWithErrorResult value)
        fieldsWithErrorResult,
    required TResult Function(FieldsWithWarningResult value)
        fieldsWithWarningResult,
    required TResult Function(SuccessfulResult value) successfulResult,
    required TResult Function(NotSavedResult value) notSavedResult,
  }) {
    return missingMandatoryResult(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MissingMandatoryResult value)? missingMandatoryResult,
    TResult? Function(FieldsWithErrorResult value)? fieldsWithErrorResult,
    TResult? Function(FieldsWithWarningResult value)? fieldsWithWarningResult,
    TResult? Function(SuccessfulResult value)? successfulResult,
    TResult? Function(NotSavedResult value)? notSavedResult,
  }) {
    return missingMandatoryResult?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MissingMandatoryResult value)? missingMandatoryResult,
    TResult Function(FieldsWithErrorResult value)? fieldsWithErrorResult,
    TResult Function(FieldsWithWarningResult value)? fieldsWithWarningResult,
    TResult Function(SuccessfulResult value)? successfulResult,
    TResult Function(NotSavedResult value)? notSavedResult,
    required TResult orElse(),
  }) {
    if (missingMandatoryResult != null) {
      return missingMandatoryResult(this);
    }
    return orElse();
  }
}

abstract class MissingMandatoryResult implements DataIntegrityCheckResult {
  const factory MissingMandatoryResult(
      {required final IMap<String, String> mandatoryFields,
      required final IList<FieldWithIssue> errorFields,
      required final IList<FieldWithIssue> warningFields,
      final bool canComplete,
      final String? onCompleteMessage,
      final bool allowDiscard}) = _$MissingMandatoryResultImpl;

  IMap<String, String> get mandatoryFields;
  IList<FieldWithIssue> get errorFields;
  IList<FieldWithIssue> get warningFields; // override
  bool get canComplete;
  String? get onCompleteMessage;
  bool get allowDiscard;
  @JsonKey(ignore: true)
  _$$MissingMandatoryResultImplCopyWith<_$MissingMandatoryResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FieldsWithErrorResultImplCopyWith<$Res> {
  factory _$$FieldsWithErrorResultImplCopyWith(
          _$FieldsWithErrorResultImpl value,
          $Res Function(_$FieldsWithErrorResultImpl) then) =
      __$$FieldsWithErrorResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {IMap<String, String> mandatoryFields,
      IList<FieldWithIssue> fieldUidErrorList,
      IList<FieldWithIssue> warningFields,
      bool canComplete,
      String? onCompleteMessage,
      bool allowDiscard});
}

/// @nodoc
class __$$FieldsWithErrorResultImplCopyWithImpl<$Res>
    extends _$DataIntegrityCheckResultCopyWithImpl<$Res,
        _$FieldsWithErrorResultImpl>
    implements _$$FieldsWithErrorResultImplCopyWith<$Res> {
  __$$FieldsWithErrorResultImplCopyWithImpl(_$FieldsWithErrorResultImpl _value,
      $Res Function(_$FieldsWithErrorResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mandatoryFields = null,
    Object? fieldUidErrorList = null,
    Object? warningFields = null,
    Object? canComplete = null,
    Object? onCompleteMessage = freezed,
    Object? allowDiscard = null,
  }) {
    return _then(_$FieldsWithErrorResultImpl(
      mandatoryFields: null == mandatoryFields
          ? _value.mandatoryFields
          : mandatoryFields // ignore: cast_nullable_to_non_nullable
              as IMap<String, String>,
      fieldUidErrorList: null == fieldUidErrorList
          ? _value.fieldUidErrorList
          : fieldUidErrorList // ignore: cast_nullable_to_non_nullable
              as IList<FieldWithIssue>,
      warningFields: null == warningFields
          ? _value.warningFields
          : warningFields // ignore: cast_nullable_to_non_nullable
              as IList<FieldWithIssue>,
      canComplete: null == canComplete
          ? _value.canComplete
          : canComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      onCompleteMessage: freezed == onCompleteMessage
          ? _value.onCompleteMessage
          : onCompleteMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      allowDiscard: null == allowDiscard
          ? _value.allowDiscard
          : allowDiscard // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FieldsWithErrorResultImpl
    with DiagnosticableTreeMixin
    implements FieldsWithErrorResult {
  const _$FieldsWithErrorResultImpl(
      {required this.mandatoryFields,
      required this.fieldUidErrorList,
      required this.warningFields,
      this.canComplete = false,
      this.onCompleteMessage,
      this.allowDiscard = false});

  @override
  final IMap<String, String> mandatoryFields;
  @override
  final IList<FieldWithIssue> fieldUidErrorList;
  @override
  final IList<FieldWithIssue> warningFields;
// override
  @override
  @JsonKey()
  final bool canComplete;
  @override
  final String? onCompleteMessage;
  @override
  @JsonKey()
  final bool allowDiscard;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DataIntegrityCheckResult.fieldsWithErrorResult(mandatoryFields: $mandatoryFields, fieldUidErrorList: $fieldUidErrorList, warningFields: $warningFields, canComplete: $canComplete, onCompleteMessage: $onCompleteMessage, allowDiscard: $allowDiscard)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'DataIntegrityCheckResult.fieldsWithErrorResult'))
      ..add(DiagnosticsProperty('mandatoryFields', mandatoryFields))
      ..add(DiagnosticsProperty('fieldUidErrorList', fieldUidErrorList))
      ..add(DiagnosticsProperty('warningFields', warningFields))
      ..add(DiagnosticsProperty('canComplete', canComplete))
      ..add(DiagnosticsProperty('onCompleteMessage', onCompleteMessage))
      ..add(DiagnosticsProperty('allowDiscard', allowDiscard));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FieldsWithErrorResultImpl &&
            (identical(other.mandatoryFields, mandatoryFields) ||
                other.mandatoryFields == mandatoryFields) &&
            const DeepCollectionEquality()
                .equals(other.fieldUidErrorList, fieldUidErrorList) &&
            const DeepCollectionEquality()
                .equals(other.warningFields, warningFields) &&
            (identical(other.canComplete, canComplete) ||
                other.canComplete == canComplete) &&
            (identical(other.onCompleteMessage, onCompleteMessage) ||
                other.onCompleteMessage == onCompleteMessage) &&
            (identical(other.allowDiscard, allowDiscard) ||
                other.allowDiscard == allowDiscard));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      mandatoryFields,
      const DeepCollectionEquality().hash(fieldUidErrorList),
      const DeepCollectionEquality().hash(warningFields),
      canComplete,
      onCompleteMessage,
      allowDiscard);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FieldsWithErrorResultImplCopyWith<_$FieldsWithErrorResultImpl>
      get copyWith => __$$FieldsWithErrorResultImplCopyWithImpl<
          _$FieldsWithErrorResultImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            IMap<String, String> mandatoryFields,
            IList<FieldWithIssue> errorFields,
            IList<FieldWithIssue> warningFields,
            bool canComplete,
            String? onCompleteMessage,
            bool allowDiscard)
        missingMandatoryResult,
    required TResult Function(
            IMap<String, String> mandatoryFields,
            IList<FieldWithIssue> fieldUidErrorList,
            IList<FieldWithIssue> warningFields,
            bool canComplete,
            String? onCompleteMessage,
            bool allowDiscard)
        fieldsWithErrorResult,
    required TResult Function(IList<FieldWithIssue> fieldUidWarningList,
            bool canComplete, String? onCompleteMessage, bool allowDiscard)
        fieldsWithWarningResult,
    required TResult Function(String? extraData, bool canComplete,
            String? onCompleteMessage, bool allowDiscard)
        successfulResult,
    required TResult Function() notSavedResult,
  }) {
    return fieldsWithErrorResult(mandatoryFields, fieldUidErrorList,
        warningFields, canComplete, onCompleteMessage, allowDiscard);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            IMap<String, String> mandatoryFields,
            IList<FieldWithIssue> errorFields,
            IList<FieldWithIssue> warningFields,
            bool canComplete,
            String? onCompleteMessage,
            bool allowDiscard)?
        missingMandatoryResult,
    TResult? Function(
            IMap<String, String> mandatoryFields,
            IList<FieldWithIssue> fieldUidErrorList,
            IList<FieldWithIssue> warningFields,
            bool canComplete,
            String? onCompleteMessage,
            bool allowDiscard)?
        fieldsWithErrorResult,
    TResult? Function(IList<FieldWithIssue> fieldUidWarningList,
            bool canComplete, String? onCompleteMessage, bool allowDiscard)?
        fieldsWithWarningResult,
    TResult? Function(String? extraData, bool canComplete,
            String? onCompleteMessage, bool allowDiscard)?
        successfulResult,
    TResult? Function()? notSavedResult,
  }) {
    return fieldsWithErrorResult?.call(mandatoryFields, fieldUidErrorList,
        warningFields, canComplete, onCompleteMessage, allowDiscard);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            IMap<String, String> mandatoryFields,
            IList<FieldWithIssue> errorFields,
            IList<FieldWithIssue> warningFields,
            bool canComplete,
            String? onCompleteMessage,
            bool allowDiscard)?
        missingMandatoryResult,
    TResult Function(
            IMap<String, String> mandatoryFields,
            IList<FieldWithIssue> fieldUidErrorList,
            IList<FieldWithIssue> warningFields,
            bool canComplete,
            String? onCompleteMessage,
            bool allowDiscard)?
        fieldsWithErrorResult,
    TResult Function(IList<FieldWithIssue> fieldUidWarningList,
            bool canComplete, String? onCompleteMessage, bool allowDiscard)?
        fieldsWithWarningResult,
    TResult Function(String? extraData, bool canComplete,
            String? onCompleteMessage, bool allowDiscard)?
        successfulResult,
    TResult Function()? notSavedResult,
    required TResult orElse(),
  }) {
    if (fieldsWithErrorResult != null) {
      return fieldsWithErrorResult(mandatoryFields, fieldUidErrorList,
          warningFields, canComplete, onCompleteMessage, allowDiscard);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MissingMandatoryResult value)
        missingMandatoryResult,
    required TResult Function(FieldsWithErrorResult value)
        fieldsWithErrorResult,
    required TResult Function(FieldsWithWarningResult value)
        fieldsWithWarningResult,
    required TResult Function(SuccessfulResult value) successfulResult,
    required TResult Function(NotSavedResult value) notSavedResult,
  }) {
    return fieldsWithErrorResult(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MissingMandatoryResult value)? missingMandatoryResult,
    TResult? Function(FieldsWithErrorResult value)? fieldsWithErrorResult,
    TResult? Function(FieldsWithWarningResult value)? fieldsWithWarningResult,
    TResult? Function(SuccessfulResult value)? successfulResult,
    TResult? Function(NotSavedResult value)? notSavedResult,
  }) {
    return fieldsWithErrorResult?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MissingMandatoryResult value)? missingMandatoryResult,
    TResult Function(FieldsWithErrorResult value)? fieldsWithErrorResult,
    TResult Function(FieldsWithWarningResult value)? fieldsWithWarningResult,
    TResult Function(SuccessfulResult value)? successfulResult,
    TResult Function(NotSavedResult value)? notSavedResult,
    required TResult orElse(),
  }) {
    if (fieldsWithErrorResult != null) {
      return fieldsWithErrorResult(this);
    }
    return orElse();
  }
}

abstract class FieldsWithErrorResult implements DataIntegrityCheckResult {
  const factory FieldsWithErrorResult(
      {required final IMap<String, String> mandatoryFields,
      required final IList<FieldWithIssue> fieldUidErrorList,
      required final IList<FieldWithIssue> warningFields,
      final bool canComplete,
      final String? onCompleteMessage,
      final bool allowDiscard}) = _$FieldsWithErrorResultImpl;

  IMap<String, String> get mandatoryFields;
  IList<FieldWithIssue> get fieldUidErrorList;
  IList<FieldWithIssue> get warningFields; // override
  bool get canComplete;
  String? get onCompleteMessage;
  bool get allowDiscard;
  @JsonKey(ignore: true)
  _$$FieldsWithErrorResultImplCopyWith<_$FieldsWithErrorResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FieldsWithWarningResultImplCopyWith<$Res> {
  factory _$$FieldsWithWarningResultImplCopyWith(
          _$FieldsWithWarningResultImpl value,
          $Res Function(_$FieldsWithWarningResultImpl) then) =
      __$$FieldsWithWarningResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {IList<FieldWithIssue> fieldUidWarningList,
      bool canComplete,
      String? onCompleteMessage,
      bool allowDiscard});
}

/// @nodoc
class __$$FieldsWithWarningResultImplCopyWithImpl<$Res>
    extends _$DataIntegrityCheckResultCopyWithImpl<$Res,
        _$FieldsWithWarningResultImpl>
    implements _$$FieldsWithWarningResultImplCopyWith<$Res> {
  __$$FieldsWithWarningResultImplCopyWithImpl(
      _$FieldsWithWarningResultImpl _value,
      $Res Function(_$FieldsWithWarningResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fieldUidWarningList = null,
    Object? canComplete = null,
    Object? onCompleteMessage = freezed,
    Object? allowDiscard = null,
  }) {
    return _then(_$FieldsWithWarningResultImpl(
      fieldUidWarningList: null == fieldUidWarningList
          ? _value.fieldUidWarningList
          : fieldUidWarningList // ignore: cast_nullable_to_non_nullable
              as IList<FieldWithIssue>,
      canComplete: null == canComplete
          ? _value.canComplete
          : canComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      onCompleteMessage: freezed == onCompleteMessage
          ? _value.onCompleteMessage
          : onCompleteMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      allowDiscard: null == allowDiscard
          ? _value.allowDiscard
          : allowDiscard // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FieldsWithWarningResultImpl
    with DiagnosticableTreeMixin
    implements FieldsWithWarningResult {
  const _$FieldsWithWarningResultImpl(
      {required this.fieldUidWarningList,
      this.canComplete = false,
      this.onCompleteMessage,
      this.allowDiscard = false});

  @override
  final IList<FieldWithIssue> fieldUidWarningList;
// override
  @override
  @JsonKey()
  final bool canComplete;
  @override
  final String? onCompleteMessage;
  @override
  @JsonKey()
  final bool allowDiscard;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DataIntegrityCheckResult.fieldsWithWarningResult(fieldUidWarningList: $fieldUidWarningList, canComplete: $canComplete, onCompleteMessage: $onCompleteMessage, allowDiscard: $allowDiscard)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'DataIntegrityCheckResult.fieldsWithWarningResult'))
      ..add(DiagnosticsProperty('fieldUidWarningList', fieldUidWarningList))
      ..add(DiagnosticsProperty('canComplete', canComplete))
      ..add(DiagnosticsProperty('onCompleteMessage', onCompleteMessage))
      ..add(DiagnosticsProperty('allowDiscard', allowDiscard));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FieldsWithWarningResultImpl &&
            const DeepCollectionEquality()
                .equals(other.fieldUidWarningList, fieldUidWarningList) &&
            (identical(other.canComplete, canComplete) ||
                other.canComplete == canComplete) &&
            (identical(other.onCompleteMessage, onCompleteMessage) ||
                other.onCompleteMessage == onCompleteMessage) &&
            (identical(other.allowDiscard, allowDiscard) ||
                other.allowDiscard == allowDiscard));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(fieldUidWarningList),
      canComplete,
      onCompleteMessage,
      allowDiscard);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FieldsWithWarningResultImplCopyWith<_$FieldsWithWarningResultImpl>
      get copyWith => __$$FieldsWithWarningResultImplCopyWithImpl<
          _$FieldsWithWarningResultImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            IMap<String, String> mandatoryFields,
            IList<FieldWithIssue> errorFields,
            IList<FieldWithIssue> warningFields,
            bool canComplete,
            String? onCompleteMessage,
            bool allowDiscard)
        missingMandatoryResult,
    required TResult Function(
            IMap<String, String> mandatoryFields,
            IList<FieldWithIssue> fieldUidErrorList,
            IList<FieldWithIssue> warningFields,
            bool canComplete,
            String? onCompleteMessage,
            bool allowDiscard)
        fieldsWithErrorResult,
    required TResult Function(IList<FieldWithIssue> fieldUidWarningList,
            bool canComplete, String? onCompleteMessage, bool allowDiscard)
        fieldsWithWarningResult,
    required TResult Function(String? extraData, bool canComplete,
            String? onCompleteMessage, bool allowDiscard)
        successfulResult,
    required TResult Function() notSavedResult,
  }) {
    return fieldsWithWarningResult(
        fieldUidWarningList, canComplete, onCompleteMessage, allowDiscard);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            IMap<String, String> mandatoryFields,
            IList<FieldWithIssue> errorFields,
            IList<FieldWithIssue> warningFields,
            bool canComplete,
            String? onCompleteMessage,
            bool allowDiscard)?
        missingMandatoryResult,
    TResult? Function(
            IMap<String, String> mandatoryFields,
            IList<FieldWithIssue> fieldUidErrorList,
            IList<FieldWithIssue> warningFields,
            bool canComplete,
            String? onCompleteMessage,
            bool allowDiscard)?
        fieldsWithErrorResult,
    TResult? Function(IList<FieldWithIssue> fieldUidWarningList,
            bool canComplete, String? onCompleteMessage, bool allowDiscard)?
        fieldsWithWarningResult,
    TResult? Function(String? extraData, bool canComplete,
            String? onCompleteMessage, bool allowDiscard)?
        successfulResult,
    TResult? Function()? notSavedResult,
  }) {
    return fieldsWithWarningResult?.call(
        fieldUidWarningList, canComplete, onCompleteMessage, allowDiscard);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            IMap<String, String> mandatoryFields,
            IList<FieldWithIssue> errorFields,
            IList<FieldWithIssue> warningFields,
            bool canComplete,
            String? onCompleteMessage,
            bool allowDiscard)?
        missingMandatoryResult,
    TResult Function(
            IMap<String, String> mandatoryFields,
            IList<FieldWithIssue> fieldUidErrorList,
            IList<FieldWithIssue> warningFields,
            bool canComplete,
            String? onCompleteMessage,
            bool allowDiscard)?
        fieldsWithErrorResult,
    TResult Function(IList<FieldWithIssue> fieldUidWarningList,
            bool canComplete, String? onCompleteMessage, bool allowDiscard)?
        fieldsWithWarningResult,
    TResult Function(String? extraData, bool canComplete,
            String? onCompleteMessage, bool allowDiscard)?
        successfulResult,
    TResult Function()? notSavedResult,
    required TResult orElse(),
  }) {
    if (fieldsWithWarningResult != null) {
      return fieldsWithWarningResult(
          fieldUidWarningList, canComplete, onCompleteMessage, allowDiscard);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MissingMandatoryResult value)
        missingMandatoryResult,
    required TResult Function(FieldsWithErrorResult value)
        fieldsWithErrorResult,
    required TResult Function(FieldsWithWarningResult value)
        fieldsWithWarningResult,
    required TResult Function(SuccessfulResult value) successfulResult,
    required TResult Function(NotSavedResult value) notSavedResult,
  }) {
    return fieldsWithWarningResult(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MissingMandatoryResult value)? missingMandatoryResult,
    TResult? Function(FieldsWithErrorResult value)? fieldsWithErrorResult,
    TResult? Function(FieldsWithWarningResult value)? fieldsWithWarningResult,
    TResult? Function(SuccessfulResult value)? successfulResult,
    TResult? Function(NotSavedResult value)? notSavedResult,
  }) {
    return fieldsWithWarningResult?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MissingMandatoryResult value)? missingMandatoryResult,
    TResult Function(FieldsWithErrorResult value)? fieldsWithErrorResult,
    TResult Function(FieldsWithWarningResult value)? fieldsWithWarningResult,
    TResult Function(SuccessfulResult value)? successfulResult,
    TResult Function(NotSavedResult value)? notSavedResult,
    required TResult orElse(),
  }) {
    if (fieldsWithWarningResult != null) {
      return fieldsWithWarningResult(this);
    }
    return orElse();
  }
}

abstract class FieldsWithWarningResult implements DataIntegrityCheckResult {
  const factory FieldsWithWarningResult(
      {required final IList<FieldWithIssue> fieldUidWarningList,
      final bool canComplete,
      final String? onCompleteMessage,
      final bool allowDiscard}) = _$FieldsWithWarningResultImpl;

  IList<FieldWithIssue> get fieldUidWarningList; // override
  bool get canComplete;
  String? get onCompleteMessage;
  bool get allowDiscard;
  @JsonKey(ignore: true)
  _$$FieldsWithWarningResultImplCopyWith<_$FieldsWithWarningResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessfulResultImplCopyWith<$Res> {
  factory _$$SuccessfulResultImplCopyWith(_$SuccessfulResultImpl value,
          $Res Function(_$SuccessfulResultImpl) then) =
      __$$SuccessfulResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String? extraData,
      bool canComplete,
      String? onCompleteMessage,
      bool allowDiscard});
}

/// @nodoc
class __$$SuccessfulResultImplCopyWithImpl<$Res>
    extends _$DataIntegrityCheckResultCopyWithImpl<$Res, _$SuccessfulResultImpl>
    implements _$$SuccessfulResultImplCopyWith<$Res> {
  __$$SuccessfulResultImplCopyWithImpl(_$SuccessfulResultImpl _value,
      $Res Function(_$SuccessfulResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extraData = freezed,
    Object? canComplete = null,
    Object? onCompleteMessage = freezed,
    Object? allowDiscard = null,
  }) {
    return _then(_$SuccessfulResultImpl(
      extraData: freezed == extraData
          ? _value.extraData
          : extraData // ignore: cast_nullable_to_non_nullable
              as String?,
      canComplete: null == canComplete
          ? _value.canComplete
          : canComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      onCompleteMessage: freezed == onCompleteMessage
          ? _value.onCompleteMessage
          : onCompleteMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      allowDiscard: null == allowDiscard
          ? _value.allowDiscard
          : allowDiscard // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SuccessfulResultImpl
    with DiagnosticableTreeMixin
    implements SuccessfulResult {
  const _$SuccessfulResultImpl(
      {this.extraData,
      this.canComplete = false,
      this.onCompleteMessage,
      this.allowDiscard = false});

  @override
  final String? extraData;
// override
  @override
  @JsonKey()
  final bool canComplete;
  @override
  final String? onCompleteMessage;
  @override
  @JsonKey()
  final bool allowDiscard;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DataIntegrityCheckResult.successfulResult(extraData: $extraData, canComplete: $canComplete, onCompleteMessage: $onCompleteMessage, allowDiscard: $allowDiscard)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'DataIntegrityCheckResult.successfulResult'))
      ..add(DiagnosticsProperty('extraData', extraData))
      ..add(DiagnosticsProperty('canComplete', canComplete))
      ..add(DiagnosticsProperty('onCompleteMessage', onCompleteMessage))
      ..add(DiagnosticsProperty('allowDiscard', allowDiscard));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessfulResultImpl &&
            (identical(other.extraData, extraData) ||
                other.extraData == extraData) &&
            (identical(other.canComplete, canComplete) ||
                other.canComplete == canComplete) &&
            (identical(other.onCompleteMessage, onCompleteMessage) ||
                other.onCompleteMessage == onCompleteMessage) &&
            (identical(other.allowDiscard, allowDiscard) ||
                other.allowDiscard == allowDiscard));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, extraData, canComplete, onCompleteMessage, allowDiscard);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessfulResultImplCopyWith<_$SuccessfulResultImpl> get copyWith =>
      __$$SuccessfulResultImplCopyWithImpl<_$SuccessfulResultImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            IMap<String, String> mandatoryFields,
            IList<FieldWithIssue> errorFields,
            IList<FieldWithIssue> warningFields,
            bool canComplete,
            String? onCompleteMessage,
            bool allowDiscard)
        missingMandatoryResult,
    required TResult Function(
            IMap<String, String> mandatoryFields,
            IList<FieldWithIssue> fieldUidErrorList,
            IList<FieldWithIssue> warningFields,
            bool canComplete,
            String? onCompleteMessage,
            bool allowDiscard)
        fieldsWithErrorResult,
    required TResult Function(IList<FieldWithIssue> fieldUidWarningList,
            bool canComplete, String? onCompleteMessage, bool allowDiscard)
        fieldsWithWarningResult,
    required TResult Function(String? extraData, bool canComplete,
            String? onCompleteMessage, bool allowDiscard)
        successfulResult,
    required TResult Function() notSavedResult,
  }) {
    return successfulResult(
        extraData, canComplete, onCompleteMessage, allowDiscard);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            IMap<String, String> mandatoryFields,
            IList<FieldWithIssue> errorFields,
            IList<FieldWithIssue> warningFields,
            bool canComplete,
            String? onCompleteMessage,
            bool allowDiscard)?
        missingMandatoryResult,
    TResult? Function(
            IMap<String, String> mandatoryFields,
            IList<FieldWithIssue> fieldUidErrorList,
            IList<FieldWithIssue> warningFields,
            bool canComplete,
            String? onCompleteMessage,
            bool allowDiscard)?
        fieldsWithErrorResult,
    TResult? Function(IList<FieldWithIssue> fieldUidWarningList,
            bool canComplete, String? onCompleteMessage, bool allowDiscard)?
        fieldsWithWarningResult,
    TResult? Function(String? extraData, bool canComplete,
            String? onCompleteMessage, bool allowDiscard)?
        successfulResult,
    TResult? Function()? notSavedResult,
  }) {
    return successfulResult?.call(
        extraData, canComplete, onCompleteMessage, allowDiscard);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            IMap<String, String> mandatoryFields,
            IList<FieldWithIssue> errorFields,
            IList<FieldWithIssue> warningFields,
            bool canComplete,
            String? onCompleteMessage,
            bool allowDiscard)?
        missingMandatoryResult,
    TResult Function(
            IMap<String, String> mandatoryFields,
            IList<FieldWithIssue> fieldUidErrorList,
            IList<FieldWithIssue> warningFields,
            bool canComplete,
            String? onCompleteMessage,
            bool allowDiscard)?
        fieldsWithErrorResult,
    TResult Function(IList<FieldWithIssue> fieldUidWarningList,
            bool canComplete, String? onCompleteMessage, bool allowDiscard)?
        fieldsWithWarningResult,
    TResult Function(String? extraData, bool canComplete,
            String? onCompleteMessage, bool allowDiscard)?
        successfulResult,
    TResult Function()? notSavedResult,
    required TResult orElse(),
  }) {
    if (successfulResult != null) {
      return successfulResult(
          extraData, canComplete, onCompleteMessage, allowDiscard);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MissingMandatoryResult value)
        missingMandatoryResult,
    required TResult Function(FieldsWithErrorResult value)
        fieldsWithErrorResult,
    required TResult Function(FieldsWithWarningResult value)
        fieldsWithWarningResult,
    required TResult Function(SuccessfulResult value) successfulResult,
    required TResult Function(NotSavedResult value) notSavedResult,
  }) {
    return successfulResult(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MissingMandatoryResult value)? missingMandatoryResult,
    TResult? Function(FieldsWithErrorResult value)? fieldsWithErrorResult,
    TResult? Function(FieldsWithWarningResult value)? fieldsWithWarningResult,
    TResult? Function(SuccessfulResult value)? successfulResult,
    TResult? Function(NotSavedResult value)? notSavedResult,
  }) {
    return successfulResult?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MissingMandatoryResult value)? missingMandatoryResult,
    TResult Function(FieldsWithErrorResult value)? fieldsWithErrorResult,
    TResult Function(FieldsWithWarningResult value)? fieldsWithWarningResult,
    TResult Function(SuccessfulResult value)? successfulResult,
    TResult Function(NotSavedResult value)? notSavedResult,
    required TResult orElse(),
  }) {
    if (successfulResult != null) {
      return successfulResult(this);
    }
    return orElse();
  }
}

abstract class SuccessfulResult implements DataIntegrityCheckResult {
  const factory SuccessfulResult(
      {final String? extraData,
      final bool canComplete,
      final String? onCompleteMessage,
      final bool allowDiscard}) = _$SuccessfulResultImpl;

  String? get extraData; // override
  bool get canComplete;
  String? get onCompleteMessage;
  bool get allowDiscard;
  @JsonKey(ignore: true)
  _$$SuccessfulResultImplCopyWith<_$SuccessfulResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotSavedResultImplCopyWith<$Res> {
  factory _$$NotSavedResultImplCopyWith(_$NotSavedResultImpl value,
          $Res Function(_$NotSavedResultImpl) then) =
      __$$NotSavedResultImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotSavedResultImplCopyWithImpl<$Res>
    extends _$DataIntegrityCheckResultCopyWithImpl<$Res, _$NotSavedResultImpl>
    implements _$$NotSavedResultImplCopyWith<$Res> {
  __$$NotSavedResultImplCopyWithImpl(
      _$NotSavedResultImpl _value, $Res Function(_$NotSavedResultImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NotSavedResultImpl
    with DiagnosticableTreeMixin
    implements NotSavedResult {
  const _$NotSavedResultImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DataIntegrityCheckResult.notSavedResult()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty('type', 'DataIntegrityCheckResult.notSavedResult'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NotSavedResultImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            IMap<String, String> mandatoryFields,
            IList<FieldWithIssue> errorFields,
            IList<FieldWithIssue> warningFields,
            bool canComplete,
            String? onCompleteMessage,
            bool allowDiscard)
        missingMandatoryResult,
    required TResult Function(
            IMap<String, String> mandatoryFields,
            IList<FieldWithIssue> fieldUidErrorList,
            IList<FieldWithIssue> warningFields,
            bool canComplete,
            String? onCompleteMessage,
            bool allowDiscard)
        fieldsWithErrorResult,
    required TResult Function(IList<FieldWithIssue> fieldUidWarningList,
            bool canComplete, String? onCompleteMessage, bool allowDiscard)
        fieldsWithWarningResult,
    required TResult Function(String? extraData, bool canComplete,
            String? onCompleteMessage, bool allowDiscard)
        successfulResult,
    required TResult Function() notSavedResult,
  }) {
    return notSavedResult();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            IMap<String, String> mandatoryFields,
            IList<FieldWithIssue> errorFields,
            IList<FieldWithIssue> warningFields,
            bool canComplete,
            String? onCompleteMessage,
            bool allowDiscard)?
        missingMandatoryResult,
    TResult? Function(
            IMap<String, String> mandatoryFields,
            IList<FieldWithIssue> fieldUidErrorList,
            IList<FieldWithIssue> warningFields,
            bool canComplete,
            String? onCompleteMessage,
            bool allowDiscard)?
        fieldsWithErrorResult,
    TResult? Function(IList<FieldWithIssue> fieldUidWarningList,
            bool canComplete, String? onCompleteMessage, bool allowDiscard)?
        fieldsWithWarningResult,
    TResult? Function(String? extraData, bool canComplete,
            String? onCompleteMessage, bool allowDiscard)?
        successfulResult,
    TResult? Function()? notSavedResult,
  }) {
    return notSavedResult?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            IMap<String, String> mandatoryFields,
            IList<FieldWithIssue> errorFields,
            IList<FieldWithIssue> warningFields,
            bool canComplete,
            String? onCompleteMessage,
            bool allowDiscard)?
        missingMandatoryResult,
    TResult Function(
            IMap<String, String> mandatoryFields,
            IList<FieldWithIssue> fieldUidErrorList,
            IList<FieldWithIssue> warningFields,
            bool canComplete,
            String? onCompleteMessage,
            bool allowDiscard)?
        fieldsWithErrorResult,
    TResult Function(IList<FieldWithIssue> fieldUidWarningList,
            bool canComplete, String? onCompleteMessage, bool allowDiscard)?
        fieldsWithWarningResult,
    TResult Function(String? extraData, bool canComplete,
            String? onCompleteMessage, bool allowDiscard)?
        successfulResult,
    TResult Function()? notSavedResult,
    required TResult orElse(),
  }) {
    if (notSavedResult != null) {
      return notSavedResult();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MissingMandatoryResult value)
        missingMandatoryResult,
    required TResult Function(FieldsWithErrorResult value)
        fieldsWithErrorResult,
    required TResult Function(FieldsWithWarningResult value)
        fieldsWithWarningResult,
    required TResult Function(SuccessfulResult value) successfulResult,
    required TResult Function(NotSavedResult value) notSavedResult,
  }) {
    return notSavedResult(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MissingMandatoryResult value)? missingMandatoryResult,
    TResult? Function(FieldsWithErrorResult value)? fieldsWithErrorResult,
    TResult? Function(FieldsWithWarningResult value)? fieldsWithWarningResult,
    TResult? Function(SuccessfulResult value)? successfulResult,
    TResult? Function(NotSavedResult value)? notSavedResult,
  }) {
    return notSavedResult?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MissingMandatoryResult value)? missingMandatoryResult,
    TResult Function(FieldsWithErrorResult value)? fieldsWithErrorResult,
    TResult Function(FieldsWithWarningResult value)? fieldsWithWarningResult,
    TResult Function(SuccessfulResult value)? successfulResult,
    TResult Function(NotSavedResult value)? notSavedResult,
    required TResult orElse(),
  }) {
    if (notSavedResult != null) {
      return notSavedResult(this);
    }
    return orElse();
  }
}

abstract class NotSavedResult implements DataIntegrityCheckResult {
  const factory NotSavedResult() = _$NotSavedResultImpl;
}
