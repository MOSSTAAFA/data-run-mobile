import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/view_actions.dart';
import 'navigation_page_configurator.dart';

class NavigationBottomBar extends StatefulWidget {
  const NavigationBottomBar(
      {super.key,
      required this.menu,
      required this.configurator,
      required this.tabController});

  final List<ViewAction> menu;

  final NavigationPageConfigurator configurator;

  final TabController tabController;

  @override
  State<NavigationBottomBar> createState() => _NavigationBottomBarState();
}

class _NavigationBottomBarState extends State<NavigationBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
