// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'syncable_entity_mapping_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$syncableEntityMappingRepositoryHash() =>
    r'ea4926a48fd543036eed122220e3be54fdb3cdd9';

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
    required DynamicForm form,
    required SyncableEntity syncableEntity,
    required SyncableQuery<SyncableEntity> d2SyncableQuery,
  }) {
    return SyncableEntityMappingRepositoryProvider(
      form: form,
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
    required DynamicForm form,
    required SyncableEntity syncableEntity,
    required SyncableQuery<SyncableEntity> d2SyncableQuery,
  }) : this._internal(
          (ref) => syncableEntityMappingRepository(
            ref as SyncableEntityMappingRepositoryRef,
            form: form,
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
    required this.syncableEntity,
    required this.d2SyncableQuery,
  }) : super.internal();

  final DynamicForm form;
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
        other.syncableEntity == syncableEntity &&
        other.d2SyncableQuery == d2SyncableQuery;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, form.hashCode);
    hash = _SystemHash.combine(hash, syncableEntity.hashCode);
    hash = _SystemHash.combine(hash, d2SyncableQuery.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SyncableEntityMappingRepositoryRef
    on AutoDisposeProviderRef<SyncableEntityMappingRepository> {
  /// The parameter `form` of this provider.
  DynamicForm get form;

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
  DynamicForm get form =>
      (origin as SyncableEntityMappingRepositoryProvider).form;
  @override
  SyncableEntity get syncableEntity =>
      (origin as SyncableEntityMappingRepositoryProvider).syncableEntity;
  @override
  SyncableQuery<SyncableEntity> get d2SyncableQuery =>
      (origin as SyncableEntityMappingRepositoryProvider).d2SyncableQuery;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
