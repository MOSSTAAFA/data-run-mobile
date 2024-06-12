// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mp_program_utils.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mpProgramUtilsHash() => r'6f56226ebb072c04083ac9f35ecebdcc51ae1c89';

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

/// See also [mpProgramUtils].
@ProviderFor(mpProgramUtils)
const mpProgramUtilsProvider = MpProgramUtilsFamily();

/// See also [mpProgramUtils].
class MpProgramUtilsFamily extends Family<MpProgramUtils> {
  /// See also [mpProgramUtils].
  const MpProgramUtilsFamily();

  /// See also [mpProgramUtils].
  MpProgramUtilsProvider call(
    EventQuery eventQuery,
  ) {
    return MpProgramUtilsProvider(
      eventQuery,
    );
  }

  @override
  MpProgramUtilsProvider getProviderOverride(
    covariant MpProgramUtilsProvider provider,
  ) {
    return call(
      provider.eventQuery,
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
  String? get name => r'mpProgramUtilsProvider';
}

/// See also [mpProgramUtils].
class MpProgramUtilsProvider extends Provider<MpProgramUtils> {
  /// See also [mpProgramUtils].
  MpProgramUtilsProvider(
    EventQuery eventQuery,
  ) : this._internal(
          (ref) => mpProgramUtils(
            ref as MpProgramUtilsRef,
            eventQuery,
          ),
          from: mpProgramUtilsProvider,
          name: r'mpProgramUtilsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$mpProgramUtilsHash,
          dependencies: MpProgramUtilsFamily._dependencies,
          allTransitiveDependencies:
              MpProgramUtilsFamily._allTransitiveDependencies,
          eventQuery: eventQuery,
        );

  MpProgramUtilsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.eventQuery,
  }) : super.internal();

  final EventQuery eventQuery;

  @override
  Override overrideWith(
    MpProgramUtils Function(MpProgramUtilsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MpProgramUtilsProvider._internal(
        (ref) => create(ref as MpProgramUtilsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        eventQuery: eventQuery,
      ),
    );
  }

  @override
  ProviderElement<MpProgramUtils> createElement() {
    return _MpProgramUtilsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MpProgramUtilsProvider && other.eventQuery == eventQuery;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, eventQuery.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MpProgramUtilsRef on ProviderRef<MpProgramUtils> {
  /// The parameter `eventQuery` of this provider.
  EventQuery get eventQuery;
}

class _MpProgramUtilsProviderElement extends ProviderElement<MpProgramUtils>
    with MpProgramUtilsRef {
  _MpProgramUtilsProviderElement(super.provider);

  @override
  EventQuery get eventQuery => (origin as MpProgramUtilsProvider).eventQuery;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
