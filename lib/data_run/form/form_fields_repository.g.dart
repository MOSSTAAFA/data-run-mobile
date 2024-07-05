// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_fields_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$displayNameProviderHash() =>
    r'5b0d20d13f56753611e802b0315afbf3ca49d501';

/// See also [displayNameProvider].
@ProviderFor(displayNameProvider)
final displayNameProviderProvider =
    AutoDisposeProvider<DisplayNameProvider>.internal(
  displayNameProvider,
  name: r'displayNameProviderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$displayNameProviderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DisplayNameProviderRef = AutoDisposeProviderRef<DisplayNameProvider>;
String _$fieldErrorMessageProviderHash() =>
    r'736b9ff87eb263423b1e96b2d64ec7d447b1294c';

/// See also [fieldErrorMessageProvider].
@ProviderFor(fieldErrorMessageProvider)
final fieldErrorMessageProviderProvider =
    AutoDisposeProvider<FieldErrorMessageProvider>.internal(
  fieldErrorMessageProvider,
  name: r'fieldErrorMessageProviderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fieldErrorMessageProviderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FieldErrorMessageProviderRef
    = AutoDisposeProviderRef<FieldErrorMessageProvider>;
String _$databaseSyncableQueryHash() =>
    r'b44568b917d4f833300eea0948f6ee6907ab60fa';

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

/// See also [databaseSyncableQuery].
@ProviderFor(databaseSyncableQuery)
const databaseSyncableQueryProvider = DatabaseSyncableQueryFamily();

/// See also [databaseSyncableQuery].
class DatabaseSyncableQueryFamily extends Family<DatabaseSyncableQuery> {
  /// See also [databaseSyncableQuery].
  const DatabaseSyncableQueryFamily();

  /// See also [databaseSyncableQuery].
  DatabaseSyncableQueryProvider call(
    String formCode,
  ) {
    return DatabaseSyncableQueryProvider(
      formCode,
    );
  }

  @override
  DatabaseSyncableQueryProvider getProviderOverride(
    covariant DatabaseSyncableQueryProvider provider,
  ) {
    return call(
      provider.formCode,
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
  String? get name => r'databaseSyncableQueryProvider';
}

/// See also [databaseSyncableQuery].
class DatabaseSyncableQueryProvider
    extends AutoDisposeProvider<DatabaseSyncableQuery> {
  /// See also [databaseSyncableQuery].
  DatabaseSyncableQueryProvider(
    String formCode,
  ) : this._internal(
          (ref) => databaseSyncableQuery(
            ref as DatabaseSyncableQueryRef,
            formCode,
          ),
          from: databaseSyncableQueryProvider,
          name: r'databaseSyncableQueryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$databaseSyncableQueryHash,
          dependencies: DatabaseSyncableQueryFamily._dependencies,
          allTransitiveDependencies:
              DatabaseSyncableQueryFamily._allTransitiveDependencies,
          formCode: formCode,
        );

  DatabaseSyncableQueryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.formCode,
  }) : super.internal();

  final String formCode;

  @override
  Override overrideWith(
    DatabaseSyncableQuery Function(DatabaseSyncableQueryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DatabaseSyncableQueryProvider._internal(
        (ref) => create(ref as DatabaseSyncableQueryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        formCode: formCode,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<DatabaseSyncableQuery> createElement() {
    return _DatabaseSyncableQueryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DatabaseSyncableQueryProvider && other.formCode == formCode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, formCode.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DatabaseSyncableQueryRef
    on AutoDisposeProviderRef<DatabaseSyncableQuery> {
  /// The parameter `formCode` of this provider.
  String get formCode;
}

class _DatabaseSyncableQueryProviderElement
    extends AutoDisposeProviderElement<DatabaseSyncableQuery>
    with DatabaseSyncableQueryRef {
  _DatabaseSyncableQueryProviderElement(super.provider);

  @override
  String get formCode => (origin as DatabaseSyncableQueryProvider).formCode;
}

String _$formFieldsRepositoryHash() =>
    r'498a3e6421aef8615603f6fce4e034458132150d';

/// See also [formFieldsRepository].
@ProviderFor(formFieldsRepository)
final formFieldsRepositoryProvider =
    AutoDisposeFutureProvider<FormFieldsRepository>.internal(
  formFieldsRepository,
  name: r'formFieldsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$formFieldsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FormFieldsRepositoryRef
    = AutoDisposeFutureProviderRef<FormFieldsRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
