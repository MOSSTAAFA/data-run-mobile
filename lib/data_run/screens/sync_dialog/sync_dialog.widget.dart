import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/generated/l10n.dart';

class SyncDialog extends ConsumerStatefulWidget {
  const SyncDialog({
    super.key,
    required this.entityUids,
    required this.syncEntity,
  });

  final List<String> entityUids;
  final Function(String) syncEntity;

  @override
  SyncDialogState createState() => SyncDialogState();
}

class SyncDialogState extends ConsumerState<SyncDialog> {
  int _currentEntityIndex = 0;
  bool _isSyncing = false;
  List<String> _syncErrors = [];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(S.of(context).syncFormData),
      content: _buildContent(),
      actions: _buildActions(),
    );
  }

  Widget _buildContent() {
    if (!_isSyncing) {
      return Text(S.of(context).confirmSyncFormData);
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        LinearProgressIndicator(
          value: _currentEntityIndex / widget.entityUids.length,
        ),
        const SizedBox(height: 16),
        Text(
            '${S.of(context).syncingData} ${_currentEntityIndex + 1}/${widget.entityUids.length}'),
        if (_syncErrors.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text( 
              '${S.of(context).error}: ${_syncErrors.join(', ')}',
              style: const TextStyle(color: Colors.red),
            ),
          ),
      ],
    );
  }

  List<Widget> _buildActions() {
    if (!_isSyncing) {
      return [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(S.of(context).cancel),
        ),
        TextButton(
          onPressed: _startSyncing,
          child: Text(S.of(context).confirm),
        ),
      ];
    }

    if (_currentEntityIndex == widget.entityUids.length) {
      return [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(S.of(context).ok),
        ),
      ];
    }

    return [];
  }

  Future<void> _startSyncing() async {
    setState(() {
      _isSyncing = true;
      _currentEntityIndex = 0;
      _syncErrors = [];
    });

    for (int i = 0; i < widget.entityUids.length; i++) {
      final uid = widget.entityUids[i];
      try {
        await widget.syncEntity(uid);
      } catch (e) {
        _syncErrors.add(uid);
      }

      setState(() {
        _currentEntityIndex = i + 1;
      });
    }
  }
}
