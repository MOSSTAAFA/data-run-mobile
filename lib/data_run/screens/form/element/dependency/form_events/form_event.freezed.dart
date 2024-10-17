// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FormEvent {
  String get source => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String source, dynamic value) onTextChange,
    required TResult Function(String source, dynamic value) onValueSaved,
    required TResult Function(String source) onValueCleared,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String source, dynamic value)? onTextChange,
    TResult? Function(String source, dynamic value)? onValueSaved,
    TResult? Function(String source)? onValueCleared,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String source, dynamic value)? onTextChange,
    TResult Function(String source, dynamic value)? onValueSaved,
    TResult Function(String source)? onValueCleared,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnTextChange value) onTextChange,
    required TResult Function(OnValueSaved value) onValueSaved,
    required TResult Function(OnValueCleared value) onValueCleared,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnTextChange value)? onTextChange,
    TResult? Function(OnValueSaved value)? onValueSaved,
    TResult? Function(OnValueCleared value)? onValueCleared,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnTextChange value)? onTextChange,
    TResult Function(OnValueSaved value)? onValueSaved,
    TResult Function(OnValueCleared value)? onValueCleared,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FormEventCopyWith<FormEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormEventCopyWith<$Res> {
  factory $FormEventCopyWith(FormEvent value, $Res Function(FormEvent) then) =
      _$FormEventCopyWithImpl<$Res, FormEvent>;
  @useResult
  $Res call({String source});
}

/// @nodoc
class _$FormEventCopyWithImpl<$Res, $Val extends FormEvent>
    implements $FormEventCopyWith<$Res> {
  _$FormEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
  }) {
    return _then(_value.copyWith(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OnTextChangeImplCopyWith<$Res>
    implements $FormEventCopyWith<$Res> {
  factory _$$OnTextChangeImplCopyWith(
          _$OnTextChangeImpl value, $Res Function(_$OnTextChangeImpl) then) =
      __$$OnTextChangeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String source, dynamic value});
}

/// @nodoc
class __$$OnTextChangeImplCopyWithImpl<$Res>
    extends _$FormEventCopyWithImpl<$Res, _$OnTextChangeImpl>
    implements _$$OnTextChangeImplCopyWith<$Res> {
  __$$OnTextChangeImplCopyWithImpl(
      _$OnTextChangeImpl _value, $Res Function(_$OnTextChangeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? value = freezed,
  }) {
    return _then(_$OnTextChangeImpl(
      null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$OnTextChangeImpl implements OnTextChange {
  const _$OnTextChangeImpl(this.source, {this.value});

  @override
  final String source;
  @override
  final dynamic value;

  @override
  String toString() {
    return 'FormEvent.onTextChange(source: $source, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnTextChangeImpl &&
            (identical(other.source, source) || other.source == source) &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, source, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnTextChangeImplCopyWith<_$OnTextChangeImpl> get copyWith =>
      __$$OnTextChangeImplCopyWithImpl<_$OnTextChangeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String source, dynamic value) onTextChange,
    required TResult Function(String source, dynamic value) onValueSaved,
    required TResult Function(String source) onValueCleared,
  }) {
    return onTextChange(source, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String source, dynamic value)? onTextChange,
    TResult? Function(String source, dynamic value)? onValueSaved,
    TResult? Function(String source)? onValueCleared,
  }) {
    return onTextChange?.call(source, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String source, dynamic value)? onTextChange,
    TResult Function(String source, dynamic value)? onValueSaved,
    TResult Function(String source)? onValueCleared,
    required TResult orElse(),
  }) {
    if (onTextChange != null) {
      return onTextChange(source, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnTextChange value) onTextChange,
    required TResult Function(OnValueSaved value) onValueSaved,
    required TResult Function(OnValueCleared value) onValueCleared,
  }) {
    return onTextChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnTextChange value)? onTextChange,
    TResult? Function(OnValueSaved value)? onValueSaved,
    TResult? Function(OnValueCleared value)? onValueCleared,
  }) {
    return onTextChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnTextChange value)? onTextChange,
    TResult Function(OnValueSaved value)? onValueSaved,
    TResult Function(OnValueCleared value)? onValueCleared,
    required TResult orElse(),
  }) {
    if (onTextChange != null) {
      return onTextChange(this);
    }
    return orElse();
  }
}

abstract class OnTextChange implements FormEvent {
  const factory OnTextChange(final String source, {final dynamic value}) =
      _$OnTextChangeImpl;

  @override
  String get source;
  dynamic get value;
  @override
  @JsonKey(ignore: true)
  _$$OnTextChangeImplCopyWith<_$OnTextChangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnValueSavedImplCopyWith<$Res>
    implements $FormEventCopyWith<$Res> {
  factory _$$OnValueSavedImplCopyWith(
          _$OnValueSavedImpl value, $Res Function(_$OnValueSavedImpl) then) =
      __$$OnValueSavedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String source, dynamic value});
}

/// @nodoc
class __$$OnValueSavedImplCopyWithImpl<$Res>
    extends _$FormEventCopyWithImpl<$Res, _$OnValueSavedImpl>
    implements _$$OnValueSavedImplCopyWith<$Res> {
  __$$OnValueSavedImplCopyWithImpl(
      _$OnValueSavedImpl _value, $Res Function(_$OnValueSavedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? value = freezed,
  }) {
    return _then(_$OnValueSavedImpl(
      null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$OnValueSavedImpl implements OnValueSaved {
  const _$OnValueSavedImpl(this.source, {this.value});

  @override
  final String source;
  @override
  final dynamic value;

  @override
  String toString() {
    return 'FormEvent.onValueSaved(source: $source, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnValueSavedImpl &&
            (identical(other.source, source) || other.source == source) &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, source, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnValueSavedImplCopyWith<_$OnValueSavedImpl> get copyWith =>
      __$$OnValueSavedImplCopyWithImpl<_$OnValueSavedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String source, dynamic value) onTextChange,
    required TResult Function(String source, dynamic value) onValueSaved,
    required TResult Function(String source) onValueCleared,
  }) {
    return onValueSaved(source, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String source, dynamic value)? onTextChange,
    TResult? Function(String source, dynamic value)? onValueSaved,
    TResult? Function(String source)? onValueCleared,
  }) {
    return onValueSaved?.call(source, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String source, dynamic value)? onTextChange,
    TResult Function(String source, dynamic value)? onValueSaved,
    TResult Function(String source)? onValueCleared,
    required TResult orElse(),
  }) {
    if (onValueSaved != null) {
      return onValueSaved(source, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnTextChange value) onTextChange,
    required TResult Function(OnValueSaved value) onValueSaved,
    required TResult Function(OnValueCleared value) onValueCleared,
  }) {
    return onValueSaved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnTextChange value)? onTextChange,
    TResult? Function(OnValueSaved value)? onValueSaved,
    TResult? Function(OnValueCleared value)? onValueCleared,
  }) {
    return onValueSaved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnTextChange value)? onTextChange,
    TResult Function(OnValueSaved value)? onValueSaved,
    TResult Function(OnValueCleared value)? onValueCleared,
    required TResult orElse(),
  }) {
    if (onValueSaved != null) {
      return onValueSaved(this);
    }
    return orElse();
  }
}

abstract class OnValueSaved implements FormEvent {
  const factory OnValueSaved(final String source, {final dynamic value}) =
      _$OnValueSavedImpl;

  @override
  String get source;
  dynamic get value;
  @override
  @JsonKey(ignore: true)
  _$$OnValueSavedImplCopyWith<_$OnValueSavedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnValueClearedImplCopyWith<$Res>
    implements $FormEventCopyWith<$Res> {
  factory _$$OnValueClearedImplCopyWith(_$OnValueClearedImpl value,
          $Res Function(_$OnValueClearedImpl) then) =
      __$$OnValueClearedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String source});
}

/// @nodoc
class __$$OnValueClearedImplCopyWithImpl<$Res>
    extends _$FormEventCopyWithImpl<$Res, _$OnValueClearedImpl>
    implements _$$OnValueClearedImplCopyWith<$Res> {
  __$$OnValueClearedImplCopyWithImpl(
      _$OnValueClearedImpl _value, $Res Function(_$OnValueClearedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
  }) {
    return _then(_$OnValueClearedImpl(
      null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnValueClearedImpl implements OnValueCleared {
  const _$OnValueClearedImpl(this.source);

  @override
  final String source;

  @override
  String toString() {
    return 'FormEvent.onValueCleared(source: $source)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnValueClearedImpl &&
            (identical(other.source, source) || other.source == source));
  }

  @override
  int get hashCode => Object.hash(runtimeType, source);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnValueClearedImplCopyWith<_$OnValueClearedImpl> get copyWith =>
      __$$OnValueClearedImplCopyWithImpl<_$OnValueClearedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String source, dynamic value) onTextChange,
    required TResult Function(String source, dynamic value) onValueSaved,
    required TResult Function(String source) onValueCleared,
  }) {
    return onValueCleared(source);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String source, dynamic value)? onTextChange,
    TResult? Function(String source, dynamic value)? onValueSaved,
    TResult? Function(String source)? onValueCleared,
  }) {
    return onValueCleared?.call(source);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String source, dynamic value)? onTextChange,
    TResult Function(String source, dynamic value)? onValueSaved,
    TResult Function(String source)? onValueCleared,
    required TResult orElse(),
  }) {
    if (onValueCleared != null) {
      return onValueCleared(source);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnTextChange value) onTextChange,
    required TResult Function(OnValueSaved value) onValueSaved,
    required TResult Function(OnValueCleared value) onValueCleared,
  }) {
    return onValueCleared(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnTextChange value)? onTextChange,
    TResult? Function(OnValueSaved value)? onValueSaved,
    TResult? Function(OnValueCleared value)? onValueCleared,
  }) {
    return onValueCleared?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnTextChange value)? onTextChange,
    TResult Function(OnValueSaved value)? onValueSaved,
    TResult Function(OnValueCleared value)? onValueCleared,
    required TResult orElse(),
  }) {
    if (onValueCleared != null) {
      return onValueCleared(this);
    }
    return orElse();
  }
}

abstract class OnValueCleared implements FormEvent {
  const factory OnValueCleared(final String source) = _$OnValueClearedImpl;

  @override
  String get source;
  @override
  @JsonKey(ignore: true)
  _$$OnValueClearedImplCopyWith<_$OnValueClearedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
