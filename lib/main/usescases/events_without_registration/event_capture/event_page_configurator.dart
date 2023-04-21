// class EventPageConfigurator.kt
import '../../../../commons/custom_widgets/navigationbar/navigation_page.dart';
import '../../../../commons/custom_widgets/navigationbar/navigation_page_configurator.dart';
import '../../../../commons/extensions/standard_extensions.dart';
import '../../../../commons/helpers/iterable.dart';
import '../../../../commons/utils/view_actions.dart';

class EventPageConfigurator with NavigationPageConfigurator {
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
  bool displayAnalytics() {
    // TODO(NMCP): implement if it has Analytics
    // return eventCaptureRepository.hasAnalytics()
    return false;
  }

  @override
  bool displayDetails() {
    return true;
  }

  @override
  bool displayDataEntry() {
    return true;
  }

  @override
  bool displayRelationships() {
    // TODO(NMCP): implement if it has Relationships
    // return eventCaptureRepository.hasRelationships();
    return false;
  }

  @override
  bool displayNotes() {
    return true;
  }
}
