import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../../../../../commons/constants.dart';
import '../../../bundle/bundle.dart';
import '../../event_details/ui/event_details_screen.widget.dart';
import '../event_capture_form/event_capture_form.widget.dart';
import '../event_capture_screen.widget.dart';

class EventCaptureTabViews extends ConsumerWidget {
  const EventCaptureTabViews({
    super.key,
    // this.onHandleDataIntegrityResult,
  });

  // /// to call on Activity -> EventCaptureScreen.
  // /// Temporarily Moved to [EventCapturePagerWidget]
  // final void Function(DataIntegrityCheckResult result)?
  //     onHandleDataIntegrityResult;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final key = ValueKey<String>((Get.arguments as Bundle).getString(EVENT_UID)!);
    debugPrint('build(): $runtimeType, key: $key');
    final children = [
      const EventDetailsScreen(),
      const EventCaptureForm(
        // showProgress: () => ref
        //     .read(eventCaptureScreenStateNotifierProvider.notifier)
        //     .showProgress(),
        // hideProgress: () => ref
        //     .read(eventCaptureScreenStateNotifierProvider.notifier)
        //     .showProgress(),
        // handleDataIntegrityResult: (DataIntegrityCheckResult result) =>
        //     onHandleDataIntegrityResult?.call(result),
      ),
      const Text('Unimplemented Screen!')
    ];
    return IndexedStack(
      index: ref.watch(selectedIndexProvider),
      children: children,
    );
  }
}
