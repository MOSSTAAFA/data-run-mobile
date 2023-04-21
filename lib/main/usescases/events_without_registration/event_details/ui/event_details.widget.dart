import 'package:d2_remote/core/mp/enrollment/enrollment_status.dart';
import 'package:d2_remote/core/mp/period/period_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../../../../../commons/constants.dart';
import '../../../../../commons/data/event_creation_type.dart';
import '../../../../../commons/period/period_extensions.dart';
import '../../../../../core/enrollment/enrollment_extensions.dart';
import '../../../bundle/bundle.dart';
import '../models/event_details.dart';
import 'event_details_view_model.dart';

/// EventDetailsFragment
class EventDetailsView extends ConsumerStatefulWidget {
  const EventDetailsView({
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
  ConsumerState<EventDetailsView> createState() => _EventDetailsViewState();
}

class _EventDetailsViewState extends ConsumerState<EventDetailsView> {
  late final String? activityUid;
  late final String? orgUnit;
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
    return Container();
  }

  @override
  void initState() {
    super.initState();
    // final Bundle bundle = Get.arguments as Bundle;
    final Bundle bundle = ref.read(bundleObjectProvider);

    activityUid = bundle.getString(ACTIVITY_UID);
    orgUnit = bundle.getString(ACTIVITY_UID);
    eventUid = bundle.getString(ACTIVITY_UID);
    programUid = bundle.getString(ACTIVITY_UID)!;
    programStageUid = bundle.getString(ACTIVITY_UID);
    periodType = bundle.getString(ACTIVITY_UID).toPeriodType;
    enrollmentId = bundle.getString(ACTIVITY_UID);
    scheduleInterval = bundle.getInt(ACTIVITY_UID) ?? 0;
    enrollmentStatus = bundle.getString(ACTIVITY_UID).toEnrollmentStatus;
    eventCreationType = bundle.getString(ACTIVITY_UID).toEventCreationType ??
        EventCreationType.DEFAULT;
  }
}
