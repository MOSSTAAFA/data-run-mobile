// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_deck.providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$projectDeckPresenterHash() =>
    r'2fc35c913712c2735a145cd114ac027d23624b52';

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

typedef ProjectDeckPresenterRef = ProviderRef<ProjectDeckPresenter>;

/// Project Deck Items Providers
///
/// Copied from [projectDeckPresenter].
@ProviderFor(projectDeckPresenter)
const projectDeckPresenterProvider = ProjectDeckPresenterFamily();

/// Project Deck Items Providers
///
/// Copied from [projectDeckPresenter].
class ProjectDeckPresenterFamily extends Family<ProjectDeckPresenter> {
  /// Project Deck Items Providers
  ///
  /// Copied from [projectDeckPresenter].
  const ProjectDeckPresenterFamily();

  /// Project Deck Items Providers
  ///
  /// Copied from [projectDeckPresenter].
  ProjectDeckPresenterProvider call(
    ProjectDeckView view,
  ) {
    return ProjectDeckPresenterProvider(
      view,
    );
  }

  @override
  ProjectDeckPresenterProvider getProviderOverride(
    covariant ProjectDeckPresenterProvider provider,
  ) {
    return call(
      provider.view,
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
  String? get name => r'projectDeckPresenterProvider';
}

/// Project Deck Items Providers
///
/// Copied from [projectDeckPresenter].
class ProjectDeckPresenterProvider extends Provider<ProjectDeckPresenter> {
  /// Project Deck Items Providers
  ///
  /// Copied from [projectDeckPresenter].
  ProjectDeckPresenterProvider(
    this.view,
  ) : super.internal(
          (ref) => projectDeckPresenter(
            ref,
            view,
          ),
          from: projectDeckPresenterProvider,
          name: r'projectDeckPresenterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$projectDeckPresenterHash,
          dependencies: ProjectDeckPresenterFamily._dependencies,
          allTransitiveDependencies:
              ProjectDeckPresenterFamily._allTransitiveDependencies,
        );

  final ProjectDeckView view;

  @override
  bool operator ==(Object other) {
    return other is ProjectDeckPresenterProvider && other.view == view;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, view.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$projectDeckRepositoryHash() =>
    r'7d26d1229ffd0fecaaa5f8884f06985125808a4f';

/// See also [projectDeckRepository].
@ProviderFor(projectDeckRepository)
final projectDeckRepositoryProvider = Provider<ProjectDeckRepository>.internal(
  projectDeckRepository,
  name: r'projectDeckRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$projectDeckRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProjectDeckRepositoryRef = ProviderRef<ProjectDeckRepository>;
String _$projectItemModelsHash() => r'68f5ac3a22acb582a1209ad449c23b70321725b2';

/// See also [projectItemModels].
@ProviderFor(projectItemModels)
final projectItemModelsProvider =
    AutoDisposeFutureProvider<IList<ProjectItemModel>>.internal(
  projectItemModels,
  name: r'projectItemModelsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$projectItemModelsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProjectItemModelsRef
    = AutoDisposeFutureProviderRef<IList<ProjectItemModel>>;
String _$projectItemModelsListLengthHash() =>
    r'75c6241e84a61facbd67cfbff4fd40ba92b36b20';

/// See also [projectItemModelsListLength].
@ProviderFor(projectItemModelsListLength)
final projectItemModelsListLengthProvider =
    AutoDisposeFutureProvider<int>.internal(
  projectItemModelsListLength,
  name: r'projectItemModelsListLengthProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$projectItemModelsListLengthHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProjectItemModelsListLengthRef = AutoDisposeFutureProviderRef<int>;
String _$projectItemModelIndexHash() =>
    r'13cf783406b6966632e9ddd3967a6ae96d3a3838';

/// See also [projectItemModelIndex].
@ProviderFor(projectItemModelIndex)
final projectItemModelIndexProvider = AutoDisposeProvider<int>.internal(
  projectItemModelIndex,
  name: r'projectItemModelIndexProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$projectItemModelIndexHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProjectItemModelIndexRef = AutoDisposeProviderRef<int>;
String _$projectItemModelHash() => r'9722ea5da92d511add277d9df84c9ef4fd01f5d7';

/// See also [projectItemModel].
@ProviderFor(projectItemModel)
final projectItemModelProvider =
    AutoDisposeProvider<ProjectItemModel?>.internal(
  projectItemModel,
  name: r'projectItemModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$projectItemModelHash,
  dependencies: <ProviderOrFamily>[projectItemModelIndexProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    projectItemModelIndexProvider,
    ...?projectItemModelIndexProvider.allTransitiveDependencies
  },
);

typedef ProjectItemModelRef = AutoDisposeProviderRef<ProjectItemModel?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
