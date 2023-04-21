// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_list_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$eventListProgramHash() => r'a2c81afc1155b266c067d8d222211bee38567af5';

/// See also [eventListProgram].
@ProviderFor(eventListProgram)
final eventListProgramProvider = AutoDisposeFutureProvider<Program>.internal(
  eventListProgram,
  name: r'eventListProgramProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$eventListProgramHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef EventListProgramRef = AutoDisposeFutureProviderRef<Program>;
String _$filteredProgramEventsHash() =>
    r'80547d7ccede0c0b1d381fd28e8aca955a779dc3';

/// LiveData<PagedList<EventViewModel>> filteredProgramEvents()
/// in ProgramEventDetailRepositoryImpl
///
/// Copied from [filteredProgramEvents].
@ProviderFor(filteredProgramEvents)
final filteredProgramEventsProvider =
    AutoDisposeFutureProvider<List<EventModel>>.internal(
  filteredProgramEvents,
  name: r'filteredProgramEventsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$filteredProgramEventsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FilteredProgramEventsRef
    = AutoDisposeFutureProviderRef<List<EventModel>>;
String _$eventModelItemIndexHash() =>
    r'72da93e08c4a5b1e93ee5661df6f690930986e01';

/// See also [eventModelItemIndex].
@ProviderFor(eventModelItemIndex)
final eventModelItemIndexProvider = AutoDisposeProvider<int>.internal(
  eventModelItemIndex,
  name: r'eventModelItemIndexProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$eventModelItemIndexHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef EventModelItemIndexRef = AutoDisposeProviderRef<int>;
String _$eventModelItemHash() => r'512ae25a852c1c8009cc5efb5b1e49681642ef69';

/// See also [eventModelItem].
@ProviderFor(eventModelItem)
final eventModelItemProvider = AutoDisposeFutureProvider<EventModel>.internal(
  eventModelItem,
  name: r'eventModelItemProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$eventModelItemHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef EventModelItemRef = AutoDisposeFutureProviderRef<EventModel>;
String _$programEventsHash() => r'1ef683c7b5dc76d091edf18c69016e859ac4b225';

/// See also [ProgramEvents].
@ProviderFor(ProgramEvents)
final programEventsProvider =
    AutoDisposeAsyncNotifierProvider<ProgramEvents, List<EventModel>>.internal(
  ProgramEvents.new,
  name: r'programEventsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$programEventsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProgramEvents = AutoDisposeAsyncNotifier<List<EventModel>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
