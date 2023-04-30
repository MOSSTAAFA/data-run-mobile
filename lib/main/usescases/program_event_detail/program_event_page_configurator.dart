import '../../../commons/custom_widgets/navigationbar/navigation_page.dart';
import '../../../commons/custom_widgets/navigationbar/navigation_page_configurator.dart';
import '../../../commons/extensions/standard_extensions.dart';
import '../../../commons/helpers/iterable.dart';
import '../../../commons/utils/view_actions.dart';

class ProgramEventPageConfigurator with NavigationPageConfigurator {
  @override
  bool actionButtonVisibility(ViewAction viewAction) {
    return when(
        NavigationPage.values.firstOrNullWhere(
            (NavigationPage it) => it.viewAction == viewAction),
        {
          [
            NavigationPage.LIST_VIEW,
            NavigationPage.TABLE_VIEW,
            NavigationPage.MAP_VIEW
          ]: () => true
        }).orElse(() => false);
  }

  @override
  bool displayListView() {
    return true;
  }

  @override
  bool displayMapView() {
    // TODO(NMCP): implement if it has coordinates
    return false;
  }

  @override
  bool displayTableView() {
    return true;
  }

  @override
  bool displayAnalytics() {
    // TODO(NMCP): implement if it has Analytics
    return false;
  }
}
