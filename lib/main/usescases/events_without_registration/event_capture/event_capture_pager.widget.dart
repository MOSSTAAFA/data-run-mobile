import 'package:flutter/material.dart';

import '../../../../commons/custom_widgets/navigationbar/navigation_tab_bar_view.widget.dart';
import '../../../../commons/utils/view_actions.dart';
import '../../../utils/event_mode.dart';

/// Representing [EventCapturePagerAdapter]
/// Opens when an already saved Event is clicked from [ProgramEventDetailScreen]
/// composing the [NavigationTabBarView] Widget
/// The [NavigationTabBarView] which in this context will have multiple Tabs
/// Tab for [EventDetailsScreen]
/// Tab for [EventCaptureForm] which contains [FormViewWidget], the data-entry Form widget that display the list of fields used to enter data
/// Tab for Notes and and later another Tabs for Indicators...etc.
///
/// ProgramStage selection screen has no layout and calls individual items layout for each program stage using
/// [ProgramStageSelectionAdapter] in [ProgramStageSelectionActivity]
class EventCapturePagerWidget extends StatefulWidget {
  const EventCapturePagerWidget({super.key});

  @override
  State<EventCapturePagerWidget> createState() =>
      _EventCapturePagerWidgetState();
}

class _EventCapturePagerWidgetState extends State<EventCapturePagerWidget> {

  late final EventMode? eventMode;
  late final String? activityUid;
  late final String? programUid;
  late final String? eventUid;

  @override
  Widget build(BuildContext context) {
    
    return Container();
    // return Expanded(
    //     child: NavigationTabBarView(
    //   onPositionChange: (position) {
    //     if (position == ViewAction.details && eventMode != EventMode.NEW) {
    //       _showSyncButton();
    //     } else {
    //       _hideSyncButton();
    //     }
    //   },
    //   appBarTitle: Text(ref.watch(eventDataStringProvider)),
    //   appBarActions: [
    //     Consumer(
    //       builder: (context, ref, child) {
    //         return ref.watch(syncButtonVisibilityProvider)
    //             ? IconButton(
    //                 icon: const Icon(Icons.sync),
    //                 tooltip: localization.lookup('sync'),
    //                 onPressed: () => showSyncDialog(),
    //               )
    //             : const SizedBox();
    //       },
    //     ),
    //   ],
    //   actionButtonBuilder: (context, viewAction) => FloatingActionButton(
    //     heroTag: ViewAction.data_entry.name,
    //     tooltip: localization.lookup('save'),
    //     onPressed: () {},
    //     child: const Icon(Icons.save),
    //   ),
    //   tabBuilder: (context, viewAction) {
    //     final name = localization.lookup(viewAction.name);
    //     return when(viewAction, {
    //       ViewAction.details: () => Tab(text: name),
    //       ViewAction.data_entry: () => Tab(text: name),
    //       ViewAction.notes: () => Tab(text: name),
    //       ViewAction.analytics: () => Tab(text: name),
    //       ViewAction.relationships: () => Tab(text: name),
    //     })!;
    //   },
    //   pageBuilder: (context, viewAction) =>
    //       when<ViewAction, Widget>(viewAction, {
    //     ViewAction.details: () => const EventDetailsScreen(),
    //     ViewAction.data_entry: () => EventCaptureForm(
    //           showProgress: showProgress,
    //           hideProgress: hideProgress,
    //           hideNavigationBar: hideNavigationBar,
    //           updatePercentage: updatePercentage,
    //           handleDataIntegrityResult: presenter.handleDataIntegrityResult,
    //         ),
    //   }).orElse(() => const Center(
    //             child: Text('Unimplemented Screen!'),
    //           )),
    // ));
  }
}
