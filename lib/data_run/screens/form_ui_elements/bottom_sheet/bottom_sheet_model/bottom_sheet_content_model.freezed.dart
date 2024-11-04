// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bottom_sheet_content_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DialogContentModel {
  String get title => throw _privateConstructorUsedError;
  String get subtitle => throw _privateConstructorUsedError;
  IconData get icon => throw _privateConstructorUsedError;
  BottomSheetBodyModel get body => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DialogContentModelCopyWith<DialogContentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DialogContentModelCopyWith<$Res> {
  factory $DialogContentModelCopyWith(
          DialogContentModel value, $Res Function(DialogContentModel) then) =
      _$DialogContentModelCopyWithImpl<$Res, DialogContentModel>;
  @useResult
  $Res call(
      {String title,
      String subtitle,
      IconData icon,
      BottomSheetBodyModel body});

  $BottomSheetBodyModelCopyWith<$Res> get body;
}

/// @nodoc
class _$DialogContentModelCopyWithImpl<$Res, $Val extends DialogContentModel>
    implements $DialogContentModelCopyWith<$Res> {
  _$DialogContentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? subtitle = null,
    Object? icon = null,
    Object? body = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as BottomSheetBodyModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BottomSheetBodyModelCopyWith<$Res> get body {
    return $BottomSheetBodyModelCopyWith<$Res>(_value.body, (value) {
      return _then(_value.copyWith(body: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DialogContentModelImplCopyWith<$Res>
    implements $DialogContentModelCopyWith<$Res> {
  factory _$$DialogContentModelImplCopyWith(_$DialogContentModelImpl value,
          $Res Function(_$DialogContentModelImpl) then) =
      __$$DialogContentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String subtitle,
      IconData icon,
      BottomSheetBodyModel body});

  @override
  $BottomSheetBodyModelCopyWith<$Res> get body;
}

/// @nodoc
class __$$DialogContentModelImplCopyWithImpl<$Res>
    extends _$DialogContentModelCopyWithImpl<$Res, _$DialogContentModelImpl>
    implements _$$DialogContentModelImplCopyWith<$Res> {
  __$$DialogContentModelImplCopyWithImpl(_$DialogContentModelImpl _value,
      $Res Function(_$DialogContentModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? subtitle = null,
    Object? icon = null,
    Object? body = null,
  }) {
    return _then(_$DialogContentModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as BottomSheetBodyModel,
    ));
  }
}

/// @nodoc

class _$DialogContentModelImpl implements _DialogContentModel {
  const _$DialogContentModelImpl(
      {required this.title,
      required this.subtitle,
      required this.icon,
      required this.body});

  @override
  final String title;
  @override
  final String subtitle;
  @override
  final IconData icon;
  @override
  final BottomSheetBodyModel body;

  @override
  String toString() {
    return 'DialogContentModel(title: $title, subtitle: $subtitle, icon: $icon, body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DialogContentModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.body, body) || other.body == body));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, subtitle, icon, body);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DialogContentModelImplCopyWith<_$DialogContentModelImpl> get copyWith =>
      __$$DialogContentModelImplCopyWithImpl<_$DialogContentModelImpl>(
          this, _$identity);
}

abstract class _DialogContentModel implements DialogContentModel {
  const factory _DialogContentModel(
      {required final String title,
      required final String subtitle,
      required final IconData icon,
      required final BottomSheetBodyModel body}) = _$DialogContentModelImpl;

  @override
  String get title;
  @override
  String get subtitle;
  @override
  IconData get icon;
  @override
  BottomSheetBodyModel get body;
  @override
  @JsonKey(ignore: true)
  _$$DialogContentModelImplCopyWith<_$DialogContentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BottomSheetBodyModel {
  String? get message => throw _privateConstructorUsedError;
  Map<String, List<FieldWithIssue<dynamic>>> get fieldsWithIssues =>
      throw _privateConstructorUsedError;
  Map<String, List<FieldWithIssue<dynamic>>> get allFields =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BottomSheetBodyModelCopyWith<BottomSheetBodyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BottomSheetBodyModelCopyWith<$Res> {
  factory $BottomSheetBodyModelCopyWith(BottomSheetBodyModel value,
          $Res Function(BottomSheetBodyModel) then) =
      _$BottomSheetBodyModelCopyWithImpl<$Res, BottomSheetBodyModel>;
  @useResult
  $Res call(
      {String? message,
      Map<String, List<FieldWithIssue<dynamic>>> fieldsWithIssues,
      Map<String, List<FieldWithIssue<dynamic>>> allFields});
}

/// @nodoc
class _$BottomSheetBodyModelCopyWithImpl<$Res,
        $Val extends BottomSheetBodyModel>
    implements $BottomSheetBodyModelCopyWith<$Res> {
  _$BottomSheetBodyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? fieldsWithIssues = null,
    Object? allFields = null,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      fieldsWithIssues: null == fieldsWithIssues
          ? _value.fieldsWithIssues
          : fieldsWithIssues // ignore: cast_nullable_to_non_nullable
              as Map<String, List<FieldWithIssue<dynamic>>>,
      allFields: null == allFields
          ? _value.allFields
          : allFields // ignore: cast_nullable_to_non_nullable
              as Map<String, List<FieldWithIssue<dynamic>>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BottomSheetBodyModelImplCopyWith<$Res>
    implements $BottomSheetBodyModelCopyWith<$Res> {
  factory _$$BottomSheetBodyModelImplCopyWith(_$BottomSheetBodyModelImpl value,
          $Res Function(_$BottomSheetBodyModelImpl) then) =
      __$$BottomSheetBodyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? message,
      Map<String, List<FieldWithIssue<dynamic>>> fieldsWithIssues,
      Map<String, List<FieldWithIssue<dynamic>>> allFields});
}

/// @nodoc
class __$$BottomSheetBodyModelImplCopyWithImpl<$Res>
    extends _$BottomSheetBodyModelCopyWithImpl<$Res, _$BottomSheetBodyModelImpl>
    implements _$$BottomSheetBodyModelImplCopyWith<$Res> {
  __$$BottomSheetBodyModelImplCopyWithImpl(_$BottomSheetBodyModelImpl _value,
      $Res Function(_$BottomSheetBodyModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? fieldsWithIssues = null,
    Object? allFields = null,
  }) {
    return _then(_$BottomSheetBodyModelImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      fieldsWithIssues: null == fieldsWithIssues
          ? _value._fieldsWithIssues
          : fieldsWithIssues // ignore: cast_nullable_to_non_nullable
              as Map<String, List<FieldWithIssue<dynamic>>>,
      allFields: null == allFields
          ? _value._allFields
          : allFields // ignore: cast_nullable_to_non_nullable
              as Map<String, List<FieldWithIssue<dynamic>>>,
    ));
  }
}

/// @nodoc

class _$BottomSheetBodyModelImpl extends _BottomSheetBodyModel {
  const _$BottomSheetBodyModelImpl(
      {this.message,
      required final Map<String, List<FieldWithIssue<dynamic>>>
          fieldsWithIssues,
      required final Map<String, List<FieldWithIssue<dynamic>>> allFields})
      : _fieldsWithIssues = fieldsWithIssues,
        _allFields = allFields,
        super._();

  @override
  final String? message;
  final Map<String, List<FieldWithIssue<dynamic>>> _fieldsWithIssues;
  @override
  Map<String, List<FieldWithIssue<dynamic>>> get fieldsWithIssues {
    if (_fieldsWithIssues is EqualUnmodifiableMapView) return _fieldsWithIssues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_fieldsWithIssues);
  }

  final Map<String, List<FieldWithIssue<dynamic>>> _allFields;
  @override
  Map<String, List<FieldWithIssue<dynamic>>> get allFields {
    if (_allFields is EqualUnmodifiableMapView) return _allFields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_allFields);
  }

  @override
  String toString() {
    return 'BottomSheetBodyModel(message: $message, fieldsWithIssues: $fieldsWithIssues, allFields: $allFields)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BottomSheetBodyModelImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._fieldsWithIssues, _fieldsWithIssues) &&
            const DeepCollectionEquality()
                .equals(other._allFields, _allFields));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      message,
      const DeepCollectionEquality().hash(_fieldsWithIssues),
      const DeepCollectionEquality().hash(_allFields));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BottomSheetBodyModelImplCopyWith<_$BottomSheetBodyModelImpl>
      get copyWith =>
          __$$BottomSheetBodyModelImplCopyWithImpl<_$BottomSheetBodyModelImpl>(
              this, _$identity);
}

abstract class _BottomSheetBodyModel extends BottomSheetBodyModel {
  const factory _BottomSheetBodyModel(
      {final String? message,
      required final Map<String, List<FieldWithIssue<dynamic>>>
          fieldsWithIssues,
      required final Map<String, List<FieldWithIssue<dynamic>>>
          allFields}) = _$BottomSheetBodyModelImpl;
  const _BottomSheetBodyModel._() : super._();

  @override
  String? get message;
  @override
  Map<String, List<FieldWithIssue<dynamic>>> get fieldsWithIssues;
  @override
  Map<String, List<FieldWithIssue<dynamic>>> get allFields;
  @override
  @JsonKey(ignore: true)
  _$$BottomSheetBodyModelImplCopyWith<_$BottomSheetBodyModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FieldWithIssue<T> {
  String? get parentPath => throw _privateConstructorUsedError;
  String? get parentLabel => throw _privateConstructorUsedError;
  ParentType? get parentType => throw _privateConstructorUsedError;
  String get fieldName => throw _privateConstructorUsedError;
  String get fieldLabel => throw _privateConstructorUsedError;
  T? get value => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FieldWithIssueCopyWith<T, FieldWithIssue<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FieldWithIssueCopyWith<T, $Res> {
  factory $FieldWithIssueCopyWith(
          FieldWithIssue<T> value, $Res Function(FieldWithIssue<T>) then) =
      _$FieldWithIssueCopyWithImpl<T, $Res, FieldWithIssue<T>>;
  @useResult
  $Res call(
      {String? parentPath,
      String? parentLabel,
      ParentType? parentType,
      String fieldName,
      String fieldLabel,
      T? value,
      String? message});
}

/// @nodoc
class _$FieldWithIssueCopyWithImpl<T, $Res, $Val extends FieldWithIssue<T>>
    implements $FieldWithIssueCopyWith<T, $Res> {
  _$FieldWithIssueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parentPath = freezed,
    Object? parentLabel = freezed,
    Object? parentType = freezed,
    Object? fieldName = null,
    Object? fieldLabel = null,
    Object? value = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      parentPath: freezed == parentPath
          ? _value.parentPath
          : parentPath // ignore: cast_nullable_to_non_nullable
              as String?,
      parentLabel: freezed == parentLabel
          ? _value.parentLabel
          : parentLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      parentType: freezed == parentType
          ? _value.parentType
          : parentType // ignore: cast_nullable_to_non_nullable
              as ParentType?,
      fieldName: null == fieldName
          ? _value.fieldName
          : fieldName // ignore: cast_nullable_to_non_nullable
              as String,
      fieldLabel: null == fieldLabel
          ? _value.fieldLabel
          : fieldLabel // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FieldWithIssueImplCopyWith<T, $Res>
    implements $FieldWithIssueCopyWith<T, $Res> {
  factory _$$FieldWithIssueImplCopyWith(_$FieldWithIssueImpl<T> value,
          $Res Function(_$FieldWithIssueImpl<T>) then) =
      __$$FieldWithIssueImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {String? parentPath,
      String? parentLabel,
      ParentType? parentType,
      String fieldName,
      String fieldLabel,
      T? value,
      String? message});
}

/// @nodoc
class __$$FieldWithIssueImplCopyWithImpl<T, $Res>
    extends _$FieldWithIssueCopyWithImpl<T, $Res, _$FieldWithIssueImpl<T>>
    implements _$$FieldWithIssueImplCopyWith<T, $Res> {
  __$$FieldWithIssueImplCopyWithImpl(_$FieldWithIssueImpl<T> _value,
      $Res Function(_$FieldWithIssueImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parentPath = freezed,
    Object? parentLabel = freezed,
    Object? parentType = freezed,
    Object? fieldName = null,
    Object? fieldLabel = null,
    Object? value = freezed,
    Object? message = freezed,
  }) {
    return _then(_$FieldWithIssueImpl<T>(
      parentPath: freezed == parentPath
          ? _value.parentPath
          : parentPath // ignore: cast_nullable_to_non_nullable
              as String?,
      parentLabel: freezed == parentLabel
          ? _value.parentLabel
          : parentLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      parentType: freezed == parentType
          ? _value.parentType
          : parentType // ignore: cast_nullable_to_non_nullable
              as ParentType?,
      fieldName: null == fieldName
          ? _value.fieldName
          : fieldName // ignore: cast_nullable_to_non_nullable
              as String,
      fieldLabel: null == fieldLabel
          ? _value.fieldLabel
          : fieldLabel // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FieldWithIssueImpl<T> extends _FieldWithIssue<T> {
  const _$FieldWithIssueImpl(
      {this.parentPath,
      this.parentLabel,
      this.parentType,
      required this.fieldName,
      required this.fieldLabel,
      this.value,
      this.message})
      : super._();

  @override
  final String? parentPath;
  @override
  final String? parentLabel;
  @override
  final ParentType? parentType;
  @override
  final String fieldName;
  @override
  final String fieldLabel;
  @override
  final T? value;
  @override
  final String? message;

  @override
  String toString() {
    return 'FieldWithIssue<$T>(parentPath: $parentPath, parentLabel: $parentLabel, parentType: $parentType, fieldName: $fieldName, fieldLabel: $fieldLabel, value: $value, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FieldWithIssueImpl<T> &&
            (identical(other.parentPath, parentPath) ||
                other.parentPath == parentPath) &&
            (identical(other.parentLabel, parentLabel) ||
                other.parentLabel == parentLabel) &&
            (identical(other.parentType, parentType) ||
                other.parentType == parentType) &&
            (identical(other.fieldName, fieldName) ||
                other.fieldName == fieldName) &&
            (identical(other.fieldLabel, fieldLabel) ||
                other.fieldLabel == fieldLabel) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      parentPath,
      parentLabel,
      parentType,
      fieldName,
      fieldLabel,
      const DeepCollectionEquality().hash(value),
      message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FieldWithIssueImplCopyWith<T, _$FieldWithIssueImpl<T>> get copyWith =>
      __$$FieldWithIssueImplCopyWithImpl<T, _$FieldWithIssueImpl<T>>(
          this, _$identity);
}

abstract class _FieldWithIssue<T> extends FieldWithIssue<T> {
  const factory _FieldWithIssue(
      {final String? parentPath,
      final String? parentLabel,
      final ParentType? parentType,
      required final String fieldName,
      required final String fieldLabel,
      final T? value,
      final String? message}) = _$FieldWithIssueImpl<T>;
  const _FieldWithIssue._() : super._();

  @override
  String? get parentPath;
  @override
  String? get parentLabel;
  @override
  ParentType? get parentType;
  @override
  String get fieldName;
  @override
  String get fieldLabel;
  @override
  T? get value;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$FieldWithIssueImplCopyWith<T, _$FieldWithIssueImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
