// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_presenter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dashboardPresenterHash() =>
    r'e7308ee98bbb4f093a1865d85502e49ff65bb6da';

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

/// See also [dashboardPresenter].
@ProviderFor(dashboardPresenter)
const dashboardPresenterProvider = DashboardPresenterFamily();

/// See also [dashboardPresenter].
class DashboardPresenterFamily extends Family<DashboardPresenter> {
  /// See also [dashboardPresenter].
  const DashboardPresenterFamily();

  /// See also [dashboardPresenter].
  DashboardPresenterProvider call(
    DashboardScreenView view,
  ) {
    return DashboardPresenterProvider(
      view,
    );
  }

  @override
  DashboardPresenterProvider getProviderOverride(
    covariant DashboardPresenterProvider provider,
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
  String? get name => r'dashboardPresenterProvider';
}

/// See also [dashboardPresenter].
class DashboardPresenterProvider extends Provider<DashboardPresenter> {
  /// See also [dashboardPresenter].
  DashboardPresenterProvider(
    DashboardScreenView view,
  ) : this._internal(
          (ref) => dashboardPresenter(
            ref as DashboardPresenterRef,
            view,
          ),
          from: dashboardPresenterProvider,
          name: r'dashboardPresenterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$dashboardPresenterHash,
          dependencies: DashboardPresenterFamily._dependencies,
          allTransitiveDependencies:
              DashboardPresenterFamily._allTransitiveDependencies,
          view: view,
        );

  DashboardPresenterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.view,
  }) : super.internal();

  final DashboardScreenView view;

  @override
  Override overrideWith(
    DashboardPresenter Function(DashboardPresenterRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DashboardPresenterProvider._internal(
        (ref) => create(ref as DashboardPresenterRef),
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
  ProviderElement<DashboardPresenter> createElement() {
    return _DashboardPresenterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DashboardPresenterProvider && other.view == view;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, view.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DashboardPresenterRef on ProviderRef<DashboardPresenter> {
  /// The parameter `view` of this provider.
  DashboardScreenView get view;
}

class _DashboardPresenterProviderElement
    extends ProviderElement<DashboardPresenter> with DashboardPresenterRef {
  _DashboardPresenterProviderElement(super.provider);

  @override
  DashboardScreenView get view => (origin as DashboardPresenterProvider).view;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
