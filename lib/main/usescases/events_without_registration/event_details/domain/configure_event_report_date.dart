import 'package:d2_remote/core/mp/period/period_type.dart';

import '../../../../../commons/data/event_creation_type.dart';
import '../data/event_details_repository.dart';
import '../models/event_date.dart';
import '../providers/event_detail_resources_provider.dart';

class ConfigureEventReportDate {
  ConfigureEventReportDate(
      {required EventCreationType creationType,
      required EventDetailResourcesProvider resourceProvider,
      required EventDetailsRepository repository,
      PeriodType? periodType,
      // required DhisPeriodUtils periodUtils,
      String? enrollmentId,
      int scheduleInterval = 0})
      : _creationType = creationType,
        _resourceProvider = resourceProvider,
        _repository = repository,
        _periodType = periodType,
        // _periodUtils = periodUtils,
        _enrollmentId = enrollmentId,
        _scheduleInterval = scheduleInterval;

  final EventCreationType _creationType;
  final EventDetailResourcesProvider _resourceProvider;
  final EventDetailsRepository _repository;
  final PeriodType? _periodType;

  // DhisPeriodUtils _periodUtils;
  final String? _enrollmentId;
  final int _scheduleInterval;

  Future<EventDate> call(DateTime? selectedDate) {
    // TODO(NMC): implement rest of ConfigureEventReportDate
    return Future.value(EventDate());
  }
}
