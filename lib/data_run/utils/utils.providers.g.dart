// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'utils.providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$teamsHash() => r'7b8db610da0e55a67f7d3691b9710ae53fad8827';

/// All available teams including disabled
///
/// Copied from [teams].
@ProviderFor(teams)
final teamsProvider = AutoDisposeFutureProvider<IList<DTeam>>.internal(
  teams,
  name: r'teamsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$teamsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TeamsRef = AutoDisposeFutureProviderRef<IList<DTeam>>;
String _$activitiesHash() => r'2686badd619eecd742a8a90f2338b524a22ac088';

/// All available activities including disabled
///
/// Copied from [activities].
@ProviderFor(activities)
final activitiesProvider = AutoDisposeFutureProvider<IList<DActivity>>.internal(
  activities,
  name: r'activitiesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$activitiesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ActivitiesRef = AutoDisposeFutureProviderRef<IList<DActivity>>;
String _$projectsHash() => r'e8ad4754cc96c590d3fbbc29996969a8d4c44764';

/// All available projects including disabled
///
/// Copied from [projects].
@ProviderFor(projects)
final projectsProvider = AutoDisposeFutureProvider<IList<DProject>>.internal(
  projects,
  name: r'projectsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$projectsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProjectsRef = AutoDisposeFutureProviderRef<IList<DProject>>;
String _$activeTeamsHash() => r'a6ff3c2249f7bc2ce2b8ec531791ec921ac2eb6d';

///
/// Only Enabled
/// Only Active teams (Enabled)
///
/// Copied from [activeTeams].
@ProviderFor(activeTeams)
final activeTeamsProvider = AutoDisposeFutureProvider<IList<DTeam>>.internal(
  activeTeams,
  name: r'activeTeamsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$activeTeamsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ActiveTeamsRef = AutoDisposeFutureProviderRef<IList<DTeam>>;
String _$activeActivitiesHash() => r'61a55a7f5fd935b5b84d24e28f0459457c5706b0';

/// Only Active activities (Enabled)
///
/// Copied from [activeActivities].
@ProviderFor(activeActivities)
final activeActivitiesProvider =
    AutoDisposeFutureProvider<IList<DActivity>>.internal(
  activeActivities,
  name: r'activeActivitiesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activeActivitiesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ActiveActivitiesRef = AutoDisposeFutureProviderRef<IList<DActivity>>;
String _$activeProjectsHash() => r'ab0f9cf52c41e06b02edd464cc339ede5ea1bfb5';

/// Only Active projects (Enabled)
///
/// Copied from [activeProjects].
@ProviderFor(activeProjects)
final activeProjectsProvider =
    AutoDisposeFutureProvider<IList<DProject>>.internal(
  activeProjects,
  name: r'activeProjectsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activeProjectsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ActiveProjectsRef = AutoDisposeFutureProviderRef<IList<DProject>>;
String _$activeFormsHash() => r'3a5620c18b18170f10c9b297139c2caf481d1640';

/// Only Active forms (Enabled)
///
/// Copied from [activeForms].
@ProviderFor(activeForms)
final activeFormsProvider =
    AutoDisposeFutureProvider<IList<DynamicForm>>.internal(
  activeForms,
  name: r'activeFormsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$activeFormsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ActiveFormsRef = AutoDisposeFutureProviderRef<IList<DynamicForm>>;
String _$projectUtilsHash() => r'81207d39bfd0920bd1eda86a9b80b388b931e533';

/// See also [projectUtils].
@ProviderFor(projectUtils)
final projectUtilsProvider = Provider<ProjectUtils>.internal(
  projectUtils,
  name: r'projectUtilsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$projectUtilsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProjectUtilsRef = ProviderRef<ProjectUtils>;
String _$activityUtilsHash() => r'cb22af623ec980ff3f172431e42d1f55d7ec70d0';

/// See also [activityUtils].
@ProviderFor(activityUtils)
final activityUtilsProvider = Provider<ActivityUtils>.internal(
  activityUtils,
  name: r'activityUtilsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activityUtilsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ActivityUtilsRef = ProviderRef<ActivityUtils>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
