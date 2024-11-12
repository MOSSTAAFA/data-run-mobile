import 'package:datarun/commons/custom_widgets/async_value.widget.dart';
import 'package:datarun/core/auth/auth_service.dart';
import 'package:datarun/core/auth/user_session_manager.dart';
import 'package:datarun/generated/l10n.dart';
import 'package:datarun/utils/user_preferences/preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserSettingsTab extends ConsumerWidget {
  const UserSettingsTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfoAsync = ref.watch(userInfoProvider);

    return AsyncValueWidget(
      value: userInfoAsync,
      valueBuilder: (user) => ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Account Information Section
          Text(
            S.of(context).accountInformation,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 10),
          Card(
            child: ListTile(
              leading: Icon(Icons.person_outline,
                  color: Theme.of(context).primaryColor),
              title: Text(S.of(context).loginUsername),
              subtitle: Text(user!.username ?? '-'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.info_outline,
                  color: Theme.of(context).primaryColor),
              title: Text(S.of(context).personInformation),
              subtitle: Text(user.firstName ?? '-'),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  // TODO(Hamza) Implement user info editing
                },
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.info_outline,
                  color: Theme.of(context).primaryColor),
              title: Text(S.of(context).mobile),
              subtitle: Text(user.phoneNumber ?? '-'),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  // TODO(Hamza) Implement user info editing
                },
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.lock_outline,
                  color: Theme.of(context).primaryColor),
              title: Text(S.of(context).changePassword),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  // TODO(Hamza) Implement password change
                },
              ),
            ),
          ),

          // Preferences Section
          const SizedBox(height: 24),
          Text(
            S.of(context).preferences,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 10),
          Card(
            child: ListTile(
              leading:
                  Icon(Icons.language, color: Theme.of(context).primaryColor),
              title: Text(S.of(context).language),
              subtitle: Text(
                  ref.watch(preferenceNotifierProvider(Preference.language))),
              trailing: DropdownButton<String>(
                value:
                    ref.watch(preferenceNotifierProvider(Preference.language)),
                onChanged: (String? newValue) {
                  ref
                      .read(preferenceNotifierProvider(Preference.language)
                          .notifier)
                      .update(newValue ?? 'ar');
                },
                items: <String>['ar', 'en']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),

          // Logout Button
          const SizedBox(height: 20),
          Card(
            color: Theme.of(context).colorScheme.errorContainer,
            child: ListTile(
              leading: Icon(Icons.logout,
                  color: Theme.of(context).colorScheme.onErrorContainer),
              title: Text(
                S.of(context).logout,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onErrorContainer),
              ),
              subtitle: Text(
                S.of(context).logoutNote,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onErrorContainer),
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () async {
                await ref.read(authServiceProvider).logout();
              },
            ),
          ),
        ],
      ),
    );
  }
}
