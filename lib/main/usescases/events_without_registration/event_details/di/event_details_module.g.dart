// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_details_module.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$eventDetailResourcesHash() =>
    r'222d1c42c610a1f841883f7268036dc773734f19';

/// See also [eventDetailResources].
@ProviderFor(eventDetailResources)
final eventDetailResourcesProvider =
    AutoDisposeProvider<EventDetailResourcesProvider>.internal(
  eventDetailResources,
  name: r'eventDetailResourcesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$eventDetailResourcesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef EventDetailResourcesRef
    = AutoDisposeProviderRef<EventDetailResourcesProvider>;
String _$eventDetailsRepositoryHash() =>
    r'd405466a750c67f3df81d7ecb3dd3a9f20a9d485';

/// See also [eventDetailsRepository].
@ProviderFor(eventDetailsRepository)
final eventDetailsRepositoryProvider =
    AutoDisposeProvider<EventDetailsRepository>.internal(
  eventDetailsRepository,
  name: r'eventDetailsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$eventDetailsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef EventDetailsRepositoryRef
    = AutoDisposeProviderRef<EventDetailsRepository>;
String _$eventDetailsViewModelControllerHash() =>
    r'7128207b12471607f78d148512c2fdead6f08fe6';

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

/// See also [eventDetailsViewModelController].
@ProviderFor(eventDetailsViewModelController)
const eventDetailsViewModelControllerProvider =
    EventDetailsViewModelControllerFamily();

/// See also [eventDetailsViewModelController].
class EventDetailsViewModelControllerFamily
    extends Family<EventDetailsViewModelController> {
  /// See also [eventDetailsViewModelController].
  const EventDetailsViewModelControllerFamily();

  /// See also [eventDetailsViewModelController].
  EventDetailsViewModelControllerProvider call(
    EventDetailsView view,
  ) {
    return EventDetailsViewModelControllerProvider(
      view,
    );
  }

  @override
  EventDetailsViewModelControllerProvider getProviderOverride(
    covariant EventDetailsViewModelControllerProvider provider,
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
  String? get name => r'eventDetailsViewModelControllerProvider';
}

/// See also [eventDetailsViewModelController].
class EventDetailsViewModelControllerProvider
    extends AutoDisposeProvider<EventDetailsViewModelController> {
  /// See also [eventDetailsViewModelController].
  EventDetailsViewModelControllerProvider(
    EventDetailsView view,
  ) : this._internal(
          (ref) => eventDetailsViewModelController(
            ref as EventDetailsViewModelControllerRef,
            view,
          ),
          from: eventDetailsViewModelControllerProvider,
          name: r'eventDetailsViewModelControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$eventDetailsViewModelControllerHash,
          dependencies: EventDetailsViewModelControllerFamily._dependencies,
          allTransitiveDependencies:
              EventDetailsViewModelControllerFamily._allTransitiveDependencies,
          view: view,
        );

  EventDetailsViewModelControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.view,
  }) : super.internal();

  final EventDetailsView view;

  @override
  Override overrideWith(
    EventDetailsViewModelController Function(
            EventDetailsViewModelControllerRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: EventDetailsViewModelControllerProvider._internal(
        (ref) => create(ref as EventDetailsViewModelControllerRef),
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
  AutoDisposeProviderElement<EventDetailsViewModelController> createElement() {
    return _EventDetailsViewModelControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EventDetailsViewModelControllerProvider &&
        other.view == view;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, view.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin EventDetailsViewModelControllerRef
    on AutoDisposeProviderRef<EventDetailsViewModelController> {
  /// The parameter `view` of this provider.
  EventDetailsView get view;
}

class _EventDetailsViewModelControllerProviderElement
    extends AutoDisposeProviderElement<EventDetailsViewModelController>
    with EventDetailsViewModelControllerRef {
  _EventDetailsViewModelControllerProviderElement(super.provider);

  @override
  EventDetailsView get view =>
      (origin as EventDetailsViewModelControllerProvider).view;
}

String _$eventDetailsModelHash() => r'beeceea3330c916f3c224afc7fe2691124753ce9';

/// See also [EventDetailsModel].
@ProviderFor(EventDetailsModel)
final eventDetailsModelProvider = AutoDisposeNotifierProvider<EventDetailsModel,
    EventDetailsViewModel>.internal(
  EventDetailsModel.new,
  name: r'eventDetailsModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$eventDetailsModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EventDetailsModel = AutoDisposeNotifier<EventDetailsViewModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
