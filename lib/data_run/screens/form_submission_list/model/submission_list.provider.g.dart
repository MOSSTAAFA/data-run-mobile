// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submission_list.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$submissionMappingRepositoryHash() =>
    r'24cf3fb29ae7ea84fe4cffc912b109aafc5d06cc';

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

/// See also [submissionMappingRepository].
@ProviderFor(submissionMappingRepository)
const submissionMappingRepositoryProvider = SubmissionMappingRepositoryFamily();

/// See also [submissionMappingRepository].
class SubmissionMappingRepositoryFamily extends Family {
  /// See also [submissionMappingRepository].
  const SubmissionMappingRepositoryFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'submissionMappingRepositoryProvider';

  /// See also [submissionMappingRepository].
  SubmissionMappingRepositoryProvider call({
    required FormConfiguration formConfiguration,
    required String submissionUid,
  }) {
    return SubmissionMappingRepositoryProvider(
      formConfiguration: formConfiguration,
      submissionUid: submissionUid,
    );
  }

  @visibleForOverriding
  @override
  SubmissionMappingRepositoryProvider getProviderOverride(
    covariant SubmissionMappingRepositoryProvider provider,
  ) {
    return call(
      formConfiguration: provider.formConfiguration,
      submissionUid: provider.submissionUid,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      SubmissionMappingRepository Function(SubmissionMappingRepositoryRef ref)
          create) {
    return _$SubmissionMappingRepositoryFamilyOverride(this, create);
  }
}

class _$SubmissionMappingRepositoryFamilyOverride implements FamilyOverride {
  _$SubmissionMappingRepositoryFamilyOverride(
      this.overriddenFamily, this.create);

  final SubmissionMappingRepository Function(SubmissionMappingRepositoryRef ref)
      create;

  @override
  final SubmissionMappingRepositoryFamily overriddenFamily;

  @override
  SubmissionMappingRepositoryProvider getProviderOverride(
    covariant SubmissionMappingRepositoryProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [submissionMappingRepository].
class SubmissionMappingRepositoryProvider
    extends AutoDisposeProvider<SubmissionMappingRepository> {
  /// See also [submissionMappingRepository].
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
    super.create, {
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
    SubmissionMappingRepository Function(SubmissionMappingRepositoryRef ref)
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
  ({
    FormConfiguration formConfiguration,
    String submissionUid,
  }) get argument {
    return (
      formConfiguration: formConfiguration,
      submissionUid: submissionUid,
    );
  }

  @override
  AutoDisposeProviderElement<SubmissionMappingRepository> createElement() {
    return _SubmissionMappingRepositoryProviderElement(this);
  }

  SubmissionMappingRepositoryProvider _copyWith(
    SubmissionMappingRepository Function(SubmissionMappingRepositoryRef ref)
        create,
  ) {
    return SubmissionMappingRepositoryProvider._internal(
      (ref) => create(ref as SubmissionMappingRepositoryRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      formConfiguration: formConfiguration,
      submissionUid: submissionUid,
    );
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

String _$submissionFilteredByStateHash() =>
    r'8babdca9160839049f42f4e7ab630def623629b8';

/// See also [submissionFilteredByState].
@ProviderFor(submissionFilteredByState)
const submissionFilteredByStateProvider = SubmissionFilteredByStateFamily();

/// See also [submissionFilteredByState].
class SubmissionFilteredByStateFamily extends Family {
  /// See also [submissionFilteredByState].
  const SubmissionFilteredByStateFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'submissionFilteredByStateProvider';

  /// See also [submissionFilteredByState].
  SubmissionFilteredByStateProvider call({
    required String form,
    SyncStatus? status,
    String sortBy = 'name',
  }) {
    return SubmissionFilteredByStateProvider(
      form: form,
      status: status,
      sortBy: sortBy,
    );
  }

  @visibleForOverriding
  @override
  SubmissionFilteredByStateProvider getProviderOverride(
    covariant SubmissionFilteredByStateProvider provider,
  ) {
    return call(
      form: provider.form,
      status: provider.status,
      sortBy: provider.sortBy,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<List<DataFormSubmission>> Function(
              SubmissionFilteredByStateRef ref)
          create) {
    return _$SubmissionFilteredByStateFamilyOverride(this, create);
  }
}

class _$SubmissionFilteredByStateFamilyOverride implements FamilyOverride {
  _$SubmissionFilteredByStateFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<List<DataFormSubmission>> Function(
      SubmissionFilteredByStateRef ref) create;

  @override
  final SubmissionFilteredByStateFamily overriddenFamily;

  @override
  SubmissionFilteredByStateProvider getProviderOverride(
    covariant SubmissionFilteredByStateProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [submissionFilteredByState].
class SubmissionFilteredByStateProvider
    extends AutoDisposeFutureProvider<List<DataFormSubmission>> {
  /// See also [submissionFilteredByState].
  SubmissionFilteredByStateProvider({
    required String form,
    SyncStatus? status,
    String sortBy = 'name',
  }) : this._internal(
          (ref) => submissionFilteredByState(
            ref as SubmissionFilteredByStateRef,
            form: form,
            status: status,
            sortBy: sortBy,
          ),
          from: submissionFilteredByStateProvider,
          name: r'submissionFilteredByStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$submissionFilteredByStateHash,
          dependencies: SubmissionFilteredByStateFamily._dependencies,
          allTransitiveDependencies:
              SubmissionFilteredByStateFamily._allTransitiveDependencies,
          form: form,
          status: status,
          sortBy: sortBy,
        );

  SubmissionFilteredByStateProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.form,
    required this.status,
    required this.sortBy,
  }) : super.internal();

  final String form;
  final SyncStatus? status;
  final String sortBy;

  @override
  Override overrideWith(
    FutureOr<List<DataFormSubmission>> Function(
            SubmissionFilteredByStateRef ref)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SubmissionFilteredByStateProvider._internal(
        (ref) => create(ref as SubmissionFilteredByStateRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        form: form,
        status: status,
        sortBy: sortBy,
      ),
    );
  }

  @override
  ({
    String form,
    SyncStatus? status,
    String sortBy,
  }) get argument {
    return (
      form: form,
      status: status,
      sortBy: sortBy,
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<DataFormSubmission>> createElement() {
    return _SubmissionFilteredByStateProviderElement(this);
  }

  SubmissionFilteredByStateProvider _copyWith(
    FutureOr<List<DataFormSubmission>> Function(
            SubmissionFilteredByStateRef ref)
        create,
  ) {
    return SubmissionFilteredByStateProvider._internal(
      (ref) => create(ref as SubmissionFilteredByStateRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      form: form,
      status: status,
      sortBy: sortBy,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SubmissionFilteredByStateProvider &&
        other.form == form &&
        other.status == status &&
        other.sortBy == sortBy;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, form.hashCode);
    hash = _SystemHash.combine(hash, status.hashCode);
    hash = _SystemHash.combine(hash, sortBy.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SubmissionFilteredByStateRef
    on AutoDisposeFutureProviderRef<List<DataFormSubmission>> {
  /// The parameter `form` of this provider.
  String get form;

  /// The parameter `status` of this provider.
  SyncStatus? get status;

  /// The parameter `sortBy` of this provider.
  String get sortBy;
}

class _SubmissionFilteredByStateProviderElement
    extends AutoDisposeFutureProviderElement<List<DataFormSubmission>>
    with SubmissionFilteredByStateRef {
  _SubmissionFilteredByStateProviderElement(super.provider);

  @override
  String get form => (origin as SubmissionFilteredByStateProvider).form;
  @override
  SyncStatus? get status =>
      (origin as SubmissionFilteredByStateProvider).status;
  @override
  String get sortBy => (origin as SubmissionFilteredByStateProvider).sortBy;
}

String _$submissionStatusModelHash() =>
    r'b30e32673c15ba14ed1b946f207367e251f60155';

/// See also [submissionStatusModel].
@ProviderFor(submissionStatusModel)
const submissionStatusModelProvider = SubmissionStatusModelFamily();

/// See also [submissionStatusModel].
class SubmissionStatusModelFamily extends Family {
  /// See also [submissionStatusModel].
  const SubmissionStatusModelFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'submissionStatusModelProvider';

  /// See also [submissionStatusModel].
  SubmissionStatusModelProvider call({
    required String form,
  }) {
    return SubmissionStatusModelProvider(
      form: form,
    );
  }

  @visibleForOverriding
  @override
  SubmissionStatusModelProvider getProviderOverride(
    covariant SubmissionStatusModelProvider provider,
  ) {
    return call(
      form: provider.form,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<SubmissionStatusModel> Function(SubmissionStatusModelRef ref)
          create) {
    return _$SubmissionStatusModelFamilyOverride(this, create);
  }
}

class _$SubmissionStatusModelFamilyOverride implements FamilyOverride {
  _$SubmissionStatusModelFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<SubmissionStatusModel> Function(SubmissionStatusModelRef ref)
      create;

  @override
  final SubmissionStatusModelFamily overriddenFamily;

  @override
  SubmissionStatusModelProvider getProviderOverride(
    covariant SubmissionStatusModelProvider provider,
  ) {
    return provider._copyWith(create);
  }
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
    super.create, {
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
    FutureOr<SubmissionStatusModel> Function(SubmissionStatusModelRef ref)
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
  ({
    String form,
  }) get argument {
    return (form: form,);
  }

  @override
  AutoDisposeFutureProviderElement<SubmissionStatusModel> createElement() {
    return _SubmissionStatusModelProviderElement(this);
  }

  SubmissionStatusModelProvider _copyWith(
    FutureOr<SubmissionStatusModel> Function(SubmissionStatusModelRef ref)
        create,
  ) {
    return SubmissionStatusModelProvider._internal(
      (ref) => create(ref as SubmissionStatusModelRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      form: form,
    );
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
    r'1a011f4ca53e01408881358a396f6da9d8be5aaa';

/// See also [submissionItemSummaryModel].
@ProviderFor(submissionItemSummaryModel)
const submissionItemSummaryModelProvider = SubmissionItemSummaryModelFamily();

/// See also [submissionItemSummaryModel].
class SubmissionItemSummaryModelFamily extends Family {
  /// See also [submissionItemSummaryModel].
  const SubmissionItemSummaryModelFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'submissionItemSummaryModelProvider';

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

  @visibleForOverriding
  @override
  SubmissionItemSummaryModelProvider getProviderOverride(
    covariant SubmissionItemSummaryModelProvider provider,
  ) {
    return call(
      submissionUid: provider.submissionUid,
      form: provider.form,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<SubmissionItemSummaryModel> Function(
              SubmissionItemSummaryModelRef ref)
          create) {
    return _$SubmissionItemSummaryModelFamilyOverride(this, create);
  }
}

class _$SubmissionItemSummaryModelFamilyOverride implements FamilyOverride {
  _$SubmissionItemSummaryModelFamilyOverride(
      this.overriddenFamily, this.create);

  final FutureOr<SubmissionItemSummaryModel> Function(
      SubmissionItemSummaryModelRef ref) create;

  @override
  final SubmissionItemSummaryModelFamily overriddenFamily;

  @override
  SubmissionItemSummaryModelProvider getProviderOverride(
    covariant SubmissionItemSummaryModelProvider provider,
  ) {
    return provider._copyWith(create);
  }
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
    super.create, {
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
            SubmissionItemSummaryModelRef ref)
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
  ({
    String submissionUid,
    String form,
  }) get argument {
    return (
      submissionUid: submissionUid,
      form: form,
    );
  }

  @override
  AutoDisposeFutureProviderElement<SubmissionItemSummaryModel> createElement() {
    return _SubmissionItemSummaryModelProviderElement(this);
  }

  SubmissionItemSummaryModelProvider _copyWith(
    FutureOr<SubmissionItemSummaryModel> Function(
            SubmissionItemSummaryModelRef ref)
        create,
  ) {
    return SubmissionItemSummaryModelProvider._internal(
      (ref) => create(ref as SubmissionItemSummaryModelRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      submissionUid: submissionUid,
      form: form,
    );
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

String _$selectedStatusHash() => r'9bd7335246209a7e86bf8ff40ebaea3690d3b5db';

/// See also [SelectedStatus].
@ProviderFor(SelectedStatus)
final selectedStatusProvider =
    AutoDisposeNotifierProvider<SelectedStatus, SyncStatus?>.internal(
  SelectedStatus.new,
  name: r'selectedStatusProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedStatusHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedStatus = AutoDisposeNotifier<SyncStatus?>;
String _$formSubmissionListHash() =>
    r'fcdb664b54775cafd3e123d2dd30e98388600f61';

abstract class _$FormSubmissionList
    extends BuildlessAutoDisposeAsyncNotifier<IList<DataFormSubmission>> {
  late final String form;

  FutureOr<IList<DataFormSubmission>> build({
    required String form,
  });
}

/// See also [FormSubmissionList].
@ProviderFor(FormSubmissionList)
const formSubmissionListProvider = FormSubmissionListFamily();

/// See also [FormSubmissionList].
class FormSubmissionListFamily extends Family {
  /// See also [FormSubmissionList].
  const FormSubmissionListFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'formSubmissionListProvider';

  /// See also [FormSubmissionList].
  FormSubmissionListProvider call({
    required String form,
  }) {
    return FormSubmissionListProvider(
      form: form,
    );
  }

  @visibleForOverriding
  @override
  FormSubmissionListProvider getProviderOverride(
    covariant FormSubmissionListProvider provider,
  ) {
    return call(
      form: provider.form,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(FormSubmissionList Function() create) {
    return _$FormSubmissionListFamilyOverride(this, create);
  }
}

class _$FormSubmissionListFamilyOverride implements FamilyOverride {
  _$FormSubmissionListFamilyOverride(this.overriddenFamily, this.create);

  final FormSubmissionList Function() create;

  @override
  final FormSubmissionListFamily overriddenFamily;

  @override
  FormSubmissionListProvider getProviderOverride(
    covariant FormSubmissionListProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [FormSubmissionList].
class FormSubmissionListProvider extends AutoDisposeAsyncNotifierProviderImpl<
    FormSubmissionList, IList<DataFormSubmission>> {
  /// See also [FormSubmissionList].
  FormSubmissionListProvider({
    required String form,
  }) : this._internal(
          () => FormSubmissionList()..form = form,
          from: formSubmissionListProvider,
          name: r'formSubmissionListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$formSubmissionListHash,
          dependencies: FormSubmissionListFamily._dependencies,
          allTransitiveDependencies:
              FormSubmissionListFamily._allTransitiveDependencies,
          form: form,
        );

  FormSubmissionListProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.form,
  }) : super.internal();

  final String form;

  @override
  FutureOr<IList<DataFormSubmission>> runNotifierBuild(
    covariant FormSubmissionList notifier,
  ) {
    return notifier.build(
      form: form,
    );
  }

  @override
  Override overrideWith(FormSubmissionList Function() create) {
    return ProviderOverride(
      origin: this,
      override: FormSubmissionListProvider._internal(
        () => create()..form = form,
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
  ({
    String form,
  }) get argument {
    return (form: form,);
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<FormSubmissionList,
      IList<DataFormSubmission>> createElement() {
    return _FormSubmissionListProviderElement(this);
  }

  FormSubmissionListProvider _copyWith(
    FormSubmissionList Function() create,
  ) {
    return FormSubmissionListProvider._internal(
      () => create()..form = form,
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      form: form,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FormSubmissionListProvider && other.form == form;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, form.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FormSubmissionListRef
    on AutoDisposeAsyncNotifierProviderRef<IList<DataFormSubmission>> {
  /// The parameter `form` of this provider.
  String get form;
}

class _FormSubmissionListProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<FormSubmissionList,
        IList<DataFormSubmission>> with FormSubmissionListRef {
  _FormSubmissionListProviderElement(super.provider);

  @override
  String get form => (origin as FormSubmissionListProvider).form;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
