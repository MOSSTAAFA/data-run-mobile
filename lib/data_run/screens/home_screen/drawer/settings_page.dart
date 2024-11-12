import 'package:datarun/data_run/screens/home_screen/drawer/about_page.dart';
import 'package:datarun/data_run/screens/home_screen/drawer/appearance_settings_tab.dart';
import 'package:datarun/data_run/screens/home_screen/drawer/sync_setting_page.dart';
import 'package:datarun/data_run/screens/home_screen/drawer/user_settings_tab.dart';
import 'package:datarun/generated/l10n.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).settings),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.person),
                text: S.of(context).userSettings,
              ),
              Tab(
                icon: Icon(Icons.sync),
                text: S.of(context).syncSettings,
              ),
              Tab(
                icon: Icon(Icons.color_lens),
                text: S.of(context).appearance,
              ),
              Tab(
                icon: Icon(Icons.info),
                text: S.of(context).about,
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const UserSettingsTab(),
            const SyncSettingTab(),
            const AppearanceSettingsTab(),
            const AboutPage(),
          ],
        ),
      ),
    );
  }
}