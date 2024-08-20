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
    r'a432069388ed78d36d6cebf74483078da6fb4853';

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
    r'125c55110856e98d205eb7c65d57b3c4af27a6fa';

/// See also [formListItemModels].
@ProviderFor(formListItemModels)
const formListItemModelsProvider = FormListItemModelsFamily();

/// See also [formListItemModels].
class FormListItemModelsFamily
    extends Family<AsyncValue<IList<FormListItemModel>>> {
  /// See also [formListItemModels].
  const FormListItemModelsFamily();

  /// See also [formListItemModels].
  FormListItemModelsProvider call({
    required String activity,
    required String team,
  }) {
    return FormListItemModelsProvider(
      activity: activity,
      team: team,
    );
  }

  @override
  FormListItemModelsProvider getProviderOverride(
    covariant FormListItemModelsProvider provider,
  ) {
    return call(
      activity: provider.activity,
      team: provider.team,
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
  String? get name => r'formListItemModelsProvider';
}

/// See also [formListItemModels].
class FormListItemModelsProvider
    extends AutoDisposeFutureProvider<IList<FormListItemModel>> {
  /// See also [formListItemModels].
  FormListItemModelsProvider({
    required String activity,
    required String team,
  }) : this._internal(
          (ref) => formListItemModels(
            ref as FormListItemModelsRef,
            activity: activity,
            team: team,
          ),
          from: formListItemModelsProvider,
          name: r'formListItemModelsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$formListItemModelsHash,
          dependencies: FormListItemModelsFamily._dependencies,
          allTransitiveDependencies:
              FormListItemModelsFamily._allTransitiveDependencies,
          activity: activity,
          team: team,
        );

  FormListItemModelsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.activity,
    required this.team,
  }) : super.internal();

  final String activity;
  final String team;

  @override
  Override overrideWith(
    FutureOr<IList<FormListItemModel>> Function(FormListItemModelsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FormListItemModelsProvider._internal(
        (ref) => create(ref as FormListItemModelsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        activity: activity,
        team: team,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<IList<FormListItemModel>> createElement() {
    return _FormListItemModelsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FormListItemModelsProvider &&
        other.activity == activity &&
        other.team == team;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, activity.hashCode);
    hash = _SystemHash.combine(hash, team.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FormListItemModelsRef
    on AutoDisposeFutureProviderRef<IList<FormListItemModel>> {
  /// The parameter `activity` of this provider.
  String get activity;

  /// The parameter `team` of this provider.
  String get team;
}

class _FormListItemModelsProviderElement
    extends AutoDisposeFutureProviderElement<IList<FormListItemModel>>
    with FormListItemModelsRef {
  _FormListItemModelsProviderElement(super.provider);

  @override
  String get activity => (origin as FormListItemModelsProvider).activity;
  @override
  String get team => (origin as FormListItemModelsProvider).team;
}

String _$projectDetailItemModelsHash() =>
    r'e512327a40e43e36f7adb18c6affeeff4c57e6f3';

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
