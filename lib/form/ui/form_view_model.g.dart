// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$formViewModelHash() => r'cfe85a53b29799605626cfd2c4f779ada3c13cc5';

/// See also [formViewModel].
@ProviderFor(formViewModel)
final formViewModelProvider = AutoDisposeProvider<FormViewModel>.internal(
  formViewModel,
  name: r'formViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$formViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FormViewModelRef = AutoDisposeProviderRef<FormViewModel>;
String _$itemsFetchHash() =>
    r'c0531a736d3f1bb596f890f24e39e6428905c747'; ////////////////////////////////
////////////////////////////////
////////////////////////////////
////////////////////////////////
////////////////////////////////
////////////////////////////////
////////////////////////////////
////////////////////////////////
////////////////////////////////
///
/// Copied from [itemsFetch].
@ProviderFor(itemsFetch)
final itemsFetchProvider =
    AutoDisposeFutureProvider<IList<FieldUiModel>>.internal(
  itemsFetch,
  name: r'itemsFetchProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$itemsFetchHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ItemsFetchRef = AutoDisposeFutureProviderRef<IList<FieldUiModel>>;
String _$indexHash() => r'0860d4852b5c4278c17554156493538148336c3c';

/// See also [index].
@ProviderFor(index)
final indexProvider = AutoDisposeProvider<int>.internal(
  index,
  name: r'indexProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$indexHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef IndexRef = AutoDisposeProviderRef<int>;
String _$formRepositoryRecordsInstanceHash() =>
    r'a828604e9f8c9b5fd8ac769c1b954125fd04f38a';

/// See also [FormRepositoryRecordsInstance].
@ProviderFor(FormRepositoryRecordsInstance)
final formRepositoryRecordsInstanceProvider = AutoDisposeNotifierProvider<
    FormRepositoryRecordsInstance, FormRepositoryRecords>.internal(
  FormRepositoryRecordsInstance.new,
  name: r'formRepositoryRecordsInstanceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$formRepositoryRecordsInstanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FormRepositoryRecordsInstance
    = AutoDisposeNotifier<FormRepositoryRecords>;
String _$itemsHash() => r'983bd900534ddb4d9e076bda1c69422f3d673ae4';

/// See also [Items].
@ProviderFor(Items)
final itemsProvider =
    AutoDisposeAsyncNotifierProvider<Items, IList<FieldUiModel>>.internal(
  Items.new,
  name: r'itemsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$itemsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Items = AutoDisposeAsyncNotifier<IList<FieldUiModel>>;
String _$uiEventHash() => r'0f088847f34e14c22d3667864349a3b0776a9824';

/// See also [UiEvent].
@ProviderFor(UiEvent)
final uiEventProvider =
    AutoDisposeNotifierProvider<UiEvent, ListViewUiEvents?>.internal(
  UiEvent.new,
  name: r'uiEventProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$uiEventHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UiEvent = AutoDisposeNotifier<ListViewUiEvents?>;
String _$uiIntentHash() => r'b5bb96443cc4694e5e530c6f0355650b940d698b';

/// See also [UiIntent].
@ProviderFor(UiIntent)
final uiIntentProvider =
    AutoDisposeNotifierProvider<UiIntent, FormIntent?>.internal(
  UiIntent.new,
  name: r'uiIntentProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$uiIntentHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UiIntent = AutoDisposeNotifier<FormIntent?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
