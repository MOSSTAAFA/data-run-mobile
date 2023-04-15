// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UIState {
  String get currentRoute =>
      throw _privateConstructorUsedError; // required int selectedCompanyIndex,
  int get filterClearedAt => throw _privateConstructorUsedError;
  int get lastActivityAt => throw _privateConstructorUsedError;
  String get previousRoute => throw _privateConstructorUsedError;
  List<BaseQuery<IdentifiableEntity>> get previewStack =>
      throw _privateConstructorUsedError;
  List<IdentifiableEntity> get filterStack =>
      throw _privateConstructorUsedError;
  BaseQuery<IdentifiableEntity>? get loadingEntityType =>
      throw _privateConstructorUsedError;
  String? get filter => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UIStateCopyWith<UIState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UIStateCopyWith<$Res> {
  factory $UIStateCopyWith(UIState value, $Res Function(UIState) then) =
      _$UIStateCopyWithImpl<$Res, UIState>;
  @useResult
  $Res call(
      {String currentRoute,
      int filterClearedAt,
      int lastActivityAt,
      String previousRoute,
      List<BaseQuery<IdentifiableEntity>> previewStack,
      List<IdentifiableEntity> filterStack,
      BaseQuery<IdentifiableEntity>? loadingEntityType,
      String? filter});
}

/// @nodoc
class _$UIStateCopyWithImpl<$Res, $Val extends UIState>
    implements $UIStateCopyWith<$Res> {
  _$UIStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentRoute = null,
    Object? filterClearedAt = null,
    Object? lastActivityAt = null,
    Object? previousRoute = null,
    Object? previewStack = null,
    Object? filterStack = null,
    Object? loadingEntityType = freezed,
    Object? filter = freezed,
  }) {
    return _then(_value.copyWith(
      currentRoute: null == currentRoute
          ? _value.currentRoute
          : currentRoute // ignore: cast_nullable_to_non_nullable
              as String,
      filterClearedAt: null == filterClearedAt
          ? _value.filterClearedAt
          : filterClearedAt // ignore: cast_nullable_to_non_nullable
              as int,
      lastActivityAt: null == lastActivityAt
          ? _value.lastActivityAt
          : lastActivityAt // ignore: cast_nullable_to_non_nullable
              as int,
      previousRoute: null == previousRoute
          ? _value.previousRoute
          : previousRoute // ignore: cast_nullable_to_non_nullable
              as String,
      previewStack: null == previewStack
          ? _value.previewStack
          : previewStack // ignore: cast_nullable_to_non_nullable
              as List<BaseQuery<IdentifiableEntity>>,
      filterStack: null == filterStack
          ? _value.filterStack
          : filterStack // ignore: cast_nullable_to_non_nullable
              as List<IdentifiableEntity>,
      loadingEntityType: freezed == loadingEntityType
          ? _value.loadingEntityType
          : loadingEntityType // ignore: cast_nullable_to_non_nullable
              as BaseQuery<IdentifiableEntity>?,
      filter: freezed == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UIStateCopyWith<$Res> implements $UIStateCopyWith<$Res> {
  factory _$$_UIStateCopyWith(
          _$_UIState value, $Res Function(_$_UIState) then) =
      __$$_UIStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String currentRoute,
      int filterClearedAt,
      int lastActivityAt,
      String previousRoute,
      List<BaseQuery<IdentifiableEntity>> previewStack,
      List<IdentifiableEntity> filterStack,
      BaseQuery<IdentifiableEntity>? loadingEntityType,
      String? filter});
}

/// @nodoc
class __$$_UIStateCopyWithImpl<$Res>
    extends _$UIStateCopyWithImpl<$Res, _$_UIState>
    implements _$$_UIStateCopyWith<$Res> {
  __$$_UIStateCopyWithImpl(_$_UIState _value, $Res Function(_$_UIState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentRoute = null,
    Object? filterClearedAt = null,
    Object? lastActivityAt = null,
    Object? previousRoute = null,
    Object? previewStack = null,
    Object? filterStack = null,
    Object? loadingEntityType = freezed,
    Object? filter = freezed,
  }) {
    return _then(_$_UIState(
      currentRoute: null == currentRoute
          ? _value.currentRoute
          : currentRoute // ignore: cast_nullable_to_non_nullable
              as String,
      filterClearedAt: null == filterClearedAt
          ? _value.filterClearedAt
          : filterClearedAt // ignore: cast_nullable_to_non_nullable
              as int,
      lastActivityAt: null == lastActivityAt
          ? _value.lastActivityAt
          : lastActivityAt // ignore: cast_nullable_to_non_nullable
              as int,
      previousRoute: null == previousRoute
          ? _value.previousRoute
          : previousRoute // ignore: cast_nullable_to_non_nullable
              as String,
      previewStack: null == previewStack
          ? _value._previewStack
          : previewStack // ignore: cast_nullable_to_non_nullable
              as List<BaseQuery<IdentifiableEntity>>,
      filterStack: null == filterStack
          ? _value._filterStack
          : filterStack // ignore: cast_nullable_to_non_nullable
              as List<IdentifiableEntity>,
      loadingEntityType: freezed == loadingEntityType
          ? _value.loadingEntityType
          : loadingEntityType // ignore: cast_nullable_to_non_nullable
              as BaseQuery<IdentifiableEntity>?,
      filter: freezed == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_UIState extends _UIState with DiagnosticableTreeMixin {
  const _$_UIState(
      {required this.currentRoute,
      required this.filterClearedAt,
      required this.lastActivityAt,
      required this.previousRoute,
      required final List<BaseQuery<IdentifiableEntity>> previewStack,
      required final List<IdentifiableEntity> filterStack,
      this.loadingEntityType,
      this.filter})
      : _previewStack = previewStack,
        _filterStack = filterStack,
        super._();

  @override
  final String currentRoute;
// required int selectedCompanyIndex,
  @override
  final int filterClearedAt;
  @override
  final int lastActivityAt;
  @override
  final String previousRoute;
  final List<BaseQuery<IdentifiableEntity>> _previewStack;
  @override
  List<BaseQuery<IdentifiableEntity>> get previewStack {
    if (_previewStack is EqualUnmodifiableListView) return _previewStack;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_previewStack);
  }

  final List<IdentifiableEntity> _filterStack;
  @override
  List<IdentifiableEntity> get filterStack {
    if (_filterStack is EqualUnmodifiableListView) return _filterStack;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filterStack);
  }

  @override
  final BaseQuery<IdentifiableEntity>? loadingEntityType;
  @override
  final String? filter;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UIState(currentRoute: $currentRoute, filterClearedAt: $filterClearedAt, lastActivityAt: $lastActivityAt, previousRoute: $previousRoute, previewStack: $previewStack, filterStack: $filterStack, loadingEntityType: $loadingEntityType, filter: $filter)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UIState'))
      ..add(DiagnosticsProperty('currentRoute', currentRoute))
      ..add(DiagnosticsProperty('filterClearedAt', filterClearedAt))
      ..add(DiagnosticsProperty('lastActivityAt', lastActivityAt))
      ..add(DiagnosticsProperty('previousRoute', previousRoute))
      ..add(DiagnosticsProperty('previewStack', previewStack))
      ..add(DiagnosticsProperty('filterStack', filterStack))
      ..add(DiagnosticsProperty('loadingEntityType', loadingEntityType))
      ..add(DiagnosticsProperty('filter', filter));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UIState &&
            (identical(other.currentRoute, currentRoute) ||
                other.currentRoute == currentRoute) &&
            (identical(other.filterClearedAt, filterClearedAt) ||
                other.filterClearedAt == filterClearedAt) &&
            (identical(other.lastActivityAt, lastActivityAt) ||
                other.lastActivityAt == lastActivityAt) &&
            (identical(other.previousRoute, previousRoute) ||
                other.previousRoute == previousRoute) &&
            const DeepCollectionEquality()
                .equals(other._previewStack, _previewStack) &&
            const DeepCollectionEquality()
                .equals(other._filterStack, _filterStack) &&
            (identical(other.loadingEntityType, loadingEntityType) ||
                other.loadingEntityType == loadingEntityType) &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentRoute,
      filterClearedAt,
      lastActivityAt,
      previousRoute,
      const DeepCollectionEquality().hash(_previewStack),
      const DeepCollectionEquality().hash(_filterStack),
      loadingEntityType,
      filter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UIStateCopyWith<_$_UIState> get copyWith =>
      __$$_UIStateCopyWithImpl<_$_UIState>(this, _$identity);
}

abstract class _UIState extends UIState {
  const factory _UIState(
      {required final String currentRoute,
      required final int filterClearedAt,
      required final int lastActivityAt,
      required final String previousRoute,
      required final List<BaseQuery<IdentifiableEntity>> previewStack,
      required final List<IdentifiableEntity> filterStack,
      final BaseQuery<IdentifiableEntity>? loadingEntityType,
      final String? filter}) = _$_UIState;
  const _UIState._() : super._();

  @override
  String get currentRoute;
  @override // required int selectedCompanyIndex,
  int get filterClearedAt;
  @override
  int get lastActivityAt;
  @override
  String get previousRoute;
  @override
  List<BaseQuery<IdentifiableEntity>> get previewStack;
  @override
  List<IdentifiableEntity> get filterStack;
  @override
  BaseQuery<IdentifiableEntity>? get loadingEntityType;
  @override
  String? get filter;
  @override
  @JsonKey(ignore: true)
  _$$_UIStateCopyWith<_$_UIState> get copyWith =>
      throw _privateConstructorUsedError;
}
