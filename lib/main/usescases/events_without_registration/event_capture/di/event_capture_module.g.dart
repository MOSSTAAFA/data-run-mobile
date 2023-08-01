// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_capture_module.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$eventCaptureRepositoryHash() =>
    r'1863fb0c68ca64cbc671836adbdcef4c1af0a353';

/// See also [eventCaptureRepository].
@ProviderFor(eventCaptureRepository)
final eventCaptureRepositoryProvider =
    AutoDisposeProvider<EventCaptureRepository>.internal(
  eventCaptureRepository,
  name: r'eventCaptureRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$eventCaptureRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef EventCaptureRepositoryRef
    = AutoDisposeProviderRef<EventCaptureRepository>;
String _$eventCapturePresenterHash() =>
    r'0203e5809094dbd17d0dacf5be559bf4347ee3a0';

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

typedef EventCapturePresenterRef
    = AutoDisposeProviderRef<EventCapturePresenter>;

/// See also [eventCapturePresenter].
@ProviderFor(eventCapturePresenter)
const eventCapturePresenterProvider = EventCapturePresenterFamily();

/// See also [eventCapturePresenter].
class EventCapturePresenterFamily extends Family<EventCapturePresenter> {
  /// See also [eventCapturePresenter].
  const EventCapturePresenterFamily();

  /// See also [eventCapturePresenter].
  EventCapturePresenterProvider call(
    EventCaptureView view,
  ) {
    return EventCapturePresenterProvider(
      view,
    );
  }

  @override
  EventCapturePresenterProvider getProviderOverride(
    covariant EventCapturePresenterProvider provider,
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
  String? get name => r'eventCapturePresenterProvider';
}

/// See also [eventCapturePresenter].
class EventCapturePresenterProvider
    extends AutoDisposeProvider<EventCapturePresenter> {
  /// See also [eventCapturePresenter].
  EventCapturePresenterProvider(
    this.view,
  ) : super.internal(
          (ref) => eventCapturePresenter(
            ref,
            view,
          ),
          from: eventCapturePresenterProvider,
          name: r'eventCapturePresenterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$eventCapturePresenterHash,
          dependencies: EventCapturePresenterFamily._dependencies,
          allTransitiveDependencies:
              EventCapturePresenterFamily._allTransitiveDependencies,
        );

  final EventCaptureView view;

  @override
  bool operator ==(Object other) {
    return other is EventCapturePresenterProvider && other.view == view;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, view.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$eventCaptureResourcesHash() =>
    r'33e1bb223dd3e98b6762a2f25d746fae840d5256';

/// See also [eventCaptureResources].
@ProviderFor(eventCaptureResources)
final eventCaptureResourcesProvider =
    AutoDisposeProvider<EventCaptureResourcesProvider>.internal(
  eventCaptureResources,
  name: r'eventCaptureResourcesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$eventCaptureResourcesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef EventCaptureResourcesRef
    = AutoDisposeProviderRef<EventCaptureResourcesProvider>;
String _$configureEventCompletionDialogHash() =>
    r'33bf33c4cc9df29539e4f27dabf938d371d8359f';

/// See also [configureEventCompletionDialog].
@ProviderFor(configureEventCompletionDialog)
final configureEventCompletionDialogProvider =
    AutoDisposeProvider<ConfigureEventCompletionDialog>.internal(
  configureEventCompletionDialog,
  name: r'configureEventCompletionDialogProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$configureEventCompletionDialogHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ConfigureEventCompletionDialogRef
    = AutoDisposeProviderRef<ConfigureEventCompletionDialog>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
