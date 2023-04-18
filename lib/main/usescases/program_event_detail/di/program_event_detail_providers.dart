import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../commons/data/event_view_model.dart';
import '../program_event_detail_contract.dart';
import '../program_event_detail_presenter.dart';
import '../program_event_detail_repository.dart';
import '../program_event_detail_repository_impl.dart';
import '../program_event_mapper.dart';

part 'program_event_detail_providers.g.dart';

@riverpod
ProgramEventMapper programEventMapper(ProgramEventMapperRef ref) {
  return ProgramEventMapper(ref);
}

/// ProgramEventDetailPresenter
@riverpod
ProgramEventDetailRepository programEventDetailRepository(
    ProgramEventDetailRepositoryRef ref) {
  return ProgramEventDetailRepositoryImpl(
      ref, ref.read(programEventMapperProvider));
}

@riverpod
ProgramEventDetailPresenter programEventDetailPresenter(
    ProgramEventDetailPresenterRef ref, ProgramEventDetailView view) {
  return ProgramEventDetailPresenterImpl(ref, view);
}

@riverpod
class ProgramEvents extends _$ProgramEvents {
  @override
  List<EventModel> build() {
    return [];
  }

  void setValue(List<EventModel> value) {
    state = value;
  }
}

/// LiveData<PagedList<EventViewModel>> filteredProgramEvents()
/// in ProgramEventDetailRepositoryImpl
@riverpod
List<EventModel> filteredProgramEvents(FilteredProgramEventsRef ref) {
  // TODO(NMC): implement Filtering of events
  final List<EventModel> programEvents = ref.watch(programEventsProvider);

  /// the list filtering is now cached
  /// the list of filtered events will not be recomputed until events
  /// are added/removed/updated,
  /// even if we are reading the list of completed todos multiple times.
  return programEvents;
}
