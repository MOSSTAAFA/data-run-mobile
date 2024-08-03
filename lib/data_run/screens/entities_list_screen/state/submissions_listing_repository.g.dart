// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submissions_listing_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$submissionsListingRepositoryHash() =>
    r'b6e227e7c53ce26ba5bf3ae0dcab2a536783e132';

/// See also [submissionsListingRepository].
@ProviderFor(submissionsListingRepository)
final submissionsListingRepositoryProvider =
    AutoDisposeProvider<SubmissionsListingRepository>.internal(
  submissionsListingRepository,
  name: r'submissionsListingRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$submissionsListingRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SubmissionsListingRepositoryRef
    = AutoDisposeProviderRef<SubmissionsListingRepository>;
String _$submissionsByStatusHash() =>
    r'02f6b74f53b6576ba8bbba70c3b66b1405871e4f';

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

/// See also [submissionsByStatus].
@ProviderFor(submissionsByStatus)
const submissionsByStatusProvider = SubmissionsByStatusFamily();

/// See also [submissionsByStatus].
class SubmissionsByStatusFamily
    extends Family<AsyncValue<IList<SyncableEntity>>> {
  /// See also [submissionsByStatus].
  const SubmissionsByStatusFamily();

  /// See also [submissionsByStatus].
  SubmissionsByStatusProvider call({
    required String formCode,
    SyncableEntityState? entityStatus,
    String sortBy = 'name',
  }) {
    return SubmissionsByStatusProvider(
      formCode: formCode,
      entityStatus: entityStatus,
      sortBy: sortBy,
    );
  }

  @override
  SubmissionsByStatusProvider getProviderOverride(
    covariant SubmissionsByStatusProvider provider,
  ) {
    return call(
      formCode: provider.formCode,
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
  String? get name => r'submissionsByStatusProvider';
}

/// See also [submissionsByStatus].
class SubmissionsByStatusProvider
    extends AutoDisposeFutureProvider<IList<SyncableEntity>> {
  /// See also [submissionsByStatus].
  SubmissionsByStatusProvider({
    required String formCode,
    SyncableEntityState? entityStatus,
    String sortBy = 'name',
  }) : this._internal(
          (ref) => submissionsByStatus(
            ref as SubmissionsByStatusRef,
            formCode: formCode,
            entityStatus: entityStatus,
            sortBy: sortBy,
          ),
          from: submissionsByStatusProvider,
          name: r'submissionsByStatusProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$submissionsByStatusHash,
          dependencies: SubmissionsByStatusFamily._dependencies,
          allTransitiveDependencies:
              SubmissionsByStatusFamily._allTransitiveDependencies,
          formCode: formCode,
          entityStatus: entityStatus,
          sortBy: sortBy,
        );

  SubmissionsByStatusProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.formCode,
    required this.entityStatus,
    required this.sortBy,
  }) : super.internal();

  final String formCode;
  final SyncableEntityState? entityStatus;
  final String sortBy;

  @override
  Override overrideWith(
    FutureOr<IList<SyncableEntity>> Function(SubmissionsByStatusRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SubmissionsByStatusProvider._internal(
        (ref) => create(ref as SubmissionsByStatusRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        formCode: formCode,
        entityStatus: entityStatus,
        sortBy: sortBy,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<IList<SyncableEntity>> createElement() {
    return _SubmissionsByStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SubmissionsByStatusProvider &&
        other.formCode == formCode &&
        other.entityStatus == entityStatus &&
        other.sortBy == sortBy;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, formCode.hashCode);
    hash = _SystemHash.combine(hash, entityStatus.hashCode);
    hash = _SystemHash.combine(hash, sortBy.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SubmissionsByStatusRef
    on AutoDisposeFutureProviderRef<IList<SyncableEntity>> {
  /// The parameter `formCode` of this provider.
  String get formCode;

  /// The parameter `entityStatus` of this provider.
  SyncableEntityState? get entityStatus;

  /// The parameter `sortBy` of this provider.
  String get sortBy;
}

class _SubmissionsByStatusProviderElement
    extends AutoDisposeFutureProviderElement<IList<SyncableEntity>>
    with SubmissionsByStatusRef {
  _SubmissionsByStatusProviderElement(super.provider);

  @override
  String get formCode => (origin as SubmissionsByStatusProvider).formCode;
  @override
  SyncableEntityState? get entityStatus =>
      (origin as SubmissionsByStatusProvider).entityStatus;
  @override
  String get sortBy => (origin as SubmissionsByStatusProvider).sortBy;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
