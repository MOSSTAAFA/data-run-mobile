import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../program_event_detail_view_model.dart';
import 'di/event_list_providers.dart';
import 'event_list.widget.dart';

/// EventListFragment
class EventListScreen extends ConsumerWidget {
  const EventListScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(eventListProgramProvider).when(data: (data) {
      Future(() => ref
          .read(programEventDetailModelProvider.notifier)
          .setProgress(false));
      return EventList(
        program: data,
      );
    }, error: (error, __) {
      Future(() => ref
          .read(programEventDetailModelProvider.notifier)
          .setProgress(false));
      return Text('WhenError: EventListScreen $error');
    }, loading: () {
      Future(() =>
          ref.read(programEventDetailModelProvider.notifier).setProgress(true));
      return const SizedBox();
    });
  }
}
