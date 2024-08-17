// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$treeNodeDataSourceHash() =>
    r'40cd636ba893a2339734597508f1a1efbe46b1cf';

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
class TreeNodeDataSourceFamily
    extends Family<AsyncValue<TreeNodeDataSource<T, Q>>> {
  /// See also [treeNodeDataSource].
  const TreeNodeDataSourceFamily();

  /// See also [treeNodeDataSource].
  TreeNodeDataSourceProvider call({
    required Q query,
    required IList<String> selectableUids,
  }) {
    return TreeNodeDataSourceProvider(
      query: query,
      selectableUids: selectableUids,
    );
  }

  @override
  TreeNodeDataSourceProvider getProviderOverride(
    covariant TreeNodeDataSourceProvider provider,
  ) {
    return call(
      query: provider.query,
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
    extends AutoDisposeFutureProvider<TreeNodeDataSource<T, Q>> {
  /// See also [treeNodeDataSource].
  TreeNodeDataSourceProvider({
    required Q query,
    required IList<String> selectableUids,
  }) : this._internal(
          (ref) => treeNodeDataSource(
            ref as TreeNodeDataSourceRef,
            query: query,
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
          query: query,
          selectableUids: selectableUids,
        );

  TreeNodeDataSourceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
    required this.selectableUids,
  }) : super.internal();

  final Q query;
  final IList<String> selectableUids;

  @override
  Override overrideWith(
    FutureOr<TreeNodeDataSource<T, Q>> Function(TreeNodeDataSourceRef provider)
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
        query: query,
        selectableUids: selectableUids,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<TreeNodeDataSource<T, Q>> createElement() {
    return _TreeNodeDataSourceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TreeNodeDataSourceProvider &&
        other.query == query &&
        other.selectableUids == selectableUids;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);
    hash = _SystemHash.combine(hash, selectableUids.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TreeNodeDataSourceRef
    on AutoDisposeFutureProviderRef<TreeNodeDataSource<T, Q>> {
  /// The parameter `query` of this provider.
  Q get query;

  /// The parameter `selectableUids` of this provider.
  IList<String> get selectableUids;
}

class _TreeNodeDataSourceProviderElement
    extends AutoDisposeFutureProviderElement<TreeNodeDataSource<T, Q>>
    with TreeNodeDataSourceRef {
  _TreeNodeDataSourceProviderElement(super.provider);

  @override
  Q get query => (origin as TreeNodeDataSourceProvider).query;
  @override
  IList<String> get selectableUids =>
      (origin as TreeNodeDataSourceProvider).selectableUids;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
