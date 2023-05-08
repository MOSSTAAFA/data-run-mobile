import 'package:d2_remote/modules/metadata/program/entities/program.entity.dart';
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
    final program = ref.watch(eventListProgramProvider).value;
    ref.listen<AsyncValue<Program>>(eventListProgramProvider, (previous, next) {
      next.maybeWhen(
        loading: () => Future(() => ref
            .read(programEventDetailModelProvider.notifier)
            .setProgress(true)),
        orElse: () => Future(() => ref
            .read(programEventDetailModelProvider.notifier)
            .setProgress(false)),
      );
    });
    return EventList(
      program: program,
    );
  }
}
