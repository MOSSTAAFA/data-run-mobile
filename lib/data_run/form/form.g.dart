// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$syncableEntityInitialRepositoryHash() =>
    r'67227eeaa0d0c1ba73f9c4340b5df2659587cfcf';

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

/// See also [syncableEntityInitialRepository].
@ProviderFor(syncableEntityInitialRepository)
const syncableEntityInitialRepositoryProvider =
    SyncableEntityInitialRepositoryFamily();

/// See also [syncableEntityInitialRepository].
class SyncableEntityInitialRepositoryFamily
    extends Family<SyncableEntityInitialRepository> {
  /// See also [syncableEntityInitialRepository].
  const SyncableEntityInitialRepositoryFamily();

  /// See also [syncableEntityInitialRepository].
  SyncableEntityInitialRepositoryProvider call({
    required String form,
    String? syncableUid,
  }) {
    return SyncableEntityInitialRepositoryProvider(
      form: form,
      syncableUid: syncableUid,
    );
  }

  @override
  SyncableEntityInitialRepositoryProvider getProviderOverride(
    covariant SyncableEntityInitialRepositoryProvider provider,
  ) {
    return call(
      form: provider.form,
      syncableUid: provider.syncableUid,
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
  String? get name => r'syncableEntityInitialRepositoryProvider';
}

/// See also [syncableEntityInitialRepository].
class SyncableEntityInitialRepositoryProvider
    extends AutoDisposeProvider<SyncableEntityInitialRepository> {
  /// See also [syncableEntityInitialRepository].
  SyncableEntityInitialRepositoryProvider({
    required String form,
    String? syncableUid,
  }) : this._internal(
          (ref) => syncableEntityInitialRepository(
            ref as SyncableEntityInitialRepositoryRef,
            form: form,
            syncableUid: syncableUid,
          ),
          from: syncableEntityInitialRepositoryProvider,
          name: r'syncableEntityInitialRepositoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$syncableEntityInitialRepositoryHash,
          dependencies: SyncableEntityInitialRepositoryFamily._dependencies,
          allTransitiveDependencies:
              SyncableEntityInitialRepositoryFamily._allTransitiveDependencies,
          form: form,
          syncableUid: syncableUid,
        );

  SyncableEntityInitialRepositoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.form,
    required this.syncableUid,
  }) : super.internal();

  final String form;
  final String? syncableUid;

  @override
  Override overrideWith(
    SyncableEntityInitialRepository Function(
            SyncableEntityInitialRepositoryRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SyncableEntityInitialRepositoryProvider._internal(
        (ref) => create(ref as SyncableEntityInitialRepositoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        form: form,
        syncableUid: syncableUid,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<SyncableEntityInitialRepository> createElement() {
    return _SyncableEntityInitialRepositoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SyncableEntityInitialRepositoryProvider &&
        other.form == form &&
        other.syncableUid == syncableUid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, form.hashCode);
    hash = _SystemHash.combine(hash, syncableUid.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SyncableEntityInitialRepositoryRef
    on AutoDisposeProviderRef<SyncableEntityInitialRepository> {
  /// The parameter `form` of this provider.
  String get form;

  /// The parameter `syncableUid` of this provider.
  String? get syncableUid;
}

class _SyncableEntityInitialRepositoryProviderElement
    extends AutoDisposeProviderElement<SyncableEntityInitialRepository>
    with SyncableEntityInitialRepositoryRef {
  _SyncableEntityInitialRepositoryProviderElement(super.provider);

  @override
  String get form => (origin as SyncableEntityInitialRepositoryProvider).form;
  @override
  String? get syncableUid =>
      (origin as SyncableEntityInitialRepositoryProvider).syncableUid;
}

String _$syncableEntityMappingRepositoryHash() =>
    r'd5c632b2de95c2e66a702d9041238445b009a539';

/// Depends on Bundle from the route
///
///
/// Copied from [syncableEntityMappingRepository].
@ProviderFor(syncableEntityMappingRepository)
const syncableEntityMappingRepositoryProvider =
    SyncableEntityMappingRepositoryFamily();

/// Depends on Bundle from the route
///
///
/// Copied from [syncableEntityMappingRepository].
class SyncableEntityMappingRepositoryFamily
    extends Family<SyncableEntityMappingRepository> {
  /// Depends on Bundle from the route
  ///
  ///
  /// Copied from [syncableEntityMappingRepository].
  const SyncableEntityMappingRepositoryFamily();

  /// Depends on Bundle from the route
  ///
  ///
  /// Copied from [syncableEntityMappingRepository].
  SyncableEntityMappingRepositoryProvider call({
    required String form,
    required String version,
    required SyncableEntity syncableEntity,
    required SyncableQuery<SyncableEntity> d2SyncableQuery,
  }) {
    return SyncableEntityMappingRepositoryProvider(
      form: form,
      version: version,
      syncableEntity: syncableEntity,
      d2SyncableQuery: d2SyncableQuery,
    );
  }

  @override
  SyncableEntityMappingRepositoryProvider getProviderOverride(
    covariant SyncableEntityMappingRepositoryProvider provider,
  ) {
    return call(
      form: provider.form,
      version: provider.version,
      syncableEntity: provider.syncableEntity,
      d2SyncableQuery: provider.d2SyncableQuery,
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
  String? get name => r'syncableEntityMappingRepositoryProvider';
}

/// Depends on Bundle from the route
///
///
/// Copied from [syncableEntityMappingRepository].
class SyncableEntityMappingRepositoryProvider
    extends AutoDisposeProvider<SyncableEntityMappingRepository> {
  /// Depends on Bundle from the route
  ///
  ///
  /// Copied from [syncableEntityMappingRepository].
  SyncableEntityMappingRepositoryProvider({
    required String form,
    required String version,
    required SyncableEntity syncableEntity,
    required SyncableQuery<SyncableEntity> d2SyncableQuery,
  }) : this._internal(
          (ref) => syncableEntityMappingRepository(
            ref as SyncableEntityMappingRepositoryRef,
            form: form,
            version: version,
            syncableEntity: syncableEntity,
            d2SyncableQuery: d2SyncableQuery,
          ),
          from: syncableEntityMappingRepositoryProvider,
          name: r'syncableEntityMappingRepositoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$syncableEntityMappingRepositoryHash,
          dependencies: SyncableEntityMappingRepositoryFamily._dependencies,
          allTransitiveDependencies:
              SyncableEntityMappingRepositoryFamily._allTransitiveDependencies,
          form: form,
          version: version,
          syncableEntity: syncableEntity,
          d2SyncableQuery: d2SyncableQuery,
        );

  SyncableEntityMappingRepositoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.form,
    required this.version,
    required this.syncableEntity,
    required this.d2SyncableQuery,
  }) : super.internal();

  final String form;
  final String version;
  final SyncableEntity syncableEntity;
  final SyncableQuery<SyncableEntity> d2SyncableQuery;

  @override
  Override overrideWith(
    SyncableEntityMappingRepository Function(
            SyncableEntityMappingRepositoryRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SyncableEntityMappingRepositoryProvider._internal(
        (ref) => create(ref as SyncableEntityMappingRepositoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        form: form,
        version: version,
        syncableEntity: syncableEntity,
        d2SyncableQuery: d2SyncableQuery,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<SyncableEntityMappingRepository> createElement() {
    return _SyncableEntityMappingRepositoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SyncableEntityMappingRepositoryProvider &&
        other.form == form &&
        other.version == version &&
        other.syncableEntity == syncableEntity &&
        other.d2SyncableQuery == d2SyncableQuery;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, form.hashCode);
    hash = _SystemHash.combine(hash, version.hashCode);
    hash = _SystemHash.combine(hash, syncableEntity.hashCode);
    hash = _SystemHash.combine(hash, d2SyncableQuery.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SyncableEntityMappingRepositoryRef
    on AutoDisposeProviderRef<SyncableEntityMappingRepository> {
  /// The parameter `form` of this provider.
  String get form;

  /// The parameter `version` of this provider.
  String get version;

  /// The parameter `syncableEntity` of this provider.
  SyncableEntity get syncableEntity;

  /// The parameter `d2SyncableQuery` of this provider.
  SyncableQuery<SyncableEntity> get d2SyncableQuery;
}

class _SyncableEntityMappingRepositoryProviderElement
    extends AutoDisposeProviderElement<SyncableEntityMappingRepository>
    with SyncableEntityMappingRepositoryRef {
  _SyncableEntityMappingRepositoryProviderElement(super.provider);

  @override
  String get form => (origin as SyncableEntityMappingRepositoryProvider).form;
  @override
  String get version =>
      (origin as SyncableEntityMappingRepositoryProvider).version;
  @override
  SyncableEntity get syncableEntity =>
      (origin as SyncableEntityMappingRepositoryProvider).syncableEntity;
  @override
  SyncableQuery<SyncableEntity> get d2SyncableQuery =>
      (origin as SyncableEntityMappingRepositoryProvider).d2SyncableQuery;
}

String _$databaseSyncableQueryHash() =>
    r'b44568b917d4f833300eea0948f6ee6907ab60fa';

/// See also [databaseSyncableQuery].
@ProviderFor(databaseSyncableQuery)
const databaseSyncableQueryProvider = DatabaseSyncableQueryFamily();

/// See also [databaseSyncableQuery].
class DatabaseSyncableQueryFamily extends Family<DatabaseSyncableQuery> {
  /// See also [databaseSyncableQuery].
  const DatabaseSyncableQueryFamily();

  /// See also [databaseSyncableQuery].
  DatabaseSyncableQueryProvider call(
    String formCode,
  ) {
    return DatabaseSyncableQueryProvider(
      formCode,
    );
  }

  @override
  DatabaseSyncableQueryProvider getProviderOverride(
    covariant DatabaseSyncableQueryProvider provider,
  ) {
    return call(
      provider.formCode,
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
  String? get name => r'databaseSyncableQueryProvider';
}

/// See also [databaseSyncableQuery].
class DatabaseSyncableQueryProvider
    extends AutoDisposeProvider<DatabaseSyncableQuery> {
  /// See also [databaseSyncableQuery].
  DatabaseSyncableQueryProvider(
    String formCode,
  ) : this._internal(
          (ref) => databaseSyncableQuery(
            ref as DatabaseSyncableQueryRef,
            formCode,
          ),
          from: databaseSyncableQueryProvider,
          name: r'databaseSyncableQueryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$databaseSyncableQueryHash,
          dependencies: DatabaseSyncableQueryFamily._dependencies,
          allTransitiveDependencies:
              DatabaseSyncableQueryFamily._allTransitiveDependencies,
          formCode: formCode,
        );

  DatabaseSyncableQueryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.formCode,
  }) : super.internal();

  final String formCode;

  @override
  Override overrideWith(
    DatabaseSyncableQuery Function(DatabaseSyncableQueryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DatabaseSyncableQueryProvider._internal(
        (ref) => create(ref as DatabaseSyncableQueryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        formCode: formCode,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<DatabaseSyncableQuery> createElement() {
    return _DatabaseSyncableQueryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DatabaseSyncableQueryProvider && other.formCode == formCode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, formCode.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DatabaseSyncableQueryRef
    on AutoDisposeProviderRef<DatabaseSyncableQuery> {
  /// The parameter `formCode` of this provider.
  String get formCode;
}

class _DatabaseSyncableQueryProviderElement
    extends AutoDisposeProviderElement<DatabaseSyncableQuery>
    with DatabaseSyncableQueryRef {
  _DatabaseSyncableQueryProviderElement(super.provider);

  @override
  String get formCode => (origin as DatabaseSyncableQueryProvider).formCode;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
