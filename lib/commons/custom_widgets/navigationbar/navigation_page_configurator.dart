import 'package:d2_remote/modules/datarun/common/standard_extensions.dart';
import 'package:dartx/dartx.dart';

import 'package:mass_pro/commons/data_run/utils/view_actions.dart';
import 'package:mass_pro/commons/custom_widgets/navigationbar/navigation_page.dart';

abstract class NavigationPageConfigurator {
  bool pageVisibility(ViewAction viewAction) {
    return when(
        NavigationPage.values.firstOrNullWhere(
            (NavigationPage it) => it.viewAction == viewAction),
        {
          NavigationPage.DETAILS: () => displayDetails(),
          NavigationPage.EVENTS: () => displayEvents(),
          NavigationPage.ANALYTICS: () => displayAnalytics(),
          NavigationPage.RELATIONSHIPS: () => displayRelationships(),
          NavigationPage.NOTES: () => displayNotes(),
          NavigationPage.DATA_ENTRY: () => displayDataEntry(),
          NavigationPage.LIST_VIEW: () => displayListView(),
          NavigationPage.MAP_VIEW: () => displayMapView(),
          NavigationPage.TABLE_VIEW: () => displayTableView(),
          NavigationPage.TASKS: () => displayTasks(),
          NavigationPage.PROGRAMS: () => displayPrograms(),
        }).orElse(() => false);
  }

  bool actionButtonVisibility(ViewAction viewAction);
  // {
  //   return when(
  //       NavigationPage.values.firstOrNullWhere(
  //           (NavigationPage it) => it.viewAction == viewAction),
  //       {
  //         NavigationPage.DETAILS: () => false,
  //         NavigationPage.EVENTS: () => false,
  //         NavigationPage.ANALYTICS: () => false,
  //         NavigationPage.RELATIONSHIPS: () => false,
  //         NavigationPage.NOTES: () => false,
  //         NavigationPage.DATA_ENTRY: () => false,
  //         NavigationPage.LIST_VIEW: () => false,
  //         NavigationPage.MAP_VIEW: () => false,
  //         NavigationPage.TABLE_VIEW: () => false,
  //         NavigationPage.TASKS: () => false,
  //         NavigationPage.PROGRAMS: () => false,
  //       }).orElse(() => false);
  // }

  bool displayDetails() {
    return false;
  }

  bool displayEvents() {
    return false;
  }

  bool displayAnalytics() {
    return false;
  }

  bool displayRelationships() {
    return false;
  }

  bool displayNotes() {
    return false;
  }

  bool displayDataEntry() {
    return false;
  }

  bool displayListView() {
    return false;
  }

  bool displayMapView() {
    return false;
  }

  bool displayTableView() {
    return false;
  }

  bool displayTasks() {
    return false;
  }

  bool displayPrograms() {
    return false;
  }
}
