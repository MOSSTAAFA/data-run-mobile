import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../../../../../commons/constants.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../utils/event_mode.dart';
import '../../../bundle/bundle.dart';
import '../event_capture_screen.widget.dart';
import 'event_capture_app_bar_notifier.dart';

class EventCaptureAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const EventCaptureAppBar({
    super.key,
    this.onSyncButtonPressed,
  });

  final void Function()? onSyncButtonPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalization.of(context)!;
    debugPrint('build(): $runtimeType');
    final eventMode =
        (Get.arguments as Bundle).getString(EVENT_MODE).toEventMode;
    final String barString = ref.watch(
        eventCaptureAppBarNotifierProvider.select(
            (notifier) => '${notifier.eventDate} | ${notifier.orgUnitName}'));
    return AppBar(
      centerTitle: false,
      title: Row(
        children: [
          Expanded(
            child: Text(barString),
          ),
        ],
      ),
      actions: /*ref.watch(navInfoNotifierProvider.select(
                  (value) => value.index == 0 && eventMode != EventMode.NEW))*/
          ref.watch(selectedIndexProvider) == 0 && eventMode != EventMode.NEW
              ? [
                  IconButton(
                    icon: const Icon(Icons.sync),
                    tooltip: localization.lookup('sync'),
                    // onPressed: () => showSyncDialog(),
                    onPressed: onSyncButtonPressed,
                  ),
                ]
              : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
