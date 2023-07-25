// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$formViewModelHash() => r'48eb9f648b20c354b104ef7b859f9e971cebfcad';

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

typedef FormViewModelRef = AutoDisposeProviderRef<FormViewModel>;

/// See also [formViewModel].
@ProviderFor(formViewModel)
const formViewModelProvider = FormViewModelFamily();

/// See also [formViewModel].
class FormViewModelFamily extends Family<FormViewModel> {
  /// See also [formViewModel].
  const FormViewModelFamily();

  /// See also [formViewModel].
  FormViewModelProvider call(
    FormRepositoryRecords repositoryRecords,
  ) {
    return FormViewModelProvider(
      repositoryRecords,
    );
  }

  @override
  FormViewModelProvider getProviderOverride(
    covariant FormViewModelProvider provider,
  ) {
    return call(
      provider.repositoryRecords,
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
  String? get name => r'formViewModelProvider';
}

/// See also [formViewModel].
class FormViewModelProvider extends AutoDisposeProvider<FormViewModel> {
  /// See also [formViewModel].
  FormViewModelProvider(
    this.repositoryRecords,
  ) : super.internal(
          (ref) => formViewModel(
            ref,
            repositoryRecords,
          ),
          from: formViewModelProvider,
          name: r'formViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$formViewModelHash,
          dependencies: FormViewModelFamily._dependencies,
          allTransitiveDependencies:
              FormViewModelFamily._allTransitiveDependencies,
        );

  final FormRepositoryRecords repositoryRecords;

  @override
  bool operator ==(Object other) {
    return other is FormViewModelProvider &&
        other.repositoryRecords == repositoryRecords;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, repositoryRecords.hashCode);

    return _SystemHash.finish(hash);
  }
}

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
String _$formModelInstanceHash() =>
    r'237afb43c8388b134264300b175d715209d22ae9'; ////////////////////////////////
////////////////////////////////
////////////////////////////////
////////////////////////////////
////////////////////////////////
////////////////////////////////
////////////////////////////////
////////////////////////////////
////////////////////////////////
///
/// Copied from [FormModelInstance].
@ProviderFor(FormModelInstance)
final formModelInstanceProvider =
    AutoDisposeNotifierProvider<FormModelInstance, FormModel>.internal(
  FormModelInstance.new,
  name: r'formModelInstanceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$formModelInstanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FormModelInstance = AutoDisposeNotifier<FormModel>;
String _$itemsHash() => r'cd67bdffac462f0692951b49f72dc752573d6f40';

/// See also [Items].
@ProviderFor(Items)
final itemsProvider =
    AutoDisposeNotifierProvider<Items, IList<FieldUiModel>>.internal(
  Items.new,
  name: r'itemsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$itemsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Items = AutoDisposeNotifier<IList<FieldUiModel>>;
String _$fieldItemHash() => r'0f4159ce978ab3e369a0fb8a0daef5b1bcfb8e80';

abstract class _$FieldItem extends BuildlessAutoDisposeNotifier<FieldUiModel?> {
  late final Callback callback;

  FieldUiModel? build(
    Callback callback,
  );
}

/// See also [FieldItem].
@ProviderFor(FieldItem)
const fieldItemProvider = FieldItemFamily();

/// See also [FieldItem].
class FieldItemFamily extends Family<FieldUiModel?> {
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

  static final Iterable<ProviderOrFamily> _dependencies = <ProviderOrFamily>[
    indexProvider
  ];

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static final Iterable<ProviderOrFamily> _allTransitiveDependencies =
      <ProviderOrFamily>[indexProvider];

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fieldItemProvider';
}

/// See also [FieldItem].
class FieldItemProvider
    extends AutoDisposeNotifierProviderImpl<FieldItem, FieldUiModel?> {
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
  FieldUiModel? runNotifierBuild(
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
