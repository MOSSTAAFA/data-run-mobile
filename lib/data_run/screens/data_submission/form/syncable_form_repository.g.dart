// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'syncable_form_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$syncableDataEntryRepositoryHash() =>
    r'3c0e5fb6b19d62e8e4c9352cd7efde4f59680747';

/// See also [syncableDataEntryRepository].
@ProviderFor(syncableDataEntryRepository)
final syncableDataEntryRepositoryProvider =
    AutoDisposeProvider<SyncableDataEntryRepository>.internal(
  syncableDataEntryRepository,
  name: r'syncableDataEntryRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$syncableDataEntryRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SyncableDataEntryRepositoryRef
    = AutoDisposeProviderRef<SyncableDataEntryRepository>;
String _$fieldErrorMessageHash() => r'17b134ed2a0e67d096059f49a7ecc938cf9ccb9b';

/// See also [fieldErrorMessage].
@ProviderFor(fieldErrorMessage)
final fieldErrorMessageProvider =
    AutoDisposeProvider<FieldErrorMessageProvider>.internal(
  fieldErrorMessage,
  name: r'fieldErrorMessageProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fieldErrorMessageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FieldErrorMessageRef
    = AutoDisposeProviderRef<FieldErrorMessageProvider>;
String _$syncableFormRepositoryHash() =>
    r'6cd400af8c38976985367204a48f30ea5dc72b76';

/// See also [syncableFormRepository].
@ProviderFor(syncableFormRepository)
final syncableFormRepositoryProvider =
    AutoDisposeProvider<SyncableFormRepository>.internal(
  syncableFormRepository,
  name: r'syncableFormRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$syncableFormRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SyncableFormRepositoryRef
    = AutoDisposeProviderRef<SyncableFormRepository>;
String _$fieldInputModelNotifierHash() =>
    r'5ad653656c83e76450b36f2dee3dd67e5e58c627';

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

abstract class _$FieldInputModelNotifier
    extends BuildlessAutoDisposeAsyncNotifier<FieldInputModel> {
  late final int index;

  FutureOr<FieldInputModel> build(
    int index,
  );
}

/// See also [FieldInputModelNotifier].
@ProviderFor(FieldInputModelNotifier)
const fieldInputModelNotifierProvider = FieldInputModelNotifierFamily();

/// See also [FieldInputModelNotifier].
class FieldInputModelNotifierFamily
    extends Family<AsyncValue<FieldInputModel>> {
  /// See also [FieldInputModelNotifier].
  const FieldInputModelNotifierFamily();

  /// See also [FieldInputModelNotifier].
  FieldInputModelNotifierProvider call(
    int index,
  ) {
    return FieldInputModelNotifierProvider(
      index,
    );
  }

  @override
  FieldInputModelNotifierProvider getProviderOverride(
    covariant FieldInputModelNotifierProvider provider,
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
  String? get name => r'fieldInputModelNotifierProvider';
}

/// See also [FieldInputModelNotifier].
class FieldInputModelNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<FieldInputModelNotifier,
        FieldInputModel> {
  /// See also [FieldInputModelNotifier].
  FieldInputModelNotifierProvider(
    int index,
  ) : this._internal(
          () => FieldInputModelNotifier()..index = index,
          from: fieldInputModelNotifierProvider,
          name: r'fieldInputModelNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fieldInputModelNotifierHash,
          dependencies: FieldInputModelNotifierFamily._dependencies,
          allTransitiveDependencies:
              FieldInputModelNotifierFamily._allTransitiveDependencies,
          index: index,
        );

  FieldInputModelNotifierProvider._internal(
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
  FutureOr<FieldInputModel> runNotifierBuild(
    covariant FieldInputModelNotifier notifier,
  ) {
    return notifier.build(
      index,
    );
  }

  @override
  Override overrideWith(FieldInputModelNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: FieldInputModelNotifierProvider._internal(
        () => create()..index = index,
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
  AutoDisposeAsyncNotifierProviderElement<FieldInputModelNotifier,
      FieldInputModel> createElement() {
    return _FieldInputModelNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FieldInputModelNotifierProvider && other.index == index;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, index.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FieldInputModelNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<FieldInputModel> {
  /// The parameter `index` of this provider.
  int get index;
}

class _FieldInputModelNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<FieldInputModelNotifier,
        FieldInputModel> with FieldInputModelNotifierRef {
  _FieldInputModelNotifierProviderElement(super.provider);

  @override
  int get index => (origin as FieldInputModelNotifierProvider).index;
}

String _$formInputFieldsListNotifierHash() =>
    r'3943e0ca610edf1f5b86f868975f486e84b326d4';

/// fetchFormItems
///
/// Copied from [FormInputFieldsListNotifier].
@ProviderFor(FormInputFieldsListNotifier)
final formInputFieldsListNotifierProvider = AutoDisposeAsyncNotifierProvider<
    FormInputFieldsListNotifier, IList<FieldInputModel>>.internal(
  FormInputFieldsListNotifier.new,
  name: r'formInputFieldsListNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$formInputFieldsListNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FormInputFieldsListNotifier
    = AutoDisposeAsyncNotifier<IList<FieldInputModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
