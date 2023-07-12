import 'package:d2_remote/core/common/feature_type.dart';
import 'package:d2_remote/core/mp/helpers/result.dart';
import 'package:d2_remote/core/mp/period/period_type.dart';

import '../../../../../commons/extensions/list_extensions.dart';
import '../../../../../commons/extensions/standard_extensions.dart';
import '../di/event_details_module.dart';
import '../domain/configure_event_coordinates.dart';
import '../domain/configure_event_details.dart';
import '../domain/configure_event_report_date.dart';
import '../domain/configure_event_temp.dart';
import '../domain/configure_org_unit.dart';
import '../domain/create_or_update_event_details.dart';
import '../models/event_temp.dart';
import '../models/event_temp_status.dart';
import '../providers/event_detail_resources_provider.dart';
import 'event_details_view.dart';

/// EventDetailsViewModel
class EventDetailsViewModelController {
  EventDetailsViewModelController(this.ref, this.view,
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

  final EventDetailsViewModelControllerRef ref;
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

  final EventDetailsView view;

  // void Function()? showCalendar;
  // void Function()? showPeriods;
  // void Function()? showOrgUnits;
  // void Function()? showNoOrgUnits;
  // void Function()? requestLocationPermissions;
  // void Function()? showEnableLocationMessage;
  // void Function(String featureType, String? initCoordinate)?
  //     requestLocationByMap;
  // void Function()? onButtonClickCallback;
  // void Function(String result)? showEventUpdateStatus;
  // void Function(String message)? onReopenError;
  // void Function(String message)? onReopenSuccess;

  // final Rx<EventDetails> _eventDetails = Rx<EventDetails>(const EventDetails());

  // Stream<EventDetails> get eventDetails => _eventDetails.stream;

  // final Rx<EventDate> _eventDate = Rx<EventDate>(const EventDate());

  // Stream<EventDate> get eventDate => _eventDate.stream;

  // final Rx<EventOrgUnit> _eventOrgUnit = Rx<EventOrgUnit>(const EventOrgUnit());

  // Stream<EventOrgUnit> get eventOrgUnit => _eventOrgUnit.stream;

  // final Rx<EventCoordinates> _eventCoordinates =
  //     Rx<EventCoordinates>(const EventCoordinates());

  // Stream<EventCoordinates> get eventCoordinates => _eventCoordinates.stream;

  // final Rx<EventTemp> _eventTemp = Rx<EventTemp>(const EventTemp());

  // Stream<EventTemp> get eventTemp => _eventTemp.stream;

  Future<void> _loadEventDetails() async {
    await _setUpEventDetails();
    await setUpEventReportDate();
    // await _setUpCoordinates();
    await setUpEventTemp();
  }

  Future<void> _setUpEventDetails() async {
    final currentModel = ref.read(eventDetailsModelProvider);

    ref.read(eventDetailsModelProvider.notifier).updateWith(
        eventDetails: await _configureEventDetails(
            selectedDate: currentModel.eventDate.currentDate,
            selectedOrgUnit: currentModel.eventOrgUnit.selectedOrgUnit?.id,
            coordinates: currentModel.eventCoordinates.model?.value,
            tempCreate: currentModel.eventTemp.status?.name));
  }

  Future<void> setUpEventReportDate({DateTime? selectedDate}) async {
    final currentModel = ref.read(eventDetailsModelProvider);
    ref
        .read(eventDetailsModelProvider.notifier)
        .updateWith(eventDate: await _configureEventReportDate(selectedDate));

    await _setUpEventDetails();
    await setUpOrgUnit(selectedDate: currentModel.eventDate.currentDate);
  }

  Future<void> setUpOrgUnit(
      {DateTime? selectedDate, String? selectedOrgUnit}) async {
    ref.read(eventDetailsModelProvider.notifier).updateWith(
        eventOrgUnit: await _configureOrgUnit(selectedDate, selectedOrgUnit));
    await _setUpEventDetails();
  }

  // TODO(NMC): after implementing coordinate
  // Future<void> _setUpCoordinates({String value = ''}) {
  //   _configureEventCoordinates(value).then((eventCoordinates) {
  //     eventCoordinates.model.setCallback(
  //         geometryController.getCoordinatesCallback(
  //           updateCoordinates: (value) => _setUpCoordinates(value),
  //           currentLocation: requestCurrentLocation(),
  //           mapRequest: (_, featureType, initCoordinate) =>
  //               requestLocationByMap?.call(featureType, initCoordinate),
  //         ));
  //     _eventCoordinates.value = eventCoordinates;
  //     _setUpEventDetails();
  //   });
  // }

  Future<void> setUpEventTemp(
      {EventTempStatus? status, bool isChecked = true}) async {
    if (isChecked) {
      _configureEventTemp(status).apply((EventTemp value) {
        ref
            .read(eventDetailsModelProvider.notifier)
            .updateWith(eventTemp: value);
      });
      await _setUpEventDetails();
    }
  }

  void onDateClick() {
    _periodType != null ? view.showPeriods() : view.showDateDialog();
  }

  Future<void> onDateSet(int year, int month, int day) async {
    final DateTime selectedDate = DateTime(year, month, day);
    await setUpEventReportDate(selectedDate: selectedDate);
  }

  void onOrgUnitClick() {
    final currentModel = ref.read(eventDetailsModelProvider);
    if (!currentModel.eventOrgUnit.fixed) {
      if (currentModel.eventOrgUnit.orgUnits.isNullOrEmpty) {
        view.showNoOrgUnitsDialog();
      } else {
        view.showOrgUnitDialog();
      }
    }
  }

  void onLocationByMapSelected(FeatureType featureType, String? coordinates) {
    // final Geometry? geometry = geometryController
    //     .generateLocationFromCoordinates(
    //     featureType,
    //     coordinates);
    // geometry?.let((it) => setUpCoordinates(it.coordinates()));
  }

  void onButtonClick() {
    view.onButtonClickCallback();
  }

  Future<void> onActionButtonClick() async {
    final currentModel = ref.read(eventDetailsModelProvider);
    await currentModel.eventDetails.selectedDate?.aLet((DateTime date) =>
        _createOrUpdateEventDetails(
                selectedDate: date,
                selectedOrgUnit: currentModel.eventDetails.selectedOrgUnit,
                coordinates: currentModel.eventDetails.coordinates)
            .then((Result<String, dynamic> result) {
          result.fold(
            (dynamic failure) => view.showEventUpdateStatus(failure.toString()),
            (String message) => view.showEventUpdateStatus(message),
          );
        }));
  }

  Future<void> onReopenClick() async {
    final Result<String, dynamic> result =
        await _configureEventDetails.reopenEvent();
    if (result.isSuccess) {
      await _loadEventDetails();
      view.onReopenSuccess(_resourcesProvider.provideReOpened());
    }

    if (result.isFailure) {
      result.error?.let((Exception it) => view.onReopenError(it.toString()));
    }
  }

// Future<void> cancelCoordinateRequest() async {
//   await _setUpCoordinates(value: _eventCoordinates.value.model?.value);
// }
}
