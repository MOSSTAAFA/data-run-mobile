// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dialog_button_style.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DialogButtonStyle {
  String get textResource => throw _privateConstructorUsedError;
  Color? get colorResource => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String textResource, Color? colorResource,
            IconData? iconResource, Color? backgroundColor)
        $default, {
    required TResult Function(String textResource, Color? colorResource)
        mainButton,
    required TResult Function(String textResource, Color? colorResource)
        secondaryButton,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String textResource, Color? colorResource,
            IconData? iconResource, Color? backgroundColor)?
        $default, {
    TResult? Function(String textResource, Color? colorResource)? mainButton,
    TResult? Function(String textResource, Color? colorResource)?
        secondaryButton,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String textResource, Color? colorResource,
            IconData? iconResource, Color? backgroundColor)?
        $default, {
    TResult Function(String textResource, Color? colorResource)? mainButton,
    TResult Function(String textResource, Color? colorResource)?
        secondaryButton,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DialogButtonStyle value) $default, {
    required TResult Function(MainButton value) mainButton,
    required TResult Function(SecondaryButton value) secondaryButton,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_DialogButtonStyle value)? $default, {
    TResult? Function(MainButton value)? mainButton,
    TResult? Function(SecondaryButton value)? secondaryButton,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DialogButtonStyle value)? $default, {
    TResult Function(MainButton value)? mainButton,
    TResult Function(SecondaryButton value)? secondaryButton,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DialogButtonStyleCopyWith<DialogButtonStyle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DialogButtonStyleCopyWith<$Res> {
  factory $DialogButtonStyleCopyWith(
          DialogButtonStyle value, $Res Function(DialogButtonStyle) then) =
      _$DialogButtonStyleCopyWithImpl<$Res, DialogButtonStyle>;
  @useResult
  $Res call({String textResource, Color? colorResource});
}

/// @nodoc
class _$DialogButtonStyleCopyWithImpl<$Res, $Val extends DialogButtonStyle>
    implements $DialogButtonStyleCopyWith<$Res> {
  _$DialogButtonStyleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? textResource = null,
    Object? colorResource = freezed,
  }) {
    return _then(_value.copyWith(
      textResource: null == textResource
          ? _value.textResource
          : textResource // ignore: cast_nullable_to_non_nullable
              as String,
      colorResource: freezed == colorResource
          ? _value.colorResource
          : colorResource // ignore: cast_nullable_to_non_nullable
              as Color?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DialogButtonStyleCopyWith<$Res>
    implements $DialogButtonStyleCopyWith<$Res> {
  factory _$$_DialogButtonStyleCopyWith(_$_DialogButtonStyle value,
          $Res Function(_$_DialogButtonStyle) then) =
      __$$_DialogButtonStyleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String textResource,
      Color? colorResource,
      IconData? iconResource,
      Color? backgroundColor});
}

/// @nodoc
class __$$_DialogButtonStyleCopyWithImpl<$Res>
    extends _$DialogButtonStyleCopyWithImpl<$Res, _$_DialogButtonStyle>
    implements _$$_DialogButtonStyleCopyWith<$Res> {
  __$$_DialogButtonStyleCopyWithImpl(
      _$_DialogButtonStyle _value, $Res Function(_$_DialogButtonStyle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? textResource = null,
    Object? colorResource = freezed,
    Object? iconResource = freezed,
    Object? backgroundColor = freezed,
  }) {
    return _then(_$_DialogButtonStyle(
      textResource: null == textResource
          ? _value.textResource
          : textResource // ignore: cast_nullable_to_non_nullable
              as String,
      colorResource: freezed == colorResource
          ? _value.colorResource
          : colorResource // ignore: cast_nullable_to_non_nullable
              as Color?,
      iconResource: freezed == iconResource
          ? _value.iconResource
          : iconResource // ignore: cast_nullable_to_non_nullable
              as IconData?,
      backgroundColor: freezed == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as Color?,
    ));
  }
}

/// @nodoc

class _$_DialogButtonStyle extends _DialogButtonStyle {
  const _$_DialogButtonStyle(
      {required this.textResource,
      this.colorResource,
      this.iconResource,
      this.backgroundColor})
      : super._();

  @override
  final String textResource;
  @override
  final Color? colorResource;
  @override
  final IconData? iconResource;
  @override
  final Color? backgroundColor;

  @override
  String toString() {
    return 'DialogButtonStyle(textResource: $textResource, colorResource: $colorResource, iconResource: $iconResource, backgroundColor: $backgroundColor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DialogButtonStyle &&
            (identical(other.textResource, textResource) ||
                other.textResource == textResource) &&
            (identical(other.colorResource, colorResource) ||
                other.colorResource == colorResource) &&
            (identical(other.iconResource, iconResource) ||
                other.iconResource == iconResource) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, textResource, colorResource, iconResource, backgroundColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DialogButtonStyleCopyWith<_$_DialogButtonStyle> get copyWith =>
      __$$_DialogButtonStyleCopyWithImpl<_$_DialogButtonStyle>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String textResource, Color? colorResource,
            IconData? iconResource, Color? backgroundColor)
        $default, {
    required TResult Function(String textResource, Color? colorResource)
        mainButton,
    required TResult Function(String textResource, Color? colorResource)
        secondaryButton,
  }) {
    return $default(textResource, colorResource, iconResource, backgroundColor);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String textResource, Color? colorResource,
            IconData? iconResource, Color? backgroundColor)?
        $default, {
    TResult? Function(String textResource, Color? colorResource)? mainButton,
    TResult? Function(String textResource, Color? colorResource)?
        secondaryButton,
  }) {
    return $default?.call(
        textResource, colorResource, iconResource, backgroundColor);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String textResource, Color? colorResource,
            IconData? iconResource, Color? backgroundColor)?
        $default, {
    TResult Function(String textResource, Color? colorResource)? mainButton,
    TResult Function(String textResource, Color? colorResource)?
        secondaryButton,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
          textResource, colorResource, iconResource, backgroundColor);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DialogButtonStyle value) $default, {
    required TResult Function(MainButton value) mainButton,
    required TResult Function(SecondaryButton value) secondaryButton,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_DialogButtonStyle value)? $default, {
    TResult? Function(MainButton value)? mainButton,
    TResult? Function(SecondaryButton value)? secondaryButton,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DialogButtonStyle value)? $default, {
    TResult Function(MainButton value)? mainButton,
    TResult Function(SecondaryButton value)? secondaryButton,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _DialogButtonStyle extends DialogButtonStyle {
  const factory _DialogButtonStyle(
      {required final String textResource,
      final Color? colorResource,
      final IconData? iconResource,
      final Color? backgroundColor}) = _$_DialogButtonStyle;
  const _DialogButtonStyle._() : super._();

  @override
  String get textResource;
  @override
  Color? get colorResource;
  IconData? get iconResource;
  Color? get backgroundColor;
  @override
  @JsonKey(ignore: true)
  _$$_DialogButtonStyleCopyWith<_$_DialogButtonStyle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MainButtonCopyWith<$Res>
    implements $DialogButtonStyleCopyWith<$Res> {
  factory _$$MainButtonCopyWith(
          _$MainButton value, $Res Function(_$MainButton) then) =
      __$$MainButtonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String textResource, Color? colorResource});
}

/// @nodoc
class __$$MainButtonCopyWithImpl<$Res>
    extends _$DialogButtonStyleCopyWithImpl<$Res, _$MainButton>
    implements _$$MainButtonCopyWith<$Res> {
  __$$MainButtonCopyWithImpl(
      _$MainButton _value, $Res Function(_$MainButton) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? textResource = null,
    Object? colorResource = freezed,
  }) {
    return _then(_$MainButton(
      textResource: null == textResource
          ? _value.textResource
          : textResource // ignore: cast_nullable_to_non_nullable
              as String,
      colorResource: freezed == colorResource
          ? _value.colorResource
          : colorResource // ignore: cast_nullable_to_non_nullable
              as Color?,
    ));
  }
}

/// @nodoc

class _$MainButton extends MainButton {
  const _$MainButton(
      {required this.textResource, this.colorResource = Colors.white})
      : super._();

  @override
  final String textResource;
  @override
  @JsonKey()
  final Color? colorResource;

  @override
  String toString() {
    return 'DialogButtonStyle.mainButton(textResource: $textResource, colorResource: $colorResource)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainButton &&
            (identical(other.textResource, textResource) ||
                other.textResource == textResource) &&
            (identical(other.colorResource, colorResource) ||
                other.colorResource == colorResource));
  }

  @override
  int get hashCode => Object.hash(runtimeType, textResource, colorResource);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MainButtonCopyWith<_$MainButton> get copyWith =>
      __$$MainButtonCopyWithImpl<_$MainButton>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String textResource, Color? colorResource,
            IconData? iconResource, Color? backgroundColor)
        $default, {
    required TResult Function(String textResource, Color? colorResource)
        mainButton,
    required TResult Function(String textResource, Color? colorResource)
        secondaryButton,
  }) {
    return mainButton(textResource, colorResource);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String textResource, Color? colorResource,
            IconData? iconResource, Color? backgroundColor)?
        $default, {
    TResult? Function(String textResource, Color? colorResource)? mainButton,
    TResult? Function(String textResource, Color? colorResource)?
        secondaryButton,
  }) {
    return mainButton?.call(textResource, colorResource);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String textResource, Color? colorResource,
            IconData? iconResource, Color? backgroundColor)?
        $default, {
    TResult Function(String textResource, Color? colorResource)? mainButton,
    TResult Function(String textResource, Color? colorResource)?
        secondaryButton,
    required TResult orElse(),
  }) {
    if (mainButton != null) {
      return mainButton(textResource, colorResource);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DialogButtonStyle value) $default, {
    required TResult Function(MainButton value) mainButton,
    required TResult Function(SecondaryButton value) secondaryButton,
  }) {
    return mainButton(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_DialogButtonStyle value)? $default, {
    TResult? Function(MainButton value)? mainButton,
    TResult? Function(SecondaryButton value)? secondaryButton,
  }) {
    return mainButton?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DialogButtonStyle value)? $default, {
    TResult Function(MainButton value)? mainButton,
    TResult Function(SecondaryButton value)? secondaryButton,
    required TResult orElse(),
  }) {
    if (mainButton != null) {
      return mainButton(this);
    }
    return orElse();
  }
}

abstract class MainButton extends DialogButtonStyle {
  const factory MainButton(
      {required final String textResource,
      final Color? colorResource}) = _$MainButton;
  const MainButton._() : super._();

  @override
  String get textResource;
  @override
  Color? get colorResource;
  @override
  @JsonKey(ignore: true)
  _$$MainButtonCopyWith<_$MainButton> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SecondaryButtonCopyWith<$Res>
    implements $DialogButtonStyleCopyWith<$Res> {
  factory _$$SecondaryButtonCopyWith(
          _$SecondaryButton value, $Res Function(_$SecondaryButton) then) =
      __$$SecondaryButtonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String textResource, Color? colorResource});
}

/// @nodoc
class __$$SecondaryButtonCopyWithImpl<$Res>
    extends _$DialogButtonStyleCopyWithImpl<$Res, _$SecondaryButton>
    implements _$$SecondaryButtonCopyWith<$Res> {
  __$$SecondaryButtonCopyWithImpl(
      _$SecondaryButton _value, $Res Function(_$SecondaryButton) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? textResource = null,
    Object? colorResource = freezed,
  }) {
    return _then(_$SecondaryButton(
      textResource: null == textResource
          ? _value.textResource
          : textResource // ignore: cast_nullable_to_non_nullable
              as String,
      colorResource: freezed == colorResource
          ? _value.colorResource
          : colorResource // ignore: cast_nullable_to_non_nullable
              as Color?,
    ));
  }
}

/// @nodoc

class _$SecondaryButton extends SecondaryButton {
  const _$SecondaryButton(
      {required this.textResource, this.colorResource = Colors.white})
      : super._();

  @override
  final String textResource;
  @override
  @JsonKey()
  final Color? colorResource;

  @override
  String toString() {
    return 'DialogButtonStyle.secondaryButton(textResource: $textResource, colorResource: $colorResource)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SecondaryButton &&
            (identical(other.textResource, textResource) ||
                other.textResource == textResource) &&
            (identical(other.colorResource, colorResource) ||
                other.colorResource == colorResource));
  }

  @override
  int get hashCode => Object.hash(runtimeType, textResource, colorResource);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SecondaryButtonCopyWith<_$SecondaryButton> get copyWith =>
      __$$SecondaryButtonCopyWithImpl<_$SecondaryButton>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String textResource, Color? colorResource,
            IconData? iconResource, Color? backgroundColor)
        $default, {
    required TResult Function(String textResource, Color? colorResource)
        mainButton,
    required TResult Function(String textResource, Color? colorResource)
        secondaryButton,
  }) {
    return secondaryButton(textResource, colorResource);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String textResource, Color? colorResource,
            IconData? iconResource, Color? backgroundColor)?
        $default, {
    TResult? Function(String textResource, Color? colorResource)? mainButton,
    TResult? Function(String textResource, Color? colorResource)?
        secondaryButton,
  }) {
    return secondaryButton?.call(textResource, colorResource);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String textResource, Color? colorResource,
            IconData? iconResource, Color? backgroundColor)?
        $default, {
    TResult Function(String textResource, Color? colorResource)? mainButton,
    TResult Function(String textResource, Color? colorResource)?
        secondaryButton,
    required TResult orElse(),
  }) {
    if (secondaryButton != null) {
      return secondaryButton(textResource, colorResource);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DialogButtonStyle value) $default, {
    required TResult Function(MainButton value) mainButton,
    required TResult Function(SecondaryButton value) secondaryButton,
  }) {
    return secondaryButton(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_DialogButtonStyle value)? $default, {
    TResult? Function(MainButton value)? mainButton,
    TResult? Function(SecondaryButton value)? secondaryButton,
  }) {
    return secondaryButton?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DialogButtonStyle value)? $default, {
    TResult Function(MainButton value)? mainButton,
    TResult Function(SecondaryButton value)? secondaryButton,
    required TResult orElse(),
  }) {
    if (secondaryButton != null) {
      return secondaryButton(this);
    }
    return orElse();
  }
}

abstract class SecondaryButton extends DialogButtonStyle {
  const factory SecondaryButton(
      {required final String textResource,
      final Color? colorResource}) = _$SecondaryButton;
  const SecondaryButton._() : super._();

  @override
  String get textResource;
  @override
  Color? get colorResource;
  @override
  @JsonKey(ignore: true)
  _$$SecondaryButtonCopyWith<_$SecondaryButton> get copyWith =>
      throw _privateConstructorUsedError;
}
