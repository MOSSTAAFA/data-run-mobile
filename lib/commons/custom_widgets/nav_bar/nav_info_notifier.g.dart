// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nav_info_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$navInfoNotifierHash() => r'1bd82c4497e6eed51aae74679bb45099da8cf0e8';

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

abstract class _$NavInfoNotifier
    extends BuildlessAutoDisposeNotifier<NavigationInfo> {
  late final Object? key;

  NavigationInfo build([
    Object? key,
  ]);
}

/// See also [NavInfoNotifier].
@ProviderFor(NavInfoNotifier)
const navInfoNotifierProvider = NavInfoNotifierFamily();

/// See also [NavInfoNotifier].
class NavInfoNotifierFamily extends Family<NavigationInfo> {
  /// See also [NavInfoNotifier].
  const NavInfoNotifierFamily();

  /// See also [NavInfoNotifier].
  NavInfoNotifierProvider call([
    Object? key,
  ]) {
    return NavInfoNotifierProvider(
      key,
    );
  }

  @override
  NavInfoNotifierProvider getProviderOverride(
    covariant NavInfoNotifierProvider provider,
  ) {
    return call(
      provider.key,
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
  String? get name => r'navInfoNotifierProvider';
}

/// See also [NavInfoNotifier].
class NavInfoNotifierProvider
    extends AutoDisposeNotifierProviderImpl<NavInfoNotifier, NavigationInfo> {
  /// See also [NavInfoNotifier].
  NavInfoNotifierProvider([
    this.key,
  ]) : super.internal(
          () => NavInfoNotifier()..key = key,
          from: navInfoNotifierProvider,
          name: r'navInfoNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$navInfoNotifierHash,
          dependencies: NavInfoNotifierFamily._dependencies,
          allTransitiveDependencies:
              NavInfoNotifierFamily._allTransitiveDependencies,
        );

  final Object? key;

  @override
  bool operator ==(Object other) {
    return other is NavInfoNotifierProvider && other.key == key;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, key.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  NavigationInfo runNotifierBuild(
    covariant NavInfoNotifier notifier,
  ) {
    return notifier.build(
      key,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
