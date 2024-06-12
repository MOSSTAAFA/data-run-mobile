// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_deck.providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dashboardDeckPresenterHash() =>
    r'8a4d275cea22eb3c2acabc49cba2f82043f34c88';

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

/// Dashboard Deck Items Providers
///
/// Copied from [dashboardDeckPresenter].
@ProviderFor(dashboardDeckPresenter)
const dashboardDeckPresenterProvider = DashboardDeckPresenterFamily();

/// Dashboard Deck Items Providers
///
/// Copied from [dashboardDeckPresenter].
class DashboardDeckPresenterFamily extends Family<DashboardDeckPresenter> {
  /// Dashboard Deck Items Providers
  ///
  /// Copied from [dashboardDeckPresenter].
  const DashboardDeckPresenterFamily();

  /// Dashboard Deck Items Providers
  ///
  /// Copied from [dashboardDeckPresenter].
  DashboardDeckPresenterProvider call(
    DashboardDeckView view,
  ) {
    return DashboardDeckPresenterProvider(
      view,
    );
  }

  @override
  DashboardDeckPresenterProvider getProviderOverride(
    covariant DashboardDeckPresenterProvider provider,
  ) {
    return call(
      provider.view,
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
  String? get name => r'dashboardDeckPresenterProvider';
}

/// Dashboard Deck Items Providers
///
/// Copied from [dashboardDeckPresenter].
class DashboardDeckPresenterProvider extends Provider<DashboardDeckPresenter> {
  /// Dashboard Deck Items Providers
  ///
  /// Copied from [dashboardDeckPresenter].
  DashboardDeckPresenterProvider(
    DashboardDeckView view,
  ) : this._internal(
          (ref) => dashboardDeckPresenter(
            ref as DashboardDeckPresenterRef,
            view,
          ),
          from: dashboardDeckPresenterProvider,
          name: r'dashboardDeckPresenterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$dashboardDeckPresenterHash,
          dependencies: DashboardDeckPresenterFamily._dependencies,
          allTransitiveDependencies:
              DashboardDeckPresenterFamily._allTransitiveDependencies,
          view: view,
        );

  DashboardDeckPresenterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.view,
  }) : super.internal();

  final DashboardDeckView view;

  @override
  Override overrideWith(
    DashboardDeckPresenter Function(DashboardDeckPresenterRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DashboardDeckPresenterProvider._internal(
        (ref) => create(ref as DashboardDeckPresenterRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        view: view,
      ),
    );
  }

  @override
  ProviderElement<DashboardDeckPresenter> createElement() {
    return _DashboardDeckPresenterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DashboardDeckPresenterProvider && other.view == view;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, view.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DashboardDeckPresenterRef on ProviderRef<DashboardDeckPresenter> {
  /// The parameter `view` of this provider.
  DashboardDeckView get view;
}

class _DashboardDeckPresenterProviderElement
    extends ProviderElement<DashboardDeckPresenter>
    with DashboardDeckPresenterRef {
  _DashboardDeckPresenterProviderElement(super.provider);

  @override
  DashboardDeckView get view => (origin as DashboardDeckPresenterProvider).view;
}

String _$dashboardDeckRepositoryHash() =>
    r'754b53826bd4f26aab743e76d00fb882c02fdc27';

/// See also [dashboardDeckRepository].
@ProviderFor(dashboardDeckRepository)
final dashboardDeckRepositoryProvider =
    Provider<DashboardDeckRepository>.internal(
  dashboardDeckRepository,
  name: r'dashboardDeckRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dashboardDeckRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DashboardDeckRepositoryRef = ProviderRef<DashboardDeckRepository>;
String _$dashboardItemModelsHash() =>
    r'54ef334c04133ea30b470a054dabd13ed3dfe30f';

/// See also [dashboardItemModels].
@ProviderFor(dashboardItemModels)
final dashboardItemModelsProvider =
    AutoDisposeFutureProvider<IList<DashboardItemModel>>.internal(
  dashboardItemModels,
  name: r'dashboardItemModelsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dashboardItemModelsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DashboardItemModelsRef
    = AutoDisposeFutureProviderRef<IList<DashboardItemModel>>;
String _$dashboardItemModelsListLengthHash() =>
    r'40356a3e1ac0c2c7ac9113e3e2a760fd30a73fca';

/// See also [dashboardItemModelsListLength].
@ProviderFor(dashboardItemModelsListLength)
final dashboardItemModelsListLengthProvider =
    AutoDisposeFutureProvider<int>.internal(
  dashboardItemModelsListLength,
  name: r'dashboardItemModelsListLengthProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dashboardItemModelsListLengthHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DashboardItemModelsListLengthRef = AutoDisposeFutureProviderRef<int>;
String _$dashboardItemModelIndexHash() =>
    r'd9caaedd32f74dd2313cb5b4fa606f14cae5c3c7';

/// See also [dashboardItemModelIndex].
@ProviderFor(dashboardItemModelIndex)
final dashboardItemModelIndexProvider = AutoDisposeProvider<int>.internal(
  dashboardItemModelIndex,
  name: r'dashboardItemModelIndexProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dashboardItemModelIndexHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DashboardItemModelIndexRef = AutoDisposeProviderRef<int>;
String _$dashboardItemModelHash() =>
    r'3fa0b6faf9872aa8df39e66331be3e9f601d651c';

/// See also [dashboardItemModel].
@ProviderFor(dashboardItemModel)
final dashboardItemModelProvider =
    AutoDisposeProvider<DashboardItemModel?>.internal(
  dashboardItemModel,
  name: r'dashboardItemModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dashboardItemModelHash,
  dependencies: <ProviderOrFamily>[dashboardItemModelIndexProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    dashboardItemModelIndexProvider,
    ...?dashboardItemModelIndexProvider.allTransitiveDependencies
  },
);

typedef DashboardItemModelRef = AutoDisposeProviderRef<DashboardItemModel?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
