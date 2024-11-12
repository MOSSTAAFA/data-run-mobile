import 'package:datarun/commons/custom_widgets/async_value.widget.dart';
import 'package:datarun/core/auth/auth_service.dart';
import 'package:datarun/core/auth/user_session_manager.dart';
import 'package:datarun/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserSettingsTab extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final userInfo = UserService.instance.user?.firstName ??
    //     UserService.instance.user?.username;
    final userInfoAsync = ref.watch(userInfoProvider);
    return AsyncValueWidget(
        value: userInfoAsync,
        valueBuilder: (user) => ListView(
              children: [
                ListTile(
                  title: Text(S.of(context).username),
                  subtitle: Text(user?.firstName ?? 'userInfo'),
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
                GestureDetector(
                  onTap: () async {
                    await ref.read(authServiceProvider).logout();
                  },
                  child: ListTile(
                    title: Text(S.of(context).logout),
                    subtitle: Text(
                      S.of(context).logoutNote,
                      overflow: TextOverflow.fade,
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.logout),
                      onPressed: () async {},
                    ),
                  ),
                ),
              ],
            ));
  }
}
