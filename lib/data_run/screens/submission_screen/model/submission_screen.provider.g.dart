// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submission_screen.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$submissionEditStatusHash() =>
    r'8ab5adeb8c7f1d22f3ec1eba6d81a99eb28b457d';

/// See also [submissionEditStatus].
@ProviderFor(submissionEditStatus)
final submissionEditStatusProvider = AutoDisposeFutureProvider<bool>.internal(
  submissionEditStatus,
  name: r'submissionEditStatusProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$submissionEditStatusHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SubmissionEditStatusRef = AutoDisposeFutureProviderRef<bool>;
String _$submissionHash() => r'c955a56a0046fb93bdb221c1fd8081ee28e82aca';

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

abstract class _$Submission
    extends BuildlessAutoDisposeAsyncNotifier<DataFormSubmission> {
  late final String submissionId;

  FutureOr<DataFormSubmission> build({
    required String submissionId,
  });
}

/// See also [Submission].
@ProviderFor(Submission)
const submissionProvider = SubmissionFamily();

/// See also [Submission].
class SubmissionFamily extends Family<AsyncValue<DataFormSubmission>> {
  /// See also [Submission].
  const SubmissionFamily();

  /// See also [Submission].
  SubmissionProvider call({
    required String submissionId,
  }) {
    return SubmissionProvider(
      submissionId: submissionId,
    );
  }

  @override
  SubmissionProvider getProviderOverride(
    covariant SubmissionProvider provider,
  ) {
    return call(
      submissionId: provider.submissionId,
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
  String? get name => r'submissionProvider';
}

/// See also [Submission].
class SubmissionProvider extends AutoDisposeAsyncNotifierProviderImpl<
    Submission, DataFormSubmission> {
  /// See also [Submission].
  SubmissionProvider({
    required String submissionId,
  }) : this._internal(
          () => Submission()..submissionId = submissionId,
          from: submissionProvider,
          name: r'submissionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$submissionHash,
          dependencies: SubmissionFamily._dependencies,
          allTransitiveDependencies:
              SubmissionFamily._allTransitiveDependencies,
          submissionId: submissionId,
        );

  SubmissionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.submissionId,
  }) : super.internal();

  final String submissionId;

  @override
  FutureOr<DataFormSubmission> runNotifierBuild(
    covariant Submission notifier,
  ) {
    return notifier.build(
      submissionId: submissionId,
    );
  }

  @override
  Override overrideWith(Submission Function() create) {
    return ProviderOverride(
      origin: this,
      override: SubmissionProvider._internal(
        () => create()..submissionId = submissionId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        submissionId: submissionId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<Submission, DataFormSubmission>
      createElement() {
    return _SubmissionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SubmissionProvider && other.submissionId == submissionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, submissionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SubmissionRef on AutoDisposeAsyncNotifierProviderRef<DataFormSubmission> {
  /// The parameter `submissionId` of this provider.
  String get submissionId;
}

class _SubmissionProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<Submission,
        DataFormSubmission> with SubmissionRef {
  _SubmissionProviderElement(super.provider);

  @override
  String get submissionId => (origin as SubmissionProvider).submissionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
