import 'package:flutter/material.dart';
import 'package:mass_pro/main/usescases/sync/sync_screen.widget.dart';
import 'package:mass_pro/utils/navigator_key.dart';

class UserSettingsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('Username'),
          subtitle: Text('Current username'),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Implement username editing
            },
          ),
        ),
        ListTile(
          title: Text('Change Password'),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Implement password change
            },
          ),
        ),
        ListTile(
          title: Text('Language'),
          subtitle: Text('Current language'),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Implement language change
            },
          ),
        ),
        ListTile(
          title: Text('SyncConfiguration'),
          subtitle: Text('Sync Configuration'),
          trailing: IconButton(
              onPressed: () => Navigator.push(
                    navigatorKey.currentContext!,
                    MaterialPageRoute(builder: (context) => const SyncScreen()),
                  ),
              icon: const Icon(Icons.sync)),
        ),
      ],
    );
  }
}
