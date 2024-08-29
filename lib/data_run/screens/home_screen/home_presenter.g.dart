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
class HomePresenterFamily extends Family<HomePresenter> {
  /// See also [homePresenter].
  const HomePresenterFamily();

  /// See also [homePresenter].
  HomePresenterProvider call(
    HomeScreenView view,
  ) {
    return HomePresenterProvider(
      view,
    );
  }

  @override
  HomePresenterProvider getProviderOverride(
    covariant HomePresenterProvider provider,
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
  String? get name => r'homePresenterProvider';
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
    super._createNotifier, {
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
    HomePresenter Function(HomePresenterRef provider) create,
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
  ProviderElement<HomePresenter> createElement() {
    return _HomePresenterProviderElement(this);
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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
