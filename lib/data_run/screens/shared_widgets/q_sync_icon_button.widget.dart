import 'package:flutter/material.dart';
import 'package:mass_pro/core/common/state.dart';

class QSyncIconButton extends StatelessWidget {
  final SyncableEntityState? state;
  final VoidCallback? onUnsyncedPressed;
  final VoidCallback? onErrorPressed;

  const QSyncIconButton({
    Key? key,
    required this.state,
    this.onUnsyncedPressed,
    this.onErrorPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case SyncableEntityState.SYNCED:
        return const IconButton(
          icon: Icon(Icons.cloud_done, color: Colors.green),
          onPressed: null,
        );
      case SyncableEntityState.TO_POST:
      case SyncableEntityState.TO_UPDATE:
        return IconButton(
          icon: const Icon(Icons.sync, color: Colors.blue),
          onPressed: onUnsyncedPressed,
        );
      case SyncableEntityState.ERROR:
        return IconButton(
          icon: const Icon(Icons.error, color: Colors.red),
          onPressed: onErrorPressed,
        );
      default:
        return const Icon(Icons.all_inclusive);
    }
  }
}
