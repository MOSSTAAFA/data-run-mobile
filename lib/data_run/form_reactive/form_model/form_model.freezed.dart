// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EvaluationAction {
  String get path => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String path, dynamic value) assignValue,
    required TResult Function(String path) markAsPending,
    required TResult Function(String path) markAsHidden,
    required TResult Function(String path) markAsVisible,
    required TResult Function(String path) markAsMandatory,
    required TResult Function(String path) markAsOptional,
    required TResult Function(String path, Map<String, String>? errorMessage)
        setError,
    required TResult Function(String path) stopRepeat,
    required TResult Function(String path) setCount,
    required TResult Function(
            String path, List<String> optionsToShow, List<String> optionsToHide)
        showHideOptions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String path, dynamic value)? assignValue,
    TResult? Function(String path)? markAsPending,
    TResult? Function(String path)? markAsHidden,
    TResult? Function(String path)? markAsVisible,
    TResult? Function(String path)? markAsMandatory,
    TResult? Function(String path)? markAsOptional,
    TResult? Function(String path, Map<String, String>? errorMessage)? setError,
    TResult? Function(String path)? stopRepeat,
    TResult? Function(String path)? setCount,
    TResult? Function(String path, List<String> optionsToShow,
            List<String> optionsToHide)?
        showHideOptions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String path, dynamic value)? assignValue,
    TResult Function(String path)? markAsPending,
    TResult Function(String path)? markAsHidden,
    TResult Function(String path)? markAsVisible,
    TResult Function(String path)? markAsMandatory,
    TResult Function(String path)? markAsOptional,
    TResult Function(String path, Map<String, String>? errorMessage)? setError,
    TResult Function(String path)? stopRepeat,
    TResult Function(String path)? setCount,
    TResult Function(String path, List<String> optionsToShow,
            List<String> optionsToHide)?
        showHideOptions,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AssignValue value) assignValue,
    required TResult Function(MarkAsPending value) markAsPending,
    required TResult Function(MarkAsHidden value) markAsHidden,
    required TResult Function(MarkAsVisible value) markAsVisible,
    required TResult Function(MarkAsMandatory value) markAsMandatory,
    required TResult Function(MarkAsOptional value) markAsOptional,
    required TResult Function(SetError value) setError,
    required TResult Function(StopRepeat value) stopRepeat,
    required TResult Function(SetCount value) setCount,
    required TResult Function(ShowHideOptions value) showHideOptions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AssignValue value)? assignValue,
    TResult? Function(MarkAsPending value)? markAsPending,
    TResult? Function(MarkAsHidden value)? markAsHidden,
    TResult? Function(MarkAsVisible value)? markAsVisible,
    TResult? Function(MarkAsMandatory value)? markAsMandatory,
    TResult? Function(MarkAsOptional value)? markAsOptional,
    TResult? Function(SetError value)? setError,
    TResult? Function(StopRepeat value)? stopRepeat,
    TResult? Function(SetCount value)? setCount,
    TResult? Function(ShowHideOptions value)? showHideOptions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AssignValue value)? assignValue,
    TResult Function(MarkAsPending value)? markAsPending,
    TResult Function(MarkAsHidden value)? markAsHidden,
    TResult Function(MarkAsVisible value)? markAsVisible,
    TResult Function(MarkAsMandatory value)? markAsMandatory,
    TResult Function(MarkAsOptional value)? markAsOptional,
    TResult Function(SetError value)? setError,
    TResult Function(StopRepeat value)? stopRepeat,
    TResult Function(SetCount value)? setCount,
    TResult Function(ShowHideOptions value)? showHideOptions,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EvaluationActionCopyWith<EvaluationAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EvaluationActionCopyWith<$Res> {
  factory $EvaluationActionCopyWith(
          EvaluationAction value, $Res Function(EvaluationAction) then) =
      _$EvaluationActionCopyWithImpl<$Res, EvaluationAction>;
  @useResult
  $Res call({String path});
}

/// @nodoc
class _$EvaluationActionCopyWithImpl<$Res, $Val extends EvaluationAction>
    implements $EvaluationActionCopyWith<$Res> {
  _$EvaluationActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
  }) {
    return _then(_value.copyWith(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssignValueImplCopyWith<$Res>
    implements $EvaluationActionCopyWith<$Res> {
  factory _$$AssignValueImplCopyWith(
          _$AssignValueImpl value, $Res Function(_$AssignValueImpl) then) =
      __$$AssignValueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String path, dynamic value});
}

/// @nodoc
class __$$AssignValueImplCopyWithImpl<$Res>
    extends _$EvaluationActionCopyWithImpl<$Res, _$AssignValueImpl>
    implements _$$AssignValueImplCopyWith<$Res> {
  __$$AssignValueImplCopyWithImpl(
      _$AssignValueImpl _value, $Res Function(_$AssignValueImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? value = freezed,
  }) {
    return _then(_$AssignValueImpl(
      null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$AssignValueImpl with DiagnosticableTreeMixin implements AssignValue {
  const _$AssignValueImpl(this.path, {this.value});

  @override
  final String path;
  @override
  final dynamic value;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EvaluationAction.assignValue(path: $path, value: $value)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EvaluationAction.assignValue'))
      ..add(DiagnosticsProperty('path', path))
      ..add(DiagnosticsProperty('value', value));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssignValueImpl &&
            (identical(other.path, path) || other.path == path) &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, path, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssignValueImplCopyWith<_$AssignValueImpl> get copyWith =>
      __$$AssignValueImplCopyWithImpl<_$AssignValueImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String path, dynamic value) assignValue,
    required TResult Function(String path) markAsPending,
    required TResult Function(String path) markAsHidden,
    required TResult Function(String path) markAsVisible,
    required TResult Function(String path) markAsMandatory,
    required TResult Function(String path) markAsOptional,
    required TResult Function(String path, Map<String, String>? errorMessage)
        setError,
    required TResult Function(String path) stopRepeat,
    required TResult Function(String path) setCount,
    required TResult Function(
            String path, List<String> optionsToShow, List<String> optionsToHide)
        showHideOptions,
  }) {
    return assignValue(path, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String path, dynamic value)? assignValue,
    TResult? Function(String path)? markAsPending,
    TResult? Function(String path)? markAsHidden,
    TResult? Function(String path)? markAsVisible,
    TResult? Function(String path)? markAsMandatory,
    TResult? Function(String path)? markAsOptional,
    TResult? Function(String path, Map<String, String>? errorMessage)? setError,
    TResult? Function(String path)? stopRepeat,
    TResult? Function(String path)? setCount,
    TResult? Function(String path, List<String> optionsToShow,
            List<String> optionsToHide)?
        showHideOptions,
  }) {
    return assignValue?.call(path, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String path, dynamic value)? assignValue,
    TResult Function(String path)? markAsPending,
    TResult Function(String path)? markAsHidden,
    TResult Function(String path)? markAsVisible,
    TResult Function(String path)? markAsMandatory,
    TResult Function(String path)? markAsOptional,
    TResult Function(String path, Map<String, String>? errorMessage)? setError,
    TResult Function(String path)? stopRepeat,
    TResult Function(String path)? setCount,
    TResult Function(String path, List<String> optionsToShow,
            List<String> optionsToHide)?
        showHideOptions,
    required TResult orElse(),
  }) {
    if (assignValue != null) {
      return assignValue(path, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AssignValue value) assignValue,
    required TResult Function(MarkAsPending value) markAsPending,
    required TResult Function(MarkAsHidden value) markAsHidden,
    required TResult Function(MarkAsVisible value) markAsVisible,
    required TResult Function(MarkAsMandatory value) markAsMandatory,
    required TResult Function(MarkAsOptional value) markAsOptional,
    required TResult Function(SetError value) setError,
    required TResult Function(StopRepeat value) stopRepeat,
    required TResult Function(SetCount value) setCount,
    required TResult Function(ShowHideOptions value) showHideOptions,
  }) {
    return assignValue(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AssignValue value)? assignValue,
    TResult? Function(MarkAsPending value)? markAsPending,
    TResult? Function(MarkAsHidden value)? markAsHidden,
    TResult? Function(MarkAsVisible value)? markAsVisible,
    TResult? Function(MarkAsMandatory value)? markAsMandatory,
    TResult? Function(MarkAsOptional value)? markAsOptional,
    TResult? Function(SetError value)? setError,
    TResult? Function(StopRepeat value)? stopRepeat,
    TResult? Function(SetCount value)? setCount,
    TResult? Function(ShowHideOptions value)? showHideOptions,
  }) {
    return assignValue?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AssignValue value)? assignValue,
    TResult Function(MarkAsPending value)? markAsPending,
    TResult Function(MarkAsHidden value)? markAsHidden,
    TResult Function(MarkAsVisible value)? markAsVisible,
    TResult Function(MarkAsMandatory value)? markAsMandatory,
    TResult Function(MarkAsOptional value)? markAsOptional,
    TResult Function(SetError value)? setError,
    TResult Function(StopRepeat value)? stopRepeat,
    TResult Function(SetCount value)? setCount,
    TResult Function(ShowHideOptions value)? showHideOptions,
    required TResult orElse(),
  }) {
    if (assignValue != null) {
      return assignValue(this);
    }
    return orElse();
  }
}

abstract class AssignValue implements EvaluationAction {
  const factory AssignValue(final String path, {final dynamic value}) =
      _$AssignValueImpl;

  @override
  String get path;
  dynamic get value;
  @override
  @JsonKey(ignore: true)
  _$$AssignValueImplCopyWith<_$AssignValueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MarkAsPendingImplCopyWith<$Res>
    implements $EvaluationActionCopyWith<$Res> {
  factory _$$MarkAsPendingImplCopyWith(
          _$MarkAsPendingImpl value, $Res Function(_$MarkAsPendingImpl) then) =
      __$$MarkAsPendingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String path});
}

/// @nodoc
class __$$MarkAsPendingImplCopyWithImpl<$Res>
    extends _$EvaluationActionCopyWithImpl<$Res, _$MarkAsPendingImpl>
    implements _$$MarkAsPendingImplCopyWith<$Res> {
  __$$MarkAsPendingImplCopyWithImpl(
      _$MarkAsPendingImpl _value, $Res Function(_$MarkAsPendingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
  }) {
    return _then(_$MarkAsPendingImpl(
      null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MarkAsPendingImpl
    with DiagnosticableTreeMixin
    implements MarkAsPending {
  const _$MarkAsPendingImpl(this.path);

  @override
  final String path;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EvaluationAction.markAsPending(path: $path)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EvaluationAction.markAsPending'))
      ..add(DiagnosticsProperty('path', path));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkAsPendingImpl &&
            (identical(other.path, path) || other.path == path));
  }

  @override
  int get hashCode => Object.hash(runtimeType, path);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarkAsPendingImplCopyWith<_$MarkAsPendingImpl> get copyWith =>
      __$$MarkAsPendingImplCopyWithImpl<_$MarkAsPendingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String path, dynamic value) assignValue,
    required TResult Function(String path) markAsPending,
    required TResult Function(String path) markAsHidden,
    required TResult Function(String path) markAsVisible,
    required TResult Function(String path) markAsMandatory,
    required TResult Function(String path) markAsOptional,
    required TResult Function(String path, Map<String, String>? errorMessage)
        setError,
    required TResult Function(String path) stopRepeat,
    required TResult Function(String path) setCount,
    required TResult Function(
            String path, List<String> optionsToShow, List<String> optionsToHide)
        showHideOptions,
  }) {
    return markAsPending(path);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String path, dynamic value)? assignValue,
    TResult? Function(String path)? markAsPending,
    TResult? Function(String path)? markAsHidden,
    TResult? Function(String path)? markAsVisible,
    TResult? Function(String path)? markAsMandatory,
    TResult? Function(String path)? markAsOptional,
    TResult? Function(String path, Map<String, String>? errorMessage)? setError,
    TResult? Function(String path)? stopRepeat,
    TResult? Function(String path)? setCount,
    TResult? Function(String path, List<String> optionsToShow,
            List<String> optionsToHide)?
        showHideOptions,
  }) {
    return markAsPending?.call(path);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String path, dynamic value)? assignValue,
    TResult Function(String path)? markAsPending,
    TResult Function(String path)? markAsHidden,
    TResult Function(String path)? markAsVisible,
    TResult Function(String path)? markAsMandatory,
    TResult Function(String path)? markAsOptional,
    TResult Function(String path, Map<String, String>? errorMessage)? setError,
    TResult Function(String path)? stopRepeat,
    TResult Function(String path)? setCount,
    TResult Function(String path, List<String> optionsToShow,
            List<String> optionsToHide)?
        showHideOptions,
    required TResult orElse(),
  }) {
    if (markAsPending != null) {
      return markAsPending(path);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AssignValue value) assignValue,
    required TResult Function(MarkAsPending value) markAsPending,
    required TResult Function(MarkAsHidden value) markAsHidden,
    required TResult Function(MarkAsVisible value) markAsVisible,
    required TResult Function(MarkAsMandatory value) markAsMandatory,
    required TResult Function(MarkAsOptional value) markAsOptional,
    required TResult Function(SetError value) setError,
    required TResult Function(StopRepeat value) stopRepeat,
    required TResult Function(SetCount value) setCount,
    required TResult Function(ShowHideOptions value) showHideOptions,
  }) {
    return markAsPending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AssignValue value)? assignValue,
    TResult? Function(MarkAsPending value)? markAsPending,
    TResult? Function(MarkAsHidden value)? markAsHidden,
    TResult? Function(MarkAsVisible value)? markAsVisible,
    TResult? Function(MarkAsMandatory value)? markAsMandatory,
    TResult? Function(MarkAsOptional value)? markAsOptional,
    TResult? Function(SetError value)? setError,
    TResult? Function(StopRepeat value)? stopRepeat,
    TResult? Function(SetCount value)? setCount,
    TResult? Function(ShowHideOptions value)? showHideOptions,
  }) {
    return markAsPending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AssignValue value)? assignValue,
    TResult Function(MarkAsPending value)? markAsPending,
    TResult Function(MarkAsHidden value)? markAsHidden,
    TResult Function(MarkAsVisible value)? markAsVisible,
    TResult Function(MarkAsMandatory value)? markAsMandatory,
    TResult Function(MarkAsOptional value)? markAsOptional,
    TResult Function(SetError value)? setError,
    TResult Function(StopRepeat value)? stopRepeat,
    TResult Function(SetCount value)? setCount,
    TResult Function(ShowHideOptions value)? showHideOptions,
    required TResult orElse(),
  }) {
    if (markAsPending != null) {
      return markAsPending(this);
    }
    return orElse();
  }
}

abstract class MarkAsPending implements EvaluationAction {
  const factory MarkAsPending(final String path) = _$MarkAsPendingImpl;

  @override
  String get path;
  @override
  @JsonKey(ignore: true)
  _$$MarkAsPendingImplCopyWith<_$MarkAsPendingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MarkAsHiddenImplCopyWith<$Res>
    implements $EvaluationActionCopyWith<$Res> {
  factory _$$MarkAsHiddenImplCopyWith(
          _$MarkAsHiddenImpl value, $Res Function(_$MarkAsHiddenImpl) then) =
      __$$MarkAsHiddenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String path});
}

/// @nodoc
class __$$MarkAsHiddenImplCopyWithImpl<$Res>
    extends _$EvaluationActionCopyWithImpl<$Res, _$MarkAsHiddenImpl>
    implements _$$MarkAsHiddenImplCopyWith<$Res> {
  __$$MarkAsHiddenImplCopyWithImpl(
      _$MarkAsHiddenImpl _value, $Res Function(_$MarkAsHiddenImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
  }) {
    return _then(_$MarkAsHiddenImpl(
      null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MarkAsHiddenImpl with DiagnosticableTreeMixin implements MarkAsHidden {
  const _$MarkAsHiddenImpl(this.path);

  @override
  final String path;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EvaluationAction.markAsHidden(path: $path)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EvaluationAction.markAsHidden'))
      ..add(DiagnosticsProperty('path', path));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkAsHiddenImpl &&
            (identical(other.path, path) || other.path == path));
  }

  @override
  int get hashCode => Object.hash(runtimeType, path);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarkAsHiddenImplCopyWith<_$MarkAsHiddenImpl> get copyWith =>
      __$$MarkAsHiddenImplCopyWithImpl<_$MarkAsHiddenImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String path, dynamic value) assignValue,
    required TResult Function(String path) markAsPending,
    required TResult Function(String path) markAsHidden,
    required TResult Function(String path) markAsVisible,
    required TResult Function(String path) markAsMandatory,
    required TResult Function(String path) markAsOptional,
    required TResult Function(String path, Map<String, String>? errorMessage)
        setError,
    required TResult Function(String path) stopRepeat,
    required TResult Function(String path) setCount,
    required TResult Function(
            String path, List<String> optionsToShow, List<String> optionsToHide)
        showHideOptions,
  }) {
    return markAsHidden(path);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String path, dynamic value)? assignValue,
    TResult? Function(String path)? markAsPending,
    TResult? Function(String path)? markAsHidden,
    TResult? Function(String path)? markAsVisible,
    TResult? Function(String path)? markAsMandatory,
    TResult? Function(String path)? markAsOptional,
    TResult? Function(String path, Map<String, String>? errorMessage)? setError,
    TResult? Function(String path)? stopRepeat,
    TResult? Function(String path)? setCount,
    TResult? Function(String path, List<String> optionsToShow,
            List<String> optionsToHide)?
        showHideOptions,
  }) {
    return markAsHidden?.call(path);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String path, dynamic value)? assignValue,
    TResult Function(String path)? markAsPending,
    TResult Function(String path)? markAsHidden,
    TResult Function(String path)? markAsVisible,
    TResult Function(String path)? markAsMandatory,
    TResult Function(String path)? markAsOptional,
    TResult Function(String path, Map<String, String>? errorMessage)? setError,
    TResult Function(String path)? stopRepeat,
    TResult Function(String path)? setCount,
    TResult Function(String path, List<String> optionsToShow,
            List<String> optionsToHide)?
        showHideOptions,
    required TResult orElse(),
  }) {
    if (markAsHidden != null) {
      return markAsHidden(path);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AssignValue value) assignValue,
    required TResult Function(MarkAsPending value) markAsPending,
    required TResult Function(MarkAsHidden value) markAsHidden,
    required TResult Function(MarkAsVisible value) markAsVisible,
    required TResult Function(MarkAsMandatory value) markAsMandatory,
    required TResult Function(MarkAsOptional value) markAsOptional,
    required TResult Function(SetError value) setError,
    required TResult Function(StopRepeat value) stopRepeat,
    required TResult Function(SetCount value) setCount,
    required TResult Function(ShowHideOptions value) showHideOptions,
  }) {
    return markAsHidden(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AssignValue value)? assignValue,
    TResult? Function(MarkAsPending value)? markAsPending,
    TResult? Function(MarkAsHidden value)? markAsHidden,
    TResult? Function(MarkAsVisible value)? markAsVisible,
    TResult? Function(MarkAsMandatory value)? markAsMandatory,
    TResult? Function(MarkAsOptional value)? markAsOptional,
    TResult? Function(SetError value)? setError,
    TResult? Function(StopRepeat value)? stopRepeat,
    TResult? Function(SetCount value)? setCount,
    TResult? Function(ShowHideOptions value)? showHideOptions,
  }) {
    return markAsHidden?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AssignValue value)? assignValue,
    TResult Function(MarkAsPending value)? markAsPending,
    TResult Function(MarkAsHidden value)? markAsHidden,
    TResult Function(MarkAsVisible value)? markAsVisible,
    TResult Function(MarkAsMandatory value)? markAsMandatory,
    TResult Function(MarkAsOptional value)? markAsOptional,
    TResult Function(SetError value)? setError,
    TResult Function(StopRepeat value)? stopRepeat,
    TResult Function(SetCount value)? setCount,
    TResult Function(ShowHideOptions value)? showHideOptions,
    required TResult orElse(),
  }) {
    if (markAsHidden != null) {
      return markAsHidden(this);
    }
    return orElse();
  }
}

abstract class MarkAsHidden implements EvaluationAction {
  const factory MarkAsHidden(final String path) = _$MarkAsHiddenImpl;

  @override
  String get path;
  @override
  @JsonKey(ignore: true)
  _$$MarkAsHiddenImplCopyWith<_$MarkAsHiddenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MarkAsVisibleImplCopyWith<$Res>
    implements $EvaluationActionCopyWith<$Res> {
  factory _$$MarkAsVisibleImplCopyWith(
          _$MarkAsVisibleImpl value, $Res Function(_$MarkAsVisibleImpl) then) =
      __$$MarkAsVisibleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String path});
}

/// @nodoc
class __$$MarkAsVisibleImplCopyWithImpl<$Res>
    extends _$EvaluationActionCopyWithImpl<$Res, _$MarkAsVisibleImpl>
    implements _$$MarkAsVisibleImplCopyWith<$Res> {
  __$$MarkAsVisibleImplCopyWithImpl(
      _$MarkAsVisibleImpl _value, $Res Function(_$MarkAsVisibleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
  }) {
    return _then(_$MarkAsVisibleImpl(
      null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MarkAsVisibleImpl
    with DiagnosticableTreeMixin
    implements MarkAsVisible {
  const _$MarkAsVisibleImpl(this.path);

  @override
  final String path;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EvaluationAction.markAsVisible(path: $path)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EvaluationAction.markAsVisible'))
      ..add(DiagnosticsProperty('path', path));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkAsVisibleImpl &&
            (identical(other.path, path) || other.path == path));
  }

  @override
  int get hashCode => Object.hash(runtimeType, path);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarkAsVisibleImplCopyWith<_$MarkAsVisibleImpl> get copyWith =>
      __$$MarkAsVisibleImplCopyWithImpl<_$MarkAsVisibleImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String path, dynamic value) assignValue,
    required TResult Function(String path) markAsPending,
    required TResult Function(String path) markAsHidden,
    required TResult Function(String path) markAsVisible,
    required TResult Function(String path) markAsMandatory,
    required TResult Function(String path) markAsOptional,
    required TResult Function(String path, Map<String, String>? errorMessage)
        setError,
    required TResult Function(String path) stopRepeat,
    required TResult Function(String path) setCount,
    required TResult Function(
            String path, List<String> optionsToShow, List<String> optionsToHide)
        showHideOptions,
  }) {
    return markAsVisible(path);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String path, dynamic value)? assignValue,
    TResult? Function(String path)? markAsPending,
    TResult? Function(String path)? markAsHidden,
    TResult? Function(String path)? markAsVisible,
    TResult? Function(String path)? markAsMandatory,
    TResult? Function(String path)? markAsOptional,
    TResult? Function(String path, Map<String, String>? errorMessage)? setError,
    TResult? Function(String path)? stopRepeat,
    TResult? Function(String path)? setCount,
    TResult? Function(String path, List<String> optionsToShow,
            List<String> optionsToHide)?
        showHideOptions,
  }) {
    return markAsVisible?.call(path);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String path, dynamic value)? assignValue,
    TResult Function(String path)? markAsPending,
    TResult Function(String path)? markAsHidden,
    TResult Function(String path)? markAsVisible,
    TResult Function(String path)? markAsMandatory,
    TResult Function(String path)? markAsOptional,
    TResult Function(String path, Map<String, String>? errorMessage)? setError,
    TResult Function(String path)? stopRepeat,
    TResult Function(String path)? setCount,
    TResult Function(String path, List<String> optionsToShow,
            List<String> optionsToHide)?
        showHideOptions,
    required TResult orElse(),
  }) {
    if (markAsVisible != null) {
      return markAsVisible(path);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AssignValue value) assignValue,
    required TResult Function(MarkAsPending value) markAsPending,
    required TResult Function(MarkAsHidden value) markAsHidden,
    required TResult Function(MarkAsVisible value) markAsVisible,
    required TResult Function(MarkAsMandatory value) markAsMandatory,
    required TResult Function(MarkAsOptional value) markAsOptional,
    required TResult Function(SetError value) setError,
    required TResult Function(StopRepeat value) stopRepeat,
    required TResult Function(SetCount value) setCount,
    required TResult Function(ShowHideOptions value) showHideOptions,
  }) {
    return markAsVisible(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AssignValue value)? assignValue,
    TResult? Function(MarkAsPending value)? markAsPending,
    TResult? Function(MarkAsHidden value)? markAsHidden,
    TResult? Function(MarkAsVisible value)? markAsVisible,
    TResult? Function(MarkAsMandatory value)? markAsMandatory,
    TResult? Function(MarkAsOptional value)? markAsOptional,
    TResult? Function(SetError value)? setError,
    TResult? Function(StopRepeat value)? stopRepeat,
    TResult? Function(SetCount value)? setCount,
    TResult? Function(ShowHideOptions value)? showHideOptions,
  }) {
    return markAsVisible?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AssignValue value)? assignValue,
    TResult Function(MarkAsPending value)? markAsPending,
    TResult Function(MarkAsHidden value)? markAsHidden,
    TResult Function(MarkAsVisible value)? markAsVisible,
    TResult Function(MarkAsMandatory value)? markAsMandatory,
    TResult Function(MarkAsOptional value)? markAsOptional,
    TResult Function(SetError value)? setError,
    TResult Function(StopRepeat value)? stopRepeat,
    TResult Function(SetCount value)? setCount,
    TResult Function(ShowHideOptions value)? showHideOptions,
    required TResult orElse(),
  }) {
    if (markAsVisible != null) {
      return markAsVisible(this);
    }
    return orElse();
  }
}

abstract class MarkAsVisible implements EvaluationAction {
  const factory MarkAsVisible(final String path) = _$MarkAsVisibleImpl;

  @override
  String get path;
  @override
  @JsonKey(ignore: true)
  _$$MarkAsVisibleImplCopyWith<_$MarkAsVisibleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MarkAsMandatoryImplCopyWith<$Res>
    implements $EvaluationActionCopyWith<$Res> {
  factory _$$MarkAsMandatoryImplCopyWith(_$MarkAsMandatoryImpl value,
          $Res Function(_$MarkAsMandatoryImpl) then) =
      __$$MarkAsMandatoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String path});
}

/// @nodoc
class __$$MarkAsMandatoryImplCopyWithImpl<$Res>
    extends _$EvaluationActionCopyWithImpl<$Res, _$MarkAsMandatoryImpl>
    implements _$$MarkAsMandatoryImplCopyWith<$Res> {
  __$$MarkAsMandatoryImplCopyWithImpl(
      _$MarkAsMandatoryImpl _value, $Res Function(_$MarkAsMandatoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
  }) {
    return _then(_$MarkAsMandatoryImpl(
      null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MarkAsMandatoryImpl
    with DiagnosticableTreeMixin
    implements MarkAsMandatory {
  const _$MarkAsMandatoryImpl(this.path);

  @override
  final String path;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EvaluationAction.markAsMandatory(path: $path)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EvaluationAction.markAsMandatory'))
      ..add(DiagnosticsProperty('path', path));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkAsMandatoryImpl &&
            (identical(other.path, path) || other.path == path));
  }

  @override
  int get hashCode => Object.hash(runtimeType, path);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarkAsMandatoryImplCopyWith<_$MarkAsMandatoryImpl> get copyWith =>
      __$$MarkAsMandatoryImplCopyWithImpl<_$MarkAsMandatoryImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String path, dynamic value) assignValue,
    required TResult Function(String path) markAsPending,
    required TResult Function(String path) markAsHidden,
    required TResult Function(String path) markAsVisible,
    required TResult Function(String path) markAsMandatory,
    required TResult Function(String path) markAsOptional,
    required TResult Function(String path, Map<String, String>? errorMessage)
        setError,
    required TResult Function(String path) stopRepeat,
    required TResult Function(String path) setCount,
    required TResult Function(
            String path, List<String> optionsToShow, List<String> optionsToHide)
        showHideOptions,
  }) {
    return markAsMandatory(path);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String path, dynamic value)? assignValue,
    TResult? Function(String path)? markAsPending,
    TResult? Function(String path)? markAsHidden,
    TResult? Function(String path)? markAsVisible,
    TResult? Function(String path)? markAsMandatory,
    TResult? Function(String path)? markAsOptional,
    TResult? Function(String path, Map<String, String>? errorMessage)? setError,
    TResult? Function(String path)? stopRepeat,
    TResult? Function(String path)? setCount,
    TResult? Function(String path, List<String> optionsToShow,
            List<String> optionsToHide)?
        showHideOptions,
  }) {
    return markAsMandatory?.call(path);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String path, dynamic value)? assignValue,
    TResult Function(String path)? markAsPending,
    TResult Function(String path)? markAsHidden,
    TResult Function(String path)? markAsVisible,
    TResult Function(String path)? markAsMandatory,
    TResult Function(String path)? markAsOptional,
    TResult Function(String path, Map<String, String>? errorMessage)? setError,
    TResult Function(String path)? stopRepeat,
    TResult Function(String path)? setCount,
    TResult Function(String path, List<String> optionsToShow,
            List<String> optionsToHide)?
        showHideOptions,
    required TResult orElse(),
  }) {
    if (markAsMandatory != null) {
      return markAsMandatory(path);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AssignValue value) assignValue,
    required TResult Function(MarkAsPending value) markAsPending,
    required TResult Function(MarkAsHidden value) markAsHidden,
    required TResult Function(MarkAsVisible value) markAsVisible,
    required TResult Function(MarkAsMandatory value) markAsMandatory,
    required TResult Function(MarkAsOptional value) markAsOptional,
    required TResult Function(SetError value) setError,
    required TResult Function(StopRepeat value) stopRepeat,
    required TResult Function(SetCount value) setCount,
    required TResult Function(ShowHideOptions value) showHideOptions,
  }) {
    return markAsMandatory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AssignValue value)? assignValue,
    TResult? Function(MarkAsPending value)? markAsPending,
    TResult? Function(MarkAsHidden value)? markAsHidden,
    TResult? Function(MarkAsVisible value)? markAsVisible,
    TResult? Function(MarkAsMandatory value)? markAsMandatory,
    TResult? Function(MarkAsOptional value)? markAsOptional,
    TResult? Function(SetError value)? setError,
    TResult? Function(StopRepeat value)? stopRepeat,
    TResult? Function(SetCount value)? setCount,
    TResult? Function(ShowHideOptions value)? showHideOptions,
  }) {
    return markAsMandatory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AssignValue value)? assignValue,
    TResult Function(MarkAsPending value)? markAsPending,
    TResult Function(MarkAsHidden value)? markAsHidden,
    TResult Function(MarkAsVisible value)? markAsVisible,
    TResult Function(MarkAsMandatory value)? markAsMandatory,
    TResult Function(MarkAsOptional value)? markAsOptional,
    TResult Function(SetError value)? setError,
    TResult Function(StopRepeat value)? stopRepeat,
    TResult Function(SetCount value)? setCount,
    TResult Function(ShowHideOptions value)? showHideOptions,
    required TResult orElse(),
  }) {
    if (markAsMandatory != null) {
      return markAsMandatory(this);
    }
    return orElse();
  }
}

abstract class MarkAsMandatory implements EvaluationAction {
  const factory MarkAsMandatory(final String path) = _$MarkAsMandatoryImpl;

  @override
  String get path;
  @override
  @JsonKey(ignore: true)
  _$$MarkAsMandatoryImplCopyWith<_$MarkAsMandatoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MarkAsOptionalImplCopyWith<$Res>
    implements $EvaluationActionCopyWith<$Res> {
  factory _$$MarkAsOptionalImplCopyWith(_$MarkAsOptionalImpl value,
          $Res Function(_$MarkAsOptionalImpl) then) =
      __$$MarkAsOptionalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String path});
}

/// @nodoc
class __$$MarkAsOptionalImplCopyWithImpl<$Res>
    extends _$EvaluationActionCopyWithImpl<$Res, _$MarkAsOptionalImpl>
    implements _$$MarkAsOptionalImplCopyWith<$Res> {
  __$$MarkAsOptionalImplCopyWithImpl(
      _$MarkAsOptionalImpl _value, $Res Function(_$MarkAsOptionalImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
  }) {
    return _then(_$MarkAsOptionalImpl(
      null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MarkAsOptionalImpl
    with DiagnosticableTreeMixin
    implements MarkAsOptional {
  const _$MarkAsOptionalImpl(this.path);

  @override
  final String path;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EvaluationAction.markAsOptional(path: $path)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EvaluationAction.markAsOptional'))
      ..add(DiagnosticsProperty('path', path));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkAsOptionalImpl &&
            (identical(other.path, path) || other.path == path));
  }

  @override
  int get hashCode => Object.hash(runtimeType, path);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarkAsOptionalImplCopyWith<_$MarkAsOptionalImpl> get copyWith =>
      __$$MarkAsOptionalImplCopyWithImpl<_$MarkAsOptionalImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String path, dynamic value) assignValue,
    required TResult Function(String path) markAsPending,
    required TResult Function(String path) markAsHidden,
    required TResult Function(String path) markAsVisible,
    required TResult Function(String path) markAsMandatory,
    required TResult Function(String path) markAsOptional,
    required TResult Function(String path, Map<String, String>? errorMessage)
        setError,
    required TResult Function(String path) stopRepeat,
    required TResult Function(String path) setCount,
    required TResult Function(
            String path, List<String> optionsToShow, List<String> optionsToHide)
        showHideOptions,
  }) {
    return markAsOptional(path);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String path, dynamic value)? assignValue,
    TResult? Function(String path)? markAsPending,
    TResult? Function(String path)? markAsHidden,
    TResult? Function(String path)? markAsVisible,
    TResult? Function(String path)? markAsMandatory,
    TResult? Function(String path)? markAsOptional,
    TResult? Function(String path, Map<String, String>? errorMessage)? setError,
    TResult? Function(String path)? stopRepeat,
    TResult? Function(String path)? setCount,
    TResult? Function(String path, List<String> optionsToShow,
            List<String> optionsToHide)?
        showHideOptions,
  }) {
    return markAsOptional?.call(path);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String path, dynamic value)? assignValue,
    TResult Function(String path)? markAsPending,
    TResult Function(String path)? markAsHidden,
    TResult Function(String path)? markAsVisible,
    TResult Function(String path)? markAsMandatory,
    TResult Function(String path)? markAsOptional,
    TResult Function(String path, Map<String, String>? errorMessage)? setError,
    TResult Function(String path)? stopRepeat,
    TResult Function(String path)? setCount,
    TResult Function(String path, List<String> optionsToShow,
            List<String> optionsToHide)?
        showHideOptions,
    required TResult orElse(),
  }) {
    if (markAsOptional != null) {
      return markAsOptional(path);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AssignValue value) assignValue,
    required TResult Function(MarkAsPending value) markAsPending,
    required TResult Function(MarkAsHidden value) markAsHidden,
    required TResult Function(MarkAsVisible value) markAsVisible,
    required TResult Function(MarkAsMandatory value) markAsMandatory,
    required TResult Function(MarkAsOptional value) markAsOptional,
    required TResult Function(SetError value) setError,
    required TResult Function(StopRepeat value) stopRepeat,
    required TResult Function(SetCount value) setCount,
    required TResult Function(ShowHideOptions value) showHideOptions,
  }) {
    return markAsOptional(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AssignValue value)? assignValue,
    TResult? Function(MarkAsPending value)? markAsPending,
    TResult? Function(MarkAsHidden value)? markAsHidden,
    TResult? Function(MarkAsVisible value)? markAsVisible,
    TResult? Function(MarkAsMandatory value)? markAsMandatory,
    TResult? Function(MarkAsOptional value)? markAsOptional,
    TResult? Function(SetError value)? setError,
    TResult? Function(StopRepeat value)? stopRepeat,
    TResult? Function(SetCount value)? setCount,
    TResult? Function(ShowHideOptions value)? showHideOptions,
  }) {
    return markAsOptional?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AssignValue value)? assignValue,
    TResult Function(MarkAsPending value)? markAsPending,
    TResult Function(MarkAsHidden value)? markAsHidden,
    TResult Function(MarkAsVisible value)? markAsVisible,
    TResult Function(MarkAsMandatory value)? markAsMandatory,
    TResult Function(MarkAsOptional value)? markAsOptional,
    TResult Function(SetError value)? setError,
    TResult Function(StopRepeat value)? stopRepeat,
    TResult Function(SetCount value)? setCount,
    TResult Function(ShowHideOptions value)? showHideOptions,
    required TResult orElse(),
  }) {
    if (markAsOptional != null) {
      return markAsOptional(this);
    }
    return orElse();
  }
}

abstract class MarkAsOptional implements EvaluationAction {
  const factory MarkAsOptional(final String path) = _$MarkAsOptionalImpl;

  @override
  String get path;
  @override
  @JsonKey(ignore: true)
  _$$MarkAsOptionalImplCopyWith<_$MarkAsOptionalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetErrorImplCopyWith<$Res>
    implements $EvaluationActionCopyWith<$Res> {
  factory _$$SetErrorImplCopyWith(
          _$SetErrorImpl value, $Res Function(_$SetErrorImpl) then) =
      __$$SetErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String path, Map<String, String>? errorMessage});
}

/// @nodoc
class __$$SetErrorImplCopyWithImpl<$Res>
    extends _$EvaluationActionCopyWithImpl<$Res, _$SetErrorImpl>
    implements _$$SetErrorImplCopyWith<$Res> {
  __$$SetErrorImplCopyWithImpl(
      _$SetErrorImpl _value, $Res Function(_$SetErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$SetErrorImpl(
      null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessage: freezed == errorMessage
          ? _value._errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ));
  }
}

/// @nodoc

class _$SetErrorImpl with DiagnosticableTreeMixin implements SetError {
  const _$SetErrorImpl(this.path, {final Map<String, String>? errorMessage})
      : _errorMessage = errorMessage;

  @override
  final String path;
  final Map<String, String>? _errorMessage;
  @override
  Map<String, String>? get errorMessage {
    final value = _errorMessage;
    if (value == null) return null;
    if (_errorMessage is EqualUnmodifiableMapView) return _errorMessage;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EvaluationAction.setError(path: $path, errorMessage: $errorMessage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EvaluationAction.setError'))
      ..add(DiagnosticsProperty('path', path))
      ..add(DiagnosticsProperty('errorMessage', errorMessage));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetErrorImpl &&
            (identical(other.path, path) || other.path == path) &&
            const DeepCollectionEquality()
                .equals(other._errorMessage, _errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, path, const DeepCollectionEquality().hash(_errorMessage));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetErrorImplCopyWith<_$SetErrorImpl> get copyWith =>
      __$$SetErrorImplCopyWithImpl<_$SetErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String path, dynamic value) assignValue,
    required TResult Function(String path) markAsPending,
    required TResult Function(String path) markAsHidden,
    required TResult Function(String path) markAsVisible,
    required TResult Function(String path) markAsMandatory,
    required TResult Function(String path) markAsOptional,
    required TResult Function(String path, Map<String, String>? errorMessage)
        setError,
    required TResult Function(String path) stopRepeat,
    required TResult Function(String path) setCount,
    required TResult Function(
            String path, List<String> optionsToShow, List<String> optionsToHide)
        showHideOptions,
  }) {
    return setError(path, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String path, dynamic value)? assignValue,
    TResult? Function(String path)? markAsPending,
    TResult? Function(String path)? markAsHidden,
    TResult? Function(String path)? markAsVisible,
    TResult? Function(String path)? markAsMandatory,
    TResult? Function(String path)? markAsOptional,
    TResult? Function(String path, Map<String, String>? errorMessage)? setError,
    TResult? Function(String path)? stopRepeat,
    TResult? Function(String path)? setCount,
    TResult? Function(String path, List<String> optionsToShow,
            List<String> optionsToHide)?
        showHideOptions,
  }) {
    return setError?.call(path, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String path, dynamic value)? assignValue,
    TResult Function(String path)? markAsPending,
    TResult Function(String path)? markAsHidden,
    TResult Function(String path)? markAsVisible,
    TResult Function(String path)? markAsMandatory,
    TResult Function(String path)? markAsOptional,
    TResult Function(String path, Map<String, String>? errorMessage)? setError,
    TResult Function(String path)? stopRepeat,
    TResult Function(String path)? setCount,
    TResult Function(String path, List<String> optionsToShow,
            List<String> optionsToHide)?
        showHideOptions,
    required TResult orElse(),
  }) {
    if (setError != null) {
      return setError(path, errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AssignValue value) assignValue,
    required TResult Function(MarkAsPending value) markAsPending,
    required TResult Function(MarkAsHidden value) markAsHidden,
    required TResult Function(MarkAsVisible value) markAsVisible,
    required TResult Function(MarkAsMandatory value) markAsMandatory,
    required TResult Function(MarkAsOptional value) markAsOptional,
    required TResult Function(SetError value) setError,
    required TResult Function(StopRepeat value) stopRepeat,
    required TResult Function(SetCount value) setCount,
    required TResult Function(ShowHideOptions value) showHideOptions,
  }) {
    return setError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AssignValue value)? assignValue,
    TResult? Function(MarkAsPending value)? markAsPending,
    TResult? Function(MarkAsHidden value)? markAsHidden,
    TResult? Function(MarkAsVisible value)? markAsVisible,
    TResult? Function(MarkAsMandatory value)? markAsMandatory,
    TResult? Function(MarkAsOptional value)? markAsOptional,
    TResult? Function(SetError value)? setError,
    TResult? Function(StopRepeat value)? stopRepeat,
    TResult? Function(SetCount value)? setCount,
    TResult? Function(ShowHideOptions value)? showHideOptions,
  }) {
    return setError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AssignValue value)? assignValue,
    TResult Function(MarkAsPending value)? markAsPending,
    TResult Function(MarkAsHidden value)? markAsHidden,
    TResult Function(MarkAsVisible value)? markAsVisible,
    TResult Function(MarkAsMandatory value)? markAsMandatory,
    TResult Function(MarkAsOptional value)? markAsOptional,
    TResult Function(SetError value)? setError,
    TResult Function(StopRepeat value)? stopRepeat,
    TResult Function(SetCount value)? setCount,
    TResult Function(ShowHideOptions value)? showHideOptions,
    required TResult orElse(),
  }) {
    if (setError != null) {
      return setError(this);
    }
    return orElse();
  }
}

abstract class SetError implements EvaluationAction {
  const factory SetError(final String path,
      {final Map<String, String>? errorMessage}) = _$SetErrorImpl;

  @override
  String get path;
  Map<String, String>? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$SetErrorImplCopyWith<_$SetErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StopRepeatImplCopyWith<$Res>
    implements $EvaluationActionCopyWith<$Res> {
  factory _$$StopRepeatImplCopyWith(
          _$StopRepeatImpl value, $Res Function(_$StopRepeatImpl) then) =
      __$$StopRepeatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String path});
}

/// @nodoc
class __$$StopRepeatImplCopyWithImpl<$Res>
    extends _$EvaluationActionCopyWithImpl<$Res, _$StopRepeatImpl>
    implements _$$StopRepeatImplCopyWith<$Res> {
  __$$StopRepeatImplCopyWithImpl(
      _$StopRepeatImpl _value, $Res Function(_$StopRepeatImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
  }) {
    return _then(_$StopRepeatImpl(
      null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$StopRepeatImpl with DiagnosticableTreeMixin implements StopRepeat {
  const _$StopRepeatImpl(this.path);

  @override
  final String path;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EvaluationAction.stopRepeat(path: $path)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EvaluationAction.stopRepeat'))
      ..add(DiagnosticsProperty('path', path));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StopRepeatImpl &&
            (identical(other.path, path) || other.path == path));
  }

  @override
  int get hashCode => Object.hash(runtimeType, path);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StopRepeatImplCopyWith<_$StopRepeatImpl> get copyWith =>
      __$$StopRepeatImplCopyWithImpl<_$StopRepeatImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String path, dynamic value) assignValue,
    required TResult Function(String path) markAsPending,
    required TResult Function(String path) markAsHidden,
    required TResult Function(String path) markAsVisible,
    required TResult Function(String path) markAsMandatory,
    required TResult Function(String path) markAsOptional,
    required TResult Function(String path, Map<String, String>? errorMessage)
        setError,
    required TResult Function(String path) stopRepeat,
    required TResult Function(String path) setCount,
    required TResult Function(
            String path, List<String> optionsToShow, List<String> optionsToHide)
        showHideOptions,
  }) {
    return stopRepeat(path);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String path, dynamic value)? assignValue,
    TResult? Function(String path)? markAsPending,
    TResult? Function(String path)? markAsHidden,
    TResult? Function(String path)? markAsVisible,
    TResult? Function(String path)? markAsMandatory,
    TResult? Function(String path)? markAsOptional,
    TResult? Function(String path, Map<String, String>? errorMessage)? setError,
    TResult? Function(String path)? stopRepeat,
    TResult? Function(String path)? setCount,
    TResult? Function(String path, List<String> optionsToShow,
            List<String> optionsToHide)?
        showHideOptions,
  }) {
    return stopRepeat?.call(path);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String path, dynamic value)? assignValue,
    TResult Function(String path)? markAsPending,
    TResult Function(String path)? markAsHidden,
    TResult Function(String path)? markAsVisible,
    TResult Function(String path)? markAsMandatory,
    TResult Function(String path)? markAsOptional,
    TResult Function(String path, Map<String, String>? errorMessage)? setError,
    TResult Function(String path)? stopRepeat,
    TResult Function(String path)? setCount,
    TResult Function(String path, List<String> optionsToShow,
            List<String> optionsToHide)?
        showHideOptions,
    required TResult orElse(),
  }) {
    if (stopRepeat != null) {
      return stopRepeat(path);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AssignValue value) assignValue,
    required TResult Function(MarkAsPending value) markAsPending,
    required TResult Function(MarkAsHidden value) markAsHidden,
    required TResult Function(MarkAsVisible value) markAsVisible,
    required TResult Function(MarkAsMandatory value) markAsMandatory,
    required TResult Function(MarkAsOptional value) markAsOptional,
    required TResult Function(SetError value) setError,
    required TResult Function(StopRepeat value) stopRepeat,
    required TResult Function(SetCount value) setCount,
    required TResult Function(ShowHideOptions value) showHideOptions,
  }) {
    return stopRepeat(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AssignValue value)? assignValue,
    TResult? Function(MarkAsPending value)? markAsPending,
    TResult? Function(MarkAsHidden value)? markAsHidden,
    TResult? Function(MarkAsVisible value)? markAsVisible,
    TResult? Function(MarkAsMandatory value)? markAsMandatory,
    TResult? Function(MarkAsOptional value)? markAsOptional,
    TResult? Function(SetError value)? setError,
    TResult? Function(StopRepeat value)? stopRepeat,
    TResult? Function(SetCount value)? setCount,
    TResult? Function(ShowHideOptions value)? showHideOptions,
  }) {
    return stopRepeat?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AssignValue value)? assignValue,
    TResult Function(MarkAsPending value)? markAsPending,
    TResult Function(MarkAsHidden value)? markAsHidden,
    TResult Function(MarkAsVisible value)? markAsVisible,
    TResult Function(MarkAsMandatory value)? markAsMandatory,
    TResult Function(MarkAsOptional value)? markAsOptional,
    TResult Function(SetError value)? setError,
    TResult Function(StopRepeat value)? stopRepeat,
    TResult Function(SetCount value)? setCount,
    TResult Function(ShowHideOptions value)? showHideOptions,
    required TResult orElse(),
  }) {
    if (stopRepeat != null) {
      return stopRepeat(this);
    }
    return orElse();
  }
}

abstract class StopRepeat implements EvaluationAction {
  const factory StopRepeat(final String path) = _$StopRepeatImpl;

  @override
  String get path;
  @override
  @JsonKey(ignore: true)
  _$$StopRepeatImplCopyWith<_$StopRepeatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetCountImplCopyWith<$Res>
    implements $EvaluationActionCopyWith<$Res> {
  factory _$$SetCountImplCopyWith(
          _$SetCountImpl value, $Res Function(_$SetCountImpl) then) =
      __$$SetCountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String path});
}

/// @nodoc
class __$$SetCountImplCopyWithImpl<$Res>
    extends _$EvaluationActionCopyWithImpl<$Res, _$SetCountImpl>
    implements _$$SetCountImplCopyWith<$Res> {
  __$$SetCountImplCopyWithImpl(
      _$SetCountImpl _value, $Res Function(_$SetCountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
  }) {
    return _then(_$SetCountImpl(
      null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SetCountImpl with DiagnosticableTreeMixin implements SetCount {
  const _$SetCountImpl(this.path);

  @override
  final String path;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EvaluationAction.setCount(path: $path)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EvaluationAction.setCount'))
      ..add(DiagnosticsProperty('path', path));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetCountImpl &&
            (identical(other.path, path) || other.path == path));
  }

  @override
  int get hashCode => Object.hash(runtimeType, path);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetCountImplCopyWith<_$SetCountImpl> get copyWith =>
      __$$SetCountImplCopyWithImpl<_$SetCountImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String path, dynamic value) assignValue,
    required TResult Function(String path) markAsPending,
    required TResult Function(String path) markAsHidden,
    required TResult Function(String path) markAsVisible,
    required TResult Function(String path) markAsMandatory,
    required TResult Function(String path) markAsOptional,
    required TResult Function(String path, Map<String, String>? errorMessage)
        setError,
    required TResult Function(String path) stopRepeat,
    required TResult Function(String path) setCount,
    required TResult Function(
            String path, List<String> optionsToShow, List<String> optionsToHide)
        showHideOptions,
  }) {
    return setCount(path);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String path, dynamic value)? assignValue,
    TResult? Function(String path)? markAsPending,
    TResult? Function(String path)? markAsHidden,
    TResult? Function(String path)? markAsVisible,
    TResult? Function(String path)? markAsMandatory,
    TResult? Function(String path)? markAsOptional,
    TResult? Function(String path, Map<String, String>? errorMessage)? setError,
    TResult? Function(String path)? stopRepeat,
    TResult? Function(String path)? setCount,
    TResult? Function(String path, List<String> optionsToShow,
            List<String> optionsToHide)?
        showHideOptions,
  }) {
    return setCount?.call(path);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String path, dynamic value)? assignValue,
    TResult Function(String path)? markAsPending,
    TResult Function(String path)? markAsHidden,
    TResult Function(String path)? markAsVisible,
    TResult Function(String path)? markAsMandatory,
    TResult Function(String path)? markAsOptional,
    TResult Function(String path, Map<String, String>? errorMessage)? setError,
    TResult Function(String path)? stopRepeat,
    TResult Function(String path)? setCount,
    TResult Function(String path, List<String> optionsToShow,
            List<String> optionsToHide)?
        showHideOptions,
    required TResult orElse(),
  }) {
    if (setCount != null) {
      return setCount(path);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AssignValue value) assignValue,
    required TResult Function(MarkAsPending value) markAsPending,
    required TResult Function(MarkAsHidden value) markAsHidden,
    required TResult Function(MarkAsVisible value) markAsVisible,
    required TResult Function(MarkAsMandatory value) markAsMandatory,
    required TResult Function(MarkAsOptional value) markAsOptional,
    required TResult Function(SetError value) setError,
    required TResult Function(StopRepeat value) stopRepeat,
    required TResult Function(SetCount value) setCount,
    required TResult Function(ShowHideOptions value) showHideOptions,
  }) {
    return setCount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AssignValue value)? assignValue,
    TResult? Function(MarkAsPending value)? markAsPending,
    TResult? Function(MarkAsHidden value)? markAsHidden,
    TResult? Function(MarkAsVisible value)? markAsVisible,
    TResult? Function(MarkAsMandatory value)? markAsMandatory,
    TResult? Function(MarkAsOptional value)? markAsOptional,
    TResult? Function(SetError value)? setError,
    TResult? Function(StopRepeat value)? stopRepeat,
    TResult? Function(SetCount value)? setCount,
    TResult? Function(ShowHideOptions value)? showHideOptions,
  }) {
    return setCount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AssignValue value)? assignValue,
    TResult Function(MarkAsPending value)? markAsPending,
    TResult Function(MarkAsHidden value)? markAsHidden,
    TResult Function(MarkAsVisible value)? markAsVisible,
    TResult Function(MarkAsMandatory value)? markAsMandatory,
    TResult Function(MarkAsOptional value)? markAsOptional,
    TResult Function(SetError value)? setError,
    TResult Function(StopRepeat value)? stopRepeat,
    TResult Function(SetCount value)? setCount,
    TResult Function(ShowHideOptions value)? showHideOptions,
    required TResult orElse(),
  }) {
    if (setCount != null) {
      return setCount(this);
    }
    return orElse();
  }
}

abstract class SetCount implements EvaluationAction {
  const factory SetCount(final String path) = _$SetCountImpl;

  @override
  String get path;
  @override
  @JsonKey(ignore: true)
  _$$SetCountImplCopyWith<_$SetCountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ShowHideOptionsImplCopyWith<$Res>
    implements $EvaluationActionCopyWith<$Res> {
  factory _$$ShowHideOptionsImplCopyWith(_$ShowHideOptionsImpl value,
          $Res Function(_$ShowHideOptionsImpl) then) =
      __$$ShowHideOptionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String path, List<String> optionsToShow, List<String> optionsToHide});
}

/// @nodoc
class __$$ShowHideOptionsImplCopyWithImpl<$Res>
    extends _$EvaluationActionCopyWithImpl<$Res, _$ShowHideOptionsImpl>
    implements _$$ShowHideOptionsImplCopyWith<$Res> {
  __$$ShowHideOptionsImplCopyWithImpl(
      _$ShowHideOptionsImpl _value, $Res Function(_$ShowHideOptionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? optionsToShow = null,
    Object? optionsToHide = null,
  }) {
    return _then(_$ShowHideOptionsImpl(
      null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      optionsToShow: null == optionsToShow
          ? _value._optionsToShow
          : optionsToShow // ignore: cast_nullable_to_non_nullable
              as List<String>,
      optionsToHide: null == optionsToHide
          ? _value._optionsToHide
          : optionsToHide // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$ShowHideOptionsImpl
    with DiagnosticableTreeMixin
    implements ShowHideOptions {
  const _$ShowHideOptionsImpl(this.path,
      {final List<String> optionsToShow = const [],
      final List<String> optionsToHide = const []})
      : _optionsToShow = optionsToShow,
        _optionsToHide = optionsToHide;

  @override
  final String path;
  final List<String> _optionsToShow;
  @override
  @JsonKey()
  List<String> get optionsToShow {
    if (_optionsToShow is EqualUnmodifiableListView) return _optionsToShow;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_optionsToShow);
  }

  final List<String> _optionsToHide;
  @override
  @JsonKey()
  List<String> get optionsToHide {
    if (_optionsToHide is EqualUnmodifiableListView) return _optionsToHide;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_optionsToHide);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EvaluationAction.showHideOptions(path: $path, optionsToShow: $optionsToShow, optionsToHide: $optionsToHide)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EvaluationAction.showHideOptions'))
      ..add(DiagnosticsProperty('path', path))
      ..add(DiagnosticsProperty('optionsToShow', optionsToShow))
      ..add(DiagnosticsProperty('optionsToHide', optionsToHide));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShowHideOptionsImpl &&
            (identical(other.path, path) || other.path == path) &&
            const DeepCollectionEquality()
                .equals(other._optionsToShow, _optionsToShow) &&
            const DeepCollectionEquality()
                .equals(other._optionsToHide, _optionsToHide));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      path,
      const DeepCollectionEquality().hash(_optionsToShow),
      const DeepCollectionEquality().hash(_optionsToHide));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShowHideOptionsImplCopyWith<_$ShowHideOptionsImpl> get copyWith =>
      __$$ShowHideOptionsImplCopyWithImpl<_$ShowHideOptionsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String path, dynamic value) assignValue,
    required TResult Function(String path) markAsPending,
    required TResult Function(String path) markAsHidden,
    required TResult Function(String path) markAsVisible,
    required TResult Function(String path) markAsMandatory,
    required TResult Function(String path) markAsOptional,
    required TResult Function(String path, Map<String, String>? errorMessage)
        setError,
    required TResult Function(String path) stopRepeat,
    required TResult Function(String path) setCount,
    required TResult Function(
            String path, List<String> optionsToShow, List<String> optionsToHide)
        showHideOptions,
  }) {
    return showHideOptions(path, optionsToShow, optionsToHide);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String path, dynamic value)? assignValue,
    TResult? Function(String path)? markAsPending,
    TResult? Function(String path)? markAsHidden,
    TResult? Function(String path)? markAsVisible,
    TResult? Function(String path)? markAsMandatory,
    TResult? Function(String path)? markAsOptional,
    TResult? Function(String path, Map<String, String>? errorMessage)? setError,
    TResult? Function(String path)? stopRepeat,
    TResult? Function(String path)? setCount,
    TResult? Function(String path, List<String> optionsToShow,
            List<String> optionsToHide)?
        showHideOptions,
  }) {
    return showHideOptions?.call(path, optionsToShow, optionsToHide);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String path, dynamic value)? assignValue,
    TResult Function(String path)? markAsPending,
    TResult Function(String path)? markAsHidden,
    TResult Function(String path)? markAsVisible,
    TResult Function(String path)? markAsMandatory,
    TResult Function(String path)? markAsOptional,
    TResult Function(String path, Map<String, String>? errorMessage)? setError,
    TResult Function(String path)? stopRepeat,
    TResult Function(String path)? setCount,
    TResult Function(String path, List<String> optionsToShow,
            List<String> optionsToHide)?
        showHideOptions,
    required TResult orElse(),
  }) {
    if (showHideOptions != null) {
      return showHideOptions(path, optionsToShow, optionsToHide);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AssignValue value) assignValue,
    required TResult Function(MarkAsPending value) markAsPending,
    required TResult Function(MarkAsHidden value) markAsHidden,
    required TResult Function(MarkAsVisible value) markAsVisible,
    required TResult Function(MarkAsMandatory value) markAsMandatory,
    required TResult Function(MarkAsOptional value) markAsOptional,
    required TResult Function(SetError value) setError,
    required TResult Function(StopRepeat value) stopRepeat,
    required TResult Function(SetCount value) setCount,
    required TResult Function(ShowHideOptions value) showHideOptions,
  }) {
    return showHideOptions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AssignValue value)? assignValue,
    TResult? Function(MarkAsPending value)? markAsPending,
    TResult? Function(MarkAsHidden value)? markAsHidden,
    TResult? Function(MarkAsVisible value)? markAsVisible,
    TResult? Function(MarkAsMandatory value)? markAsMandatory,
    TResult? Function(MarkAsOptional value)? markAsOptional,
    TResult? Function(SetError value)? setError,
    TResult? Function(StopRepeat value)? stopRepeat,
    TResult? Function(SetCount value)? setCount,
    TResult? Function(ShowHideOptions value)? showHideOptions,
  }) {
    return showHideOptions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AssignValue value)? assignValue,
    TResult Function(MarkAsPending value)? markAsPending,
    TResult Function(MarkAsHidden value)? markAsHidden,
    TResult Function(MarkAsVisible value)? markAsVisible,
    TResult Function(MarkAsMandatory value)? markAsMandatory,
    TResult Function(MarkAsOptional value)? markAsOptional,
    TResult Function(SetError value)? setError,
    TResult Function(StopRepeat value)? stopRepeat,
    TResult Function(SetCount value)? setCount,
    TResult Function(ShowHideOptions value)? showHideOptions,
    required TResult orElse(),
  }) {
    if (showHideOptions != null) {
      return showHideOptions(this);
    }
    return orElse();
  }
}

abstract class ShowHideOptions implements EvaluationAction {
  const factory ShowHideOptions(final String path,
      {final List<String> optionsToShow,
      final List<String> optionsToHide}) = _$ShowHideOptionsImpl;

  @override
  String get path;
  List<String> get optionsToShow;
  List<String> get optionsToHide;
  @override
  @JsonKey(ignore: true)
  _$$ShowHideOptionsImplCopyWith<_$ShowHideOptionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
