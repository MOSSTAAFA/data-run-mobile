import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'main_presenter.dart';
import 'main_view.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> with MainView {
  late final MainPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void initState() {
    super.initState();
    presenter = ref.read(mainPresenterProvider(this));
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
  void goToLogin(int accountsCount, {bool isDeletion = false}) {
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
