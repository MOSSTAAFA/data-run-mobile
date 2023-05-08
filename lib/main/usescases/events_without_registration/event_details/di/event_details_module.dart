import 'package:d2_remote/core/mp/enrollment/enrollment_status.dart';
import 'package:get/get.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../commons/constants.dart';
import '../../../../../commons/data/event_creation_type.dart';
import '../../../../../commons/period/period_extensions.dart';
import '../../../../../commons/resources/d2_error_utils.dart';
import '../../../../../commons/resources/resource_manager.dart';
import '../../../../../core/di/providers.dart';
import '../../../../../form/di/injector.dart';
import '../../../../../form/ui/view_model/view_model_provider.dart';
import '../../../bundle/bundle.dart';
import '../../event_initial/di/event_initial_module.dart';
import '../data/event_details_repository.dart';
import '../domain/configure_event_coordinates.dart';
import '../domain/configure_event_details.dart';
import '../domain/configure_event_report_date.dart';
import '../domain/configure_event_temp.dart';
import '../domain/configure_org_unit.dart';
import '../domain/create_or_update_event_details.dart';
import '../providers/event_detail_resources_provider.dart';
import '../ui/event_details_view_model_factory.dart';

part 'event_details_module.g.dart';

@riverpod
EventDetailResourcesProvider eventDetailResources(EventDetailResourcesRef ref) {
  final ResourceManager resourceManager = ref.read(resourceManagerProvider);
  return EventDetailResourcesProvider(resourceManager);
}

@riverpod
EventDetailsRepository eventDetailsRepository(EventDetailsRepositoryRef ref) {
  // final Bundle eventBundle = ref.read(bundleObjectProvider);
  final Bundle eventBundle = Get.arguments as Bundle;

  return EventDetailsRepository(
      programUid: eventBundle.getString(PROGRAM_UID)!,
      fieldFactory: ref.read(fieldViewModelFactoryProvider(false, true)),
      d2ErrorMapper: ref.read(d2ErrorUtilsProvider),
      eventService: ref.read(eventServiceProvider));
}

@riverpod
EventDetailsViewModelFactory eventDetailsViewModelFactory(
    EventDetailsViewModelFactoryRef ref) {
  // final Bundle bundle = ref.read(bundleObjectProvider);
  final Bundle bundle = Get.arguments as Bundle;

  return EventDetailsViewModelFactory(
      configureEventDetails: ConfigureEventDetails(
          repository: ref.read(eventDetailsRepositoryProvider),
          resourcesProvider: ref.read(eventDetailResourcesProvider),
          creationType:
              bundle.getString(EVENT_CREATION_TYPE).toEventCreationType ??
                  EventCreationType.DEFAULT,
          enrollmentStatus:
              bundle.getString(ENROLLMENT_STATUS).toEnrollmentStatus),
      configureEventReportDate: ConfigureEventReportDate(
          creationType:
              bundle.getString(EVENT_CREATION_TYPE).toEventCreationType ??
                  EventCreationType.DEFAULT,
          resourceProvider: ref.read(eventDetailResourcesProvider),
          repository: ref.read(eventDetailsRepositoryProvider),
          periodType: bundle.getString(EVENT_PERIOD_TYPE).toPeriodType,
          // periodUtils: periodUtils,
          enrollmentId: bundle.getString(ENROLLMENT_UID),
          scheduleInterval: bundle.getInt(EVENT_SCHEDULE_INTERVAL) ?? 0),
      configureOrgUnit: ConfigureOrgUnit(
          creationType:
              bundle.getString(EVENT_CREATION_TYPE).toEventCreationType ??
                  EventCreationType.DEFAULT,
          repository: ref.read(eventDetailsRepositoryProvider),
          preferencesProvider: ref.read(preferencesInstanceProvider),
          programUid: bundle.getString(PROGRAM_UID)!,
          initialOrgUnitUid: bundle.getString(ORG_UNIT)),
      configureEventCoordinates: ConfigureEventCoordinates(
          repository: ref.read(eventDetailsRepositoryProvider)),
      configureEventTemp: ConfigureEventTemp(
          creationType:
              bundle.getString(EVENT_CREATION_TYPE).toEventCreationType ??
                  EventCreationType.DEFAULT),
      periodType: bundle.getString(EVENT_PERIOD_TYPE).toPeriodType,
      // geometryController: geometryController,
      // locationProvider: locationProvider,
      createOrUpdateEventDetails: CreateOrUpdateEventDetails(
          repository: ref.read(eventDetailsRepositoryProvider),
          resourcesProvider: ref.read(eventDetailResourcesProvider)),
      eventDetailResourcesProvider: ref.read(eventDetailResourcesProvider));
}

//EventDetailResourcesProvider
// class EventDetailsModule {
//   EventDetailsModule(
//       {required BuildContext context,
//       String? eventUid,
//       required EventCreationType eventCreationType,
//       String? programStageUid,
//       required String programUid,
//       PeriodType? periodType,
//       String? enrollmentId,
//       required int scheduleInterval,
//       String? initialOrgUnitUid,
//       EnrollmentStatus? enrollmentStatus})
//       : _context = context,
//         _eventUid = eventUid,
//         _eventCreationType = eventCreationType,
//         _programStageUid = programStageUid,
//         _programUid = programUid,
//         _periodType = periodType,
//         _enrollmentId = enrollmentId,
//         _scheduleInterval = scheduleInterval,
//         _initialOrgUnitUid = initialOrgUnitUid,
//         _enrollmentStatus = enrollmentStatus;

//   final BuildContext _context;
//   final String? _eventUid;
//   final EventCreationType _eventCreationType;
//   final String? _programStageUid;
//   final String _programUid;
//   final PeriodType? _periodType;
//   final String? _enrollmentId;
//   final int _scheduleInterval;
//   final String? _initialOrgUnitUid;
//   final EnrollmentStatus? _enrollmentStatus;

//   EventDetailResourcesProvider provideEventDetailResourceProvider(
//       ResourceManager resourceManager) {
//     return EventDetailResourcesProvider(resourceManager);
//   }

// EventDetailsRepository provideEventDetailsRepository(
//     ResourceManager resourceManager) {
//   return EventDetailsRepository(
//       programUid: _programUid,
//       eventUid: _eventUid,
//       programStageUid: _programStageUid,
//       fieldFactory: FieldViewModelFactoryImpl(
//         noMandatoryFields: false,
//         uiStyleProvider: UiStyleProviderImpl(
//             colorFactory: FormUiModelColorFactoryImpl(
//                 context: _context, isBackgroundTransparent: true),
//             longTextColorFactory: LongTextUiColorFactoryImpl(
//                 context: _context, isBackgroundTransparent: true)),
//         layoutProvider: const LayoutProviderImpl(),
//         hintProvider: HintProviderImpl(_context),
//         displayNameProvider: const DisplayNameProviderImpl(
//             OptionSetConfiguration(), OrgUnitConfiguration()),
//         uiEventTypesProvider: const UiEventTypesProviderImpl(),
//         keyboardActionProvider: const KeyboardActionProviderImpl(),
//         // legendValueProvider: LegendValueProviderImpl(resourceManager)
//       ),
//       d2ErrorMapper: D2ErrorUtils(_context),
//       eventService: eventService);
// }

// EventDetailsViewModelFactory eventDetailsViewModelFactory(
//     EventDetailsRepository eventDetailsRepository,
//     EventDetailResourcesProvider resourcesProvider,
//     // DhisPeriodUtils periodUtils,
//     PreferenceProvider preferencesProvider,
//     // GeometryController geometryController,
//     // LocationProvider locationProvider,
//     EventDetailResourcesProvider eventDetailResourcesProvider) {
//   return EventDetailsViewModelFactory(
//       configureEventDetails: ConfigureEventDetails(
//           repository: eventDetailsRepository,
//           resourcesProvider: resourcesProvider,
//           creationType: _eventCreationType,
//           enrollmentStatus: _enrollmentStatus),
//       configureEventReportDate: ConfigureEventReportDate(
//           creationType: _eventCreationType,
//           resourceProvider: resourcesProvider,
//           repository: eventDetailsRepository,
//           periodType: _periodType,
//           // periodUtils: periodUtils,
//           enrollmentId: _enrollmentId,
//           scheduleInterval: _scheduleInterval),
//       configureOrgUnit: ConfigureOrgUnit(
//           creationType: _eventCreationType,
//           repository: eventDetailsRepository,
//           preferencesProvider: preferencesProvider,
//           programUid: _programUid,
//           initialOrgUnitUid: _initialOrgUnitUid),
//       configureEventCoordinates:
//           ConfigureEventCoordinates(repository: eventDetailsRepository),
//       configureEventTemp:
//           ConfigureEventTemp(creationType: _eventCreationType),
//       periodType: _periodType,
//       // geometryController: geometryController,
//       // locationProvider: locationProvider,
//       createOrUpdateEventDetails: CreateOrUpdateEventDetails(
//           repository: eventDetailsRepository,
//           resourcesProvider: resourcesProvider),
//       eventDetailResourcesProvider: eventDetailResourcesProvider);
// }
// }
