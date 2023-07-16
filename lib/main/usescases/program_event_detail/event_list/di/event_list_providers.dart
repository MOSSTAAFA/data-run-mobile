import 'package:d2_remote/modules/metadata/program/entities/program.entity.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../commons/data/event_view_model.dart';
import '../../program_event_detail_repository.dart';
import '../../program_event_detail_repository_impl.dart';

part 'event_list_providers.g.dart';

// @riverpod
// Future<EventListPresenter> eventListPresenter(EventListPresenterRef ref) async {
//   final EventListPresenter eventListPresenter = EventListPresenter(ref);
//   await AsyncValue.guard(() => eventListPresenter.init());
//   return eventListPresenter;
// }

// @riverpod
// String programUid(ProgramUidRef ref) {

//   return uid;
// }

@riverpod
Future<Program> eventListProgram(EventListProgramRef ref) async {
  final ProgramEventDetailRepository eventRepository =
      ref.read(programEventDetailRepositoryProvider);

  return eventRepository.program();
}

@riverpod
class ProgramEvents extends _$ProgramEvents {
  @override
  Future<IList<EventModel>> build() {
    final eventRepository = ref.read(programEventDetailRepositoryProvider);

    return eventRepository.programEvents();
  }
}

/// LiveData<PagedList<EventViewModel>> filteredProgramEvents()
/// in ProgramEventDetailRepositoryImpl
@riverpod
Future<IList<EventModel>> filteredProgramEvents(
    FilteredProgramEventsRef ref) async {
  // TODO(NMC): implement Filtering of events
  final IList<EventModel>? events = ref.watch(programEventsProvider).value;

  /// Filter events
  final IList<EventModel> filteredEvents = events ?? IList<EventModel>();

  /// the list filtering is now cached
  /// the list of filtered events will not be recomputed until events
  /// are added/removed/updated,
  /// even if we are reading the list of completed todos multiple times.
  return filteredEvents;
}

@riverpod
Future<int> filteredProgramEventsListLength(
    FilteredProgramEventsListLengthRef ref) {
  return ref.watch(filteredProgramEventsProvider
      .selectAsync((IList<EventModel> list) => list.length));
}

@riverpod
int eventModelItemIndex(EventModelItemIndexRef ref) {
  throw UnimplementedError();
}

@Riverpod(dependencies: [eventModelItemIndex])
Future<EventModel?> eventModelItem(EventModelItemRef ref) async {
  // final int index = ref.read(eventModelItemIndexProvider);
  // final EventModel item = await ref.watch(filteredProgramEventsProvider
  //     .selectAsync((IList<EventModel> e) => e[index]));
  // return item;

  final IList<EventModel>? items =
      ref.watch(filteredProgramEventsProvider).value;
  if (items != null && items.isNotEmpty) {
    final int index = ref.watch(eventModelItemIndexProvider);
    return items[index];
  }

  return null;
}
