// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_data.providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$activityDataRepositoryHash() =>
    r'cfac3d3ce288a5ceae70be9a12a0dc3fbb2b139e';

/// See also [activityDataRepository].
@ProviderFor(activityDataRepository)
final activityDataRepositoryProvider =
    AutoDisposeProvider<ActivityDataRepository>.internal(
  activityDataRepository,
  name: r'activityDataRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activityDataRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ActivityDataRepositoryRef
    = AutoDisposeProviderRef<ActivityDataRepository>;
String _$activityDataItemModelsHash() =>
    r'1d3db9e30b389af5fac75678559af2e1aa9cc21f';

/// See also [activityDataItemModels].
@ProviderFor(activityDataItemModels)
final activityDataItemModelsProvider =
    AutoDisposeFutureProvider<IList<ActivityDataItemModel>>.internal(
  activityDataItemModels,
  name: r'activityDataItemModelsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activityDataItemModelsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ActivityDataItemModelsRef
    = AutoDisposeFutureProviderRef<IList<ActivityDataItemModel>>;
String _$activityDataItemModelsListLengthHash() =>
    r'76dd2963a94555792b04a81af1dcc4bbf0d5b76f';

/// See also [activityDataItemModelsListLength].
@ProviderFor(activityDataItemModelsListLength)
final activityDataItemModelsListLengthProvider =
    AutoDisposeFutureProvider<int>.internal(
  activityDataItemModelsListLength,
  name: r'activityDataItemModelsListLengthProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activityDataItemModelsListLengthHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ActivityDataItemModelsListLengthRef = AutoDisposeFutureProviderRef<int>;
String _$activityDataItemModelIndexHash() =>
    r'603d8c9c56c99d5d4c9802dbd150917c74cc38d6';

/// See also [activityDataItemModelIndex].
@ProviderFor(activityDataItemModelIndex)
final activityDataItemModelIndexProvider = AutoDisposeProvider<int>.internal(
  activityDataItemModelIndex,
  name: r'activityDataItemModelIndexProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activityDataItemModelIndexHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ActivityDataItemModelIndexRef = AutoDisposeProviderRef<int>;
String _$activityDataItemModelHash() =>
    r'a27bdd6bebe9aa76ff93c1105b0eac4a2930eb85';

/// See also [activityDataItemModel].
@ProviderFor(activityDataItemModel)
final activityDataItemModelProvider =
    AutoDisposeProvider<ActivityDataItemModel?>.internal(
  activityDataItemModel,
  name: r'activityDataItemModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activityDataItemModelHash,
  dependencies: <ProviderOrFamily>[activityDataItemModelIndexProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    activityDataItemModelIndexProvider,
    ...?activityDataItemModelIndexProvider.allTransitiveDependencies
  },
);

typedef ActivityDataItemModelRef
    = AutoDisposeProviderRef<ActivityDataItemModel?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
