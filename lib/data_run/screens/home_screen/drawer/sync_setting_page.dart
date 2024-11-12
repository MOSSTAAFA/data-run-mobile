import 'package:datarun/core/auth/user_session_manager.dart';
import 'package:datarun/core/sync_manager/sync_service.dart';
import 'package:datarun/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SyncSettingTab extends ConsumerWidget {
  const SyncSettingTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final syncService = ref.watch(syncServiceProvider.notifier);

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Text(S.of(context).syncSettings,
            style: Theme.of(context).textTheme.titleLarge),

        Card(
          child: ListTile(
            title: Text(S.of(context).syncInterval),
            subtitle: FutureBuilder<SyncInterval>(
              future: syncService.getSyncInterval(),
              builder: (context, snapshot) {
                final selectedInterval = snapshot.data ?? SyncInterval.daily;
                return DropdownButton<SyncInterval>(
                  value: selectedInterval,
                  items: SyncInterval.values.map((interval) {
                    return DropdownMenuItem(
                      value: interval,
                      child: Text(interval.localLabel),
                    );
                  }).toList(),
                  onChanged: (newInterval) {
                    if (newInterval != null) {
                      syncService.setSyncInterval(newInterval);
                    }
                  },
                );
              },
            ),
          ),
        ),

        const SizedBox(height: 10),

        Card(
          child: ListTile(
            leading: Icon(Icons.sync, color: Theme.of(context).primaryColor),
            title: Text(S.of(context).lastConfigurationSyncTime),
            subtitle: Text(
                ref.watch(userSessionManagerProvider).lastSyncTime.toString()),
            trailing: FilledButton(
                onPressed: () {
                  ref.read(syncServiceProvider.notifier).performSync(
                        onFinish: (message) =>
                            ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(message ?? '')),
                        ),
                      );
                },
                child: Text(S.of(context).syncNow)),
          ),
        ),

        // Sync Status Card
        Card(
          child: ListTile(
            leading: Icon(Icons.check_circle,
                color: ref.watch(userSessionManagerProvider).syncDone
                    ? Colors.green
                    : Colors.red),
            title: Text(S.of(context).lastSyncStatus),
            subtitle: Text(ref.watch(userSessionManagerProvider).syncDone
                ? S.of(context).done
                : S.of(context).failed),
          ),
        ),
      ],
    );
  }
}
