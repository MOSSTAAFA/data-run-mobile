// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_capture_form.presenter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$eventCaptureFormPresenterHash() =>
    r'f622b41e837a16cbb07cd5c6c6342598ef22be08';

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

typedef EventCaptureFormPresenterRef
    = AutoDisposeProviderRef<EventCaptureFormPresenter>;

/// See also [eventCaptureFormPresenter].
@ProviderFor(eventCaptureFormPresenter)
const eventCaptureFormPresenterProvider = EventCaptureFormPresenterFamily();

/// See also [eventCaptureFormPresenter].
class EventCaptureFormPresenterFamily
    extends Family<EventCaptureFormPresenter> {
  /// See also [eventCaptureFormPresenter].
  const EventCaptureFormPresenterFamily();

  /// See also [eventCaptureFormPresenter].
  EventCaptureFormPresenterProvider call(
    EventCaptureFormView view,
  ) {
    return EventCaptureFormPresenterProvider(
      view,
    );
  }

  @override
  EventCaptureFormPresenterProvider getProviderOverride(
    covariant EventCaptureFormPresenterProvider provider,
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
  String? get name => r'eventCaptureFormPresenterProvider';
}

/// See also [eventCaptureFormPresenter].
class EventCaptureFormPresenterProvider
    extends AutoDisposeProvider<EventCaptureFormPresenter> {
  /// See also [eventCaptureFormPresenter].
  EventCaptureFormPresenterProvider(
    this.view,
  ) : super.internal(
          (ref) => eventCaptureFormPresenter(
            ref,
            view,
          ),
          from: eventCaptureFormPresenterProvider,
          name: r'eventCaptureFormPresenterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$eventCaptureFormPresenterHash,
          dependencies: EventCaptureFormPresenterFamily._dependencies,
          allTransitiveDependencies:
              EventCaptureFormPresenterFamily._allTransitiveDependencies,
        );

  final EventCaptureFormView view;

  @override
  bool operator ==(Object other) {
    return other is EventCaptureFormPresenterProvider && other.view == view;
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
