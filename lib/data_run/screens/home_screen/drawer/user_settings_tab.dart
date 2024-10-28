import 'package:flutter/material.dart';
import 'package:mass_pro/generated/l10n.dart';

class UserSettingsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text(S.of(context).username),
          subtitle: Text(S.of(context).currentUsername),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Implement username editing
            },
          ),
        ),
        ListTile(
          title: Text(S.of(context).changePassword),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Implement password change
            },
          ),
        ),
        ListTile(
          title: Text(S.of(context).language),
          subtitle: Text('ar'),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Implement language change
            },
          ),
        ),
      ],
    );
  }
}
