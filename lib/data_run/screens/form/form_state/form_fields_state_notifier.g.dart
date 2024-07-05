// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_fields_state_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$indexedFieldInputHash() => r'acae32b946ae175af848eac15bdf230237796302';

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
class IndexedFieldInputFamily extends Family<AsyncValue<QFieldModel>> {
  /// See also [indexedFieldInput].
  const IndexedFieldInputFamily();

  /// See also [indexedFieldInput].
  IndexedFieldInputProvider call(
    String key,
  ) {
    return IndexedFieldInputProvider(
      key,
    );
  }

  @override
  IndexedFieldInputProvider getProviderOverride(
    covariant IndexedFieldInputProvider provider,
  ) {
    return call(
      provider.key,
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
class IndexedFieldInputProvider extends AutoDisposeFutureProvider<QFieldModel> {
  /// See also [indexedFieldInput].
  IndexedFieldInputProvider(
    String key,
  ) : this._internal(
          (ref) => indexedFieldInput(
            ref as IndexedFieldInputRef,
            key,
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
          key: key,
        );

  IndexedFieldInputProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.key,
  }) : super.internal();

  final String key;

  @override
  Override overrideWith(
    FutureOr<QFieldModel> Function(IndexedFieldInputRef provider) create,
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
        key: key,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<QFieldModel> createElement() {
    return _IndexedFieldInputProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IndexedFieldInputProvider && other.key == key;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, key.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin IndexedFieldInputRef on AutoDisposeFutureProviderRef<QFieldModel> {
  /// The parameter `key` of this provider.
  String get key;
}

class _IndexedFieldInputProviderElement
    extends AutoDisposeFutureProviderElement<QFieldModel>
    with IndexedFieldInputRef {
  _IndexedFieldInputProviderElement(super.provider);

  @override
  String get key => (origin as IndexedFieldInputProvider).key;
}

String _$formFieldsStateNotifierHash() =>
    r'bca4db5c2ffcf9bc9e6245ad64b5b00c879b9517';

/// See also [FormFieldsStateNotifier].
@ProviderFor(FormFieldsStateNotifier)
final formFieldsStateNotifierProvider = AutoDisposeAsyncNotifierProvider<
    FormFieldsStateNotifier, IMap<String, QFieldModel>>.internal(
  FormFieldsStateNotifier.new,
  name: r'formFieldsStateNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$formFieldsStateNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FormFieldsStateNotifier
    = AutoDisposeAsyncNotifier<IMap<String, QFieldModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
