// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../../../../commons/custom_widgets/nav_bar/nav_info_notifier.dart';
// import '../../../../commons/custom_widgets/navigationbar/navigation_page.dart';
// import '../../../../commons/custom_widgets/navigationbar/navigation_tab_bar_view.widget.dart';
// import '../../../../commons/extensions/standard_extensions.dart';
// import '../../../../form/data/data_integrity_check_result.dart';
// import '../../../utils/event_mode.dart';
// import '../event_details/ui/event_details_screen.widget.dart';
// import 'event_capture_form/event_capture_form.widget.dart';
//
// /// Representing [EventCapturePagerAdapter]
// /// Opens when an already saved Event is clicked from [ProgramEventDetailScreen]
// /// composing the [NavigationTabBarView] Widget
// /// The [NavigationTabBarView] which in this context will have multiple Tabs
// /// Tab for [EventDetailsScreen]
// /// Tab for [EventCaptureForm] which contains [FormViewWidget], the data-entry Form widget that display the list of fields used to enter data
// /// Tab for Notes and and later another Tabs for Indicators...etc.
// ///
// /// ProgramStage selection screen has no layout and calls individual items layout for each program stage using
// /// [ProgramStageSelectionAdapter] in [ProgramStageSelectionActivity]
// class EventCapturePagerWidget extends ConsumerStatefulWidget {
//   const EventCapturePagerWidget({
//     super.key,
//     this.handleDataIntegrityResult,
//   });
//
//   final void Function(DataIntegrityCheckResult result)?
//       handleDataIntegrityResult;
//
//   @override
//   ConsumerState<EventCapturePagerWidget> createState() =>
//       _EventCapturePagerWidgetState();
// }
//
// class _EventCapturePagerWidgetState
//     extends ConsumerState<EventCapturePagerWidget> {
//   /// From [NavigationTabBarView]
//   // late TabController controller;
//   // late List<NavigationPage> _visibleTabs;
//
//   late final PageController _myPage;
//
//   late final EventMode? eventMode;
//   late final String? activityUid;
//   late final String? programUid;
//   late final String? eventUid;
//
//   @override
//   Widget build(BuildContext context) {
//     final selectedIndex =
//         ref.watch(navInfoNotifierProvider.select((value) => value.index));
//
//     return when<int, Widget>(selectedIndex, {
//       0: () => const EventDetailsScreen(),
//       1: () => EventCaptureForm(
//             // showProgress: showProgress,
//             // hideProgress: hideProgress,
//             // hideNavigationBar: hideNavigationBar,
//             // updatePercentage: updatePercentage,
//             handleDataIntegrityResult: (result) =>
//                 widget.handleDataIntegrityResult?.call(result),
//           ),
//     }).orElse(() => const Text('Unimplemented Screen!'));
//   }
// }
