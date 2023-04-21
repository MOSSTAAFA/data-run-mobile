// import '../../extensions/standard_extensions.dart';
// import '../../utils/view_actions.dart';
// import 'navigation_page.dart';
// import 'navigation_page_configurator.dart';

// class NavigationBottomBar {
//   const NavigationBottomBar({required NavigationPageConfigurator configurator})
//       : navigationPageConfigurator = configurator;

//   final NavigationPageConfigurator navigationPageConfigurator;
//   List<NavigationPage> getMenuItems() {
//     final List<NavigationPage> visibleMenuItems = <NavigationPage>[];
//     for (final menuItme in ViewAction.values) {
//       if (navigationPageConfigurator.pageVisibility(menuItme)) {
//         NavigationPage.getMenu(menuItme)?.let((it) => visibleMenuItems.add(it));
//       }
//     }
//     return visibleMenuItems;
//   }

//   int visibleItemCount() {
//     return getMenuItems().length;
//   }
// }
