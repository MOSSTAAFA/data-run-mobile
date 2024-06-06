// class EventPageConfigurator.kt
import 'package:mass_pro/commons/custom_widgets/navigationbar/navigation_page_configurator.dart';
import 'package:mass_pro/commons/data_run/utils/view_actions.dart';

class DashboardPageConfigurator with NavigationPageConfigurator {
  @override
  bool actionButtonVisibility(ViewAction viewAction) {
    return false;
    // return when(
    //     NavigationPage.values.firstOrNullWhere(
    //         (NavigationPage it) => it.viewAction == viewAction),
    //     {
    //       NavigationPage.DETAILS: () => true,
    //       NavigationPage.NOTES: () => true,
    //       NavigationPage.DATA_ENTRY: () => true,
    //       NavigationPage.TABLE_VIEW: () => true,
    //     }).orElse(() => false);
  }

  @override
  bool displayPrograms() {
    return true;
  }

  @override
  bool displayAnalytics() {
    return false;
    // return homeRepository.hasHomeAnalytics();
  }
}
