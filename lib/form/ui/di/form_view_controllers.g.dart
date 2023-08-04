// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_view_controllers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$formRepositoryRecordsInstanceHash() =>
    r'ad5c0aa2319f7b0932b1c3b3af8bb96d6782386f';

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
String _$formViewRepositoryHash() =>
    r'8ced87607b5e7682ea930189af4b1cf199077d23';

/// See also [_formViewRepository].
@ProviderFor(_formViewRepository)
final _formViewRepositoryProvider =
    AutoDisposeProvider<FormViewRepository>.internal(
  _formViewRepository,
  name: r'_formViewRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$formViewRepositoryHash,
  dependencies: <ProviderOrFamily>[formRepositoryProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    formRepositoryProvider,
    ...?formRepositoryProvider.allTransitiveDependencies
  },
);

typedef _FormViewRepositoryRef = AutoDisposeProviderRef<FormViewRepository>;
String _$rowActionFromIntentHash() =>
    r'a123a0f7c3790124163b50288ce7003d437898b0';

/// See also [_rowActionFromIntent].
@ProviderFor(_rowActionFromIntent)
final _rowActionFromIntentProvider = AutoDisposeProvider<RowAction>.internal(
  _rowActionFromIntent,
  name: r'_rowActionFromIntentProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$rowActionFromIntentHash,
  dependencies: <ProviderOrFamily>[_formViewRepositoryProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    _formViewRepositoryProvider,
    ...?_formViewRepositoryProvider.allTransitiveDependencies
  },
);

typedef _RowActionFromIntentRef = AutoDisposeProviderRef<RowAction>;
String _$formViewFocusedHash() => r'91e590f97ecf5e0f4ce04ab10785f4fd865af554';

/// See also [formViewFocused].
@ProviderFor(formViewFocused)
final formViewFocusedProvider = AutoDisposeProvider<bool>.internal(
  formViewFocused,
  name: r'formViewFocusedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$formViewFocusedHash,
  dependencies: <ProviderOrFamily>[_rowActionFromIntentProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    _rowActionFromIntentProvider,
    ...?_rowActionFromIntentProvider.allTransitiveDependencies
  },
);

typedef FormViewFocusedRef = AutoDisposeProviderRef<bool>;
String _$formViewLoadingHash() => r'fbbf2c23307ef371c453ec61dbbfe01a1b9c40c0';

/// See also [formViewLoading].
@ProviderFor(formViewLoading)
final formViewLoadingProvider = AutoDisposeProvider<bool>.internal(
  formViewLoading,
  name: r'formViewLoadingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$formViewLoadingHash,
  dependencies: <ProviderOrFamily>[
    _rowActionFromIntentProvider,
    itemsResultProvider
  ],
  allTransitiveDependencies: <ProviderOrFamily>{
    _rowActionFromIntentProvider,
    ...?_rowActionFromIntentProvider.allTransitiveDependencies,
    itemsResultProvider,
    ...?itemsResultProvider.allTransitiveDependencies
  },
);

typedef FormViewLoadingRef = AutoDisposeProviderRef<bool>;
String _$completionPercentageHash() =>
    r'f35adf3ea0c30b28bc11cab1cbb492ed91b8a7e3';

/// See also [completionPercentage].
@ProviderFor(completionPercentage)
final completionPercentageProvider = AutoDisposeProvider<double>.internal(
  completionPercentage,
  name: r'completionPercentageProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$completionPercentageHash,
  dependencies: <ProviderOrFamily>[
    _formViewRepositoryProvider,
    itemsResultProvider
  ],
  allTransitiveDependencies: <ProviderOrFamily>{
    _formViewRepositoryProvider,
    ...?_formViewRepositoryProvider.allTransitiveDependencies,
    itemsResultProvider,
    ...?itemsResultProvider.allTransitiveDependencies
  },
);

typedef CompletionPercentageRef = AutoDisposeProviderRef<double>;
String _$calculationLoopHash() => r'a6b782a2799716fb93698b3591d4c0079b0e0098';

/// See also [calculationLoop].
@ProviderFor(calculationLoop)
final calculationLoopProvider = AutoDisposeProvider<bool>.internal(
  calculationLoop,
  name: r'calculationLoopProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$calculationLoopHash,
  dependencies: <ProviderOrFamily>[
    _formViewRepositoryProvider,
    itemsResultProvider
  ],
  allTransitiveDependencies: <ProviderOrFamily>{
    _formViewRepositoryProvider,
    ...?_formViewRepositoryProvider.allTransitiveDependencies,
    itemsResultProvider,
    ...?itemsResultProvider.allTransitiveDependencies
  },
);

typedef CalculationLoopRef = AutoDisposeProviderRef<bool>;
String _$rowActionStoreHash() => r'3e7415bb73a047273f461a5205dba6552cd09135';

/// See also [_rowActionStore].
@ProviderFor(_rowActionStore)
final _rowActionStoreProvider =
    AutoDisposeFutureProvider<Pair<RowAction, StoreResult>>.internal(
  _rowActionStore,
  name: r'_rowActionStoreProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$rowActionStoreHash,
  dependencies: <ProviderOrFamily>[
    _rowActionFromIntentProvider,
    _formViewRepositoryProvider
  ],
  allTransitiveDependencies: <ProviderOrFamily>{
    _rowActionFromIntentProvider,
    ...?_rowActionFromIntentProvider.allTransitiveDependencies,
    _formViewRepositoryProvider,
    ...?_formViewRepositoryProvider.allTransitiveDependencies
  },
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
String _$formPendingIntentsHash() =>
    r'2d00cbd9c08541bc485b4f65d1e1a0d385ad4e42';

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
String _$itemsResultHash() => r'187ee0e2fe9af5d15bb0318f0b0f5a047d816470';

/// See also [ItemsResult].
@ProviderFor(ItemsResult)
final itemsResultProvider =
    AutoDisposeAsyncNotifierProvider<ItemsResult, IList<FieldUiModel>>.internal(
  ItemsResult.new,
  name: r'itemsResultProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$itemsResultHash,
  dependencies: <ProviderOrFamily>[
    _formViewRepositoryProvider,
    _rowActionStoreProvider
  ],
  allTransitiveDependencies: <ProviderOrFamily>{
    _formViewRepositoryProvider,
    ...?_formViewRepositoryProvider.allTransitiveDependencies,
    _rowActionStoreProvider,
    ...?_rowActionStoreProvider.allTransitiveDependencies
  },
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
