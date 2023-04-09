// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ou_tree_node.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OuTreeNodeModel {
  OrganisationUnit get content => throw _privateConstructorUsedError;
  bool get isOpen => throw _privateConstructorUsedError;
  bool get hasChild => throw _privateConstructorUsedError;
  bool get isChecked => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  int get selectedChildrenCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OuTreeNodeModelCopyWith<OuTreeNodeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OuTreeNodeModelCopyWith<$Res> {
  factory $OuTreeNodeModelCopyWith(
          OuTreeNodeModel value, $Res Function(OuTreeNodeModel) then) =
      _$OuTreeNodeModelCopyWithImpl<$Res, OuTreeNodeModel>;
  @useResult
  $Res call(
      {OrganisationUnit content,
      bool isOpen,
      bool hasChild,
      bool isChecked,
      int level,
      int selectedChildrenCount});
}

/// @nodoc
class _$OuTreeNodeModelCopyWithImpl<$Res, $Val extends OuTreeNodeModel>
    implements $OuTreeNodeModelCopyWith<$Res> {
  _$OuTreeNodeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? isOpen = null,
    Object? hasChild = null,
    Object? isChecked = null,
    Object? level = null,
    Object? selectedChildrenCount = null,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as OrganisationUnit,
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      hasChild: null == hasChild
          ? _value.hasChild
          : hasChild // ignore: cast_nullable_to_non_nullable
              as bool,
      isChecked: null == isChecked
          ? _value.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      selectedChildrenCount: null == selectedChildrenCount
          ? _value.selectedChildrenCount
          : selectedChildrenCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OuTreeNodeModelCopyWith<$Res>
    implements $OuTreeNodeModelCopyWith<$Res> {
  factory _$$_OuTreeNodeModelCopyWith(
          _$_OuTreeNodeModel value, $Res Function(_$_OuTreeNodeModel) then) =
      __$$_OuTreeNodeModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {OrganisationUnit content,
      bool isOpen,
      bool hasChild,
      bool isChecked,
      int level,
      int selectedChildrenCount});
}

/// @nodoc
class __$$_OuTreeNodeModelCopyWithImpl<$Res>
    extends _$OuTreeNodeModelCopyWithImpl<$Res, _$_OuTreeNodeModel>
    implements _$$_OuTreeNodeModelCopyWith<$Res> {
  __$$_OuTreeNodeModelCopyWithImpl(
      _$_OuTreeNodeModel _value, $Res Function(_$_OuTreeNodeModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? isOpen = null,
    Object? hasChild = null,
    Object? isChecked = null,
    Object? level = null,
    Object? selectedChildrenCount = null,
  }) {
    return _then(_$_OuTreeNodeModel(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as OrganisationUnit,
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      hasChild: null == hasChild
          ? _value.hasChild
          : hasChild // ignore: cast_nullable_to_non_nullable
              as bool,
      isChecked: null == isChecked
          ? _value.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      selectedChildrenCount: null == selectedChildrenCount
          ? _value.selectedChildrenCount
          : selectedChildrenCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_OuTreeNodeModel extends _OuTreeNodeModel {
  const _$_OuTreeNodeModel(
      {required this.content,
      this.isOpen = false,
      this.hasChild = false,
      this.isChecked = false,
      this.level = 0,
      this.selectedChildrenCount = 0})
      : super._();

  @override
  final OrganisationUnit content;
  @override
  @JsonKey()
  final bool isOpen;
  @override
  @JsonKey()
  final bool hasChild;
  @override
  @JsonKey()
  final bool isChecked;
  @override
  @JsonKey()
  final int level;
  @override
  @JsonKey()
  final int selectedChildrenCount;

  @override
  String toString() {
    return 'OuTreeNodeModel(content: $content, isOpen: $isOpen, hasChild: $hasChild, isChecked: $isChecked, level: $level, selectedChildrenCount: $selectedChildrenCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OuTreeNodeModel &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen) &&
            (identical(other.hasChild, hasChild) ||
                other.hasChild == hasChild) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.selectedChildrenCount, selectedChildrenCount) ||
                other.selectedChildrenCount == selectedChildrenCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, content, isOpen, hasChild,
      isChecked, level, selectedChildrenCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OuTreeNodeModelCopyWith<_$_OuTreeNodeModel> get copyWith =>
      __$$_OuTreeNodeModelCopyWithImpl<_$_OuTreeNodeModel>(this, _$identity);
}

abstract class _OuTreeNodeModel extends OuTreeNodeModel {
  const factory _OuTreeNodeModel(
      {required final OrganisationUnit content,
      final bool isOpen,
      final bool hasChild,
      final bool isChecked,
      final int level,
      final int selectedChildrenCount}) = _$_OuTreeNodeModel;
  const _OuTreeNodeModel._() : super._();

  @override
  OrganisationUnit get content;
  @override
  bool get isOpen;
  @override
  bool get hasChild;
  @override
  bool get isChecked;
  @override
  int get level;
  @override
  int get selectedChildrenCount;
  @override
  @JsonKey(ignore: true)
  _$$_OuTreeNodeModelCopyWith<_$_OuTreeNodeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
