// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_presenter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$projectPresenterHash() => r'24fbd1bc537d9b1ed7ff3059a405458d6cabc370';

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

typedef ProjectPresenterRef = ProviderRef<ProjectPresenter>;

/// See also [projectPresenter].
@ProviderFor(projectPresenter)
const projectPresenterProvider = ProjectPresenterFamily();

/// See also [projectPresenter].
class ProjectPresenterFamily extends Family<ProjectPresenter> {
  /// See also [projectPresenter].
  const ProjectPresenterFamily();

  /// See also [projectPresenter].
  ProjectPresenterProvider call(
    ProjectScreenView view,
  ) {
    return ProjectPresenterProvider(
      view,
    );
  }

  @override
  ProjectPresenterProvider getProviderOverride(
    covariant ProjectPresenterProvider provider,
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
  String? get name => r'projectPresenterProvider';
}

/// See also [projectPresenter].
class ProjectPresenterProvider extends Provider<ProjectPresenter> {
  /// See also [projectPresenter].
  ProjectPresenterProvider(
    this.view,
  ) : super.internal(
          (ref) => projectPresenter(
            ref,
            view,
          ),
          from: projectPresenterProvider,
          name: r'projectPresenterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$projectPresenterHash,
          dependencies: ProjectPresenterFamily._dependencies,
          allTransitiveDependencies:
              ProjectPresenterFamily._allTransitiveDependencies,
        );

  final ProjectScreenView view;

  @override
  bool operator ==(Object other) {
    return other is ProjectPresenterProvider && other.view == view;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, view.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
