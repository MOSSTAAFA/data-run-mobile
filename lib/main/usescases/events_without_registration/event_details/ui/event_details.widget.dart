import 'package:d2_remote/core/mp/enrollment/enrollment_status.dart';
import 'package:d2_remote/core/mp/period/period_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../commons/constants.dart';
import '../../../../../commons/data/event_creation_type.dart';
import '../../../../../commons/period/period_extensions.dart';
import '../../../bundle/bundle.dart';
import '../models/event_details.dart';

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
    return Container();
  }

  @override
  void initState() {
    super.initState();
    // final Bundle bundle = Get.arguments as Bundle;
    final Bundle bundle = ref.read(bundleObjectProvider);

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
  }
}
