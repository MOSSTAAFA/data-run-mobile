// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_presenter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mainPresenterHash() => r'b9728042d031d2f8a89ae32fff99430f1cea6b23';

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

/// See also [mainPresenter].
@ProviderFor(mainPresenter)
const mainPresenterProvider = MainPresenterFamily();

/// See also [mainPresenter].
class MainPresenterFamily extends Family<MainPresenter> {
  /// See also [mainPresenter].
  const MainPresenterFamily();

  /// See also [mainPresenter].
  MainPresenterProvider call(
    MainView view,
  ) {
    return MainPresenterProvider(
      view,
    );
  }

  @override
  MainPresenterProvider getProviderOverride(
    covariant MainPresenterProvider provider,
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
  String? get name => r'mainPresenterProvider';
}

/// See also [mainPresenter].
class MainPresenterProvider extends Provider<MainPresenter> {
  /// See also [mainPresenter].
  MainPresenterProvider(
    MainView view,
  ) : this._internal(
          (ref) => mainPresenter(
            ref as MainPresenterRef,
            view,
          ),
          from: mainPresenterProvider,
          name: r'mainPresenterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$mainPresenterHash,
          dependencies: MainPresenterFamily._dependencies,
          allTransitiveDependencies:
              MainPresenterFamily._allTransitiveDependencies,
          view: view,
        );

  MainPresenterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.view,
  }) : super.internal();

  final MainView view;

  @override
  Override overrideWith(
    MainPresenter Function(MainPresenterRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MainPresenterProvider._internal(
        (ref) => create(ref as MainPresenterRef),
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
  ProviderElement<MainPresenter> createElement() {
    return _MainPresenterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MainPresenterProvider && other.view == view;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, view.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MainPresenterRef on ProviderRef<MainPresenter> {
  /// The parameter `view` of this provider.
  MainView get view;
}

class _MainPresenterProviderElement extends ProviderElement<MainPresenter>
    with MainPresenterRef {
  _MainPresenterProviderElement(super.provider);

  @override
  MainView get view => (origin as MainPresenterProvider).view;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
