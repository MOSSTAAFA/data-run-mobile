import 'package:equatable/equatable.dart';

class EventCaptureModel with EquatableMixin {
  EventCaptureModel(
      {this.programStageName = '',
      this.eventDate = '',
      this.orgUnit = '',
      this.activity = ''});

  final String programStageName;
  final String eventDate;
  final String orgUnit;
  final String activity;

  /// copyWith
  EventCaptureModel copyWith({
    String? programStageName,
    String? eventDate,
    String? orgUnit,
    String? activity,
  }) =>
      EventCaptureModel(
          programStageName: programStageName ?? this.programStageName,
          eventDate: eventDate ?? this.eventDate,
          orgUnit: orgUnit ?? this.orgUnit,
          activity: activity ?? this.activity);

  @override
  List<Object?> get props => [programStageName, eventDate, orgUnit, activity];
}
