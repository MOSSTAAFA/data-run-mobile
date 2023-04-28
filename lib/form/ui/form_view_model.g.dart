// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$completionPercentageValueHash() =>
    r'ea1a51fa448b41d2f907ca3f9a796ac3cb3a15b7';

/// See also [completionPercentageValue].
@ProviderFor(completionPercentageValue)
final completionPercentageValueProvider =
    AutoDisposeFutureProvider<double>.internal(
  completionPercentageValue,
  name: r'completionPercentageValueProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$completionPercentageValueHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CompletionPercentageValueRef = AutoDisposeFutureProviderRef<double>;
String _$formViewModelHash() => r'269e9869e97f2c9ef8d299005b35f6b300bc47c1';

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
String _$fieldRowHash() => r'443059f2aead91de2105341a8b39f3a28d5273d7';

/// See also [fieldRow].
@ProviderFor(fieldRow)
final fieldRowProvider = AutoDisposeProvider<FieldUiModel?>.internal(
  fieldRow,
  name: r'fieldRowProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fieldRowHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FieldRowRef = AutoDisposeProviderRef<FieldUiModel?>;
String _$loadingHash() => r'2ed8ed17ccc9a7a43d0276b80bab516862840ebe';

/// See also [Loading].
@ProviderFor(Loading)
final loadingProvider = AutoDisposeNotifierProvider<Loading, bool>.internal(
  Loading.new,
  name: r'loadingProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$loadingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Loading = AutoDisposeNotifier<bool>;
String _$showToastHash() => r'a687a9df001f06805c0b35beac3f24f71e9ce169';

/// See also [ShowToast].
@ProviderFor(ShowToast)
final showToastProvider = NotifierProvider<ShowToast, String?>.internal(
  ShowToast.new,
  name: r'showToastProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$showToastHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ShowToast = Notifier<String?>;
String _$focusedHash() => r'ca0389d86161f4c6da5ba8e8de1bf17573819c97';

/// See also [Focused].
@ProviderFor(Focused)
final focusedProvider = AutoDisposeNotifierProvider<Focused, bool?>.internal(
  Focused.new,
  name: r'focusedProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$focusedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Focused = AutoDisposeNotifier<bool?>;
String _$showInfoHash() => r'b3eceb58c61fa39103f18bcc8d9587d983af5c29';

/// See also [ShowInfo].
@ProviderFor(ShowInfo)
final showInfoProvider =
    AutoDisposeNotifierProvider<ShowInfo, InfoUiModel?>.internal(
  ShowInfo.new,
  name: r'showInfoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$showInfoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ShowInfo = AutoDisposeNotifier<InfoUiModel?>;
String _$itemsHash() => r'72ab4a841237b575adc12149a73a13857176f889';

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
String _$savedValueHash() => r'c6c70d35b9e0dda88bb517af75021f4b5f779883';

/// See also [SavedValue].
@ProviderFor(SavedValue)
final savedValueProvider =
    AutoDisposeNotifierProvider<SavedValue, RowAction?>.internal(
  SavedValue.new,
  name: r'savedValueProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$savedValueHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SavedValue = AutoDisposeNotifier<RowAction?>;
String _$queryDataHash() => r'abbacc3784e00074eb7aea391520c16ec4e2b484';

/// See also [QueryData].
@ProviderFor(QueryData)
final queryDataProvider =
    AutoDisposeNotifierProvider<QueryData, RowAction?>.internal(
  QueryData.new,
  name: r'queryDataProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$queryDataHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$QueryData = AutoDisposeNotifier<RowAction?>;
String _$calculationLoopValueHash() =>
    r'9bb56e5711ca32cc664270cd885d14cd8d955b2a';

/// See also [CalculationLoopValue].
@ProviderFor(CalculationLoopValue)
final calculationLoopValueProvider =
    AutoDisposeAsyncNotifierProvider<CalculationLoopValue, bool>.internal(
  CalculationLoopValue.new,
  name: r'calculationLoopValueProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$calculationLoopValueHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CalculationLoopValue = AutoDisposeAsyncNotifier<bool>;
String _$dataIntegrityResultValueHash() =>
    r'c7e6c840b831460b0d38e8786c4a2f00387c6527';

/// See also [DataIntegrityResultValue].
@ProviderFor(DataIntegrityResultValue)
final dataIntegrityResultValueProvider = AutoDisposeNotifierProvider<
    DataIntegrityResultValue, DataIntegrityCheckResult?>.internal(
  DataIntegrityResultValue.new,
  name: r'dataIntegrityResultValueProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dataIntegrityResultValueHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DataIntegrityResultValue
    = AutoDisposeNotifier<DataIntegrityCheckResult?>;
String _$pendingIntentsHash() => r'c9bb527c0214f456679774fac2d4886479f739e4';

/// See also [PendingIntents].
@ProviderFor(PendingIntents)
final pendingIntentsProvider =
    AutoDisposeNotifierProvider<PendingIntents, FormIntent?>.internal(
  PendingIntents.new,
  name: r'pendingIntentsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pendingIntentsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PendingIntents = AutoDisposeNotifier<FormIntent?>;
String _$fieldItemHash() => r'8f794191cff740e1297b50535639286569554215';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$FieldItem
    extends BuildlessAutoDisposeAsyncNotifier<FieldUiModel> {
  late final Callback callback;

  FutureOr<FieldUiModel> build(
    Callback callback,
  );
}

/// See also [FieldItem].
@ProviderFor(FieldItem)
const fieldItemProvider = FieldItemFamily();

/// See also [FieldItem].
class FieldItemFamily extends Family<AsyncValue<FieldUiModel>> {
  /// See also [FieldItem].
  const FieldItemFamily();

  /// See also [FieldItem].
  FieldItemProvider call(
    Callback callback,
  ) {
    return FieldItemProvider(
      callback,
    );
  }

  @override
  FieldItemProvider getProviderOverride(
    covariant FieldItemProvider provider,
  ) {
    return call(
      provider.callback,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fieldItemProvider';
}

/// See also [FieldItem].
class FieldItemProvider
    extends AutoDisposeAsyncNotifierProviderImpl<FieldItem, FieldUiModel> {
  /// See also [FieldItem].
  FieldItemProvider(
    this.callback,
  ) : super.internal(
          () => FieldItem()..callback = callback,
          from: fieldItemProvider,
          name: r'fieldItemProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fieldItemHash,
          dependencies: FieldItemFamily._dependencies,
          allTransitiveDependencies: FieldItemFamily._allTransitiveDependencies,
        );

  final Callback callback;

  @override
  bool operator ==(Object other) {
    return other is FieldItemProvider && other.callback == callback;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, callback.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<FieldUiModel> runNotifierBuild(
    covariant FieldItem notifier,
  ) {
    return notifier.build(
      callback,
    );
  }
}

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
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
