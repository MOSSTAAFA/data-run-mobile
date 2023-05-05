// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_initial_module.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fieldMapperHash() => r'1ac597c34bc9ef15bcbd065e6d9981c121141adb';

/// See also [fieldMapper].
@ProviderFor(fieldMapper)
final fieldMapperProvider = AutoDisposeProvider<EventFieldMapper>.internal(
  fieldMapper,
  name: r'fieldMapperProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fieldMapperHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FieldMapperRef = AutoDisposeProviderRef<EventFieldMapper>;
String _$eventInitialRepositoryHash() =>
    r'54caadc9475578245e8f470bdf0f4fc102b381a8';

/// See also [eventInitialRepository].
@ProviderFor(eventInitialRepository)
final eventInitialRepositoryProvider =
    AutoDisposeProvider<EventInitialRepository>.internal(
  eventInitialRepository,
  name: r'eventInitialRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$eventInitialRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef EventInitialRepositoryRef
    = AutoDisposeProviderRef<EventInitialRepository>;
String _$eventInitialPresenterHash() =>
    r'0e44c908028c457cf419bdf5364157455d11ffbb';

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

typedef EventInitialPresenterRef
    = AutoDisposeProviderRef<EventInitialPresenter>;

/// See also [eventInitialPresenter].
@ProviderFor(eventInitialPresenter)
const eventInitialPresenterProvider = EventInitialPresenterFamily();

/// See also [eventInitialPresenter].
class EventInitialPresenterFamily extends Family<EventInitialPresenter> {
  /// See also [eventInitialPresenter].
  const EventInitialPresenterFamily();

  /// See also [eventInitialPresenter].
  EventInitialPresenterProvider call(
    EventInitialViewBase view,
  ) {
    return EventInitialPresenterProvider(
      view,
    );
  }

  @override
  EventInitialPresenterProvider getProviderOverride(
    covariant EventInitialPresenterProvider provider,
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
  String? get name => r'eventInitialPresenterProvider';
}

/// See also [eventInitialPresenter].
class EventInitialPresenterProvider
    extends AutoDisposeProvider<EventInitialPresenter> {
  /// See also [eventInitialPresenter].
  EventInitialPresenterProvider(
    this.view,
  ) : super.internal(
          (ref) => eventInitialPresenter(
            ref,
            view,
          ),
          from: eventInitialPresenterProvider,
          name: r'eventInitialPresenterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$eventInitialPresenterHash,
          dependencies: EventInitialPresenterFamily._dependencies,
          allTransitiveDependencies:
              EventInitialPresenterFamily._allTransitiveDependencies,
        );

  final EventInitialViewBase view;

  @override
  bool operator ==(Object other) {
    return other is EventInitialPresenterProvider && other.view == view;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, view.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$preferencesInstanceHash() =>
    r'48adee76f0eb4dc136617325727758209e324eb9';

/// See also [preferencesInstance].
@ProviderFor(preferencesInstance)
final preferencesInstanceProvider = Provider<PreferenceProvider>.internal(
  preferencesInstance,
  name: r'preferencesInstanceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$preferencesInstanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PreferencesInstanceRef = ProviderRef<PreferenceProvider>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
