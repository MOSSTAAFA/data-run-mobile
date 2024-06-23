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
String _$formListItemModelsHash() =>
    r'61334a0291bb46ef0b511c59ecf2dd2dea563350';

/// See also [formListItemModels].
@ProviderFor(formListItemModels)
final formListItemModelsProvider =
    AutoDisposeFutureProvider<IList<FormListItemModel>>.internal(
  formListItemModels,
  name: r'formListItemModelsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$formListItemModelsHash,
  dependencies: <ProviderOrFamily>[projectDetailItemModelProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    projectDetailItemModelProvider,
    ...?projectDetailItemModelProvider.allTransitiveDependencies
  },
);

typedef FormListItemModelsRef
    = AutoDisposeFutureProviderRef<IList<FormListItemModel>>;
String _$projectDetailItemsModelsNotifierHash() =>
    r'f3468e9ffc41b14c752f1f9ba92b9cc30337f7e2';

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
