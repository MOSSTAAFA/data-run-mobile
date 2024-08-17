// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_detail_items_models_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$projectDetailItemModelHash() =>
    r'6783ff775be4bbd442d956cb6d2d8da0c5a0b804';

/// See also [projectDetailItemModel].
@ProviderFor(projectDetailItemModel)
final projectDetailItemModelProvider =
    AutoDisposeProvider<ProjectDetailItemModel>.internal(
  projectDetailItemModel,
  name: r'projectDetailItemModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$projectDetailItemModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProjectDetailItemModelRef
    = AutoDisposeProviderRef<ProjectDetailItemModel>;
String _$formListingModelsMapperHash() =>
    r'5ff9f3ad7f86d836f4c0d87a2335ef9e2fe1a33a';

/// See also [formListingModelsMapper].
@ProviderFor(formListingModelsMapper)
final formListingModelsMapperProvider =
    AutoDisposeProvider<FormListingModelsMapper>.internal(
  formListingModelsMapper,
  name: r'formListingModelsMapperProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$formListingModelsMapperHash,
  dependencies: <ProviderOrFamily>[projectDetailItemModelProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    projectDetailItemModelProvider,
    ...?projectDetailItemModelProvider.allTransitiveDependencies
  },
);

typedef FormListingModelsMapperRef
    = AutoDisposeProviderRef<FormListingModelsMapper>;
String _$formListItemModelsHash() =>
    r'fb16f17b23a3b8e496e441921edfed0191ef54c2';

/// See also [formListItemModels].
@ProviderFor(formListItemModels)
final formListItemModelsProvider =
    AutoDisposeFutureProvider<IList<FormListItemModel>>.internal(
  formListItemModels,
  name: r'formListItemModelsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$formListItemModelsHash,
  dependencies: <ProviderOrFamily>[formListingModelsMapperProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    formListingModelsMapperProvider,
    ...?formListingModelsMapperProvider.allTransitiveDependencies
  },
);

typedef FormListItemModelsRef
    = AutoDisposeFutureProviderRef<IList<FormListItemModel>>;
String _$projectDetailItemsModelsNotifierHash() =>
    r'57b2ae7c6ae281176a9449b67a3993d964e19587';

/// See also [ProjectDetailItemsModelsNotifier].
@ProviderFor(ProjectDetailItemsModelsNotifier)
final projectDetailItemsModelsNotifierProvider =
    AutoDisposeAsyncNotifierProvider<ProjectDetailItemsModelsNotifier,
        IList<ProjectDetailItemModel>>.internal(
  ProjectDetailItemsModelsNotifier.new,
  name: r'projectDetailItemsModelsNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$projectDetailItemsModelsNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProjectDetailItemsModelsNotifier
    = AutoDisposeAsyncNotifier<IList<ProjectDetailItemModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
