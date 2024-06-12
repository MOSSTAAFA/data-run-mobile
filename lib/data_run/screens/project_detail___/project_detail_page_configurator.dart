import 'package:d2_remote/modules/datarun/common/standard_extensions.dart';
import 'package:mass_pro/commons/custom_widgets/navigationbar/navigation_page.dart';
import 'package:mass_pro/commons/custom_widgets/navigationbar/navigation_page_configurator.dart';
import 'package:mass_pro/commons/data_run/utils/view_actions.dart';
import 'package:mass_pro/commons/helpers/iterable.dart';

class ProjectDetailPageConfigurator with NavigationPageConfigurator {
  @override
  bool actionButtonVisibility(ViewAction viewAction) {
    // return [
    //   NavigationPage.LIST_VIEW,
    //   NavigationPage.TABLE_VIEW,
    //   NavigationPage.MAP_VIEW
    // ].any((element) => element.viewAction == viewAction);

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
    return false;
  }

  @override
  bool displayAnalytics() {
    // TODO(NMCP): implement if it has Analytics
    return false;
  }
}
