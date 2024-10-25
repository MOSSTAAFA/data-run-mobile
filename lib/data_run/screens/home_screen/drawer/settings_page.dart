import 'package:flutter/material.dart';
import 'package:mass_pro/data_run/screens/home_screen/drawer/appearance_settings_tab.dart';
import 'package:mass_pro/data_run/screens/home_screen/drawer/user_settings_tab.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Appearance'),
              Tab(text: 'User Settings'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AppearanceSettingsTab(),
            UserSettingsTab(),
          ],
        ),
      ),
    );
  }
}
