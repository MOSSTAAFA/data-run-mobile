import 'package:flutter/material.dart';

import '../models/event_details.dart';
import 'event_details_view_model.dart';

/// EventDetailsFragment
class EventDetailsView extends StatefulWidget {
  const EventDetailsView(
      {super.key,
      this.onEventDetailsChange,
      this.onButtonCallback,
      this.onEventReopened});

  /// .read(eventDetailsViewModelProvider)
  // final EventDetailsViewModel viewModel;

  final void Function(EventDetails eventDetails)? onEventDetailsChange;
  final void Function()? onButtonCallback;
  final void Function()? onEventReopened;

  @override
  State<EventDetailsView> createState() => _EventDetailsViewState();
}

class _EventDetailsViewState extends State<EventDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
