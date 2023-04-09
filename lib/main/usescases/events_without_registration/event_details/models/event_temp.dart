import 'package:equatable/equatable.dart';

import 'event_temp_status.dart';

/// data class
class EventTemp with EquatableMixin {
  const EventTemp({this.active = false, this.status, this.completed = true});

  final bool active;
  final EventTempStatus? status;
  final bool completed;

  /// copyWith
  EventTemp copyWith(
          {final bool? active,
          final EventTempStatus? status,
          bool? completed}) =>
      EventTemp(
        active: active ?? this.active,
        status: status ?? this.status,
        completed: completed ?? this.completed,
      );

  @override
  List<Object?> get props => [
        active,
        status,
        completed,
      ];
}
