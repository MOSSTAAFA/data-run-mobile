// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_presenter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$splashPresenterHash() => r'f7d844e00c1e9bfca75f3e328595ed7c6fd257b7';

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

typedef SplashPresenterRef = AutoDisposeProviderRef<SplashPresenter>;

/// See also [splashPresenter].
@ProviderFor(splashPresenter)
const splashPresenterProvider = SplashPresenterFamily();

/// See also [splashPresenter].
class SplashPresenterFamily extends Family<SplashPresenter> {
  /// See also [splashPresenter].
  const SplashPresenterFamily();

  /// See also [splashPresenter].
  SplashPresenterProvider call(
    SplashView view,
  ) {
    return SplashPresenterProvider(
      view,
    );
  }

  @override
  SplashPresenterProvider getProviderOverride(
    covariant SplashPresenterProvider provider,
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
  String? get name => r'splashPresenterProvider';
}

/// See also [splashPresenter].
class SplashPresenterProvider extends AutoDisposeProvider<SplashPresenter> {
  /// See also [splashPresenter].
  SplashPresenterProvider(
    this.view,
  ) : super.internal(
          (ref) => splashPresenter(
            ref,
            view,
          ),
          from: splashPresenterProvider,
          name: r'splashPresenterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$splashPresenterHash,
          dependencies: SplashPresenterFamily._dependencies,
          allTransitiveDependencies:
              SplashPresenterFamily._allTransitiveDependencies,
        );

  final SplashView view;

  @override
  bool operator ==(Object other) {
    return other is SplashPresenterProvider && other.view == view;
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
