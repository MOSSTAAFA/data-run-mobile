// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submission_creation_model.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$submissionCreationModelHash() =>
    r'47f308896dada49ece27cf8a423d42135f4c3e18';

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

/// See also [submissionCreationModel].
@ProviderFor(submissionCreationModel)
const submissionCreationModelProvider = SubmissionCreationModelFamily();

/// See also [submissionCreationModel].
class SubmissionCreationModelFamily extends Family {
  /// See also [submissionCreationModel].
  const SubmissionCreationModelFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'submissionCreationModelProvider';

  /// See also [submissionCreationModel].
  SubmissionCreationModelProvider call({
    required FormMetadata formMetadata,
  }) {
    return SubmissionCreationModelProvider(
      formMetadata: formMetadata,
    );
  }

  @visibleForOverriding
  @override
  SubmissionCreationModelProvider getProviderOverride(
    covariant SubmissionCreationModelProvider provider,
  ) {
    return call(
      formMetadata: provider.formMetadata,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<SubmissionCreationModel> Function(SubmissionCreationModelRef ref)
          create) {
    return _$SubmissionCreationModelFamilyOverride(this, create);
  }
}

class _$SubmissionCreationModelFamilyOverride implements FamilyOverride {
  _$SubmissionCreationModelFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<SubmissionCreationModel> Function(
      SubmissionCreationModelRef ref) create;

  @override
  final SubmissionCreationModelFamily overriddenFamily;

  @override
  SubmissionCreationModelProvider getProviderOverride(
    covariant SubmissionCreationModelProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [submissionCreationModel].
class SubmissionCreationModelProvider
    extends AutoDisposeFutureProvider<SubmissionCreationModel> {
  /// See also [submissionCreationModel].
  SubmissionCreationModelProvider({
    required FormMetadata formMetadata,
  }) : this._internal(
          (ref) => submissionCreationModel(
            ref as SubmissionCreationModelRef,
            formMetadata: formMetadata,
          ),
          from: submissionCreationModelProvider,
          name: r'submissionCreationModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$submissionCreationModelHash,
          dependencies: SubmissionCreationModelFamily._dependencies,
          allTransitiveDependencies:
              SubmissionCreationModelFamily._allTransitiveDependencies,
          formMetadata: formMetadata,
        );

  SubmissionCreationModelProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.formMetadata,
  }) : super.internal();

  final FormMetadata formMetadata;

  @override
  Override overrideWith(
    FutureOr<SubmissionCreationModel> Function(SubmissionCreationModelRef ref)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SubmissionCreationModelProvider._internal(
        (ref) => create(ref as SubmissionCreationModelRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        formMetadata: formMetadata,
      ),
    );
  }

  @override
  ({
    FormMetadata formMetadata,
  }) get argument {
    return (formMetadata: formMetadata,);
  }

  @override
  AutoDisposeFutureProviderElement<SubmissionCreationModel> createElement() {
    return _SubmissionCreationModelProviderElement(this);
  }

  SubmissionCreationModelProvider _copyWith(
    FutureOr<SubmissionCreationModel> Function(SubmissionCreationModelRef ref)
        create,
  ) {
    return SubmissionCreationModelProvider._internal(
      (ref) => create(ref as SubmissionCreationModelRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      formMetadata: formMetadata,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SubmissionCreationModelProvider &&
        other.formMetadata == formMetadata;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, formMetadata.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SubmissionCreationModelRef
    on AutoDisposeFutureProviderRef<SubmissionCreationModel> {
  /// The parameter `formMetadata` of this provider.
  FormMetadata get formMetadata;
}

class _SubmissionCreationModelProviderElement
    extends AutoDisposeFutureProviderElement<SubmissionCreationModel>
    with SubmissionCreationModelRef {
  _SubmissionCreationModelProviderElement(super.provider);

  @override
  FormMetadata get formMetadata =>
      (origin as SubmissionCreationModelProvider).formMetadata;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
