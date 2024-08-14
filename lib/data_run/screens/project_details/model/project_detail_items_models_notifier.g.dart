// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_detail_items_models_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userAssignedTeamsHash() => r'bd82782bbc44c5b03a7ee39e598720bad40188f7';

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

/// See also [userAssignedTeams].
@ProviderFor(userAssignedTeams)
const userAssignedTeamsProvider = UserAssignedTeamsFamily();

/// See also [userAssignedTeams].
class UserAssignedTeamsFamily extends Family<AsyncValue<IList<DTeam>>> {
  /// See also [userAssignedTeams].
  const UserAssignedTeamsFamily();

  /// See also [userAssignedTeams].
  UserAssignedTeamsProvider call({
    ActiveStatus activeStatus = ActiveStatus.EnabledOnly,
    String? activity,
  }) {
    return UserAssignedTeamsProvider(
      activeStatus: activeStatus,
      activity: activity,
    );
  }

  @override
  UserAssignedTeamsProvider getProviderOverride(
    covariant UserAssignedTeamsProvider provider,
  ) {
    return call(
      activeStatus: provider.activeStatus,
      activity: provider.activity,
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
  String? get name => r'userAssignedTeamsProvider';
}

/// See also [userAssignedTeams].
class UserAssignedTeamsProvider
    extends AutoDisposeFutureProvider<IList<DTeam>> {
  /// See also [userAssignedTeams].
  UserAssignedTeamsProvider({
    ActiveStatus activeStatus = ActiveStatus.EnabledOnly,
    String? activity,
  }) : this._internal(
          (ref) => userAssignedTeams(
            ref as UserAssignedTeamsRef,
            activeStatus: activeStatus,
            activity: activity,
          ),
          from: userAssignedTeamsProvider,
          name: r'userAssignedTeamsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userAssignedTeamsHash,
          dependencies: UserAssignedTeamsFamily._dependencies,
          allTransitiveDependencies:
              UserAssignedTeamsFamily._allTransitiveDependencies,
          activeStatus: activeStatus,
          activity: activity,
        );

  UserAssignedTeamsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.activeStatus,
    required this.activity,
  }) : super.internal();

  final ActiveStatus activeStatus;
  final String? activity;

  @override
  Override overrideWith(
    FutureOr<IList<DTeam>> Function(UserAssignedTeamsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserAssignedTeamsProvider._internal(
        (ref) => create(ref as UserAssignedTeamsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        activeStatus: activeStatus,
        activity: activity,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<IList<DTeam>> createElement() {
    return _UserAssignedTeamsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserAssignedTeamsProvider &&
        other.activeStatus == activeStatus &&
        other.activity == activity;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, activeStatus.hashCode);
    hash = _SystemHash.combine(hash, activity.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UserAssignedTeamsRef on AutoDisposeFutureProviderRef<IList<DTeam>> {
  /// The parameter `activeStatus` of this provider.
  ActiveStatus get activeStatus;

  /// The parameter `activity` of this provider.
  String? get activity;
}

class _UserAssignedTeamsProviderElement
    extends AutoDisposeFutureProviderElement<IList<DTeam>>
    with UserAssignedTeamsRef {
  _UserAssignedTeamsProviderElement(super.provider);

  @override
  ActiveStatus get activeStatus =>
      (origin as UserAssignedTeamsProvider).activeStatus;
  @override
  String? get activity => (origin as UserAssignedTeamsProvider).activity;
}

String _$userAssignedActivitiesHash() =>
    r'0f383103aaa57efd9961cc3e0c0c98d6c7c3c624';

/// See also [userAssignedActivities].
@ProviderFor(userAssignedActivities)
const userAssignedActivitiesProvider = UserAssignedActivitiesFamily();

/// See also [userAssignedActivities].
class UserAssignedActivitiesFamily
    extends Family<AsyncValue<IList<DActivity>>> {
  /// See also [userAssignedActivities].
  const UserAssignedActivitiesFamily();

  /// See also [userAssignedActivities].
  UserAssignedActivitiesProvider call({
    ActiveStatus activeStatus = ActiveStatus.EnabledOnly,
    String? project,
  }) {
    return UserAssignedActivitiesProvider(
      activeStatus: activeStatus,
      project: project,
    );
  }

  @override
  UserAssignedActivitiesProvider getProviderOverride(
    covariant UserAssignedActivitiesProvider provider,
  ) {
    return call(
      activeStatus: provider.activeStatus,
      project: provider.project,
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
  String? get name => r'userAssignedActivitiesProvider';
}

/// See also [userAssignedActivities].
class UserAssignedActivitiesProvider
    extends AutoDisposeFutureProvider<IList<DActivity>> {
  /// See also [userAssignedActivities].
  UserAssignedActivitiesProvider({
    ActiveStatus activeStatus = ActiveStatus.EnabledOnly,
    String? project,
  }) : this._internal(
          (ref) => userAssignedActivities(
            ref as UserAssignedActivitiesRef,
            activeStatus: activeStatus,
            project: project,
          ),
          from: userAssignedActivitiesProvider,
          name: r'userAssignedActivitiesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userAssignedActivitiesHash,
          dependencies: UserAssignedActivitiesFamily._dependencies,
          allTransitiveDependencies:
              UserAssignedActivitiesFamily._allTransitiveDependencies,
          activeStatus: activeStatus,
          project: project,
        );

  UserAssignedActivitiesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.activeStatus,
    required this.project,
  }) : super.internal();

  final ActiveStatus activeStatus;
  final String? project;

  @override
  Override overrideWith(
    FutureOr<IList<DActivity>> Function(UserAssignedActivitiesRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserAssignedActivitiesProvider._internal(
        (ref) => create(ref as UserAssignedActivitiesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        activeStatus: activeStatus,
        project: project,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<IList<DActivity>> createElement() {
    return _UserAssignedActivitiesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserAssignedActivitiesProvider &&
        other.activeStatus == activeStatus &&
        other.project == project;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, activeStatus.hashCode);
    hash = _SystemHash.combine(hash, project.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UserAssignedActivitiesRef
    on AutoDisposeFutureProviderRef<IList<DActivity>> {
  /// The parameter `activeStatus` of this provider.
  ActiveStatus get activeStatus;

  /// The parameter `project` of this provider.
  String? get project;
}

class _UserAssignedActivitiesProviderElement
    extends AutoDisposeFutureProviderElement<IList<DActivity>>
    with UserAssignedActivitiesRef {
  _UserAssignedActivitiesProviderElement(super.provider);

  @override
  ActiveStatus get activeStatus =>
      (origin as UserAssignedActivitiesProvider).activeStatus;
  @override
  String? get project => (origin as UserAssignedActivitiesProvider).project;
}

String _$activityFormsDefinitionsHash() =>
    r'e2bf38297a25c13e15c05ef49f020e7f5a5ad675';

/// See also [activityFormsDefinitions].
@ProviderFor(activityFormsDefinitions)
const activityFormsDefinitionsProvider = ActivityFormsDefinitionsFamily();

/// See also [activityFormsDefinitions].
class ActivityFormsDefinitionsFamily
    extends Family<AsyncValue<List<FormDefinition?>>> {
  /// See also [activityFormsDefinitions].
  const ActivityFormsDefinitionsFamily();

  /// See also [activityFormsDefinitions].
  ActivityFormsDefinitionsProvider call({
    required String activity,
  }) {
    return ActivityFormsDefinitionsProvider(
      activity: activity,
    );
  }

  @override
  ActivityFormsDefinitionsProvider getProviderOverride(
    covariant ActivityFormsDefinitionsProvider provider,
  ) {
    return call(
      activity: provider.activity,
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
  String? get name => r'activityFormsDefinitionsProvider';
}

/// See also [activityFormsDefinitions].
class ActivityFormsDefinitionsProvider
    extends AutoDisposeFutureProvider<List<FormDefinition?>> {
  /// See also [activityFormsDefinitions].
  ActivityFormsDefinitionsProvider({
    required String activity,
  }) : this._internal(
          (ref) => activityFormsDefinitions(
            ref as ActivityFormsDefinitionsRef,
            activity: activity,
          ),
          from: activityFormsDefinitionsProvider,
          name: r'activityFormsDefinitionsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$activityFormsDefinitionsHash,
          dependencies: ActivityFormsDefinitionsFamily._dependencies,
          allTransitiveDependencies:
              ActivityFormsDefinitionsFamily._allTransitiveDependencies,
          activity: activity,
        );

  ActivityFormsDefinitionsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.activity,
  }) : super.internal();

  final String activity;

  @override
  Override overrideWith(
    FutureOr<List<FormDefinition?>> Function(
            ActivityFormsDefinitionsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ActivityFormsDefinitionsProvider._internal(
        (ref) => create(ref as ActivityFormsDefinitionsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        activity: activity,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<FormDefinition?>> createElement() {
    return _ActivityFormsDefinitionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ActivityFormsDefinitionsProvider &&
        other.activity == activity;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, activity.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ActivityFormsDefinitionsRef
    on AutoDisposeFutureProviderRef<List<FormDefinition?>> {
  /// The parameter `activity` of this provider.
  String get activity;
}

class _ActivityFormsDefinitionsProviderElement
    extends AutoDisposeFutureProviderElement<List<FormDefinition?>>
    with ActivityFormsDefinitionsRef {
  _ActivityFormsDefinitionsProviderElement(super.provider);

  @override
  String get activity => (origin as ActivityFormsDefinitionsProvider).activity;
}

String _$formSubmissionsByStatusHash() =>
    r'ab210e2b3f29da56740322d57e509cefcf98c6c1';

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

String _$entityCountByStatusHash() =>
    r'60e9fef4cd586324f13ca009256fb0081beaecc4';

/// See also [entityCountByStatus].
@ProviderFor(entityCountByStatus)
const entityCountByStatusProvider = EntityCountByStatusFamily();

/// See also [entityCountByStatus].
class EntityCountByStatusFamily
    extends Family<AsyncValue<EntityCountByStatus>> {
  /// See also [entityCountByStatus].
  const EntityCountByStatusFamily();

  /// See also [entityCountByStatus].
  EntityCountByStatusProvider call({
    required String form,
  }) {
    return EntityCountByStatusProvider(
      form: form,
    );
  }

  @override
  EntityCountByStatusProvider getProviderOverride(
    covariant EntityCountByStatusProvider provider,
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
  String? get name => r'entityCountByStatusProvider';
}

/// See also [entityCountByStatus].
class EntityCountByStatusProvider
    extends AutoDisposeFutureProvider<EntityCountByStatus> {
  /// See also [entityCountByStatus].
  EntityCountByStatusProvider({
    required String form,
  }) : this._internal(
          (ref) => entityCountByStatus(
            ref as EntityCountByStatusRef,
            form: form,
          ),
          from: entityCountByStatusProvider,
          name: r'entityCountByStatusProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$entityCountByStatusHash,
          dependencies: EntityCountByStatusFamily._dependencies,
          allTransitiveDependencies:
              EntityCountByStatusFamily._allTransitiveDependencies,
          form: form,
        );

  EntityCountByStatusProvider._internal(
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
    FutureOr<EntityCountByStatus> Function(EntityCountByStatusRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: EntityCountByStatusProvider._internal(
        (ref) => create(ref as EntityCountByStatusRef),
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
  AutoDisposeFutureProviderElement<EntityCountByStatus> createElement() {
    return _EntityCountByStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EntityCountByStatusProvider && other.form == form;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, form.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin EntityCountByStatusRef
    on AutoDisposeFutureProviderRef<EntityCountByStatus> {
  /// The parameter `form` of this provider.
  String get form;
}

class _EntityCountByStatusProviderElement
    extends AutoDisposeFutureProviderElement<EntityCountByStatus>
    with EntityCountByStatusRef {
  _EntityCountByStatusProviderElement(super.provider);

  @override
  String get form => (origin as EntityCountByStatusProvider).form;
}

String _$projectDetailItemModelHash() =>
    r'6783ff775be4bbd442d956cb6d2d8da0c5a0b804';

/// See also [projectDetailItemModel].
@ProviderFor(projectDetailItemModel)
final projectDetailItemModelProvider =
    AutoDisposeProvider<ProjectDetailItemModel>.internal(
  projectDetailItemModel,
  name: r'projectDetailItemModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$projectDetailItemModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProjectDetailItemModelRef
    = AutoDisposeProviderRef<ProjectDetailItemModel>;
String _$formListItemModelsHash() =>
    r'a330f6c992585fc1426afecd887406d8336ec13a';

/// See also [formListItemModels].
@ProviderFor(formListItemModels)
final formListItemModelsProvider =
    AutoDisposeFutureProvider<IList<FormListItemModel>>.internal(
  formListItemModels,
  name: r'formListItemModelsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$formListItemModelsHash,
  dependencies: <ProviderOrFamily>[projectDetailItemModelProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    projectDetailItemModelProvider,
    ...?projectDetailItemModelProvider.allTransitiveDependencies
  },
);

typedef FormListItemModelsRef
    = AutoDisposeFutureProviderRef<IList<FormListItemModel>>;
String _$projectDetailItemModelsHash() =>
    r'd1d0a41954fb34f9ccef8ee78e87a3edac4cf626';

/// See also [projectDetailItemModels].
@ProviderFor(projectDetailItemModels)
final projectDetailItemModelsProvider =
    AutoDisposeFutureProvider<IList<ProjectDetailItemModel>>.internal(
  projectDetailItemModels,
  name: r'projectDetailItemModelsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$projectDetailItemModelsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProjectDetailItemModelsRef
    = AutoDisposeFutureProviderRef<IList<ProjectDetailItemModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
