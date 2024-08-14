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

String _$submissionSummaryHash() => r'050d6a4ef90973486da7a3e545e7481691d0fb5e';

/// See also [submissionSummary].
@ProviderFor(submissionSummary)
const submissionSummaryProvider = SubmissionSummaryFamily();

/// See also [submissionSummary].
class SubmissionSummaryFamily extends Family<AsyncValue<SubmissionSummary>> {
  /// See also [submissionSummary].
  const SubmissionSummaryFamily();

  /// See also [submissionSummary].
  SubmissionSummaryProvider call({
    required String submissionUid,
    required String form,
  }) {
    return SubmissionSummaryProvider(
      submissionUid: submissionUid,
      form: form,
    );
  }

  @override
  SubmissionSummaryProvider getProviderOverride(
    covariant SubmissionSummaryProvider provider,
  ) {
    return call(
      submissionUid: provider.submissionUid,
      form: provider.form,
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
  String? get name => r'submissionSummaryProvider';
}

/// See also [submissionSummary].
class SubmissionSummaryProvider
    extends AutoDisposeFutureProvider<SubmissionSummary> {
  /// See also [submissionSummary].
  SubmissionSummaryProvider({
    required String submissionUid,
    required String form,
  }) : this._internal(
          (ref) => submissionSummary(
            ref as SubmissionSummaryRef,
            submissionUid: submissionUid,
            form: form,
          ),
          from: submissionSummaryProvider,
          name: r'submissionSummaryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$submissionSummaryHash,
          dependencies: SubmissionSummaryFamily._dependencies,
          allTransitiveDependencies:
              SubmissionSummaryFamily._allTransitiveDependencies,
          submissionUid: submissionUid,
          form: form,
        );

  SubmissionSummaryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.submissionUid,
    required this.form,
  }) : super.internal();

  final String submissionUid;
  final String form;

  @override
  Override overrideWith(
    FutureOr<SubmissionSummary> Function(SubmissionSummaryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SubmissionSummaryProvider._internal(
        (ref) => create(ref as SubmissionSummaryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        submissionUid: submissionUid,
        form: form,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<SubmissionSummary> createElement() {
    return _SubmissionSummaryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SubmissionSummaryProvider &&
        other.submissionUid == submissionUid &&
        other.form == form;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, submissionUid.hashCode);
    hash = _SystemHash.combine(hash, form.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SubmissionSummaryRef on AutoDisposeFutureProviderRef<SubmissionSummary> {
  /// The parameter `submissionUid` of this provider.
  String get submissionUid;

  /// The parameter `form` of this provider.
  String get form;
}

class _SubmissionSummaryProviderElement
    extends AutoDisposeFutureProviderElement<SubmissionSummary>
    with SubmissionSummaryRef {
  _SubmissionSummaryProviderElement(super.provider);

  @override
  String get submissionUid =>
      (origin as SubmissionSummaryProvider).submissionUid;
  @override
  String get form => (origin as SubmissionSummaryProvider).form;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
