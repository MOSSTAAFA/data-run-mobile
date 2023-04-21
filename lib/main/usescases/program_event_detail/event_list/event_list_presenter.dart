// import 'package:d2_remote/modules/metadata/program/entities/program.entity.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../../../commons/data/event_view_model.dart';
// import '../../../../commons/prefs/preference_provider.dart';
// import '../../events_without_registration/event_initial/di/event_initial_module.dart';
// import '../di/program_event_detail_providers.dart';
// import '../program_event_detail_repository.dart';

// class EventListPresenter {
//   EventListPresenter(this.ref);
//   // final FilterManager filterManager;
//   final AutoDisposeRef ref;
//   late final ProgramEventDetailRepository eventRepository;
//   late final PreferenceProvider preferences;

//   Future<void> init() async {
//     eventRepository = ref.read(programEventDetailRepositoryProvider);
//     preferences = ref.read(preferencesProvider);
//     await eventRepository.programEvents().then((List<EventModel> value) =>
//         ref.read(programEventsProvider.notifier).setValue(value));
//   }

//   Future<Program> program() {
//     return eventRepository.program();
//   }
// }
