// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submission.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$submissionListRepositoryHash() =>
    r'575187dd8075f1404926c41c8cbf19bf1dbb46b6';

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

/// See also [submissionListRepository].
@ProviderFor(submissionListRepository)
const submissionListRepositoryProvider = SubmissionListRepositoryFamily();

/// See also [submissionListRepository].
class SubmissionListRepositoryFamily extends Family<SubmissionListRepository> {
  /// See also [submissionListRepository].
  const SubmissionListRepositoryFamily();

  /// See also [submissionListRepository].
  SubmissionListRepositoryProvider call(
    String form,
  ) {
    return SubmissionListRepositoryProvider(
      form,
    );
  }

  @override
  SubmissionListRepositoryProvider getProviderOverride(
    covariant SubmissionListRepositoryProvider provider,
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
  String? get name => r'submissionListRepositoryProvider';
}

/// See also [submissionListRepository].
class SubmissionListRepositoryProvider
    extends AutoDisposeProvider<SubmissionListRepository> {
  /// See also [submissionListRepository].
  SubmissionListRepositoryProvider(
    String form,
  ) : this._internal(
          (ref) => submissionListRepository(
            ref as SubmissionListRepositoryRef,
            form,
          ),
          from: submissionListRepositoryProvider,
          name: r'submissionListRepositoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$submissionListRepositoryHash,
          dependencies: SubmissionListRepositoryFamily._dependencies,
          allTransitiveDependencies:
              SubmissionListRepositoryFamily._allTransitiveDependencies,
          form: form,
        );

  SubmissionListRepositoryProvider._internal(
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
    SubmissionListRepository Function(SubmissionListRepositoryRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SubmissionListRepositoryProvider._internal(
        (ref) => create(ref as SubmissionListRepositoryRef),
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
  AutoDisposeProviderElement<SubmissionListRepository> createElement() {
    return _SubmissionListRepositoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SubmissionListRepositoryProvider && other.form == form;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, form.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SubmissionListRepositoryRef
    on AutoDisposeProviderRef<SubmissionListRepository> {
  /// The parameter `form` of this provider.
  String get form;
}

class _SubmissionListRepositoryProviderElement
    extends AutoDisposeProviderElement<SubmissionListRepository>
    with SubmissionListRepositoryRef {
  _SubmissionListRepositoryProviderElement(super.provider);

  @override
  String get form => (origin as SubmissionListRepositoryProvider).form;
}

String _$submissionStatusModelHash() =>
    r'94108f421a31925f7d3c834d27617e16a0074188';

/// See also [submissionStatusModel].
@ProviderFor(submissionStatusModel)
const submissionStatusModelProvider = SubmissionStatusModelFamily();

/// See also [submissionStatusModel].
class SubmissionStatusModelFamily
    extends Family<AsyncValue<SubmissionStatusModel>> {
  /// See also [submissionStatusModel].
  const SubmissionStatusModelFamily();

  /// See also [submissionStatusModel].
  SubmissionStatusModelProvider call({
    required String form,
  }) {
    return SubmissionStatusModelProvider(
      form: form,
    );
  }

  @override
  SubmissionStatusModelProvider getProviderOverride(
    covariant SubmissionStatusModelProvider provider,
  ) {
    return call(
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
  String? get name => r'submissionStatusModelProvider';
}

/// See also [submissionStatusModel].
class SubmissionStatusModelProvider
    extends AutoDisposeFutureProvider<SubmissionStatusModel> {
  /// See also [submissionStatusModel].
  SubmissionStatusModelProvider({
    required String form,
  }) : this._internal(
          (ref) => submissionStatusModel(
            ref as SubmissionStatusModelRef,
            form: form,
          ),
          from: submissionStatusModelProvider,
          name: r'submissionStatusModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$submissionStatusModelHash,
          dependencies: SubmissionStatusModelFamily._dependencies,
          allTransitiveDependencies:
              SubmissionStatusModelFamily._allTransitiveDependencies,
          form: form,
        );

  SubmissionStatusModelProvider._internal(
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
    FutureOr<SubmissionStatusModel> Function(SubmissionStatusModelRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SubmissionStatusModelProvider._internal(
        (ref) => create(ref as SubmissionStatusModelRef),
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
  AutoDisposeFutureProviderElement<SubmissionStatusModel> createElement() {
    return _SubmissionStatusModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SubmissionStatusModelProvider && other.form == form;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, form.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SubmissionStatusModelRef
    on AutoDisposeFutureProviderRef<SubmissionStatusModel> {
  /// The parameter `form` of this provider.
  String get form;
}

class _SubmissionStatusModelProviderElement
    extends AutoDisposeFutureProviderElement<SubmissionStatusModel>
    with SubmissionStatusModelRef {
  _SubmissionStatusModelProviderElement(super.provider);

  @override
  String get form => (origin as SubmissionStatusModelProvider).form;
}

String _$submissionItemSummaryModelHash() =>
    r'9274df0544afedc7af91b319634e83e2670d625f';

/// See also [submissionItemSummaryModel].
@ProviderFor(submissionItemSummaryModel)
const submissionItemSummaryModelProvider = SubmissionItemSummaryModelFamily();

/// See also [submissionItemSummaryModel].
class SubmissionItemSummaryModelFamily
    extends Family<AsyncValue<SubmissionItemSummaryModel>> {
  /// See also [submissionItemSummaryModel].
  const SubmissionItemSummaryModelFamily();

  /// See also [submissionItemSummaryModel].
  SubmissionItemSummaryModelProvider call({
    required String submissionUid,
    required String form,
  }) {
    return SubmissionItemSummaryModelProvider(
      submissionUid: submissionUid,
      form: form,
    );
  }

  @override
  SubmissionItemSummaryModelProvider getProviderOverride(
    covariant SubmissionItemSummaryModelProvider provider,
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
  String? get name => r'submissionItemSummaryModelProvider';
}

/// See also [submissionItemSummaryModel].
class SubmissionItemSummaryModelProvider
    extends AutoDisposeFutureProvider<SubmissionItemSummaryModel> {
  /// See also [submissionItemSummaryModel].
  SubmissionItemSummaryModelProvider({
    required String submissionUid,
    required String form,
  }) : this._internal(
          (ref) => submissionItemSummaryModel(
            ref as SubmissionItemSummaryModelRef,
            submissionUid: submissionUid,
            form: form,
          ),
          from: submissionItemSummaryModelProvider,
          name: r'submissionItemSummaryModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$submissionItemSummaryModelHash,
          dependencies: SubmissionItemSummaryModelFamily._dependencies,
          allTransitiveDependencies:
              SubmissionItemSummaryModelFamily._allTransitiveDependencies,
          submissionUid: submissionUid,
          form: form,
        );

  SubmissionItemSummaryModelProvider._internal(
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
    FutureOr<SubmissionItemSummaryModel> Function(
            SubmissionItemSummaryModelRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SubmissionItemSummaryModelProvider._internal(
        (ref) => create(ref as SubmissionItemSummaryModelRef),
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
  AutoDisposeFutureProviderElement<SubmissionItemSummaryModel> createElement() {
    return _SubmissionItemSummaryModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SubmissionItemSummaryModelProvider &&
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

mixin SubmissionItemSummaryModelRef
    on AutoDisposeFutureProviderRef<SubmissionItemSummaryModel> {
  /// The parameter `submissionUid` of this provider.
  String get submissionUid;

  /// The parameter `form` of this provider.
  String get form;
}

class _SubmissionItemSummaryModelProviderElement
    extends AutoDisposeFutureProviderElement<SubmissionItemSummaryModel>
    with SubmissionItemSummaryModelRef {
  _SubmissionItemSummaryModelProviderElement(super.provider);

  @override
  String get submissionUid =>
      (origin as SubmissionItemSummaryModelProvider).submissionUid;
  @override
  String get form => (origin as SubmissionItemSummaryModelProvider).form;
}

String _$submissionListHash() => r'a245e559bfb5c8c23c49ac8bb8b78d68f49f22c5';

abstract class _$SubmissionList
    extends BuildlessAutoDisposeAsyncNotifier<IList<DataFormSubmission>> {
  late final String form;
  late final SyncableEntityState? entityStatus;
  late final String sortBy;

  FutureOr<IList<DataFormSubmission>> build({
    required String form,
    SyncableEntityState? entityStatus,
    String sortBy = 'name',
  });
}

/// See also [SubmissionList].
@ProviderFor(SubmissionList)
const submissionListProvider = SubmissionListFamily();

/// See also [SubmissionList].
class SubmissionListFamily
    extends Family<AsyncValue<IList<DataFormSubmission>>> {
  /// See also [SubmissionList].
  const SubmissionListFamily();

  /// See also [SubmissionList].
  SubmissionListProvider call({
    required String form,
    SyncableEntityState? entityStatus,
    String sortBy = 'name',
  }) {
    return SubmissionListProvider(
      form: form,
      entityStatus: entityStatus,
      sortBy: sortBy,
    );
  }

  @override
  SubmissionListProvider getProviderOverride(
    covariant SubmissionListProvider provider,
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
  String? get name => r'submissionListProvider';
}

/// See also [SubmissionList].
class SubmissionListProvider extends AutoDisposeAsyncNotifierProviderImpl<
    SubmissionList, IList<DataFormSubmission>> {
  /// See also [SubmissionList].
  SubmissionListProvider({
    required String form,
    SyncableEntityState? entityStatus,
    String sortBy = 'name',
  }) : this._internal(
          () => SubmissionList()
            ..form = form
            ..entityStatus = entityStatus
            ..sortBy = sortBy,
          from: submissionListProvider,
          name: r'submissionListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$submissionListHash,
          dependencies: SubmissionListFamily._dependencies,
          allTransitiveDependencies:
              SubmissionListFamily._allTransitiveDependencies,
          form: form,
          entityStatus: entityStatus,
          sortBy: sortBy,
        );

  SubmissionListProvider._internal(
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
  FutureOr<IList<DataFormSubmission>> runNotifierBuild(
    covariant SubmissionList notifier,
  ) {
    return notifier.build(
      form: form,
      entityStatus: entityStatus,
      sortBy: sortBy,
    );
  }

  @override
  Override overrideWith(SubmissionList Function() create) {
    return ProviderOverride(
      origin: this,
      override: SubmissionListProvider._internal(
        () => create()
          ..form = form
          ..entityStatus = entityStatus
          ..sortBy = sortBy,
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
  AutoDisposeAsyncNotifierProviderElement<SubmissionList,
      IList<DataFormSubmission>> createElement() {
    return _SubmissionListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SubmissionListProvider &&
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

mixin SubmissionListRef
    on AutoDisposeAsyncNotifierProviderRef<IList<DataFormSubmission>> {
  /// The parameter `form` of this provider.
  String get form;

  /// The parameter `entityStatus` of this provider.
  SyncableEntityState? get entityStatus;

  /// The parameter `sortBy` of this provider.
  String get sortBy;
}

class _SubmissionListProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SubmissionList,
        IList<DataFormSubmission>> with SubmissionListRef {
  _SubmissionListProviderElement(super.provider);

  @override
  String get form => (origin as SubmissionListProvider).form;
  @override
  SyncableEntityState? get entityStatus =>
      (origin as SubmissionListProvider).entityStatus;
  @override
  String get sortBy => (origin as SubmissionListProvider).sortBy;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
