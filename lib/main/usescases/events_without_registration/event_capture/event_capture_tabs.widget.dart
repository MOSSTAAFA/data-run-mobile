// import 'package:flutter/material.dart';

// import 'event_capture_form/event_capture_form.widget.dart';

// enum EventPageType { DETAILS, DATA_ENTRY, ANALYTICS, RELATIONSHIPS, NOTES }

// /// EventCapturePagerAdapter
// class EventCaptureTabs extends StatefulWidget {
//   EventCaptureTabs(
//       {super.key,
//       required this.activityUid,
//       required this.programUid,
//       required this.eventUid,
//       required this.formFragment,
//       this.displayAnalyticScreen = false,
//       this.displayRelationshipScreen = false})
//       : pages = [
//           EventPageType.DETAILS,
//           EventPageType.DATA_ENTRY,
//           if (displayAnalyticScreen) EventPageType.ANALYTICS,
//           if (displayRelationshipScreen) EventPageType.RELATIONSHIPS,
//           EventPageType.NOTES
//         ];

//   final String activityUid;
//   final String programUid;
//   final String eventUid;
//   final List<EventPageType> pages;
//   final EventCaptureForm formFragment;
//   final bool displayAnalyticScreen;
//   final bool displayRelationshipScreen;

//   @override
//   State<EventCaptureTabs> createState() => _EventCaptureTabsState();
// }

// class _EventCaptureTabsState extends State<EventCaptureTabs> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
