import 'package:flutter/material.dart';

enum SyncState {
  synced,
  unsynced,
  error,
}

class QSyncIconButton extends StatelessWidget {
  final SyncState state;
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
      case SyncState.synced:
        return IconButton(
          icon: Icon(Icons.check, color: Colors.green),
          onPressed: null, // Do nothing
        );
      case SyncState.unsynced:
        return IconButton(
          icon: Icon(Icons.sync, color: Colors.blue),
          onPressed: onUnsyncedPressed,
        );
      case SyncState.error:
        return IconButton(
          icon: Icon(Icons.error, color: Colors.red),
          onPressed: onErrorPressed,
        );
    }
  }
}
