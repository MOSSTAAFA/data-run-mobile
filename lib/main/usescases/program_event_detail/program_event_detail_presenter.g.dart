// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_event_detail_presenter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$programEventDetailPresenterHash() =>
    r'52888c49b225abd9c83b949ef6f83b5f45ff5ed6';

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

/// See also [programEventDetailPresenter].
@ProviderFor(programEventDetailPresenter)
const programEventDetailPresenterProvider = ProgramEventDetailPresenterFamily();

/// See also [programEventDetailPresenter].
class ProgramEventDetailPresenterFamily
    extends Family<ProgramEventDetailPresenter> {
  /// See also [programEventDetailPresenter].
  const ProgramEventDetailPresenterFamily();

  /// See also [programEventDetailPresenter].
  ProgramEventDetailPresenterProvider call(
    ProgramEventDetailView view,
  ) {
    return ProgramEventDetailPresenterProvider(
      view,
    );
  }

  @override
  ProgramEventDetailPresenterProvider getProviderOverride(
    covariant ProgramEventDetailPresenterProvider provider,
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
  String? get name => r'programEventDetailPresenterProvider';
}

/// See also [programEventDetailPresenter].
class ProgramEventDetailPresenterProvider
    extends AutoDisposeProvider<ProgramEventDetailPresenter> {
  /// See also [programEventDetailPresenter].
  ProgramEventDetailPresenterProvider(
    ProgramEventDetailView view,
  ) : this._internal(
          (ref) => programEventDetailPresenter(
            ref as ProgramEventDetailPresenterRef,
            view,
          ),
          from: programEventDetailPresenterProvider,
          name: r'programEventDetailPresenterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$programEventDetailPresenterHash,
          dependencies: ProgramEventDetailPresenterFamily._dependencies,
          allTransitiveDependencies:
              ProgramEventDetailPresenterFamily._allTransitiveDependencies,
          view: view,
        );

  ProgramEventDetailPresenterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.view,
  }) : super.internal();

  final ProgramEventDetailView view;

  @override
  Override overrideWith(
    ProgramEventDetailPresenter Function(
            ProgramEventDetailPresenterRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProgramEventDetailPresenterProvider._internal(
        (ref) => create(ref as ProgramEventDetailPresenterRef),
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
  AutoDisposeProviderElement<ProgramEventDetailPresenter> createElement() {
    return _ProgramEventDetailPresenterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProgramEventDetailPresenterProvider && other.view == view;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, view.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProgramEventDetailPresenterRef
    on AutoDisposeProviderRef<ProgramEventDetailPresenter> {
  /// The parameter `view` of this provider.
  ProgramEventDetailView get view;
}

class _ProgramEventDetailPresenterProviderElement
    extends AutoDisposeProviderElement<ProgramEventDetailPresenter>
    with ProgramEventDetailPresenterRef {
  _ProgramEventDetailPresenterProviderElement(super.provider);

  @override
  ProgramEventDetailView get view =>
      (origin as ProgramEventDetailPresenterProvider).view;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
