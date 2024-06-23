// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entities_riverpod_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$entitiesByStatusHash() => r'aa085b92f4d493cb926b7fd17453a500b54d1b20';

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

/// See also [entitiesByStatus].
@ProviderFor(entitiesByStatus)
const entitiesByStatusProvider = EntitiesByStatusFamily();

/// See also [entitiesByStatus].
class EntitiesByStatusFamily extends Family<AsyncValue<IList<SyncableEntity>>> {
  /// See also [entitiesByStatus].
  const EntitiesByStatusFamily();

  /// See also [entitiesByStatus].
  EntitiesByStatusProvider call({
    required String formCode,
    SyncableEntityState? entityStatus,
  }) {
    return EntitiesByStatusProvider(
      formCode: formCode,
      entityStatus: entityStatus,
    );
  }

  @override
  EntitiesByStatusProvider getProviderOverride(
    covariant EntitiesByStatusProvider provider,
  ) {
    return call(
      formCode: provider.formCode,
      entityStatus: provider.entityStatus,
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
  String? get name => r'entitiesByStatusProvider';
}

/// See also [entitiesByStatus].
class EntitiesByStatusProvider
    extends AutoDisposeFutureProvider<IList<SyncableEntity>> {
  /// See also [entitiesByStatus].
  EntitiesByStatusProvider({
    required String formCode,
    SyncableEntityState? entityStatus,
  }) : this._internal(
          (ref) => entitiesByStatus(
            ref as EntitiesByStatusRef,
            formCode: formCode,
            entityStatus: entityStatus,
          ),
          from: entitiesByStatusProvider,
          name: r'entitiesByStatusProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$entitiesByStatusHash,
          dependencies: EntitiesByStatusFamily._dependencies,
          allTransitiveDependencies:
              EntitiesByStatusFamily._allTransitiveDependencies,
          formCode: formCode,
          entityStatus: entityStatus,
        );

  EntitiesByStatusProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.formCode,
    required this.entityStatus,
  }) : super.internal();

  final String formCode;
  final SyncableEntityState? entityStatus;

  @override
  Override overrideWith(
    FutureOr<IList<SyncableEntity>> Function(EntitiesByStatusRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: EntitiesByStatusProvider._internal(
        (ref) => create(ref as EntitiesByStatusRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        formCode: formCode,
        entityStatus: entityStatus,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<IList<SyncableEntity>> createElement() {
    return _EntitiesByStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EntitiesByStatusProvider &&
        other.formCode == formCode &&
        other.entityStatus == entityStatus;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, formCode.hashCode);
    hash = _SystemHash.combine(hash, entityStatus.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin EntitiesByStatusRef
    on AutoDisposeFutureProviderRef<IList<SyncableEntity>> {
  /// The parameter `formCode` of this provider.
  String get formCode;

  /// The parameter `entityStatus` of this provider.
  SyncableEntityState? get entityStatus;
}

class _EntitiesByStatusProviderElement
    extends AutoDisposeFutureProviderElement<IList<SyncableEntity>>
    with EntitiesByStatusRef {
  _EntitiesByStatusProviderElement(super.provider);

  @override
  String get formCode => (origin as EntitiesByStatusProvider).formCode;
  @override
  SyncableEntityState? get entityStatus =>
      (origin as EntitiesByStatusProvider).entityStatus;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
