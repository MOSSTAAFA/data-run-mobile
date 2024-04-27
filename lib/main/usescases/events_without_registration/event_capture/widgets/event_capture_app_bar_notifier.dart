// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'event_capture_app_bar_notifier.g.dart';

@riverpod
class EventCaptureAppBarNotifier extends _$EventCaptureAppBarNotifier {
  @override
  EventCaptureAppBarModel build() {
    return EventCaptureAppBarModel();
  }

  void update(
      EventCaptureAppBarModel Function(EventCaptureAppBarModel state)
          updateState) {
    state = updateState(state);
  }
}

class EventCaptureAppBarModel with EquatableMixin {
  EventCaptureAppBarModel({
    this.eventDate = '',
    this.orgUnitName = '',
    this.activityName = '',
    this.showSyncIcon = true,
    this.percentage = 0,
  });

  final String eventDate;
  final String orgUnitName;
  final String activityName;
  final bool showSyncIcon;
  final double percentage;

  EventCaptureAppBarModel copyWith({
    String? eventDate,
    String? orgUnitName,
    String? activityName,
    bool? showSyncIcon,
    double? percentage,
  }) {
    return EventCaptureAppBarModel(
      eventDate: eventDate ?? this.eventDate,
      orgUnitName: orgUnitName ?? this.orgUnitName,
      activityName: activityName ?? this.activityName,
      showSyncIcon: showSyncIcon ?? this.showSyncIcon,
      percentage: percentage ?? this.percentage,
    );
  }

  @override
  List<Object?> get props =>
      [eventDate, orgUnitName, activityName, showSyncIcon];
}
