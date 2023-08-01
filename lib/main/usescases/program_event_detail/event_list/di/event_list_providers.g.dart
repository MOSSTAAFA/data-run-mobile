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
    r'b31dc46cda2cfc2aaa839bd775d8526544647b7d';

/// LiveData<PagedList<EventViewModel>> filteredProgramEvents()
/// in ProgramEventDetailRepositoryImpl
///
/// Copied from [filteredProgramEvents].
@ProviderFor(filteredProgramEvents)
final filteredProgramEventsProvider =
    AutoDisposeFutureProvider<IList<EventModel>>.internal(
  filteredProgramEvents,
  name: r'filteredProgramEventsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$filteredProgramEventsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FilteredProgramEventsRef
    = AutoDisposeFutureProviderRef<IList<EventModel>>;
String _$filteredProgramEventsListLengthHash() =>
    r'e83a1ceca75bb1e230c2be03d998d6db6ae55b08';

/// See also [filteredProgramEventsListLength].
@ProviderFor(filteredProgramEventsListLength)
final filteredProgramEventsListLengthProvider =
    AutoDisposeFutureProvider<int>.internal(
  filteredProgramEventsListLength,
  name: r'filteredProgramEventsListLengthProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$filteredProgramEventsListLengthHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FilteredProgramEventsListLengthRef = AutoDisposeFutureProviderRef<int>;
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
String _$eventModelItemHash() => r'35da6588236c696377c2af1043683d7da72d1869';

/// See also [eventModelItem].
@ProviderFor(eventModelItem)
final eventModelItemProvider = AutoDisposeFutureProvider<EventModel?>.internal(
  eventModelItem,
  name: r'eventModelItemProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$eventModelItemHash,
  dependencies: <ProviderOrFamily>[eventModelItemIndexProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    eventModelItemIndexProvider,
    ...?eventModelItemIndexProvider.allTransitiveDependencies
  },
);

typedef EventModelItemRef = AutoDisposeFutureProviderRef<EventModel?>;
String _$programEventsHash() => r'899beff284d7e621edd9fb38004d00a75661e896';

/// See also [ProgramEvents].
@ProviderFor(ProgramEvents)
final programEventsProvider =
    AutoDisposeAsyncNotifierProvider<ProgramEvents, IList<EventModel>>.internal(
  ProgramEvents.new,
  name: r'programEventsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$programEventsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProgramEvents = AutoDisposeAsyncNotifier<IList<EventModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
