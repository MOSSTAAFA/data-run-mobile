import 'package:get/get.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../commons/constants.dart';
import '../../../../../commons/resources/resource_manager.dart';
import '../../../bundle/bundle.dart';
import '../../event_initial/di/event_initial_module.dart';
import '../domain/configure_event_completion_dialog.dart';
import '../event_capture_contract.dart';
import '../event_capture_presenter_impl.dart';
import '../event_capture_repository_impl.dart';
import '../provider/event_capture_resources_provider.dart';

part 'event_capture_module.g.dart';

@riverpod
EventCaptureRepository eventCaptureRepository(EventCaptureRepositoryRef ref) {
  final Bundle bundle = Get.arguments as Bundle;
  return EventCaptureRepositoryImpl(ref, bundle.getString(EVENT_UID));
}

@riverpod
EventCapturePresenter eventCapturePresenter(
    EventCapturePresenterRef ref, EventCaptureView view) {
  final Bundle bundle = Get.arguments as Bundle;
  return EventCapturePresenterImpl(
    ref,
    eventCaptureRepository: ref.watch(eventCaptureRepositoryProvider),
    eventUid: bundle.getString(EVENT_UID)!,
    view: view,
    preferences: ref.watch(preferencesInstanceProvider),
    configureEventCompletionDialog:
        ref.watch(configureEventCompletionDialogProvider),
  );
}

@riverpod
EventCaptureResourcesProvider eventCaptureResources(
    EventCaptureResourcesRef ref) {
  return EventCaptureResourcesProvider(ref.read(resourceManagerProvider));
}

@riverpod
ConfigureEventCompletionDialog configureEventCompletionDialog(
    ConfigureEventCompletionDialogRef ref) {
  return ConfigureEventCompletionDialog(
      ref.read(eventCaptureResourcesProvider));
}

/// TODO(NMC): Maybe Overrid Provider
// @Provides
//     @PerActivity
//     FormValueStore valueStore(
//             @NonNull D2 d2,
//             CrashReportController crashReportController,
//             NetworkUtils networkUtils,
//             ResourceManager resourceManager
//     ) {
//         return new FormValueStore(
//                 d2,
//                 eventUid,
//                 EntryMode.DE,
//                 null,
//                 crashReportController,
//                 networkUtils,
//                 resourceManager
//         );
//     }
// @Provides
//     @PerActivity
//     NavigationPageConfigurator pageConfigurator(
//             EventCaptureContract.EventCaptureRepository repository
//     ) {
//         return new EventPageConfigurator(repository);
//     }

//     @Provides
//     @PerActivity
//     ConfigureEventCompletionDialog provideConfigureEventCompletionDialog(
//             EventCaptureResourcesProvider eventCaptureResourcesProvider
//     ) {
//         return new ConfigureEventCompletionDialog(eventCaptureResourcesProvider);
//     }

//     @Provides
//     @PerActivity
//     EventCaptureResourcesProvider provideEventCaptureResourcesProvider(
//             ResourceManager resourceManager
//     ) {
//         return new EventCaptureResourcesProvider(resourceManager);
//     }
