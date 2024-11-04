import 'package:flutter/material.dart';
import 'package:mass_pro/core/user/auth_service.dart';
import 'package:mass_pro/generated/l10n.dart';

class UserSettingsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userInfo = UserService.instance.user?.firstName ??
        UserService.instance.user?.username;
    return ListView(
      children: [
        ListTile(
          title: Text(S.of(context).username),
          subtitle: Text(userInfo!),
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
        ListTile(
          title: Text(S.of(context).logout),
          subtitle: Text(
            S.of(context).logoutNote,
            overflow: TextOverflow.fade,
          ),
          trailing: IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Implement language change
            },
          ),
        ),
      ],
    );
  }
}
