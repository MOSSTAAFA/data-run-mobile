
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
  dynamic get value => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String source, dynamic value) onStatusChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String source, dynamic value)? onStatusChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String source, dynamic value)? onStatusChange,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnStatusChange value) onStatusChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnStatusChange value)? onStatusChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnStatusChange value)? onStatusChange,
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
  $Res call({String source, dynamic value});
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
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OnStatusChangeImplCopyWith<$Res>
    implements $FormEventCopyWith<$Res> {
  factory _$$OnStatusChangeImplCopyWith(_$OnStatusChangeImpl value,
          $Res Function(_$OnStatusChangeImpl) then) =
      __$$OnStatusChangeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String source, dynamic value});
}

/// @nodoc
class __$$OnStatusChangeImplCopyWithImpl<$Res>
    extends _$FormEventCopyWithImpl<$Res, _$OnStatusChangeImpl>
    implements _$$OnStatusChangeImplCopyWith<$Res> {
  __$$OnStatusChangeImplCopyWithImpl(
      _$OnStatusChangeImpl _value, $Res Function(_$OnStatusChangeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? value = freezed,
  }) {
    return _then(_$OnStatusChangeImpl(
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

class _$OnStatusChangeImpl implements OnStatusChange {
  const _$OnStatusChangeImpl(this.source, {this.value});

  @override
  final String source;
  @override
  final dynamic value;

  @override
  String toString() {
    return 'FormEvent.onStatusChange(source: $source, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnStatusChangeImpl &&
            (identical(other.source, source) || other.source == source) &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, source, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnStatusChangeImplCopyWith<_$OnStatusChangeImpl> get copyWith =>
      __$$OnStatusChangeImplCopyWithImpl<_$OnStatusChangeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String source, dynamic value) onStatusChange,
  }) {
    return onStatusChange(source, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String source, dynamic value)? onStatusChange,
  }) {
    return onStatusChange?.call(source, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String source, dynamic value)? onStatusChange,
    required TResult orElse(),
  }) {
    if (onStatusChange != null) {
      return onStatusChange(source, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnStatusChange value) onStatusChange,
  }) {
    return onStatusChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnStatusChange value)? onStatusChange,
  }) {
    return onStatusChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnStatusChange value)? onStatusChange,
    required TResult orElse(),
  }) {
    if (onStatusChange != null) {
      return onStatusChange(this);
    }
    return orElse();
  }
}

abstract class OnStatusChange implements FormEvent {
  const factory OnStatusChange(final String source, {final dynamic value}) =
      _$OnStatusChangeImpl;

  @override
  String get source;
  @override
  dynamic get value;
  @override
  @JsonKey(ignore: true)
  _$$OnStatusChangeImplCopyWith<_$OnStatusChangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
