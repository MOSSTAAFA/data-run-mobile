import 'package:equatable/equatable.dart';

import '../models/event_coordinates.dart';
import '../models/event_date.dart';
import '../models/event_details.dart';
import '../models/event_org_unit.dart';
import '../models/event_temp.dart';

class EventDetailsViewModel with EquatableMixin {
  const EventDetailsViewModel()
      : eventDetails = const EventDetails(),
        eventDate = const EventDate(),
        eventOrgUnit = const EventOrgUnit(),
        eventCoordinates = const EventCoordinates(),
        eventTemp = const EventTemp();

  EventDetailsViewModel._(
      {required this.eventDetails,
      required this.eventDate,
      required this.eventOrgUnit,
      required this.eventCoordinates,
      required this.eventTemp});

  final EventDetails eventDetails;

  final EventDate eventDate;

  final EventOrgUnit eventOrgUnit;

  final EventCoordinates eventCoordinates;

  final EventTemp eventTemp;

  EventDetailsViewModel copyWith(
      {EventDetails? eventDetails,
      EventDate? eventDate,
      EventOrgUnit? eventOrgUnit,
      EventCoordinates? eventCoordinates,
      EventTemp? eventTemp}) {
    return EventDetailsViewModel._(
        eventDetails: eventDetails ?? this.eventDetails,
        eventDate: eventDate ?? this.eventDate,
        eventOrgUnit: eventOrgUnit ?? this.eventOrgUnit,
        eventCoordinates: eventCoordinates ?? this.eventCoordinates,
        eventTemp: eventTemp ?? this.eventTemp);
  }

  @override
  List<Object?> get props =>
      [eventDetails, eventDate, eventOrgUnit, eventCoordinates, eventTemp];
}
