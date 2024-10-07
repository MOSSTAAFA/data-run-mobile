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
  bool get hidden => throw _privateConstructorUsedError;
  bool get mandatory => throw _privateConstructorUsedError;
  ControlStatus get controlStatus => throw _privateConstructorUsedError;

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
  $Res call({bool hidden, bool mandatory, ControlStatus controlStatus});
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
    Object? hidden = null,
    Object? mandatory = null,
    Object? controlStatus = null,
  }) {
    return _then(_value.copyWith(
      hidden: null == hidden
          ? _value.hidden
          : hidden // ignore: cast_nullable_to_non_nullable
              as bool,
      mandatory: null == mandatory
          ? _value.mandatory
          : mandatory // ignore: cast_nullable_to_non_nullable
              as bool,
      controlStatus: null == controlStatus
          ? _value.controlStatus
          : controlStatus // ignore: cast_nullable_to_non_nullable
              as ControlStatus,
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
  $Res call({bool hidden, bool mandatory, ControlStatus controlStatus});
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
    Object? hidden = null,
    Object? mandatory = null,
    Object? controlStatus = null,
  }) {
    return _then(_$ElementPropertiesImpl(
      hidden: null == hidden
          ? _value.hidden
          : hidden // ignore: cast_nullable_to_non_nullable
              as bool,
      mandatory: null == mandatory
          ? _value.mandatory
          : mandatory // ignore: cast_nullable_to_non_nullable
              as bool,
      controlStatus: null == controlStatus
          ? _value.controlStatus
          : controlStatus // ignore: cast_nullable_to_non_nullable
              as ControlStatus,
    ));
  }
}

/// @nodoc

class _$ElementPropertiesImpl
    with DiagnosticableTreeMixin
    implements _ElementProperties {
  const _$ElementPropertiesImpl(
      {this.hidden = false,
      this.mandatory = false,
      this.controlStatus = ControlStatus.valid});

  @override
  @JsonKey()
  final bool hidden;
  @override
  @JsonKey()
  final bool mandatory;
  @override
  @JsonKey()
  final ControlStatus controlStatus;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ElementProperties(hidden: $hidden, mandatory: $mandatory, controlStatus: $controlStatus)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ElementProperties'))
      ..add(DiagnosticsProperty('hidden', hidden))
      ..add(DiagnosticsProperty('mandatory', mandatory))
      ..add(DiagnosticsProperty('controlStatus', controlStatus));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ElementPropertiesImpl &&
            (identical(other.hidden, hidden) || other.hidden == hidden) &&
            (identical(other.mandatory, mandatory) ||
                other.mandatory == mandatory) &&
            (identical(other.controlStatus, controlStatus) ||
                other.controlStatus == controlStatus));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, hidden, mandatory, controlStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ElementPropertiesImplCopyWith<_$ElementPropertiesImpl> get copyWith =>
      __$$ElementPropertiesImplCopyWithImpl<_$ElementPropertiesImpl>(
          this, _$identity);
}

abstract class _ElementProperties implements ElementProperties {
  const factory _ElementProperties(
      {final bool hidden,
      final bool mandatory,
      final ControlStatus controlStatus}) = _$ElementPropertiesImpl;

  @override
  bool get hidden;
  @override
  bool get mandatory;
  @override
  ControlStatus get controlStatus;
  @override
  @JsonKey(ignore: true)
  _$$ElementPropertiesImplCopyWith<_$ElementPropertiesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
