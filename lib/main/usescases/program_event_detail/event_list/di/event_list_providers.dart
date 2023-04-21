import 'package:d2_remote/modules/metadata/program/entities/program.entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../commons/data/event_view_model.dart';
import '../../di/program_event_detail_providers.dart';
import '../../program_event_detail_repository.dart';

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
  Future<List<EventModel>> build() {
    final eventRepository = ref.read(programEventDetailRepositoryProvider);

    return eventRepository.programEvents();
  }
}

/// LiveData<PagedList<EventViewModel>> filteredProgramEvents()
/// in ProgramEventDetailRepositoryImpl
@riverpod
Future<List<EventModel>> filteredProgramEvents(
    FilteredProgramEventsRef ref) async {
  // TODO(NMC): implement Filtering of events
  final List<EventModel> events = await ref.watch(programEventsProvider.future);

  /// Filter events
  final List<EventModel> filteredEvents = events;

  /// the list filtering is now cached
  /// the list of filtered events will not be recomputed until events
  /// are added/removed/updated,
  /// even if we are reading the list of completed todos multiple times.
  return filteredEvents;
}

@riverpod
int eventModelItemIndex(EventModelItemIndexRef ref) {
  throw UnimplementedError();
}

@riverpod
Future<EventModel> eventModelItem(EventModelItemRef ref) async {
  final int index = ref.read(eventModelItemIndexProvider);
  final EventModel item = await ref.watch(filteredProgramEventsProvider
      .selectAsync((List<EventModel> e) => e[index]));

  return item;
}
