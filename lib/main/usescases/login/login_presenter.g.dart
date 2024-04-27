// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_presenter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loginScreenPresenterHash() =>
    r'146f400b70259ab89440f86e1dd3602511e16c64';

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

typedef LoginScreenPresenterRef = AutoDisposeProviderRef<LoginScreenPresenter>;

/// See also [loginScreenPresenter].
@ProviderFor(loginScreenPresenter)
const loginScreenPresenterProvider = LoginScreenPresenterFamily();

/// See also [loginScreenPresenter].
class LoginScreenPresenterFamily extends Family<LoginScreenPresenter> {
  /// See also [loginScreenPresenter].
  const LoginScreenPresenterFamily();

  /// See also [loginScreenPresenter].
  LoginScreenPresenterProvider call(
    LoginView view,
  ) {
    return LoginScreenPresenterProvider(
      view,
    );
  }

  @override
  LoginScreenPresenterProvider getProviderOverride(
    covariant LoginScreenPresenterProvider provider,
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
  String? get name => r'loginScreenPresenterProvider';
}

/// See also [loginScreenPresenter].
class LoginScreenPresenterProvider
    extends AutoDisposeProvider<LoginScreenPresenter> {
  /// See also [loginScreenPresenter].
  LoginScreenPresenterProvider(
    this.view,
  ) : super.internal(
          (ref) => loginScreenPresenter(
            ref,
            view,
          ),
          from: loginScreenPresenterProvider,
          name: r'loginScreenPresenterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$loginScreenPresenterHash,
          dependencies: LoginScreenPresenterFamily._dependencies,
          allTransitiveDependencies:
              LoginScreenPresenterFamily._allTransitiveDependencies,
        );

  final LoginView view;

  @override
  bool operator ==(Object other) {
    return other is LoginScreenPresenterProvider && other.view == view;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, view.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$showLoginProgressHash() => r'7c6f17a2fcc2273167dfe985e343df182196d35f';

/// See also [ShowLoginProgress].
@ProviderFor(ShowLoginProgress)
final showLoginProgressProvider =
    AutoDisposeNotifierProvider<ShowLoginProgress, bool>.internal(
  ShowLoginProgress.new,
  name: r'showLoginProgressProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$showLoginProgressHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ShowLoginProgress = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
