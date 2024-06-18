// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_detail.providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$projectDetailRepositoryHash() =>
    r'fec3e958783a7a391a1eb7c81f1fed1b4e7dd577';

/// See also [projectDetailRepository].
@ProviderFor(projectDetailRepository)
final projectDetailRepositoryProvider =
    AutoDisposeProvider<ProjectDetailRepository>.internal(
  projectDetailRepository,
  name: r'projectDetailRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$projectDetailRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProjectDetailRepositoryRef
    = AutoDisposeProviderRef<ProjectDetailRepository>;
String _$projectDetailItemModelsHash() =>
    r'8af04c3afccd158f1a9eccb7e4068be171bf5944';

/// See also [projectDetailItemModels].
@ProviderFor(projectDetailItemModels)
final projectDetailItemModelsProvider =
    AutoDisposeFutureProvider<IList<ProjectDetailItemModel>>.internal(
  projectDetailItemModels,
  name: r'projectDetailItemModelsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$projectDetailItemModelsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProjectDetailItemModelsRef
    = AutoDisposeFutureProviderRef<IList<ProjectDetailItemModel>>;
String _$projectDetailItemModelsListLengthHash() =>
    r'b17903753dffbc317416fc5ab16b110467112ab6';

/// See also [projectDetailItemModelsListLength].
@ProviderFor(projectDetailItemModelsListLength)
final projectDetailItemModelsListLengthProvider =
    AutoDisposeFutureProvider<int>.internal(
  projectDetailItemModelsListLength,
  name: r'projectDetailItemModelsListLengthProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$projectDetailItemModelsListLengthHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProjectDetailItemModelsListLengthRef
    = AutoDisposeFutureProviderRef<int>;
String _$projectDetailItemModelIndexHash() =>
    r'b08cc79bae20e8a60716388774f11b4c2480cd08';

/// See also [projectDetailItemModelIndex].
@ProviderFor(projectDetailItemModelIndex)
final projectDetailItemModelIndexProvider = AutoDisposeProvider<int>.internal(
  projectDetailItemModelIndex,
  name: r'projectDetailItemModelIndexProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$projectDetailItemModelIndexHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProjectDetailItemModelIndexRef = AutoDisposeProviderRef<int>;
String _$projectDetailItemModelHash() =>
    r'5782640f904b62aa973cc85bc8d21481ef5465a9';

/// See also [projectDetailItemModel].
@ProviderFor(projectDetailItemModel)
final projectDetailItemModelProvider =
    AutoDisposeProvider<ProjectDetailItemModel?>.internal(
  projectDetailItemModel,
  name: r'projectDetailItemModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$projectDetailItemModelHash,
  dependencies: <ProviderOrFamily>[projectDetailItemModelIndexProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    projectDetailItemModelIndexProvider,
    ...?projectDetailItemModelIndexProvider.allTransitiveDependencies
  },
);

typedef ProjectDetailItemModelRef
    = AutoDisposeProviderRef<ProjectDetailItemModel?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
