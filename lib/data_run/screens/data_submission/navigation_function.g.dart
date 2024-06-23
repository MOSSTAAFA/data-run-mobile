// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_function.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$teamsHash() => r'0f54941f1c8695afc4d3563bb1ffdfb292555714';

/// See also [teams].
@ProviderFor(teams)
final teamsProvider = AutoDisposeFutureProvider<List<DTeam>>.internal(
  teams,
  name: r'teamsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$teamsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TeamsRef = AutoDisposeFutureProviderRef<List<DTeam>>;
String _$formsHash() => r'9da3fa87fd1e043a2bcc823303b0bd50d9d00a06';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [forms].
@ProviderFor(forms)
const formsProvider = FormsFamily();

/// See also [forms].
class FormsFamily extends Family<AsyncValue<List<DynamicForm>>> {
  /// See also [forms].
  const FormsFamily();

  /// See also [forms].
  FormsProvider call(
    String teamUid,
  ) {
    return FormsProvider(
      teamUid,
    );
  }

  @override
  FormsProvider getProviderOverride(
    covariant FormsProvider provider,
  ) {
    return call(
      provider.teamUid,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'formsProvider';
}

/// See also [forms].
class FormsProvider extends AutoDisposeFutureProvider<List<DynamicForm>> {
  /// See also [forms].
  FormsProvider(
    String teamUid,
  ) : this._internal(
          (ref) => forms(
            ref as FormsRef,
            teamUid,
          ),
          from: formsProvider,
          name: r'formsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$formsHash,
          dependencies: FormsFamily._dependencies,
          allTransitiveDependencies: FormsFamily._allTransitiveDependencies,
          teamUid: teamUid,
        );

  FormsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.teamUid,
  }) : super.internal();

  final String teamUid;

  @override
  Override overrideWith(
    FutureOr<List<DynamicForm>> Function(FormsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FormsProvider._internal(
        (ref) => create(ref as FormsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        teamUid: teamUid,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<DynamicForm>> createElement() {
    return _FormsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FormsProvider && other.teamUid == teamUid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, teamUid.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FormsRef on AutoDisposeFutureProviderRef<List<DynamicForm>> {
  /// The parameter `teamUid` of this provider.
  String get teamUid;
}

class _FormsProviderElement
    extends AutoDisposeFutureProviderElement<List<DynamicForm>> with FormsRef {
  _FormsProviderElement(super.provider);

  @override
  String get teamUid => (origin as FormsProvider).teamUid;
}

String _$activityDataRepositoryHash() =>
    r'2776d56989e58542560c52951eea4cd6f54bfdbf';

/// See also [_activityDataRepository].
@ProviderFor(_activityDataRepository)
const _activityDataRepositoryProvider = _ActivityDataRepositoryFamily();

/// See also [_activityDataRepository].
class _ActivityDataRepositoryFamily extends Family<AsyncValue<SyncableQuery>> {
  /// See also [_activityDataRepository].
  const _ActivityDataRepositoryFamily();

  /// See also [_activityDataRepository].
  _ActivityDataRepositoryProvider call(
    DActivity activity,
  ) {
    return _ActivityDataRepositoryProvider(
      activity,
    );
  }

  @override
  _ActivityDataRepositoryProvider getProviderOverride(
    covariant _ActivityDataRepositoryProvider provider,
  ) {
    return call(
      provider.activity,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'_activityDataRepositoryProvider';
}

/// See also [_activityDataRepository].
class _ActivityDataRepositoryProvider
    extends AutoDisposeFutureProvider<SyncableQuery> {
  /// See also [_activityDataRepository].
  _ActivityDataRepositoryProvider(
    DActivity activity,
  ) : this._internal(
          (ref) => _activityDataRepository(
            ref as _ActivityDataRepositoryRef,
            activity,
          ),
          from: _activityDataRepositoryProvider,
          name: r'_activityDataRepositoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$activityDataRepositoryHash,
          dependencies: _ActivityDataRepositoryFamily._dependencies,
          allTransitiveDependencies:
              _ActivityDataRepositoryFamily._allTransitiveDependencies,
          activity: activity,
        );

  _ActivityDataRepositoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.activity,
  }) : super.internal();

  final DActivity activity;

  @override
  Override overrideWith(
    FutureOr<SyncableQuery> Function(_ActivityDataRepositoryRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: _ActivityDataRepositoryProvider._internal(
        (ref) => create(ref as _ActivityDataRepositoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        activity: activity,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<SyncableQuery> createElement() {
    return _ActivityDataRepositoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is _ActivityDataRepositoryProvider &&
        other.activity == activity;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, activity.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin _ActivityDataRepositoryRef
    on AutoDisposeFutureProviderRef<SyncableQuery> {
  /// The parameter `activity` of this provider.
  DActivity get activity;
}

class _ActivityDataRepositoryProviderElement
    extends AutoDisposeFutureProviderElement<SyncableQuery>
    with _ActivityDataRepositoryRef {
  _ActivityDataRepositoryProviderElement(super.provider);

  @override
  DActivity get activity =>
      (origin as _ActivityDataRepositoryProvider).activity;
}

String _$formCreationStrategyHash() =>
    r'a057de3f3b0c4e5df37e6e25f285759d48f5c99c';

/// See also [_formCreationStrategy].
@ProviderFor(_formCreationStrategy)
const _formCreationStrategyProvider = _FormCreationStrategyFamily();

/// See also [_formCreationStrategy].
class _FormCreationStrategyFamily
    extends Family<AsyncValue<FormCreationStrategy>> {
  /// See also [_formCreationStrategy].
  const _FormCreationStrategyFamily();

  /// See also [_formCreationStrategy].
  _FormCreationStrategyProvider call(
    DActivity activity,
  ) {
    return _FormCreationStrategyProvider(
      activity,
    );
  }

  @override
  _FormCreationStrategyProvider getProviderOverride(
    covariant _FormCreationStrategyProvider provider,
  ) {
    return call(
      provider.activity,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'_formCreationStrategyProvider';
}

/// See also [_formCreationStrategy].
class _FormCreationStrategyProvider
    extends AutoDisposeFutureProvider<FormCreationStrategy> {
  /// See also [_formCreationStrategy].
  _FormCreationStrategyProvider(
    DActivity activity,
  ) : this._internal(
          (ref) => _formCreationStrategy(
            ref as _FormCreationStrategyRef,
            activity,
          ),
          from: _formCreationStrategyProvider,
          name: r'_formCreationStrategyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$formCreationStrategyHash,
          dependencies: _FormCreationStrategyFamily._dependencies,
          allTransitiveDependencies:
              _FormCreationStrategyFamily._allTransitiveDependencies,
          activity: activity,
        );

  _FormCreationStrategyProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.activity,
  }) : super.internal();

  final DActivity activity;

  @override
  Override overrideWith(
    FutureOr<FormCreationStrategy> Function(_FormCreationStrategyRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: _FormCreationStrategyProvider._internal(
        (ref) => create(ref as _FormCreationStrategyRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        activity: activity,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<FormCreationStrategy> createElement() {
    return _FormCreationStrategyProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is _FormCreationStrategyProvider && other.activity == activity;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, activity.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin _FormCreationStrategyRef
    on AutoDisposeFutureProviderRef<FormCreationStrategy> {
  /// The parameter `activity` of this provider.
  DActivity get activity;
}

class _FormCreationStrategyProviderElement
    extends AutoDisposeFutureProviderElement<FormCreationStrategy>
    with _FormCreationStrategyRef {
  _FormCreationStrategyProviderElement(super.provider);

  @override
  DActivity get activity => (origin as _FormCreationStrategyProvider).activity;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
