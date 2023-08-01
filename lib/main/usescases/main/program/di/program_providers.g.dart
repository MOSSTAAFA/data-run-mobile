// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$programPresenterHash() => r'350cae155e33a01a96aeb9261adb7e6412c20db1';

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

typedef ProgramPresenterRef = ProviderRef<ProgramPresenter>;

/// See also [programPresenter].
@ProviderFor(programPresenter)
const programPresenterProvider = ProgramPresenterFamily();

/// See also [programPresenter].
class ProgramPresenterFamily extends Family<ProgramPresenter> {
  /// See also [programPresenter].
  const ProgramPresenterFamily();

  /// See also [programPresenter].
  ProgramPresenterProvider call(
    ProgramView view,
  ) {
    return ProgramPresenterProvider(
      view,
    );
  }

  @override
  ProgramPresenterProvider getProviderOverride(
    covariant ProgramPresenterProvider provider,
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
  String? get name => r'programPresenterProvider';
}

/// See also [programPresenter].
class ProgramPresenterProvider extends Provider<ProgramPresenter> {
  /// See also [programPresenter].
  ProgramPresenterProvider(
    this.view,
  ) : super.internal(
          (ref) => programPresenter(
            ref,
            view,
          ),
          from: programPresenterProvider,
          name: r'programPresenterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$programPresenterHash,
          dependencies: ProgramPresenterFamily._dependencies,
          allTransitiveDependencies:
              ProgramPresenterFamily._allTransitiveDependencies,
        );

  final ProgramView view;

  @override
  bool operator ==(Object other) {
    return other is ProgramPresenterProvider && other.view == view;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, view.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$programRepositoryHash() => r'767156dcc27e7cd699338cb8dc4991f2e682cf05';

/// See also [programRepository].
@ProviderFor(programRepository)
final programRepositoryProvider = Provider<ProgramRepository>.internal(
  programRepository,
  name: r'programRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$programRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProgramRepositoryRef = ProviderRef<ProgramRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
