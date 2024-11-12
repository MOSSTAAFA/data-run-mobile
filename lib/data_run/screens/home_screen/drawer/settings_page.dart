import 'package:datarun/data_run/screens/home_screen/drawer/appearance_settings_tab.dart';
import 'package:datarun/data_run/screens/home_screen/drawer/user_settings_tab.dart';
import 'package:datarun/generated/l10n.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).settings),
          bottom: TabBar(
            tabs: [
              Tab(text: S.of(context).userSettings),
              Tab(text: S.of(context).appearance),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            UserSettingsTab(),
            AppearanceSettingsTab(),
          ],
        ),
      ),
    );
  }
}
