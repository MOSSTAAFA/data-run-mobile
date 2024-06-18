// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_deck.providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dashboardDeckRepositoryHash() =>
    r'ba4b6bc26a53c8078f251e37fb9fe4247c21df7b';

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
