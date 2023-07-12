import 'package:d2_remote/core/mp/period/period_type.dart';
import 'package:d2_remote/modules/metadata/program/entities/program_stage.entity.dart';

import '../../../../../commons/data/event_creation_type.dart';
import '../../../../../commons/date/date_utils.dart';
import '../../../../../commons/extensions/standard_extensions.dart';
import '../../../../../commons/extensions/string_extension.dart';
import '../../../../mp_logic/mp_period_utils.dart';
import '../data/event_details_repository.dart';
import '../models/event_date.dart';
import '../providers/event_detail_resources_provider.dart';

class ConfigureEventReportDate {
  const ConfigureEventReportDate(
      {required EventCreationType creationType,
      required EventDetailResourcesProvider resourceProvider,
      required EventDetailsRepository repository,
      PeriodType? periodType,
      required AmPeriodUtils periodUtils,
      String? enrollmentId,
      int scheduleInterval = 0})
      : _creationType = creationType,
        _resourceProvider = resourceProvider,
        _repository = repository,
        _periodType = periodType,
        _periodUtils = periodUtils,
        _enrollmentId = enrollmentId,
        _scheduleInterval = scheduleInterval;

  final EventCreationType _creationType;
  final EventDetailResourcesProvider _resourceProvider;
  final EventDetailsRepository _repository;
  final PeriodType? _periodType;

  final AmPeriodUtils _periodUtils;
  final String? _enrollmentId;
  final int _scheduleInterval;

  Future<EventDate> call(DateTime? selectedDate) async {
    // TODO(NMC): implement rest of ConfigureEventReportDate
    return EventDate(
        active: await _isActive(),
        label: await _getLabel(),
        dateValue: await _getDateValue(selectedDate),
        currentDate: await _getDate(selectedDate),
        minDate: _getMinDate(),
        maxDate: _getMaxDate(),
        scheduleInterval: _getScheduleInterval(),
        allowFutureDates: _getAllowFutureDates(),
        periodType: _periodType);
  }

  Future<bool> _isActive() async {
    if (_creationType == EventCreationType.SCHEDULE &&
        (await _getProgramStage()).hideDueDate == true) {
      return false;
    }
    return true;
  }

  Future<String> _getLabel() async {
    final programStage = await _getProgramStage();
    return when(_creationType, {
      EventCreationType.SCHEDULE: () =>
          programStage.dueDateLabel ?? _resourceProvider.provideDueDate(),
    }).orElse(() =>
        programStage.executionDateLabel ??
        _resourceProvider.provideEventDate());
  }

  Future<DateTime?> _getDate(DateTime? selectedDate) async {
    final event = await _repository.getEvent();
    return when<bool, DateTime?>(true, {
      selectedDate != null: () => selectedDate!,
      event != null: () => event?.eventDate.toDate(),
      _periodType != null: () => _getDateBasedOnPeriodType(),
      _creationType == EventCreationType.SCHEDULE: () => _getNextScheduleDate()
    }).orElse(() => _getCurrentDay());
  }

  Future<String?> _getDateValue(DateTime? selectedDate) async {
    final date = await _getDate(selectedDate);
    return date?.let((date) => when(date, {
          _periodType != null: () => _periodUtils.getPeriodUIString(
                _periodType,
                date, /* Locale.getDefault() */
              ),
        }).orElse(() => DateUtils.uiDateFormat().format(date)));
  }

  Future<ProgramStage> _getProgramStage() async =>
      _repository.getProgramStage();

  DateTime _getDateBasedOnPeriodType() {
    // TODO(NMC): implement
    return DateTime.now();
    // final programStage = await _getProgramStage();
    //   programStage.hideDueDate?.let ( (hideDueDate) {
    //     if (_creationType == EventCreationType.SCHEDULE && hideDueDate) {
    //           if (_periodType != null) {
    //               return DateUtils.getInstance().today
    //           } else {
    //               final calendar = DateUtils.getInstance().calendar
    //               calendar.add(DAY_OF_YEAR, _getScheduleInterval());
    //               org.dhis2.utils.DateUtils.getInstance().getNextPeriod(
    //                   null,
    //                   calendar.time, 0
    //               );
    //           }
    //       }
    //   });

    //   return DateUtils.getInstance()
    //       .getNextPeriod(
    //           periodType,
    //           DateUtils.getInstance().today,
    //           if (creationType != SCHEDULE) 0 else 1
    //       );
  }

  DateTime _getNextScheduleDate() {
    // TODO(NMC): implement
    return DateTime.now();
    // final programStage =  await _repository.getProgramStage();
    //   final isGeneratedEventBasedOnEnrollment =
    //       programStage.generatedByEnrollmentDate ?? false;

    //   final initialDate = await when(true, {
    //     isGeneratedEventBasedOnEnrollment == true: () => _repository.getEnrollmentDate(_enrollmentId),
    //   }).orElse(() => _repository.getStageLastDate(_enrollmentId));

    // val minDateFromStart =
    //     repository.getMinDaysFromStartByProgramStage()
    // if (minDateFromStart > 0) {
    //     initialDate.add(DAY_OF_YEAR, minDateFromStart)
    // }
    // return DateUtils.getInstance().getNextPeriod(null, initialDate.time, 0)
  }

  DateTime _getCurrentDay() => DateTime.now();

  DateTime? _getMinDate() {
    // TODO(NMC): implement
    return null;
    // repository.getProgram()?.let { program ->
    //     if (periodType == null) {
    //         if (program.expiryPeriodType() != null) {
    //             val expiryDays = program.expiryDays() ?: 0
    //             return org.dhis2.utils.DateUtils.getInstance().expDate(
    //                 null,
    //                 expiryDays,
    //                 program.expiryPeriodType()
    //             )
    //         }
    //     } else {
    //         var minDate = org.dhis2.utils.DateUtils.getInstance().expDate(
    //             null,
    //             program.expiryDays() ?: 0,
    //             periodType
    //         )
    //         val lastPeriodDate = org.dhis2.utils.DateUtils.getInstance().getNextPeriod(
    //             periodType,
    //             minDate,
    //             -1,
    //             true
    //         )

    //         if (lastPeriodDate.after(
    //             org.dhis2.utils.DateUtils.getInstance().getNextPeriod(
    //                 program.expiryPeriodType(),
    //                 minDate,
    //                 0
    //             )
    //         )
    //         ) {
    //             minDate = org.dhis2.utils.DateUtils.getInstance()
    //                 .getNextPeriod(periodType, lastPeriodDate, 0)
    //         }
    //         return minDate
    //     }
    // }
    // return null
  }

  DateTime? _getMaxDate() {
    // TODO(NMC): implement
    if (_periodType == null) {
      return when(_creationType, {
        [EventCreationType.ADDNEW, EventCreationType.DEFAULT]: () =>
            DateTime.fromMillisecondsSinceEpoch(
                DateTime.now().millisecond - 1000),
      });
    } else {
      return when(_creationType, {
        [EventCreationType.ADDNEW, EventCreationType.DEFAULT]: () =>
            DateTime.now(),
      });
    }
  }

  bool _getAllowFutureDates() => when(_creationType, {
        EventCreationType.SCHEDULE: () => true,
      }).orElse(() => false);

  int _getScheduleInterval() => when(_creationType, {
        EventCreationType.SCHEDULE: () => _scheduleInterval,
      }).orElse(() => 0);
}
