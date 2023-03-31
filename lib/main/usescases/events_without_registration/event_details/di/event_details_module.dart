import 'package:d2_remote/core/mp/enrollment/enrollment_status.dart';
import 'package:d2_remote/core/mp/period/period_type.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../commons/data/event_creation_type.dart';
import '../../../../../commons/prefs/preference_provider.dart';
import '../../../../../commons/resources/d2_error_utils.dart';
import '../../../../../commons/resources/resource_manager.dart';
import '../../../../../core/event/event_service_impl.dart';
import '../../../../../form/data/metadata/option_set_configuration.dart';
import '../../../../../form/data/metadata/org_unit_configuration.dart';
import '../../../../../form/ui/field_view_model_factory_impl.dart';
import '../../../../../form/ui/layout_provider_impl.dart';
import '../../../../../form/ui/provider/display_name_provider_impl.dart';
import '../../../../../form/ui/provider/hint_provider_impl.dart';
import '../../../../../form/ui/provider/keyboard_action_provider_impl.dart';
import '../../../../../form/ui/provider/ui_event_types_provider_impl.dart';
import '../../../../../form/ui/provider/ui_style_provider_impl.dart';
import '../../../../../form/ui/style/form_ui_model_color_factory_impl.dart';
import '../../../../../form/ui/style/long_text_ui_color_factory_impl.dart';
import '../data/event_details_repository.dart';
import '../domain/configure_event_coordinates.dart';
import '../domain/configure_event_details.dart';
import '../domain/configure_event_report_date.dart';
import '../domain/configure_event_temp.dart';
import '../domain/configure_org_unit.dart';
import '../domain/create_or_update_event_details.dart';
import '../providers/event_detail_resources_provider.dart';
import '../ui/event_details_view_model_factory.dart';

class EventDetailsModule {
  EventDetailsModule(
      {required BuildContext context,
      String? eventUid,
      required EventCreationType eventCreationType,
      String? programStageUid,
      required String programUid,
      PeriodType? periodType,
      String? enrollmentId,
      required int scheduleInterval,
      String? initialOrgUnitUid,
      EnrollmentStatus? enrollmentStatus})
      : _context = context,
        _eventUid = eventUid,
        _eventCreationType = eventCreationType,
        _programStageUid = programStageUid,
        _programUid = programUid,
        _periodType = periodType,
        _enrollmentId = enrollmentId,
        _scheduleInterval = scheduleInterval,
        _initialOrgUnitUid = initialOrgUnitUid,
        _enrollmentStatus = enrollmentStatus;

  final BuildContext _context;
  final String? _eventUid;
  final EventCreationType _eventCreationType;
  final String? _programStageUid;
  final String _programUid;
  final PeriodType? _periodType;
  final String? _enrollmentId;
  final int _scheduleInterval;
  final String? _initialOrgUnitUid;
  final EnrollmentStatus? _enrollmentStatus;

  EventDetailResourcesProvider provideEventDetailResourceProvider(
      ResourceManager resourceManager) {
    return EventDetailResourcesProvider(resourceManager);
  }

  EventDetailsRepository provideEventDetailsRepository(
      ResourceManager resourceManager) {
    return EventDetailsRepository(
        programUid: _programUid,
        eventUid: _eventUid,
        programStageUid: _programStageUid,
        fieldFactory: FieldViewModelFactoryImpl(
          noMandatoryFields: false,
          uiStyleProvider: UiStyleProviderImpl(
              colorFactory: FormUiModelColorFactoryImpl(
                  context: _context, isBackgroundTransparent: true),
              longTextColorFactory: LongTextUiColorFactoryImpl(
                  context: _context, isBackgroundTransparent: true)),
          layoutProvider: const LayoutProviderImpl(),
          hintProvider: HintProviderImpl(_context),
          displayNameProvider: const DisplayNameProviderImpl(
              OptionSetConfiguration(), OrgUnitConfiguration()),
          uiEventTypesProvider: const UiEventTypesProviderImpl(),
          keyboardActionProvider: const KeyboardActionProviderImpl(),
          // legendValueProvider: LegendValueProviderImpl(resourceManager)
        ),
        d2ErrorMapper: D2ErrorUtils(_context),
        eventService: eventService);
  }

  EventDetailsViewModelFactory eventDetailsViewModelFactory(
      EventDetailsRepository eventDetailsRepository,
      EventDetailResourcesProvider resourcesProvider,
      // DhisPeriodUtils periodUtils,
      PreferenceProvider preferencesProvider,
      // GeometryController geometryController,
      // LocationProvider locationProvider,
      EventDetailResourcesProvider eventDetailResourcesProvider) {
    return EventDetailsViewModelFactory(
        configureEventDetails: ConfigureEventDetails(
            repository: eventDetailsRepository,
            resourcesProvider: resourcesProvider,
            creationType: _eventCreationType,
            enrollmentStatus: _enrollmentStatus),
        configureEventReportDate: ConfigureEventReportDate(
            creationType: _eventCreationType,
            resourceProvider: resourcesProvider,
            repository: eventDetailsRepository,
            periodType: _periodType,
            // periodUtils: periodUtils,
            enrollmentId: _enrollmentId,
            scheduleInterval: _scheduleInterval),
        configureOrgUnit: ConfigureOrgUnit(
            creationType: _eventCreationType,
            repository: eventDetailsRepository,
            preferencesProvider: preferencesProvider,
            programUid: _programUid,
            initialOrgUnitUid: _initialOrgUnitUid),
        configureEventCoordinates:
            ConfigureEventCoordinates(repository: eventDetailsRepository),
        configureEventTemp:
            ConfigureEventTemp(creationType: _eventCreationType),
        periodType: _periodType,
        // geometryController: geometryController,
        // locationProvider: locationProvider,
        createOrUpdateEventDetails: CreateOrUpdateEventDetails(
            repository: eventDetailsRepository,
            resourcesProvider: resourcesProvider),
        eventDetailResourcesProvider: eventDetailResourcesProvider);
  }
}
