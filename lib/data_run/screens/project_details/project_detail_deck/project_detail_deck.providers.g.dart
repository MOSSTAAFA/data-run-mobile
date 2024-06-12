// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_detail_deck.providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$projectDetailDeckPresenterHash() =>
    r'c2a10463064967be002375494e6c31b7eb4f2369';

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

/// Project Deck Items Providers
///
/// Copied from [projectDetailDeckPresenter].
@ProviderFor(projectDetailDeckPresenter)
const projectDetailDeckPresenterProvider = ProjectDetailDeckPresenterFamily();

/// Project Deck Items Providers
///
/// Copied from [projectDetailDeckPresenter].
class ProjectDetailDeckPresenterFamily
    extends Family<ProjectDetailDeckPresenter> {
  /// Project Deck Items Providers
  ///
  /// Copied from [projectDetailDeckPresenter].
  const ProjectDetailDeckPresenterFamily();

  /// Project Deck Items Providers
  ///
  /// Copied from [projectDetailDeckPresenter].
  ProjectDetailDeckPresenterProvider call(
    ProjectDetailDeckView view,
  ) {
    return ProjectDetailDeckPresenterProvider(
      view,
    );
  }

  @override
  ProjectDetailDeckPresenterProvider getProviderOverride(
    covariant ProjectDetailDeckPresenterProvider provider,
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
  String? get name => r'projectDetailDeckPresenterProvider';
}

/// Project Deck Items Providers
///
/// Copied from [projectDetailDeckPresenter].
class ProjectDetailDeckPresenterProvider
    extends AutoDisposeProvider<ProjectDetailDeckPresenter> {
  /// Project Deck Items Providers
  ///
  /// Copied from [projectDetailDeckPresenter].
  ProjectDetailDeckPresenterProvider(
    ProjectDetailDeckView view,
  ) : this._internal(
          (ref) => projectDetailDeckPresenter(
            ref as ProjectDetailDeckPresenterRef,
            view,
          ),
          from: projectDetailDeckPresenterProvider,
          name: r'projectDetailDeckPresenterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$projectDetailDeckPresenterHash,
          dependencies: ProjectDetailDeckPresenterFamily._dependencies,
          allTransitiveDependencies:
              ProjectDetailDeckPresenterFamily._allTransitiveDependencies,
          view: view,
        );

  ProjectDetailDeckPresenterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.view,
  }) : super.internal();

  final ProjectDetailDeckView view;

  @override
  Override overrideWith(
    ProjectDetailDeckPresenter Function(ProjectDetailDeckPresenterRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProjectDetailDeckPresenterProvider._internal(
        (ref) => create(ref as ProjectDetailDeckPresenterRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        view: view,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<ProjectDetailDeckPresenter> createElement() {
    return _ProjectDetailDeckPresenterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectDetailDeckPresenterProvider && other.view == view;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, view.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProjectDetailDeckPresenterRef
    on AutoDisposeProviderRef<ProjectDetailDeckPresenter> {
  /// The parameter `view` of this provider.
  ProjectDetailDeckView get view;
}

class _ProjectDetailDeckPresenterProviderElement
    extends AutoDisposeProviderElement<ProjectDetailDeckPresenter>
    with ProjectDetailDeckPresenterRef {
  _ProjectDetailDeckPresenterProviderElement(super.provider);

  @override
  ProjectDetailDeckView get view =>
      (origin as ProjectDetailDeckPresenterProvider).view;
}

String _$projectDetailDeckRepositoryHash() =>
    r'0d0e61eb6620cc4589d0cb9f93084075f8587d5f';

/// See also [projectDetailDeckRepository].
@ProviderFor(projectDetailDeckRepository)
final projectDetailDeckRepositoryProvider =
    AutoDisposeProvider<ProjectDetailDeckRepository>.internal(
  projectDetailDeckRepository,
  name: r'projectDetailDeckRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$projectDetailDeckRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProjectDetailDeckRepositoryRef
    = AutoDisposeProviderRef<ProjectDetailDeckRepository>;
String _$projectDetailItemModelsHash() =>
    r'183a9562bfe24c97eeebe2231d5614b82b18d8c7';

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
String _$projectDetailItemModelsListLengthHash() =>
    r'b17903753dffbc317416fc5ab16b110467112ab6';

/// See also [projectDetailItemModelsListLength].
@ProviderFor(projectDetailItemModelsListLength)
final projectDetailItemModelsListLengthProvider =
    AutoDisposeFutureProvider<int>.internal(
  projectDetailItemModelsListLength,
  name: r'projectDetailItemModelsListLengthProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$projectDetailItemModelsListLengthHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProjectDetailItemModelsListLengthRef
    = AutoDisposeFutureProviderRef<int>;
String _$projectDetailItemModelIndexHash() =>
    r'b08cc79bae20e8a60716388774f11b4c2480cd08';

/// See also [projectDetailItemModelIndex].
@ProviderFor(projectDetailItemModelIndex)
final projectDetailItemModelIndexProvider = AutoDisposeProvider<int>.internal(
  projectDetailItemModelIndex,
  name: r'projectDetailItemModelIndexProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$projectDetailItemModelIndexHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProjectDetailItemModelIndexRef = AutoDisposeProviderRef<int>;
String _$projectDetailItemModelHash() =>
    r'5782640f904b62aa973cc85bc8d21481ef5465a9';

/// See also [projectDetailItemModel].
@ProviderFor(projectDetailItemModel)
final projectDetailItemModelProvider =
    AutoDisposeProvider<ProjectDetailItemModel?>.internal(
  projectDetailItemModel,
  name: r'projectDetailItemModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$projectDetailItemModelHash,
  dependencies: <ProviderOrFamily>[projectDetailItemModelIndexProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    projectDetailItemModelIndexProvider,
    ...?projectDetailItemModelIndexProvider.allTransitiveDependencies
  },
);

typedef ProjectDetailItemModelRef
    = AutoDisposeProviderRef<ProjectDetailItemModel?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
