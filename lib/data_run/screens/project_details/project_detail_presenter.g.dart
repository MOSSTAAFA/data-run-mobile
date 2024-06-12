// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_detail_presenter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$projectDetailPresenterHash() =>
    r'2de7f17c07db0a4ab0a3c6e363bbb09ed33f0585';

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

/// See also [projectDetailPresenter].
@ProviderFor(projectDetailPresenter)
const projectDetailPresenterProvider = ProjectDetailPresenterFamily();

/// See also [projectDetailPresenter].
class ProjectDetailPresenterFamily extends Family<ProjectDetailPresenter> {
  /// See also [projectDetailPresenter].
  const ProjectDetailPresenterFamily();

  /// See also [projectDetailPresenter].
  ProjectDetailPresenterProvider call(
    ProjectDetailScreenView view,
  ) {
    return ProjectDetailPresenterProvider(
      view,
    );
  }

  @override
  ProjectDetailPresenterProvider getProviderOverride(
    covariant ProjectDetailPresenterProvider provider,
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
  String? get name => r'projectDetailPresenterProvider';
}

/// See also [projectDetailPresenter].
class ProjectDetailPresenterProvider extends Provider<ProjectDetailPresenter> {
  /// See also [projectDetailPresenter].
  ProjectDetailPresenterProvider(
    ProjectDetailScreenView view,
  ) : this._internal(
          (ref) => projectDetailPresenter(
            ref as ProjectDetailPresenterRef,
            view,
          ),
          from: projectDetailPresenterProvider,
          name: r'projectDetailPresenterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$projectDetailPresenterHash,
          dependencies: ProjectDetailPresenterFamily._dependencies,
          allTransitiveDependencies:
              ProjectDetailPresenterFamily._allTransitiveDependencies,
          view: view,
        );

  ProjectDetailPresenterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.view,
  }) : super.internal();

  final ProjectDetailScreenView view;

  @override
  Override overrideWith(
    ProjectDetailPresenter Function(ProjectDetailPresenterRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProjectDetailPresenterProvider._internal(
        (ref) => create(ref as ProjectDetailPresenterRef),
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
  ProviderElement<ProjectDetailPresenter> createElement() {
    return _ProjectDetailPresenterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectDetailPresenterProvider && other.view == view;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, view.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProjectDetailPresenterRef on ProviderRef<ProjectDetailPresenter> {
  /// The parameter `view` of this provider.
  ProjectDetailScreenView get view;
}

class _ProjectDetailPresenterProviderElement
    extends ProviderElement<ProjectDetailPresenter>
    with ProjectDetailPresenterRef {
  _ProjectDetailPresenterProviderElement(super.provider);

  @override
  ProjectDetailScreenView get view =>
      (origin as ProjectDetailPresenterProvider).view;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
