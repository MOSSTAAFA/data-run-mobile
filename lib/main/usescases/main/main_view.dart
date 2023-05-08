import 'dart:io';

import '../general/view_base.dart';

mixin MainView implements ViewBase {
  void renderUsername(String username);

  void openDrawer(int gravity);

  void showHideFilter();

  void onLockClick();

  void changeFragment(int id);

  void updateFilters(int totalFilters);

  // void showPeriodRequest(FilterManager.PeriodRequest periodRequest);

  void goToHome();

  // void setFilters(List<FilterItem> filters);

  void hideFilters();

  void showGranularSync();

  void goToLogin(int accountsCount, {bool isDeletion = false});

  void showProgressDeleteNotification();

  File? obtainFileView();

  void cancelNotifications();

  bool hasToNotSync();
}
