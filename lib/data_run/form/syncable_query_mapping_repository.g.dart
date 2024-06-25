// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'syncable_query_mapping_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$syncableEntityInitialRepositoryHash() =>
    r'c87e1a0ec8667dba28a803d2cbef96d04b823307';

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
    required String formCode,
    String? syncableUid,
  }) {
    return SyncableEntityInitialRepositoryProvider(
      formCode: formCode,
      syncableUid: syncableUid,
    );
  }

  @override
  SyncableEntityInitialRepositoryProvider getProviderOverride(
    covariant SyncableEntityInitialRepositoryProvider provider,
  ) {
    return call(
      formCode: provider.formCode,
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
    required String formCode,
    String? syncableUid,
  }) : this._internal(
          (ref) => syncableEntityInitialRepository(
            ref as SyncableEntityInitialRepositoryRef,
            formCode: formCode,
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
          formCode: formCode,
          syncableUid: syncableUid,
        );

  SyncableEntityInitialRepositoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.formCode,
    required this.syncableUid,
  }) : super.internal();

  final String formCode;
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
        formCode: formCode,
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
        other.formCode == formCode &&
        other.syncableUid == syncableUid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, formCode.hashCode);
    hash = _SystemHash.combine(hash, syncableUid.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SyncableEntityInitialRepositoryRef
    on AutoDisposeProviderRef<SyncableEntityInitialRepository> {
  /// The parameter `formCode` of this provider.
  String get formCode;

  /// The parameter `syncableUid` of this provider.
  String? get syncableUid;
}

class _SyncableEntityInitialRepositoryProviderElement
    extends AutoDisposeProviderElement<SyncableEntityInitialRepository>
    with SyncableEntityInitialRepositoryRef {
  _SyncableEntityInitialRepositoryProviderElement(super.provider);

  @override
  String get formCode =>
      (origin as SyncableEntityInitialRepositoryProvider).formCode;
  @override
  String? get syncableUid =>
      (origin as SyncableEntityInitialRepositoryProvider).syncableUid;
}

String _$syncableQueryMappingRepositoryHash() =>
    r'27dfc0625d3573d626006de1bb32ab42b3492541';

/// See also [syncableQueryMappingRepository].
@ProviderFor(syncableQueryMappingRepository)
const syncableQueryMappingRepositoryProvider =
    SyncableQueryMappingRepositoryFamily();

/// See also [syncableQueryMappingRepository].
class SyncableQueryMappingRepositoryFamily
    extends Family<SyncableQueryMappingRepository> {
  /// See also [syncableQueryMappingRepository].
  const SyncableQueryMappingRepositoryFamily();

  /// See also [syncableQueryMappingRepository].
  SyncableQueryMappingRepositoryProvider call(
    String formCode,
  ) {
    return SyncableQueryMappingRepositoryProvider(
      formCode,
    );
  }

  @override
  SyncableQueryMappingRepositoryProvider getProviderOverride(
    covariant SyncableQueryMappingRepositoryProvider provider,
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
  String? get name => r'syncableQueryMappingRepositoryProvider';
}

/// See also [syncableQueryMappingRepository].
class SyncableQueryMappingRepositoryProvider
    extends AutoDisposeProvider<SyncableQueryMappingRepository> {
  /// See also [syncableQueryMappingRepository].
  SyncableQueryMappingRepositoryProvider(
    String formCode,
  ) : this._internal(
          (ref) => syncableQueryMappingRepository(
            ref as SyncableQueryMappingRepositoryRef,
            formCode,
          ),
          from: syncableQueryMappingRepositoryProvider,
          name: r'syncableQueryMappingRepositoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$syncableQueryMappingRepositoryHash,
          dependencies: SyncableQueryMappingRepositoryFamily._dependencies,
          allTransitiveDependencies:
              SyncableQueryMappingRepositoryFamily._allTransitiveDependencies,
          formCode: formCode,
        );

  SyncableQueryMappingRepositoryProvider._internal(
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
    SyncableQueryMappingRepository Function(
            SyncableQueryMappingRepositoryRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SyncableQueryMappingRepositoryProvider._internal(
        (ref) => create(ref as SyncableQueryMappingRepositoryRef),
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
  AutoDisposeProviderElement<SyncableQueryMappingRepository> createElement() {
    return _SyncableQueryMappingRepositoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SyncableQueryMappingRepositoryProvider &&
        other.formCode == formCode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, formCode.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SyncableQueryMappingRepositoryRef
    on AutoDisposeProviderRef<SyncableQueryMappingRepository> {
  /// The parameter `formCode` of this provider.
  String get formCode;
}

class _SyncableQueryMappingRepositoryProviderElement
    extends AutoDisposeProviderElement<SyncableQueryMappingRepository>
    with SyncableQueryMappingRepositoryRef {
  _SyncableQueryMappingRepositoryProviderElement(super.provider);

  @override
  String get formCode =>
      (origin as SyncableQueryMappingRepositoryProvider).formCode;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
