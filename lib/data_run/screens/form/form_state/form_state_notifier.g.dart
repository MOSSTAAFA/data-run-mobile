// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_state_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$indexedFieldInputHash() => r'7b7f3b0fd24ec75206d320370441581cf407e54e';

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

/// See also [indexedFieldInput].
@ProviderFor(indexedFieldInput)
const indexedFieldInputProvider = IndexedFieldInputFamily();

/// See also [indexedFieldInput].
class IndexedFieldInputFamily extends Family<AsyncValue<FormFieldModel>> {
  /// See also [indexedFieldInput].
  const IndexedFieldInputFamily();

  /// See also [indexedFieldInput].
  IndexedFieldInputProvider call(
    int index,
  ) {
    return IndexedFieldInputProvider(
      index,
    );
  }

  @override
  IndexedFieldInputProvider getProviderOverride(
    covariant IndexedFieldInputProvider provider,
  ) {
    return call(
      provider.index,
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
  String? get name => r'indexedFieldInputProvider';
}

/// See also [indexedFieldInput].
class IndexedFieldInputProvider
    extends AutoDisposeFutureProvider<FormFieldModel> {
  /// See also [indexedFieldInput].
  IndexedFieldInputProvider(
    int index,
  ) : this._internal(
          (ref) => indexedFieldInput(
            ref as IndexedFieldInputRef,
            index,
          ),
          from: indexedFieldInputProvider,
          name: r'indexedFieldInputProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$indexedFieldInputHash,
          dependencies: IndexedFieldInputFamily._dependencies,
          allTransitiveDependencies:
              IndexedFieldInputFamily._allTransitiveDependencies,
          index: index,
        );

  IndexedFieldInputProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.index,
  }) : super.internal();

  final int index;

  @override
  Override overrideWith(
    FutureOr<FormFieldModel> Function(IndexedFieldInputRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IndexedFieldInputProvider._internal(
        (ref) => create(ref as IndexedFieldInputRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        index: index,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<FormFieldModel> createElement() {
    return _IndexedFieldInputProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IndexedFieldInputProvider && other.index == index;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, index.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin IndexedFieldInputRef on AutoDisposeFutureProviderRef<FormFieldModel> {
  /// The parameter `index` of this provider.
  int get index;
}

class _IndexedFieldInputProviderElement
    extends AutoDisposeFutureProviderElement<FormFieldModel>
    with IndexedFieldInputRef {
  _IndexedFieldInputProviderElement(super.provider);

  @override
  int get index => (origin as IndexedFieldInputProvider).index;
}

String _$formStateNotifierHash() => r'fff5a69114a569d5520a89a98505024fc23dc6e5';

/// See also [FormStateNotifier].
@ProviderFor(FormStateNotifier)
final formStateNotifierProvider = AutoDisposeAsyncNotifierProvider<
    FormStateNotifier, IList<FormFieldModel>>.internal(
  FormStateNotifier.new,
  name: r'formStateNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$formStateNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FormStateNotifier = AutoDisposeAsyncNotifier<IList<FormFieldModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
