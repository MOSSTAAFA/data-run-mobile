import 'dart:io';

import 'package:flutter/material.dart';

import 'main_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with MainView {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void cancelNotifications() {
    // TODO: implement cancelNotifications
  }

  @override
  void changeFragment(int id) {
    // TODO: implement changeFragment
  }

  @override
  void goToHome() {
    // TODO: implement goToHome
  }

  @override
  void goToLogin(int accountsCount, bool isDeletion) {
    // TODO: implement goToLogin
  }

  @override
  bool hasToNotSync() {
    // TODO: implement hasToNotSync
    throw UnimplementedError();
  }

  @override
  void hideFilters() {
    // TODO: implement hideFilters
  }

  @override
  File? obtainFileView() {
    // TODO: implement obtainFileView
    throw UnimplementedError();
  }

  @override
  void onLockClick() {
    // TODO: implement onLockClick
  }

  @override
  void openDrawer(int gravity) {
    // TODO: implement openDrawer
  }

  @override
  void renderUsername(String username) {
    // TODO: implement renderUsername
  }

  @override
  void showGranularSync() {
    // TODO: implement showGranularSync
  }

  @override
  void showHideFilter() {
    // TODO: implement showHideFilter
  }

  @override
  void showProgressDeleteNotification() {
    // TODO: implement showProgressDeleteNotification
  }

  @override
  void updateFilters(int totalFilters) {
    // TODO: implement updateFilters
  }
}
