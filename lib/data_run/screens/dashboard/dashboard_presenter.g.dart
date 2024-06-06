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

typedef DashboardPresenterRef = ProviderRef<DashboardPresenter>;

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
    this.view,
  ) : super.internal(
          (ref) => dashboardPresenter(
            ref,
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
        );

  final DashboardScreenView view;

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
