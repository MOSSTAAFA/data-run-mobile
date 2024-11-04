// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_content_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FormViewContentModel {
  String get title => throw _privateConstructorUsedError;
  String get subtitle => throw _privateConstructorUsedError;
  IconData get icon => throw _privateConstructorUsedError;
  FormViewBodyModel get body => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FormViewContentModelCopyWith<FormViewContentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormViewContentModelCopyWith<$Res> {
  factory $FormViewContentModelCopyWith(FormViewContentModel value,
          $Res Function(FormViewContentModel) then) =
      _$FormViewContentModelCopyWithImpl<$Res, FormViewContentModel>;
  @useResult
  $Res call(
      {String title, String subtitle, IconData icon, FormViewBodyModel body});

  $FormViewBodyModelCopyWith<$Res> get body;
}

/// @nodoc
class _$FormViewContentModelCopyWithImpl<$Res,
        $Val extends FormViewContentModel>
    implements $FormViewContentModelCopyWith<$Res> {
  _$FormViewContentModelCopyWithImpl(this._value, this._then);

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
              as FormViewBodyModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FormViewBodyModelCopyWith<$Res> get body {
    return $FormViewBodyModelCopyWith<$Res>(_value.body, (value) {
      return _then(_value.copyWith(body: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FormViewContentModelImplCopyWith<$Res>
    implements $FormViewContentModelCopyWith<$Res> {
  factory _$$FormViewContentModelImplCopyWith(_$FormViewContentModelImpl value,
          $Res Function(_$FormViewContentModelImpl) then) =
      __$$FormViewContentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title, String subtitle, IconData icon, FormViewBodyModel body});

  @override
  $FormViewBodyModelCopyWith<$Res> get body;
}

/// @nodoc
class __$$FormViewContentModelImplCopyWithImpl<$Res>
    extends _$FormViewContentModelCopyWithImpl<$Res, _$FormViewContentModelImpl>
    implements _$$FormViewContentModelImplCopyWith<$Res> {
  __$$FormViewContentModelImplCopyWithImpl(_$FormViewContentModelImpl _value,
      $Res Function(_$FormViewContentModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? subtitle = null,
    Object? icon = null,
    Object? body = null,
  }) {
    return _then(_$FormViewContentModelImpl(
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
              as FormViewBodyModel,
    ));
  }
}

/// @nodoc

class _$FormViewContentModelImpl implements _FormViewContentModel {
  const _$FormViewContentModelImpl(
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
  final FormViewBodyModel body;

  @override
  String toString() {
    return 'FormViewContentModel(title: $title, subtitle: $subtitle, icon: $icon, body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormViewContentModelImpl &&
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
  _$$FormViewContentModelImplCopyWith<_$FormViewContentModelImpl>
      get copyWith =>
          __$$FormViewContentModelImplCopyWithImpl<_$FormViewContentModelImpl>(
              this, _$identity);
}

abstract class _FormViewContentModel implements FormViewContentModel {
  const factory _FormViewContentModel(
      {required final String title,
      required final String subtitle,
      required final IconData icon,
      required final FormViewBodyModel body}) = _$FormViewContentModelImpl;

  @override
  String get title;
  @override
  String get subtitle;
  @override
  IconData get icon;
  @override
  FormViewBodyModel get body;
  @override
  @JsonKey(ignore: true)
  _$$FormViewContentModelImplCopyWith<_$FormViewContentModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FormViewBodyModel {
  String? get errorsMessage => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  Map<String, List<FormItemWithValue<dynamic>>> get fieldsWithValues =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FormViewBodyModelCopyWith<FormViewBodyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormViewBodyModelCopyWith<$Res> {
  factory $FormViewBodyModelCopyWith(
          FormViewBodyModel value, $Res Function(FormViewBodyModel) then) =
      _$FormViewBodyModelCopyWithImpl<$Res, FormViewBodyModel>;
  @useResult
  $Res call(
      {String? errorsMessage,
      String message,
      Map<String, List<FormItemWithValue<dynamic>>> fieldsWithValues});
}

/// @nodoc
class _$FormViewBodyModelCopyWithImpl<$Res, $Val extends FormViewBodyModel>
    implements $FormViewBodyModelCopyWith<$Res> {
  _$FormViewBodyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorsMessage = freezed,
    Object? message = null,
    Object? fieldsWithValues = null,
  }) {
    return _then(_value.copyWith(
      errorsMessage: freezed == errorsMessage
          ? _value.errorsMessage
          : errorsMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      fieldsWithValues: null == fieldsWithValues
          ? _value.fieldsWithValues
          : fieldsWithValues // ignore: cast_nullable_to_non_nullable
              as Map<String, List<FormItemWithValue<dynamic>>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FormViewBodyModelImplCopyWith<$Res>
    implements $FormViewBodyModelCopyWith<$Res> {
  factory _$$FormViewBodyModelImplCopyWith(_$FormViewBodyModelImpl value,
          $Res Function(_$FormViewBodyModelImpl) then) =
      __$$FormViewBodyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? errorsMessage,
      String message,
      Map<String, List<FormItemWithValue<dynamic>>> fieldsWithValues});
}

/// @nodoc
class __$$FormViewBodyModelImplCopyWithImpl<$Res>
    extends _$FormViewBodyModelCopyWithImpl<$Res, _$FormViewBodyModelImpl>
    implements _$$FormViewBodyModelImplCopyWith<$Res> {
  __$$FormViewBodyModelImplCopyWithImpl(_$FormViewBodyModelImpl _value,
      $Res Function(_$FormViewBodyModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorsMessage = freezed,
    Object? message = null,
    Object? fieldsWithValues = null,
  }) {
    return _then(_$FormViewBodyModelImpl(
      errorsMessage: freezed == errorsMessage
          ? _value.errorsMessage
          : errorsMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      fieldsWithValues: null == fieldsWithValues
          ? _value._fieldsWithValues
          : fieldsWithValues // ignore: cast_nullable_to_non_nullable
              as Map<String, List<FormItemWithValue<dynamic>>>,
    ));
  }
}

/// @nodoc

class _$FormViewBodyModelImpl implements _FormViewBodyModel {
  const _$FormViewBodyModelImpl(
      {this.errorsMessage,
      required this.message,
      required final Map<String, List<FormItemWithValue<dynamic>>>
          fieldsWithValues})
      : _fieldsWithValues = fieldsWithValues;

  @override
  final String? errorsMessage;
  @override
  final String message;
  final Map<String, List<FormItemWithValue<dynamic>>> _fieldsWithValues;
  @override
  Map<String, List<FormItemWithValue<dynamic>>> get fieldsWithValues {
    if (_fieldsWithValues is EqualUnmodifiableMapView) return _fieldsWithValues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_fieldsWithValues);
  }

  @override
  String toString() {
    return 'FormViewBodyModel(errorsMessage: $errorsMessage, message: $message, fieldsWithValues: $fieldsWithValues)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormViewBodyModelImpl &&
            (identical(other.errorsMessage, errorsMessage) ||
                other.errorsMessage == errorsMessage) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._fieldsWithValues, _fieldsWithValues));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorsMessage, message,
      const DeepCollectionEquality().hash(_fieldsWithValues));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FormViewBodyModelImplCopyWith<_$FormViewBodyModelImpl> get copyWith =>
      __$$FormViewBodyModelImplCopyWithImpl<_$FormViewBodyModelImpl>(
          this, _$identity);
}

abstract class _FormViewBodyModel implements FormViewBodyModel {
  const factory _FormViewBodyModel(
      {final String? errorsMessage,
      required final String message,
      required final Map<String, List<FormItemWithValue<dynamic>>>
          fieldsWithValues}) = _$FormViewBodyModelImpl;

  @override
  String? get errorsMessage;
  @override
  String get message;
  @override
  Map<String, List<FormItemWithValue<dynamic>>> get fieldsWithValues;
  @override
  @JsonKey(ignore: true)
  _$$FormViewBodyModelImplCopyWith<_$FormViewBodyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
