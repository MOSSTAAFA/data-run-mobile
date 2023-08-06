// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_view_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$formRepositoryRecordsInstanceHash() =>
    r'bbda3275f13de15e657162d51b7700b6ce1a1bb0';

/// See also [formRepositoryRecordsInstance].
@ProviderFor(formRepositoryRecordsInstance)
final formRepositoryRecordsInstanceProvider =
    AutoDisposeProvider<FormRepositoryRecords>.internal(
  formRepositoryRecordsInstance,
  name: r'formRepositoryRecordsInstanceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$formRepositoryRecordsInstanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FormRepositoryRecordsInstanceRef
    = AutoDisposeProviderRef<FormRepositoryRecords>;
String _$rowActionFromIntentHash() =>
    r'160fe9543decb3cba6b0c55c365bed36614e2427';

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
String _$rowActionStoreHash() => r'40b1128b2c402086c25ade7fdea4b648825f41c6';

/// See also [rowActionStore].
@ProviderFor(rowActionStore)
final rowActionStoreProvider =
    AutoDisposeFutureProvider<Pair<RowAction, StoreResult>>.internal(
  rowActionStore,
  name: r'rowActionStoreProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$rowActionStoreHash,
  dependencies: <ProviderOrFamily>[formViewItemsProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    formViewItemsProvider,
    ...?formViewItemsProvider.allTransitiveDependencies
  },
);

typedef RowActionStoreRef
    = AutoDisposeFutureProviderRef<Pair<RowAction, StoreResult>>;
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
String _$formViewLoadingHash() => r'0ab33256580512f9922fb26bc8db31b5198718ee';

/// See also [formViewLoading].
@ProviderFor(formViewLoading)
final formViewLoadingProvider = AutoDisposeProvider<bool>.internal(
  formViewLoading,
  name: r'formViewLoadingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$formViewLoadingHash,
  dependencies: <ProviderOrFamily>[formViewItemsProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    formViewItemsProvider,
    ...?formViewItemsProvider.allTransitiveDependencies
  },
);

typedef FormViewLoadingRef = AutoDisposeProviderRef<bool>;
String _$completionPercentageHash() =>
    r'd239e2ab1d18cb330cdee10c27e3786a3b9904fd';

/// See also [completionPercentage].
@ProviderFor(completionPercentage)
final completionPercentageProvider = AutoDisposeProvider<double>.internal(
  completionPercentage,
  name: r'completionPercentageProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$completionPercentageHash,
  dependencies: <ProviderOrFamily>[formViewItemsProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    formViewItemsProvider,
    ...?formViewItemsProvider.allTransitiveDependencies
  },
);

typedef CompletionPercentageRef = AutoDisposeProviderRef<double>;
String _$calculationLoopHash() => r'c4a0b2be21a9ab3e967b996c7f9920f821823439';

/// See also [calculationLoop].
@ProviderFor(calculationLoop)
final calculationLoopProvider = AutoDisposeProvider<bool>.internal(
  calculationLoop,
  name: r'calculationLoopProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$calculationLoopHash,
  dependencies: <ProviderOrFamily>[formViewItemsProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    formViewItemsProvider,
    ...?formViewItemsProvider.allTransitiveDependencies
  },
);

typedef CalculationLoopRef = AutoDisposeProviderRef<bool>;
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
String _$formPendingIntentsHash() =>
    r'731d423ab2aec3ae9dfae7c2806e5c79361ba679';

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
String _$formViewItemsHash() => r'91626ef9743dbbcf27bb816aa2c278bb21c6fe99';

/// See also [FormViewItems].
@ProviderFor(FormViewItems)
final formViewItemsProvider = AutoDisposeAsyncNotifierProvider<FormViewItems,
    IList<FieldUiModel>>.internal(
  FormViewItems.new,
  name: r'formViewItemsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$formViewItemsHash,
  dependencies: <ProviderOrFamily>[formRepositoryProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    formRepositoryProvider,
    ...?formRepositoryProvider.allTransitiveDependencies
  },
);

typedef _$FormViewItems = AutoDisposeAsyncNotifier<IList<FieldUiModel>>;
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
