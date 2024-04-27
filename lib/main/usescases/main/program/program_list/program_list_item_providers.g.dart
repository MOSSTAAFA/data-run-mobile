// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_list_item_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$programViewModelsHash() => r'e6c13ada89c2bd9f7f568aa08dd04d8914e4d917';

/// See also [programViewModels].
@ProviderFor(programViewModels)
final programViewModelsProvider =
    AutoDisposeFutureProvider<IList<ProgramViewModel>>.internal(
  programViewModels,
  name: r'programViewModelsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$programViewModelsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProgramViewModelsRef
    = AutoDisposeFutureProviderRef<IList<ProgramViewModel>>;
String _$programModelItemsListLengthHash() =>
    r'c7ad451a34ddf465a7d895b798f4f9355abb256d';

/// See also [programModelItemsListLength].
@ProviderFor(programModelItemsListLength)
final programModelItemsListLengthProvider =
    AutoDisposeFutureProvider<int>.internal(
  programModelItemsListLength,
  name: r'programModelItemsListLengthProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$programModelItemsListLengthHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProgramModelItemsListLengthRef = AutoDisposeFutureProviderRef<int>;
String _$programModelItemIndexHash() =>
    r'd60cb3737adc7a2934f9fdd1b8a3bc9db1587c12';

/// See also [programModelItemIndex].
@ProviderFor(programModelItemIndex)
final programModelItemIndexProvider = AutoDisposeProvider<int>.internal(
  programModelItemIndex,
  name: r'programModelItemIndexProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$programModelItemIndexHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProgramModelItemIndexRef = AutoDisposeProviderRef<int>;
String _$programViewModelItemHash() =>
    r'48769441e5cd573b0d9c65a121fca05f12c5488e';

/// See also [programViewModelItem].
@ProviderFor(programViewModelItem)
final programViewModelItemProvider =
    AutoDisposeProvider<ProgramViewModel?>.internal(
  programViewModelItem,
  name: r'programViewModelItemProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$programViewModelItemHash,
  dependencies: <ProviderOrFamily>[programModelItemIndexProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    programModelItemIndexProvider,
    ...?programModelItemIndexProvider.allTransitiveDependencies
  },
);

typedef ProgramViewModelItemRef = AutoDisposeProviderRef<ProgramViewModel?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
