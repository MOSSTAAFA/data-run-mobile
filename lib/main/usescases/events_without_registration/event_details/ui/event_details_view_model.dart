import 'package:d2_remote/core/mp/period/period_type.dart';

import '../domain/configure_event_coordinates.dart';
import '../domain/configure_event_details.dart';
import '../domain/configure_event_report_date.dart';
import '../domain/configure_event_temp.dart';
import '../domain/configure_org_unit.dart';
import '../domain/create_or_update_event_details.dart';
import '../providers/event_detail_resources_provider.dart';

class EventDetailsViewModel {
  EventDetailsViewModel(
      {required ConfigureEventDetails configureEventDetails,
      required ConfigureEventReportDate configureEventReportDate,
      required ConfigureOrgUnit configureOrgUnit,
      required ConfigureEventCoordinates configureEventCoordinates,
      required ConfigureEventTemp configureEventTemp,
      PeriodType? periodType,
      // required GeometryController geometryController;
      // required LocationProvider locationProvider;
      required CreateOrUpdateEventDetails createOrUpdateEventDetails,
      required EventDetailResourcesProvider resourcesProvider})
      : _configureEventDetails = configureEventDetails,
        _configureEventReportDate = configureEventReportDate,
        _configureOrgUnit = configureOrgUnit,
        _configureEventCoordinates = configureEventCoordinates,
        _configureEventTemp = configureEventTemp,
        _periodType = periodType,
        // _geometryController = geometryController,
        // _locationProvider = locationProvider,
        _createOrUpdateEventDetails = createOrUpdateEventDetails,
        _resourcesProvider = resourcesProvider;

  final ConfigureEventDetails _configureEventDetails;
  final ConfigureEventReportDate _configureEventReportDate;
  final ConfigureOrgUnit _configureOrgUnit;
  final ConfigureEventCoordinates _configureEventCoordinates;
  final ConfigureEventTemp _configureEventTemp;
  final PeriodType? _periodType;

  // GeometryController _geometryController;
  // LocationProvider _locationProvider;
  final CreateOrUpdateEventDetails _createOrUpdateEventDetails;
  final EventDetailResourcesProvider _resourcesProvider;

  void Function()? showCalendar;
  void Function()? showPeriods;
  void Function()? showOrgUnits;
  void Function()? showNoOrgUnits;
  void Function()? requestLocationPermissions;
  void Function()? showEnableLocationMessage;
  void Function(String featureType, String? initCoordinate)?
      requestLocationByMap;
  void Function()? onButtonClickCallback;
  void Function(String result)? showEventUpdateStatus;
  void Function(String message)? onReopenError;
  void Function(String message)? onReopenSuccess;
}
