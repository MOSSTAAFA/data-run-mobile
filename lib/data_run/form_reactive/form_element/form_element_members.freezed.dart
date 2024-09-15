// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_element_members.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ElementProperties {
  int get order => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;
  String? get placeholder => throw _privateConstructorUsedError;
  bool get disabled => throw _privateConstructorUsedError;
  bool get hidden => throw _privateConstructorUsedError;
  bool get readonly => throw _privateConstructorUsedError;
  bool get mandatory => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ElementPropertiesCopyWith<ElementProperties> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ElementPropertiesCopyWith<$Res> {
  factory $ElementPropertiesCopyWith(
          ElementProperties value, $Res Function(ElementProperties) then) =
      _$ElementPropertiesCopyWithImpl<$Res, ElementProperties>;
  @useResult
  $Res call(
      {int order,
      String? label,
      String? placeholder,
      bool disabled,
      bool hidden,
      bool readonly,
      bool mandatory});
}

/// @nodoc
class _$ElementPropertiesCopyWithImpl<$Res, $Val extends ElementProperties>
    implements $ElementPropertiesCopyWith<$Res> {
  _$ElementPropertiesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = null,
    Object? label = freezed,
    Object? placeholder = freezed,
    Object? disabled = null,
    Object? hidden = null,
    Object? readonly = null,
    Object? mandatory = null,
  }) {
    return _then(_value.copyWith(
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      placeholder: freezed == placeholder
          ? _value.placeholder
          : placeholder // ignore: cast_nullable_to_non_nullable
              as String?,
      disabled: null == disabled
          ? _value.disabled
          : disabled // ignore: cast_nullable_to_non_nullable
              as bool,
      hidden: null == hidden
          ? _value.hidden
          : hidden // ignore: cast_nullable_to_non_nullable
              as bool,
      readonly: null == readonly
          ? _value.readonly
          : readonly // ignore: cast_nullable_to_non_nullable
              as bool,
      mandatory: null == mandatory
          ? _value.mandatory
          : mandatory // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ElementPropertiesImplCopyWith<$Res>
    implements $ElementPropertiesCopyWith<$Res> {
  factory _$$ElementPropertiesImplCopyWith(_$ElementPropertiesImpl value,
          $Res Function(_$ElementPropertiesImpl) then) =
      __$$ElementPropertiesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int order,
      String? label,
      String? placeholder,
      bool disabled,
      bool hidden,
      bool readonly,
      bool mandatory});
}

/// @nodoc
class __$$ElementPropertiesImplCopyWithImpl<$Res>
    extends _$ElementPropertiesCopyWithImpl<$Res, _$ElementPropertiesImpl>
    implements _$$ElementPropertiesImplCopyWith<$Res> {
  __$$ElementPropertiesImplCopyWithImpl(_$ElementPropertiesImpl _value,
      $Res Function(_$ElementPropertiesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = null,
    Object? label = freezed,
    Object? placeholder = freezed,
    Object? disabled = null,
    Object? hidden = null,
    Object? readonly = null,
    Object? mandatory = null,
  }) {
    return _then(_$ElementPropertiesImpl(
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      placeholder: freezed == placeholder
          ? _value.placeholder
          : placeholder // ignore: cast_nullable_to_non_nullable
              as String?,
      disabled: null == disabled
          ? _value.disabled
          : disabled // ignore: cast_nullable_to_non_nullable
              as bool,
      hidden: null == hidden
          ? _value.hidden
          : hidden // ignore: cast_nullable_to_non_nullable
              as bool,
      readonly: null == readonly
          ? _value.readonly
          : readonly // ignore: cast_nullable_to_non_nullable
              as bool,
      mandatory: null == mandatory
          ? _value.mandatory
          : mandatory // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ElementPropertiesImpl
    with DiagnosticableTreeMixin
    implements _ElementProperties {
  const _$ElementPropertiesImpl(
      {this.order = 0,
      this.label,
      this.placeholder,
      this.disabled = false,
      this.hidden = false,
      this.readonly = false,
      this.mandatory = false});

  @override
  @JsonKey()
  final int order;
  @override
  final String? label;
  @override
  final String? placeholder;
  @override
  @JsonKey()
  final bool disabled;
  @override
  @JsonKey()
  final bool hidden;
  @override
  @JsonKey()
  final bool readonly;
  @override
  @JsonKey()
  final bool mandatory;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ElementProperties(order: $order, label: $label, placeholder: $placeholder, disabled: $disabled, hidden: $hidden, readonly: $readonly, mandatory: $mandatory)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ElementProperties'))
      ..add(DiagnosticsProperty('order', order))
      ..add(DiagnosticsProperty('label', label))
      ..add(DiagnosticsProperty('placeholder', placeholder))
      ..add(DiagnosticsProperty('disabled', disabled))
      ..add(DiagnosticsProperty('hidden', hidden))
      ..add(DiagnosticsProperty('readonly', readonly))
      ..add(DiagnosticsProperty('mandatory', mandatory));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ElementPropertiesImpl &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.placeholder, placeholder) ||
                other.placeholder == placeholder) &&
            (identical(other.disabled, disabled) ||
                other.disabled == disabled) &&
            (identical(other.hidden, hidden) || other.hidden == hidden) &&
            (identical(other.readonly, readonly) ||
                other.readonly == readonly) &&
            (identical(other.mandatory, mandatory) ||
                other.mandatory == mandatory));
  }

  @override
  int get hashCode => Object.hash(runtimeType, order, label, placeholder,
      disabled, hidden, readonly, mandatory);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ElementPropertiesImplCopyWith<_$ElementPropertiesImpl> get copyWith =>
      __$$ElementPropertiesImplCopyWithImpl<_$ElementPropertiesImpl>(
          this, _$identity);
}

abstract class _ElementProperties implements ElementProperties {
  const factory _ElementProperties(
      {final int order,
      final String? label,
      final String? placeholder,
      final bool disabled,
      final bool hidden,
      final bool readonly,
      final bool mandatory}) = _$ElementPropertiesImpl;

  @override
  int get order;
  @override
  String? get label;
  @override
  String? get placeholder;
  @override
  bool get disabled;
  @override
  bool get hidden;
  @override
  bool get readonly;
  @override
  bool get mandatory;
  @override
  @JsonKey(ignore: true)
  _$$ElementPropertiesImplCopyWith<_$ElementPropertiesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
