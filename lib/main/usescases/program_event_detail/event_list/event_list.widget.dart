import 'package:d2_remote/modules/metadata/program/entities/program.entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../commons/data/event_view_model.dart';
import '../../tei_dashboard/event_view_item.widget.dart';
import '../program_event_detail_view_model.dart';
import 'di/event_list_providers.dart';

/// ProgramEventDetailLiveAdapter
class EventList extends ConsumerStatefulWidget {
  const EventList({super.key, required this.program});
  final Program program;
  @override
  ConsumerState<EventList> createState() => _EventListState();
}

class _EventListState extends ConsumerState<EventList> {
  final ItemScrollController itemScrollController = ItemScrollController();
  List<EventModel> eventModels = [];
  @override
  Widget build(BuildContext context) {
    return ref.watch(filteredProgramEventsProvider).when(
        data: (List<EventModel> data) {
      ref.read(programEventDetailModelProvider.notifier).setProgress(false);
      return ScrollablePositionedList.builder(
        itemCount: eventModels.length,
        itemBuilder: (BuildContext context, int index) => ProviderScope(
          overrides: [eventModelItemIndexProvider.overrideWith((_) => index)],
          child: EventViewItem(
            program: widget.program,
          ),
        ),
        itemScrollController: itemScrollController,
        // itemPositionsListener: itemPositionsListener,
      );
    }, error: (error, __) {
      ref.read(programEventDetailModelProvider.notifier).setProgress(false);
      return Text('WhenError: EventListScreen $error');
    }, loading: () {
      ref.read(programEventDetailModelProvider.notifier).setProgress(true);
      return const SizedBox();
    });
  }

  @override
  void initState() {
    super.initState();
  }
}
