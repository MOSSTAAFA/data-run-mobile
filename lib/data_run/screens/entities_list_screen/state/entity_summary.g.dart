// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_summary.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$entitySummryHash() => r'9ae38883b2afdc87fbc4a557bab7c784e9f32e75';

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

/// See also [entitySummry].
@ProviderFor(entitySummry)
const entitySummryProvider = EntitySummryFamily();

/// See also [entitySummry].
class EntitySummryFamily extends Family<AsyncValue<EntitySummary>> {
  /// See also [entitySummry].
  const EntitySummryFamily();

  /// See also [entitySummry].
  EntitySummryProvider call({
    required String entityUid,
  }) {
    return EntitySummryProvider(
      entityUid: entityUid,
    );
  }

  @override
  EntitySummryProvider getProviderOverride(
    covariant EntitySummryProvider provider,
  ) {
    return call(
      entityUid: provider.entityUid,
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
  String? get name => r'entitySummryProvider';
}

/// See also [entitySummry].
class EntitySummryProvider extends AutoDisposeFutureProvider<EntitySummary> {
  /// See also [entitySummry].
  EntitySummryProvider({
    required String entityUid,
  }) : this._internal(
          (ref) => entitySummry(
            ref as EntitySummryRef,
            entityUid: entityUid,
          ),
          from: entitySummryProvider,
          name: r'entitySummryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$entitySummryHash,
          dependencies: EntitySummryFamily._dependencies,
          allTransitiveDependencies:
              EntitySummryFamily._allTransitiveDependencies,
          entityUid: entityUid,
        );

  EntitySummryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.entityUid,
  }) : super.internal();

  final String entityUid;

  @override
  Override overrideWith(
    FutureOr<EntitySummary> Function(EntitySummryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: EntitySummryProvider._internal(
        (ref) => create(ref as EntitySummryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        entityUid: entityUid,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<EntitySummary> createElement() {
    return _EntitySummryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EntitySummryProvider && other.entityUid == entityUid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, entityUid.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin EntitySummryRef on AutoDisposeFutureProviderRef<EntitySummary> {
  /// The parameter `entityUid` of this provider.
  String get entityUid;
}

class _EntitySummryProviderElement
    extends AutoDisposeFutureProviderElement<EntitySummary>
    with EntitySummryRef {
  _EntitySummryProviderElement(super.provider);

  @override
  String get entityUid => (origin as EntitySummryProvider).entityUid;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
