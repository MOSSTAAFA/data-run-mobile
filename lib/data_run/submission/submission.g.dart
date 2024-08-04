// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submission.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$submissionInitialRepositoryHash() =>
    r'ebc197defc231e5b382495cba71740003fc9e297';

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

/// See also [submissionInitialRepository].
@ProviderFor(submissionInitialRepository)
const submissionInitialRepositoryProvider = SubmissionInitialRepositoryFamily();

/// See also [submissionInitialRepository].
class SubmissionInitialRepositoryFamily
    extends Family<SubmissionInitialRepository> {
  /// See also [submissionInitialRepository].
  const SubmissionInitialRepositoryFamily();

  /// See also [submissionInitialRepository].
  SubmissionInitialRepositoryProvider call({
    required FormConfiguration formConfiguration,
  }) {
    return SubmissionInitialRepositoryProvider(
      formConfiguration: formConfiguration,
    );
  }

  @override
  SubmissionInitialRepositoryProvider getProviderOverride(
    covariant SubmissionInitialRepositoryProvider provider,
  ) {
    return call(
      formConfiguration: provider.formConfiguration,
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
  String? get name => r'submissionInitialRepositoryProvider';
}

/// See also [submissionInitialRepository].
class SubmissionInitialRepositoryProvider
    extends AutoDisposeProvider<SubmissionInitialRepository> {
  /// See also [submissionInitialRepository].
  SubmissionInitialRepositoryProvider({
    required FormConfiguration formConfiguration,
  }) : this._internal(
          (ref) => submissionInitialRepository(
            ref as SubmissionInitialRepositoryRef,
            formConfiguration: formConfiguration,
          ),
          from: submissionInitialRepositoryProvider,
          name: r'submissionInitialRepositoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$submissionInitialRepositoryHash,
          dependencies: SubmissionInitialRepositoryFamily._dependencies,
          allTransitiveDependencies:
              SubmissionInitialRepositoryFamily._allTransitiveDependencies,
          formConfiguration: formConfiguration,
        );

  SubmissionInitialRepositoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.formConfiguration,
  }) : super.internal();

  final FormConfiguration formConfiguration;

  @override
  Override overrideWith(
    SubmissionInitialRepository Function(
            SubmissionInitialRepositoryRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SubmissionInitialRepositoryProvider._internal(
        (ref) => create(ref as SubmissionInitialRepositoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        formConfiguration: formConfiguration,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<SubmissionInitialRepository> createElement() {
    return _SubmissionInitialRepositoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SubmissionInitialRepositoryProvider &&
        other.formConfiguration == formConfiguration;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, formConfiguration.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SubmissionInitialRepositoryRef
    on AutoDisposeProviderRef<SubmissionInitialRepository> {
  /// The parameter `formConfiguration` of this provider.
  FormConfiguration get formConfiguration;
}

class _SubmissionInitialRepositoryProviderElement
    extends AutoDisposeProviderElement<SubmissionInitialRepository>
    with SubmissionInitialRepositoryRef {
  _SubmissionInitialRepositoryProviderElement(super.provider);

  @override
  FormConfiguration get formConfiguration =>
      (origin as SubmissionInitialRepositoryProvider).formConfiguration;
}

String _$submissionMappingRepositoryHash() =>
    r'87d5da857bdb87e9c4bd675bb52b9b776ca31208';

/// Depends on Bundle from the route
///
///
/// Copied from [submissionMappingRepository].
@ProviderFor(submissionMappingRepository)
const submissionMappingRepositoryProvider = SubmissionMappingRepositoryFamily();

/// Depends on Bundle from the route
///
///
/// Copied from [submissionMappingRepository].
class SubmissionMappingRepositoryFamily
    extends Family<SubmissionMappingRepository> {
  /// Depends on Bundle from the route
  ///
  ///
  /// Copied from [submissionMappingRepository].
  const SubmissionMappingRepositoryFamily();

  /// Depends on Bundle from the route
  ///
  ///
  /// Copied from [submissionMappingRepository].
  SubmissionMappingRepositoryProvider call({
    required FormConfiguration formConfiguration,
    required String submissionUid,
  }) {
    return SubmissionMappingRepositoryProvider(
      formConfiguration: formConfiguration,
      submissionUid: submissionUid,
    );
  }

  @override
  SubmissionMappingRepositoryProvider getProviderOverride(
    covariant SubmissionMappingRepositoryProvider provider,
  ) {
    return call(
      formConfiguration: provider.formConfiguration,
      submissionUid: provider.submissionUid,
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
  String? get name => r'submissionMappingRepositoryProvider';
}

/// Depends on Bundle from the route
///
///
/// Copied from [submissionMappingRepository].
class SubmissionMappingRepositoryProvider
    extends AutoDisposeProvider<SubmissionMappingRepository> {
  /// Depends on Bundle from the route
  ///
  ///
  /// Copied from [submissionMappingRepository].
  SubmissionMappingRepositoryProvider({
    required FormConfiguration formConfiguration,
    required String submissionUid,
  }) : this._internal(
          (ref) => submissionMappingRepository(
            ref as SubmissionMappingRepositoryRef,
            formConfiguration: formConfiguration,
            submissionUid: submissionUid,
          ),
          from: submissionMappingRepositoryProvider,
          name: r'submissionMappingRepositoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$submissionMappingRepositoryHash,
          dependencies: SubmissionMappingRepositoryFamily._dependencies,
          allTransitiveDependencies:
              SubmissionMappingRepositoryFamily._allTransitiveDependencies,
          formConfiguration: formConfiguration,
          submissionUid: submissionUid,
        );

  SubmissionMappingRepositoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.formConfiguration,
    required this.submissionUid,
  }) : super.internal();

  final FormConfiguration formConfiguration;
  final String submissionUid;

  @override
  Override overrideWith(
    SubmissionMappingRepository Function(
            SubmissionMappingRepositoryRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SubmissionMappingRepositoryProvider._internal(
        (ref) => create(ref as SubmissionMappingRepositoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        formConfiguration: formConfiguration,
        submissionUid: submissionUid,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<SubmissionMappingRepository> createElement() {
    return _SubmissionMappingRepositoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SubmissionMappingRepositoryProvider &&
        other.formConfiguration == formConfiguration &&
        other.submissionUid == submissionUid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, formConfiguration.hashCode);
    hash = _SystemHash.combine(hash, submissionUid.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SubmissionMappingRepositoryRef
    on AutoDisposeProviderRef<SubmissionMappingRepository> {
  /// The parameter `formConfiguration` of this provider.
  FormConfiguration get formConfiguration;

  /// The parameter `submissionUid` of this provider.
  String get submissionUid;
}

class _SubmissionMappingRepositoryProviderElement
    extends AutoDisposeProviderElement<SubmissionMappingRepository>
    with SubmissionMappingRepositoryRef {
  _SubmissionMappingRepositoryProviderElement(super.provider);

  @override
  FormConfiguration get formConfiguration =>
      (origin as SubmissionMappingRepositoryProvider).formConfiguration;
  @override
  String get submissionUid =>
      (origin as SubmissionMappingRepositoryProvider).submissionUid;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
