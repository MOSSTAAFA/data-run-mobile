import 'package:d2_remote/modules/metadata/program/entities/program.entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../commons/data/event_view_model.dart';
import '../program_event_detail_view_model.dart';
import 'di/event_list_providers.dart';
import 'event_list.widget.dart';

/// EventListFragment
class EventListScreen extends ConsumerWidget {
  const EventListScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(eventListProgramProvider).when(data: (data) {
      ref.read(programEventDetailModelProvider.notifier).setProgress(false);
      return EventList(
        program: data,
      );
    }, error: (error, __) {
      ref.read(programEventDetailModelProvider.notifier).setProgress(false);
      return Text('WhenError: EventListScreen $error');
    }, loading: () {
      ref.read(programEventDetailModelProvider.notifier).setProgress(true);
      return const SizedBox();
    });
  }
}
