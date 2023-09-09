import 'package:d2_remote/core/mp/enrollment/enrollment_status.dart';
import 'package:d2_remote/core/mp/period/period_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../../../../../commons/constants.dart';
import '../../../../../commons/custom_widgets/org_unit_dialog.dart';
import '../../../../../commons/data/event_creation_type.dart';
import '../../../../../commons/extensions/standard_extensions.dart';
import '../../../../../commons/period/period_extensions.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../bundle/bundle.dart';
import '../../../general/view_base.dart';
import '../di/event_details_module.dart';
import '../models/event_details.dart';
import 'event_details_view.dart';
import 'event_details_view_model_controller.dart';

/// EventDetailsFragment
/// display a clicked event in a events lists of a program
/// A widget with scaffold bar containing (back, name, sync, percentage, more:)
/// it shows the main Info Of an event
/// The first screen of and Event that appear in Detail tab of [EventCapturePagerWidget]
/// among (DataEntry Tab, Analytics Tab, and Notes Tab) in the [EventCapturePagerWidget] by [EventCaptureScreen]
class EventDetailsScreen extends ConsumerStatefulWidget {
  const EventDetailsScreen({
    super.key,
    this.onEventDetailsChange,
    this.onButtonCallback,
    this.onEventReopened,
  });

  /// .read(eventDetailsViewModelProvider)
  // final EventDetailsViewModel viewModel;
  // final String? eventUid;
  // final String programUid;
  final void Function(EventDetails eventDetails)? onEventDetailsChange;
  final void Function()? onButtonCallback;
  final void Function()? onEventReopened;

  @override
  ConsumerState<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends ConsumerState<EventDetailsScreen>
    with EventDetailsView, ViewBase {
  late final EventDetailsViewModelController _eventDetailsViewModelController;
  late final String? activityUid;
  late final String? initialOrgUnitUid;
  late final String? eventUid;
  late final String programUid;
  late final String? programStageUid;
  late final PeriodType? periodType;
  late final String? enrollmentId;
  late final int scheduleInterval;
  late final EnrollmentStatus? enrollmentStatus;
  late final EventCreationType eventCreationType;

  @override
  Widget build(BuildContext context) {
    debugPrint('build(): $runtimeType');
    return Container();
  }

  @override
  void initState() {
    // final Bundle bundle = Get.arguments as Bundle;
    // final Bundle bundle = ref.read(bundleObjectProvider);
    _eventDetailsViewModelController =
        ref.read(eventDetailsViewModelControllerProvider(this));

    final Bundle bundle = Get.arguments as Bundle;

    activityUid = bundle.getString(ACTIVITY_UID);
    initialOrgUnitUid = bundle.getString(ORG_UNIT);
    eventUid = bundle.getString(EVENT_UID);
    programUid = bundle.getString(PROGRAM_UID)!;
    programStageUid = bundle.getString(PROGRAM_STAGE_UID);
    periodType = bundle.getString(EVENT_PERIOD_TYPE).toPeriodType;
    enrollmentId = bundle.getString(ENROLLMENT_UID);
    scheduleInterval = bundle.getInt(EVENT_SCHEDULE_INTERVAL) ?? 0;
    enrollmentStatus = bundle.getString(ENROLLMENT_STATUS).toEnrollmentStatus;
    eventCreationType =
        bundle.getString(EVENT_CREATION_TYPE).toEventCreationType ??
            EventCreationType.DEFAULT;

    super.initState();
  }

  @override
  Future<void> showDateDialog() async {
    final eventViemModel = ref.read(eventDetailsModelProvider);
    final AppLocalization localization = AppLocalization.of(context)!;
    final DateTime firstDate =
        eventViemModel.eventDate.minDate ?? DateTime(1990);
    DateTime? lastDate =
        eventViemModel.eventDate.maxDate ?? DateTime(DateTime.now().year + 5);
    final DateTime initialDate =
        eventViemModel.eventDate.currentDate ?? DateTime.now();

    if (!eventViemModel.eventDate.allowFutureDates) {
      lastDate = DateTime.now();
    }

    // final store = StoreProvider.of<AppState>(context);
    final DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate,
        lastDate: lastDate,
        locale: const Locale('en', 'US'),
        confirmText: localization.lookup('ok'),
        cancelText: localization.lookup('cancel')
        //initialEntryMode: DatePickerEntryMode.input,
        );

    if (selectedDate != null) {
      _eventDetailsViewModelController.onDateSet(
          selectedDate.year, selectedDate.month, selectedDate.day);
    }
  }

  @override
  Future<void> showOrgUnitDialog() async {
    final AppLocalization localization = AppLocalization.of(context)!;

    final eventOrgUnit = ref.read(eventDetailsModelProvider).eventOrgUnit;

    final result = await showDialog(
      context: context,
      builder: (BuildContext context) => OrgUnitDialog(
        orgUnits: eventOrgUnit.orgUnits,
        onNegativeListener: () => Navigator.pop(context),
        onPossitiveListener: (selectedOrgUnit) =>
            _eventDetailsViewModelController.setUpOrgUnit(
                selectedOrgUnit: selectedOrgUnit),
      ),
    );
  }

  @override
  Future<void> showNoOrgUnitsDialog() async {
    final AppLocalization localization = AppLocalization.of(context)!;
    await showInfoDialog(
        title: localization.lookup('R.error'),
        message: localization.lookup('R.no_org_units'));
  }

  EventCreationType _getEventCreationType(String? typeString) {
    return typeString
        .let((it) => it.toEventCreationType)
        .orElse(() => EventCreationType.DEFAULT);
  }

  @override
  void onButtonClickCallback() {
    // TODO: implement onButtonClickCallback
  }

  @override
  void onReopenError(String message) {
    // TODO: implement onReopenError
  }

  @override
  void onReopenSuccess(String message) {
    // TODO: implement onReopenSuccess
  }

  @override
  void requestLocationByMap(String featureType, String? initCoordinate) {
    // TODO: implement requestLocationByMap
  }

  @override
  void requestLocationPermissions() {
    // TODO: implement requestLocationPermissions
  }

  @override
  void showEnableLocationMessage() {
    // TODO: implement showEnableLocationMessage
  }

  @override
  void showEventUpdateStatus(String result) {
    // TODO: implement showEventUpdateStatus
  }

  @override
  void showPeriods() {
    // TODO: implement showPeriods
  }
}
