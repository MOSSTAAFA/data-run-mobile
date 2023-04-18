// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_event_detail_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$programEventMapperHash() =>
    r'545705ec720c04a405a00c58b41f9eeec02643af';

/// See also [programEventMapper].
@ProviderFor(programEventMapper)
final programEventMapperProvider =
    AutoDisposeProvider<ProgramEventMapper>.internal(
  programEventMapper,
  name: r'programEventMapperProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$programEventMapperHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProgramEventMapperRef = AutoDisposeProviderRef<ProgramEventMapper>;
String _$programEventDetailRepositoryHash() =>
    r'173297daf391f2d62228561a374fc16e21655f74';

/// ProgramEventDetailPresenter
///
/// Copied from [programEventDetailRepository].
@ProviderFor(programEventDetailRepository)
final programEventDetailRepositoryProvider =
    AutoDisposeProvider<ProgramEventDetailRepository>.internal(
  programEventDetailRepository,
  name: r'programEventDetailRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$programEventDetailRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProgramEventDetailRepositoryRef
    = AutoDisposeProviderRef<ProgramEventDetailRepository>;
String _$programEventDetailPresenterHash() =>
    r'edea3078212aa389c7871956a5e4f577eed04b39';

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

typedef ProgramEventDetailPresenterRef
    = AutoDisposeProviderRef<ProgramEventDetailPresenter>;

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
    this.view,
  ) : super.internal(
          (ref) => programEventDetailPresenter(
            ref,
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
        );

  final ProgramEventDetailView view;

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

String _$filteredProgramEventsHash() =>
    r'cbab372920ee87513016013e14db3bf2940cd405';

/// LiveData<PagedList<EventViewModel>> filteredProgramEvents()
/// in ProgramEventDetailRepositoryImpl
///
/// Copied from [filteredProgramEvents].
@ProviderFor(filteredProgramEvents)
final filteredProgramEventsProvider =
    AutoDisposeProvider<List<EventModel>>.internal(
  filteredProgramEvents,
  name: r'filteredProgramEventsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$filteredProgramEventsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FilteredProgramEventsRef = AutoDisposeProviderRef<List<EventModel>>;
String _$programEventsHash() => r'6580426c54e77e0819a93fa5036b7f13f062a112';

/// See also [ProgramEvents].
@ProviderFor(ProgramEvents)
final programEventsProvider =
    AutoDisposeNotifierProvider<ProgramEvents, List<EventModel>>.internal(
  ProgramEvents.new,
  name: r'programEventsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$programEventsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProgramEvents = AutoDisposeNotifier<List<EventModel>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
