// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_dialog_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$syncDialogRepositoryHash() =>
    r'5d4609efa2c4596209038bc9465c25b6ba338c33';

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

/// See also [syncDialogRepository].
@ProviderFor(syncDialogRepository)
const syncDialogRepositoryProvider = SyncDialogRepositoryFamily();

/// See also [syncDialogRepository].
class SyncDialogRepositoryFamily extends Family<SyncDialogRepository> {
  /// See also [syncDialogRepository].
  const SyncDialogRepositoryFamily();

  /// See also [syncDialogRepository].
  SyncDialogRepositoryProvider call({
    required String formCode,
  }) {
    return SyncDialogRepositoryProvider(
      formCode: formCode,
    );
  }

  @override
  SyncDialogRepositoryProvider getProviderOverride(
    covariant SyncDialogRepositoryProvider provider,
  ) {
    return call(
      formCode: provider.formCode,
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
  String? get name => r'syncDialogRepositoryProvider';
}

/// See also [syncDialogRepository].
class SyncDialogRepositoryProvider
    extends AutoDisposeProvider<SyncDialogRepository> {
  /// See also [syncDialogRepository].
  SyncDialogRepositoryProvider({
    required String formCode,
  }) : this._internal(
          (ref) => syncDialogRepository(
            ref as SyncDialogRepositoryRef,
            formCode: formCode,
          ),
          from: syncDialogRepositoryProvider,
          name: r'syncDialogRepositoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$syncDialogRepositoryHash,
          dependencies: SyncDialogRepositoryFamily._dependencies,
          allTransitiveDependencies:
              SyncDialogRepositoryFamily._allTransitiveDependencies,
          formCode: formCode,
        );

  SyncDialogRepositoryProvider._internal(
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
    SyncDialogRepository Function(SyncDialogRepositoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SyncDialogRepositoryProvider._internal(
        (ref) => create(ref as SyncDialogRepositoryRef),
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
  AutoDisposeProviderElement<SyncDialogRepository> createElement() {
    return _SyncDialogRepositoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SyncDialogRepositoryProvider && other.formCode == formCode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, formCode.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SyncDialogRepositoryRef on AutoDisposeProviderRef<SyncDialogRepository> {
  /// The parameter `formCode` of this provider.
  String get formCode;
}

class _SyncDialogRepositoryProviderElement
    extends AutoDisposeProviderElement<SyncDialogRepository>
    with SyncDialogRepositoryRef {
  _SyncDialogRepositoryProviderElement(super.provider);

  @override
  String get formCode => (origin as SyncDialogRepositoryProvider).formCode;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
