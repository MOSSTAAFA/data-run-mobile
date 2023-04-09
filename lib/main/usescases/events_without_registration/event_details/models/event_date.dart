import 'package:d2_remote/core/mp/period/period_type.dart';
import 'package:equatable/equatable.dart';

/// data class
class EventDate with EquatableMixin {
  const EventDate(
      {this.active = true,
      this.dateValue,
      this.label,
      this.currentDate,
      this.minDate,
      this.maxDate,
      this.scheduleInterval = 0,
      this.allowFutureDates = true,
      this.periodType});

  final bool active;
  final String? dateValue;
  final String? label;
  final DateTime? currentDate;
  final DateTime? minDate;
  final DateTime? maxDate;
  final int scheduleInterval;
  final bool allowFutureDates;
  final PeriodType? periodType;

  /// copyWith
  EventDate copyWith({
    final bool? active,
    final String? dateValue,
    final String? label,
    final DateTime? currentDate,
    final DateTime? minDate,
    final DateTime? maxDate,
    final int? scheduleInterval,
    final bool? allowFutureDates,
    final PeriodType? periodType,
  }) =>
      EventDate(
          active: active ?? this.active,
          dateValue: dateValue ?? this.dateValue,
          label: label ?? this.label,
          currentDate: currentDate ?? this.currentDate,
          minDate: minDate ?? this.minDate,
          maxDate: maxDate ?? this.maxDate,
          scheduleInterval: scheduleInterval ?? this.scheduleInterval,
          allowFutureDates: allowFutureDates ?? this.allowFutureDates,
          periodType: periodType ?? this.periodType);

  @override
  List<Object?> get props => [
        active,
        dateValue,
        label,
        currentDate,
        minDate,
        maxDate,
        scheduleInterval,
        allowFutureDates,
        periodType
      ];
}
