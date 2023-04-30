// class EventPageConfigurator.kt
import '../../../../commons/custom_widgets/navigationbar/navigation_page.dart';
import '../../../../commons/custom_widgets/navigationbar/navigation_page_configurator.dart';
import '../../../../commons/utils/view_actions.dart';

class EventPageConfigurator with NavigationPageConfigurator {
  @override
  bool actionButtonVisibility(ViewAction viewAction) {
    return [
      NavigationPage.DETAILS,
      NavigationPage.NOTES,
      NavigationPage.DATA_ENTRY
    ].any((element) => element.viewAction == viewAction);
    // return when(
    //     NavigationPage.values.firstOrNullWhere(
    //         (NavigationPage it) => it.viewAction == viewAction),
    //     {
    //       [
    //         NavigationPage.DETAILS,
    //         NavigationPage.NOTES,
    //         NavigationPage.DATA_ENTRY
    //       ]: () => true,
    //     }).orElse(() => false);
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
