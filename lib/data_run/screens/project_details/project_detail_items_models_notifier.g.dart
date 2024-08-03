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
    r'3e1c69d603cf893218ef7c32ce3c55f6e65319be';

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
    r'e888c44d934ed257caf094c53c296af5815a3fda';

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
    r'859f4f2a15030fa8cd112f439b5e683d49d25c98';

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
