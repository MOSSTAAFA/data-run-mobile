// import 'package:d2_remote/core/mp/period/period_type.dart';

// import '../../../../../form/ui/view_model/view_model_provider.dart';
// import '../domain/configure_event_coordinates.dart';
// import '../domain/configure_event_details.dart';
// import '../domain/configure_event_report_date.dart';
// import '../domain/configure_event_temp.dart';
// import '../domain/configure_org_unit.dart';
// import '../domain/create_or_update_event_details.dart';
// import '../providers/event_detail_resources_provider.dart';
// import 'event_details_view_model_controller.dart';

// /// With NMC it's a factory for the
// /// Controller
// class EventDetailsViewModelFactory
//     implements ViewModelFactory<EventDetailsViewModelController> {
//   const EventDetailsViewModelFactory(
//       {required ConfigureEventDetails configureEventDetails,
//       required ConfigureEventReportDate configureEventReportDate,
//       required ConfigureOrgUnit configureOrgUnit,
//       required ConfigureEventCoordinates configureEventCoordinates,
//       required ConfigureEventTemp configureEventTemp,
//       PeriodType? periodType,
//       // required GeometryController geometryController,
//       // required LocationProvider locationProvider,
//       required CreateOrUpdateEventDetails createOrUpdateEventDetails,
//       required EventDetailResourcesProvider eventDetailResourcesProvider})
//       : _configureEventDetails = configureEventDetails,
//         _configureEventReportDate = configureEventReportDate,
//         _configureOrgUnit = configureOrgUnit,
//         _configureEventCoordinates = configureEventCoordinates,
//         _configureEventTemp = configureEventTemp,
//         _periodType = periodType,
//         // _geometryController = geometryController,
//         // _locationProvider = locationProvider,
//         _createOrUpdateEventDetails = createOrUpdateEventDetails,
//         _eventDetailResourcesProvider = eventDetailResourcesProvider;

//   final ConfigureEventDetails _configureEventDetails;
//   final ConfigureEventReportDate _configureEventReportDate;
//   final ConfigureOrgUnit _configureOrgUnit;
//   final ConfigureEventCoordinates _configureEventCoordinates;
//   final ConfigureEventTemp _configureEventTemp;
//   final PeriodType? _periodType;

//   // GeometryController _geometryController;
//   // LocationProvider _locationProvider;
//   final CreateOrUpdateEventDetails _createOrUpdateEventDetails;
//   final EventDetailResourcesProvider _eventDetailResourcesProvider;

//   @override
//   EventDetailsViewModelController create() {
//     return EventDetailsViewModelController(
//         configureEventDetails: _configureEventDetails,
//         configureEventReportDate: _configureEventReportDate,
//         configureOrgUnit: _configureOrgUnit,
//         configureEventCoordinates: _configureEventCoordinates,
//         configureEventTemp: _configureEventTemp,
//         periodType: _periodType,
//         // geometryController: _geometryController,
//         // locationProvider: _locationProvider,
//         createOrUpdateEventDetails: _createOrUpdateEventDetails,
//         resourcesProvider: _eventDetailResourcesProvider);
//   }

//   @override
//   Type get type => EventDetailsViewModelController;
// }
