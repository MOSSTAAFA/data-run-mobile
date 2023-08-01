// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_view_controllers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

typedef FormViewModelRef = AutoDisposeProviderRef<dynamic>;
String _$formViewRepositoryHash() =>
    r'23ddafb9a488d07c4766179a4d996585ea66dd4d';

/// See also [_formViewRepository].
@ProviderFor(_formViewRepository)
final _formViewRepositoryProvider =
    AutoDisposeProvider<FormViewRepository>.internal(
  _formViewRepository,
  name: r'_formViewRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$formViewRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _FormViewRepositoryRef = AutoDisposeProviderRef<FormViewRepository>;
String _$rowActionFromIntentHash() =>
    r'a03283137e88b5b6b863e71be8eca87eb9079c22';

/// See also [_rowActionFromIntent].
@ProviderFor(_rowActionFromIntent)
final _rowActionFromIntentProvider = AutoDisposeProvider<RowAction>.internal(
  _rowActionFromIntent,
  name: r'_rowActionFromIntentProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$rowActionFromIntentHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _RowActionFromIntentRef = AutoDisposeProviderRef<RowAction>;
String _$formViewFocusedHash() => r'30241bfff9d84a7c99c8d0721700fbb58cc7f457';

/// See also [formViewFocused].
@ProviderFor(formViewFocused)
final formViewFocusedProvider = AutoDisposeProvider<bool>.internal(
  formViewFocused,
  name: r'formViewFocusedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$formViewFocusedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FormViewFocusedRef = AutoDisposeProviderRef<bool>;
String _$formViewLoadingHash() => r'397547542ff9e0e2c5eaf6c229eae3c947bd5f34';

/// See also [formViewLoading].
@ProviderFor(formViewLoading)
final formViewLoadingProvider = AutoDisposeProvider<bool>.internal(
  formViewLoading,
  name: r'formViewLoadingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$formViewLoadingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FormViewLoadingRef = AutoDisposeProviderRef<bool>;
String _$completionPercentageHash() =>
    r'ca4c44477bea197ddfdbfa32c505e1a76e2fca60';

/// See also [completionPercentage].
@ProviderFor(completionPercentage)
final completionPercentageProvider = AutoDisposeProvider<double>.internal(
  completionPercentage,
  name: r'completionPercentageProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$completionPercentageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CompletionPercentageRef = AutoDisposeProviderRef<double>;
String _$calculationLoopHash() => r'6be959974f34bc45e666cfbdbb5e019a3c7fa4b2';

/// See also [calculationLoop].
@ProviderFor(calculationLoop)
final calculationLoopProvider = AutoDisposeProvider<bool>.internal(
  calculationLoop,
  name: r'calculationLoopProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$calculationLoopHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CalculationLoopRef = AutoDisposeProviderRef<bool>;
String _$rowActionStoreHash() => r'ca5a42ed812fac60d0daa4f8614b59800c968d1b';

/// See also [_rowActionStore].
@ProviderFor(_rowActionStore)
final _rowActionStoreProvider =
    AutoDisposeFutureProvider<Pair<RowAction, StoreResult>>.internal(
  _rowActionStore,
  name: r'_rowActionStoreProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$rowActionStoreHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _RowActionStoreRef
    = AutoDisposeFutureProviderRef<Pair<RowAction, StoreResult>>;
String _$formViewIndexHash() => r'596950527a2473b48fcd73cf67b3157da93fc787';

/// See also [formViewIndex].
@ProviderFor(formViewIndex)
final formViewIndexProvider = AutoDisposeProvider<int>.internal(
  formViewIndex,
  name: r'formViewIndexProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$formViewIndexHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FormViewIndexRef = AutoDisposeProviderRef<int>;
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
String _$formPendingIntentsHash() =>
    r'3bf8ab1219cff61eeaa853961f211c6936debc56';

/// See also [FormPendingIntents].
@ProviderFor(FormPendingIntents)
final formPendingIntentsProvider =
    AutoDisposeNotifierProvider<FormPendingIntents, FormIntent>.internal(
  FormPendingIntents.new,
  name: r'formPendingIntentsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$formPendingIntentsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FormPendingIntents = AutoDisposeNotifier<FormIntent>;
String _$itemsResultHash() => r'f004d98f2c6b6214099e8aefe37e7de9ff3742f1';

/// See also [ItemsResult].
@ProviderFor(ItemsResult)
final itemsResultProvider =
    AutoDisposeAsyncNotifierProvider<ItemsResult, IList<FieldUiModel>>.internal(
  ItemsResult.new,
  name: r'itemsResultProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$itemsResultHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ItemsResult = AutoDisposeAsyncNotifier<IList<FieldUiModel>>;
String _$formModelNotifierHash() => r'ef08c968b114c59e1a047106e8e0d96d687c9b5d';

/// See also [FormModelNotifier].
@ProviderFor(FormModelNotifier)
final formModelNotifierProvider =
    AutoDisposeNotifierProvider<FormModelNotifier, FormModel>.internal(
  FormModelNotifier.new,
  name: r'formModelNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$formModelNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FormModelNotifier = AutoDisposeNotifier<FormModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
