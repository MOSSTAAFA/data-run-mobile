// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_item_with_value.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FormItemWithValue<T> {
  String? get parent => throw _privateConstructorUsedError;
  String get fieldPath => throw _privateConstructorUsedError;
  String get fieldName => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? parent, String fieldPath,
            String fieldName, String? message, T? value)
        fieldWithValue,
    required TResult Function(
            String? parent,
            String fieldPath,
            String fieldName,
            String? message,
            List<_FieldWithValue<T>> fieldWithValueList)
        tableRowWithValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? parent, String fieldPath, String fieldName,
            String? message, T? value)?
        fieldWithValue,
    TResult? Function(String? parent, String fieldPath, String fieldName,
            String? message, List<_FieldWithValue<T>> fieldWithValueList)?
        tableRowWithValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? parent, String fieldPath, String fieldName,
            String? message, T? value)?
        fieldWithValue,
    TResult Function(String? parent, String fieldPath, String fieldName,
            String? message, List<_FieldWithValue<T>> fieldWithValueList)?
        tableRowWithValue,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FieldWithValue<T> value) fieldWithValue,
    required TResult Function(_DataRowWithValue<T> value) tableRowWithValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FieldWithValue<T> value)? fieldWithValue,
    TResult? Function(_DataRowWithValue<T> value)? tableRowWithValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FieldWithValue<T> value)? fieldWithValue,
    TResult Function(_DataRowWithValue<T> value)? tableRowWithValue,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FormItemWithValueCopyWith<T, FormItemWithValue<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormItemWithValueCopyWith<T, $Res> {
  factory $FormItemWithValueCopyWith(FormItemWithValue<T> value,
          $Res Function(FormItemWithValue<T>) then) =
      _$FormItemWithValueCopyWithImpl<T, $Res, FormItemWithValue<T>>;
  @useResult
  $Res call(
      {String? parent, String fieldPath, String fieldName, String? message});
}

/// @nodoc
class _$FormItemWithValueCopyWithImpl<T, $Res,
        $Val extends FormItemWithValue<T>>
    implements $FormItemWithValueCopyWith<T, $Res> {
  _$FormItemWithValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parent = freezed,
    Object? fieldPath = null,
    Object? fieldName = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as String?,
      fieldPath: null == fieldPath
          ? _value.fieldPath
          : fieldPath // ignore: cast_nullable_to_non_nullable
              as String,
      fieldName: null == fieldName
          ? _value.fieldName
          : fieldName // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FieldWithValueImplCopyWith<T, $Res>
    implements $FormItemWithValueCopyWith<T, $Res> {
  factory _$$FieldWithValueImplCopyWith(_$FieldWithValueImpl<T> value,
          $Res Function(_$FieldWithValueImpl<T>) then) =
      __$$FieldWithValueImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {String? parent,
      String fieldPath,
      String fieldName,
      String? message,
      T? value});
}

/// @nodoc
class __$$FieldWithValueImplCopyWithImpl<T, $Res>
    extends _$FormItemWithValueCopyWithImpl<T, $Res, _$FieldWithValueImpl<T>>
    implements _$$FieldWithValueImplCopyWith<T, $Res> {
  __$$FieldWithValueImplCopyWithImpl(_$FieldWithValueImpl<T> _value,
      $Res Function(_$FieldWithValueImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parent = freezed,
    Object? fieldPath = null,
    Object? fieldName = null,
    Object? message = freezed,
    Object? value = freezed,
  }) {
    return _then(_$FieldWithValueImpl<T>(
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as String?,
      fieldPath: null == fieldPath
          ? _value.fieldPath
          : fieldPath // ignore: cast_nullable_to_non_nullable
              as String,
      fieldName: null == fieldName
          ? _value.fieldName
          : fieldName // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$FieldWithValueImpl<T> implements _FieldWithValue<T> {
  _$FieldWithValueImpl(
      {this.parent,
      required this.fieldPath,
      required this.fieldName,
      this.message,
      this.value});

  @override
  final String? parent;
  @override
  final String fieldPath;
  @override
  final String fieldName;
  @override
  final String? message;
  @override
  final T? value;

  @override
  String toString() {
    return 'FormItemWithValue<$T>.fieldWithValue(parent: $parent, fieldPath: $fieldPath, fieldName: $fieldName, message: $message, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FieldWithValueImpl<T> &&
            (identical(other.parent, parent) || other.parent == parent) &&
            (identical(other.fieldPath, fieldPath) ||
                other.fieldPath == fieldPath) &&
            (identical(other.fieldName, fieldName) ||
                other.fieldName == fieldName) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, fieldPath, fieldName,
      message, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FieldWithValueImplCopyWith<T, _$FieldWithValueImpl<T>> get copyWith =>
      __$$FieldWithValueImplCopyWithImpl<T, _$FieldWithValueImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? parent, String fieldPath,
            String fieldName, String? message, T? value)
        fieldWithValue,
    required TResult Function(
            String? parent,
            String fieldPath,
            String fieldName,
            String? message,
            List<_FieldWithValue<T>> fieldWithValueList)
        tableRowWithValue,
  }) {
    return fieldWithValue(parent, fieldPath, fieldName, message, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? parent, String fieldPath, String fieldName,
            String? message, T? value)?
        fieldWithValue,
    TResult? Function(String? parent, String fieldPath, String fieldName,
            String? message, List<_FieldWithValue<T>> fieldWithValueList)?
        tableRowWithValue,
  }) {
    return fieldWithValue?.call(parent, fieldPath, fieldName, message, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? parent, String fieldPath, String fieldName,
            String? message, T? value)?
        fieldWithValue,
    TResult Function(String? parent, String fieldPath, String fieldName,
            String? message, List<_FieldWithValue<T>> fieldWithValueList)?
        tableRowWithValue,
    required TResult orElse(),
  }) {
    if (fieldWithValue != null) {
      return fieldWithValue(parent, fieldPath, fieldName, message, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FieldWithValue<T> value) fieldWithValue,
    required TResult Function(_DataRowWithValue<T> value) tableRowWithValue,
  }) {
    return fieldWithValue(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FieldWithValue<T> value)? fieldWithValue,
    TResult? Function(_DataRowWithValue<T> value)? tableRowWithValue,
  }) {
    return fieldWithValue?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FieldWithValue<T> value)? fieldWithValue,
    TResult Function(_DataRowWithValue<T> value)? tableRowWithValue,
    required TResult orElse(),
  }) {
    if (fieldWithValue != null) {
      return fieldWithValue(this);
    }
    return orElse();
  }
}

abstract class _FieldWithValue<T> implements FormItemWithValue<T> {
  factory _FieldWithValue(
      {final String? parent,
      required final String fieldPath,
      required final String fieldName,
      final String? message,
      final T? value}) = _$FieldWithValueImpl<T>;

  @override
  String? get parent;
  @override
  String get fieldPath;
  @override
  String get fieldName;
  @override
  String? get message;
  T? get value;
  @override
  @JsonKey(ignore: true)
  _$$FieldWithValueImplCopyWith<T, _$FieldWithValueImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DataRowWithValueImplCopyWith<T, $Res>
    implements $FormItemWithValueCopyWith<T, $Res> {
  factory _$$DataRowWithValueImplCopyWith(_$DataRowWithValueImpl<T> value,
          $Res Function(_$DataRowWithValueImpl<T>) then) =
      __$$DataRowWithValueImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {String? parent,
      String fieldPath,
      String fieldName,
      String? message,
      List<_FieldWithValue<T>> fieldWithValueList});
}

/// @nodoc
class __$$DataRowWithValueImplCopyWithImpl<T, $Res>
    extends _$FormItemWithValueCopyWithImpl<T, $Res, _$DataRowWithValueImpl<T>>
    implements _$$DataRowWithValueImplCopyWith<T, $Res> {
  __$$DataRowWithValueImplCopyWithImpl(_$DataRowWithValueImpl<T> _value,
      $Res Function(_$DataRowWithValueImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parent = freezed,
    Object? fieldPath = null,
    Object? fieldName = null,
    Object? message = freezed,
    Object? fieldWithValueList = null,
  }) {
    return _then(_$DataRowWithValueImpl<T>(
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as String?,
      fieldPath: null == fieldPath
          ? _value.fieldPath
          : fieldPath // ignore: cast_nullable_to_non_nullable
              as String,
      fieldName: null == fieldName
          ? _value.fieldName
          : fieldName // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      fieldWithValueList: null == fieldWithValueList
          ? _value._fieldWithValueList
          : fieldWithValueList // ignore: cast_nullable_to_non_nullable
              as List<_FieldWithValue<T>>,
    ));
  }
}

/// @nodoc

class _$DataRowWithValueImpl<T> implements _DataRowWithValue<T> {
  _$DataRowWithValueImpl(
      {this.parent,
      required this.fieldPath,
      required this.fieldName,
      this.message,
      final List<_FieldWithValue<T>> fieldWithValueList = const []})
      : _fieldWithValueList = fieldWithValueList;

  @override
  final String? parent;
  @override
  final String fieldPath;
  @override
  final String fieldName;
  @override
  final String? message;
  final List<_FieldWithValue<T>> _fieldWithValueList;
  @override
  @JsonKey()
  List<_FieldWithValue<T>> get fieldWithValueList {
    if (_fieldWithValueList is EqualUnmodifiableListView)
      return _fieldWithValueList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fieldWithValueList);
  }

  @override
  String toString() {
    return 'FormItemWithValue<$T>.tableRowWithValue(parent: $parent, fieldPath: $fieldPath, fieldName: $fieldName, message: $message, fieldWithValueList: $fieldWithValueList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataRowWithValueImpl<T> &&
            (identical(other.parent, parent) || other.parent == parent) &&
            (identical(other.fieldPath, fieldPath) ||
                other.fieldPath == fieldPath) &&
            (identical(other.fieldName, fieldName) ||
                other.fieldName == fieldName) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._fieldWithValueList, _fieldWithValueList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, fieldPath, fieldName,
      message, const DeepCollectionEquality().hash(_fieldWithValueList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataRowWithValueImplCopyWith<T, _$DataRowWithValueImpl<T>> get copyWith =>
      __$$DataRowWithValueImplCopyWithImpl<T, _$DataRowWithValueImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? parent, String fieldPath,
            String fieldName, String? message, T? value)
        fieldWithValue,
    required TResult Function(
            String? parent,
            String fieldPath,
            String fieldName,
            String? message,
            List<_FieldWithValue<T>> fieldWithValueList)
        tableRowWithValue,
  }) {
    return tableRowWithValue(
        parent, fieldPath, fieldName, message, fieldWithValueList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? parent, String fieldPath, String fieldName,
            String? message, T? value)?
        fieldWithValue,
    TResult? Function(String? parent, String fieldPath, String fieldName,
            String? message, List<_FieldWithValue<T>> fieldWithValueList)?
        tableRowWithValue,
  }) {
    return tableRowWithValue?.call(
        parent, fieldPath, fieldName, message, fieldWithValueList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? parent, String fieldPath, String fieldName,
            String? message, T? value)?
        fieldWithValue,
    TResult Function(String? parent, String fieldPath, String fieldName,
            String? message, List<_FieldWithValue<T>> fieldWithValueList)?
        tableRowWithValue,
    required TResult orElse(),
  }) {
    if (tableRowWithValue != null) {
      return tableRowWithValue(
          parent, fieldPath, fieldName, message, fieldWithValueList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FieldWithValue<T> value) fieldWithValue,
    required TResult Function(_DataRowWithValue<T> value) tableRowWithValue,
  }) {
    return tableRowWithValue(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FieldWithValue<T> value)? fieldWithValue,
    TResult? Function(_DataRowWithValue<T> value)? tableRowWithValue,
  }) {
    return tableRowWithValue?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FieldWithValue<T> value)? fieldWithValue,
    TResult Function(_DataRowWithValue<T> value)? tableRowWithValue,
    required TResult orElse(),
  }) {
    if (tableRowWithValue != null) {
      return tableRowWithValue(this);
    }
    return orElse();
  }
}

abstract class _DataRowWithValue<T> implements FormItemWithValue<T> {
  factory _DataRowWithValue(
          {final String? parent,
          required final String fieldPath,
          required final String fieldName,
          final String? message,
          final List<_FieldWithValue<T>> fieldWithValueList}) =
      _$DataRowWithValueImpl<T>;

  @override
  String? get parent;
  @override
  String get fieldPath;
  @override
  String get fieldName;
  @override
  String? get message;
  List<_FieldWithValue<T>> get fieldWithValueList;
  @override
  @JsonKey(ignore: true)
  _$$DataRowWithValueImplCopyWith<T, _$DataRowWithValueImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
