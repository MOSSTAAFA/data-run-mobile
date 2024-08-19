// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$treeNodeDataSourceHash() =>
    r'165974c26044e17a0759bfb8a3a4e66d9f691c33';

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

/// See also [treeNodeDataSource].
@ProviderFor(treeNodeDataSource)
const treeNodeDataSourceProvider = TreeNodeDataSourceFamily();

/// See also [treeNodeDataSource].
class TreeNodeDataSourceFamily extends Family<AsyncValue<TreeNodeDataSource>> {
  /// See also [treeNodeDataSource].
  const TreeNodeDataSourceFamily();

  /// See also [treeNodeDataSource].
  TreeNodeDataSourceProvider call({
    required IList<String> selectableUids,
  }) {
    return TreeNodeDataSourceProvider(
      selectableUids: selectableUids,
    );
  }

  @override
  TreeNodeDataSourceProvider getProviderOverride(
    covariant TreeNodeDataSourceProvider provider,
  ) {
    return call(
      selectableUids: provider.selectableUids,
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
  String? get name => r'treeNodeDataSourceProvider';
}

/// See also [treeNodeDataSource].
class TreeNodeDataSourceProvider
    extends AutoDisposeFutureProvider<TreeNodeDataSource> {
  /// See also [treeNodeDataSource].
  TreeNodeDataSourceProvider({
    required IList<String> selectableUids,
  }) : this._internal(
          (ref) => treeNodeDataSource(
            ref as TreeNodeDataSourceRef,
            selectableUids: selectableUids,
          ),
          from: treeNodeDataSourceProvider,
          name: r'treeNodeDataSourceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$treeNodeDataSourceHash,
          dependencies: TreeNodeDataSourceFamily._dependencies,
          allTransitiveDependencies:
              TreeNodeDataSourceFamily._allTransitiveDependencies,
          selectableUids: selectableUids,
        );

  TreeNodeDataSourceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.selectableUids,
  }) : super.internal();

  final IList<String> selectableUids;

  @override
  Override overrideWith(
    FutureOr<TreeNodeDataSource> Function(TreeNodeDataSourceRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TreeNodeDataSourceProvider._internal(
        (ref) => create(ref as TreeNodeDataSourceRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        selectableUids: selectableUids,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<TreeNodeDataSource> createElement() {
    return _TreeNodeDataSourceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TreeNodeDataSourceProvider &&
        other.selectableUids == selectableUids;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, selectableUids.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TreeNodeDataSourceRef
    on AutoDisposeFutureProviderRef<TreeNodeDataSource> {
  /// The parameter `selectableUids` of this provider.
  IList<String> get selectableUids;
}

class _TreeNodeDataSourceProviderElement
    extends AutoDisposeFutureProviderElement<TreeNodeDataSource>
    with TreeNodeDataSourceRef {
  _TreeNodeDataSourceProviderElement(super.provider);

  @override
  IList<String> get selectableUids =>
      (origin as TreeNodeDataSourceProvider).selectableUids;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
