// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_submission_list_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$formSubmissionListRepositoryHash() =>
    r'efb86f04403a5b6ee02a13d260aa1ae12acecff3';

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

/// See also [formSubmissionListRepository].
@ProviderFor(formSubmissionListRepository)
const formSubmissionListRepositoryProvider =
    FormSubmissionListRepositoryFamily();

/// See also [formSubmissionListRepository].
class FormSubmissionListRepositoryFamily
    extends Family<FormSubmissionListRepository> {
  /// See also [formSubmissionListRepository].
  const FormSubmissionListRepositoryFamily();

  /// See also [formSubmissionListRepository].
  FormSubmissionListRepositoryProvider call(
    String form,
  ) {
    return FormSubmissionListRepositoryProvider(
      form,
    );
  }

  @override
  FormSubmissionListRepositoryProvider getProviderOverride(
    covariant FormSubmissionListRepositoryProvider provider,
  ) {
    return call(
      provider.form,
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
  String? get name => r'formSubmissionListRepositoryProvider';
}

/// See also [formSubmissionListRepository].
class FormSubmissionListRepositoryProvider
    extends AutoDisposeProvider<FormSubmissionListRepository> {
  /// See also [formSubmissionListRepository].
  FormSubmissionListRepositoryProvider(
    String form,
  ) : this._internal(
          (ref) => formSubmissionListRepository(
            ref as FormSubmissionListRepositoryRef,
            form,
          ),
          from: formSubmissionListRepositoryProvider,
          name: r'formSubmissionListRepositoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$formSubmissionListRepositoryHash,
          dependencies: FormSubmissionListRepositoryFamily._dependencies,
          allTransitiveDependencies:
              FormSubmissionListRepositoryFamily._allTransitiveDependencies,
          form: form,
        );

  FormSubmissionListRepositoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.form,
  }) : super.internal();

  final String form;

  @override
  Override overrideWith(
    FormSubmissionListRepository Function(
            FormSubmissionListRepositoryRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FormSubmissionListRepositoryProvider._internal(
        (ref) => create(ref as FormSubmissionListRepositoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        form: form,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<FormSubmissionListRepository> createElement() {
    return _FormSubmissionListRepositoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FormSubmissionListRepositoryProvider && other.form == form;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, form.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FormSubmissionListRepositoryRef
    on AutoDisposeProviderRef<FormSubmissionListRepository> {
  /// The parameter `form` of this provider.
  String get form;
}

class _FormSubmissionListRepositoryProviderElement
    extends AutoDisposeProviderElement<FormSubmissionListRepository>
    with FormSubmissionListRepositoryRef {
  _FormSubmissionListRepositoryProviderElement(super.provider);

  @override
  String get form => (origin as FormSubmissionListRepositoryProvider).form;
}

String _$entitySummaryHash() => r'66f416bf9ee632b13635632b49c6a32565134c56';

/// See also [entitySummary].
@ProviderFor(entitySummary)
const entitySummaryProvider = EntitySummaryFamily();

/// See also [entitySummary].
class EntitySummaryFamily extends Family<AsyncValue<EntitySummary>> {
  /// See also [entitySummary].
  const EntitySummaryFamily();

  /// See also [entitySummary].
  EntitySummaryProvider call({
    required String entityUid,
  }) {
    return EntitySummaryProvider(
      entityUid: entityUid,
    );
  }

  @override
  EntitySummaryProvider getProviderOverride(
    covariant EntitySummaryProvider provider,
  ) {
    return call(
      entityUid: provider.entityUid,
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
  String? get name => r'entitySummaryProvider';
}

/// See also [entitySummary].
class EntitySummaryProvider extends AutoDisposeFutureProvider<EntitySummary> {
  /// See also [entitySummary].
  EntitySummaryProvider({
    required String entityUid,
  }) : this._internal(
          (ref) => entitySummary(
            ref as EntitySummaryRef,
            entityUid: entityUid,
          ),
          from: entitySummaryProvider,
          name: r'entitySummaryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$entitySummaryHash,
          dependencies: EntitySummaryFamily._dependencies,
          allTransitiveDependencies:
              EntitySummaryFamily._allTransitiveDependencies,
          entityUid: entityUid,
        );

  EntitySummaryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.entityUid,
  }) : super.internal();

  final String entityUid;

  @override
  Override overrideWith(
    FutureOr<EntitySummary> Function(EntitySummaryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: EntitySummaryProvider._internal(
        (ref) => create(ref as EntitySummaryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        entityUid: entityUid,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<EntitySummary> createElement() {
    return _EntitySummaryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EntitySummaryProvider && other.entityUid == entityUid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, entityUid.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin EntitySummaryRef on AutoDisposeFutureProviderRef<EntitySummary> {
  /// The parameter `entityUid` of this provider.
  String get entityUid;
}

class _EntitySummaryProviderElement
    extends AutoDisposeFutureProviderElement<EntitySummary>
    with EntitySummaryRef {
  _EntitySummaryProviderElement(super.provider);

  @override
  String get entityUid => (origin as EntitySummaryProvider).entityUid;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
