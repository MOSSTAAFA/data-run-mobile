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

String _$formSubmissionsByStatusHash() =>
    r'bbafa8a375321eb2befbcd238c2e3613f8682b6f';

/// See also [formSubmissionsByStatus].
@ProviderFor(formSubmissionsByStatus)
const formSubmissionsByStatusProvider = FormSubmissionsByStatusFamily();

/// See also [formSubmissionsByStatus].
class FormSubmissionsByStatusFamily
    extends Family<AsyncValue<IList<DataFormSubmission>>> {
  /// See also [formSubmissionsByStatus].
  const FormSubmissionsByStatusFamily();

  /// See also [formSubmissionsByStatus].
  FormSubmissionsByStatusProvider call({
    required String form,
    SyncableEntityState? entityStatus,
    String sortBy = 'name',
  }) {
    return FormSubmissionsByStatusProvider(
      form: form,
      entityStatus: entityStatus,
      sortBy: sortBy,
    );
  }

  @override
  FormSubmissionsByStatusProvider getProviderOverride(
    covariant FormSubmissionsByStatusProvider provider,
  ) {
    return call(
      form: provider.form,
      entityStatus: provider.entityStatus,
      sortBy: provider.sortBy,
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
  String? get name => r'formSubmissionsByStatusProvider';
}

/// See also [formSubmissionsByStatus].
class FormSubmissionsByStatusProvider
    extends AutoDisposeFutureProvider<IList<DataFormSubmission>> {
  /// See also [formSubmissionsByStatus].
  FormSubmissionsByStatusProvider({
    required String form,
    SyncableEntityState? entityStatus,
    String sortBy = 'name',
  }) : this._internal(
          (ref) => formSubmissionsByStatus(
            ref as FormSubmissionsByStatusRef,
            form: form,
            entityStatus: entityStatus,
            sortBy: sortBy,
          ),
          from: formSubmissionsByStatusProvider,
          name: r'formSubmissionsByStatusProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$formSubmissionsByStatusHash,
          dependencies: FormSubmissionsByStatusFamily._dependencies,
          allTransitiveDependencies:
              FormSubmissionsByStatusFamily._allTransitiveDependencies,
          form: form,
          entityStatus: entityStatus,
          sortBy: sortBy,
        );

  FormSubmissionsByStatusProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.form,
    required this.entityStatus,
    required this.sortBy,
  }) : super.internal();

  final String form;
  final SyncableEntityState? entityStatus;
  final String sortBy;

  @override
  Override overrideWith(
    FutureOr<IList<DataFormSubmission>> Function(
            FormSubmissionsByStatusRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FormSubmissionsByStatusProvider._internal(
        (ref) => create(ref as FormSubmissionsByStatusRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        form: form,
        entityStatus: entityStatus,
        sortBy: sortBy,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<IList<DataFormSubmission>> createElement() {
    return _FormSubmissionsByStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FormSubmissionsByStatusProvider &&
        other.form == form &&
        other.entityStatus == entityStatus &&
        other.sortBy == sortBy;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, form.hashCode);
    hash = _SystemHash.combine(hash, entityStatus.hashCode);
    hash = _SystemHash.combine(hash, sortBy.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FormSubmissionsByStatusRef
    on AutoDisposeFutureProviderRef<IList<DataFormSubmission>> {
  /// The parameter `form` of this provider.
  String get form;

  /// The parameter `entityStatus` of this provider.
  SyncableEntityState? get entityStatus;

  /// The parameter `sortBy` of this provider.
  String get sortBy;
}

class _FormSubmissionsByStatusProviderElement
    extends AutoDisposeFutureProviderElement<IList<DataFormSubmission>>
    with FormSubmissionsByStatusRef {
  _FormSubmissionsByStatusProviderElement(super.provider);

  @override
  String get form => (origin as FormSubmissionsByStatusProvider).form;
  @override
  SyncableEntityState? get entityStatus =>
      (origin as FormSubmissionsByStatusProvider).entityStatus;
  @override
  String get sortBy => (origin as FormSubmissionsByStatusProvider).sortBy;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
