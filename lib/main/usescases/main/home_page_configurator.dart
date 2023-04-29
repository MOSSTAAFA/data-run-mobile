// class EventPageConfigurator.kt
import '../../../../commons/custom_widgets/navigationbar/navigation_page.dart';
import '../../../../commons/custom_widgets/navigationbar/navigation_page_configurator.dart';
import '../../../../commons/extensions/standard_extensions.dart';
import '../../../../commons/helpers/iterable.dart';
import '../../../../commons/utils/view_actions.dart';

class HomePageConfigurator with NavigationPageConfigurator {
  @override
  bool actionButtonVisibility(ViewAction viewAction) {
    return when(
        NavigationPage.values.firstOrNullWhere(
            (NavigationPage it) => it.viewAction == viewAction),
        {
          NavigationPage.DETAILS: () => true,
          NavigationPage.EVENTS: () => false,
          NavigationPage.ANALYTICS: () => false,
          NavigationPage.RELATIONSHIPS: () => false,
          NavigationPage.NOTES: () => true,
          NavigationPage.DATA_ENTRY: () => true,
          NavigationPage.LIST_VIEW: () => false,
          NavigationPage.MAP_VIEW: () => false,
          NavigationPage.TABLE_VIEW: () => true,
          NavigationPage.TASKS: () => false,
          NavigationPage.PROGRAMS: () => false,
        }).orElse(() => false);
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
