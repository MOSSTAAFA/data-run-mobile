// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_presenter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$homePresenterHash() => r'db5aff693434ffdb927fcd686fff1d2d3fec78d6';

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

/// See also [homePresenter].
@ProviderFor(homePresenter)
const homePresenterProvider = HomePresenterFamily();

/// See also [homePresenter].
class HomePresenterFamily extends Family {
  /// See also [homePresenter].
  const HomePresenterFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'homePresenterProvider';

  /// See also [homePresenter].
  HomePresenterProvider call(
    HomeScreenView view,
  ) {
    return HomePresenterProvider(
      view,
    );
  }

  @visibleForOverriding
  @override
  HomePresenterProvider getProviderOverride(
    covariant HomePresenterProvider provider,
  ) {
    return call(
      provider.view,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(HomePresenter Function(HomePresenterRef ref) create) {
    return _$HomePresenterFamilyOverride(this, create);
  }
}

class _$HomePresenterFamilyOverride implements FamilyOverride {
  _$HomePresenterFamilyOverride(this.overriddenFamily, this.create);

  final HomePresenter Function(HomePresenterRef ref) create;

  @override
  final HomePresenterFamily overriddenFamily;

  @override
  HomePresenterProvider getProviderOverride(
    covariant HomePresenterProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [homePresenter].
class HomePresenterProvider extends Provider<HomePresenter> {
  /// See also [homePresenter].
  HomePresenterProvider(
    HomeScreenView view,
  ) : this._internal(
          (ref) => homePresenter(
            ref as HomePresenterRef,
            view,
          ),
          from: homePresenterProvider,
          name: r'homePresenterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$homePresenterHash,
          dependencies: HomePresenterFamily._dependencies,
          allTransitiveDependencies:
              HomePresenterFamily._allTransitiveDependencies,
          view: view,
        );

  HomePresenterProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.view,
  }) : super.internal();

  final HomeScreenView view;

  @override
  Override overrideWith(
    HomePresenter Function(HomePresenterRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: HomePresenterProvider._internal(
        (ref) => create(ref as HomePresenterRef),
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
  (HomeScreenView,) get argument {
    return (view,);
  }

  @override
  ProviderElement<HomePresenter> createElement() {
    return _HomePresenterProviderElement(this);
  }

  HomePresenterProvider _copyWith(
    HomePresenter Function(HomePresenterRef ref) create,
  ) {
    return HomePresenterProvider._internal(
      (ref) => create(ref as HomePresenterRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      view: view,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is HomePresenterProvider && other.view == view;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, view.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin HomePresenterRef on ProviderRef<HomePresenter> {
  /// The parameter `view` of this provider.
  HomeScreenView get view;
}

class _HomePresenterProviderElement extends ProviderElement<HomePresenter>
    with HomePresenterRef {
  _HomePresenterProviderElement(super.provider);

  @override
  HomeScreenView get view => (origin as HomePresenterProvider).view;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
