import 'package:flutter/material.dart';
import 'package:mass_pro/main/l10n/app_localizations.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final dashboardKey = GlobalKey<NavigatorState>();
final productsKey = GlobalKey<NavigatorState>();
final profileKey = GlobalKey<NavigatorState>();

extension NavigatorKeyUtils on GlobalKey<NavigatorState> {
  L get localization {
    return L.of(currentContext!)!;
  }
}

Future<void> navigate(BuildContext? context, String route,
        {bool isDialog = false,
        bool isRootNavigator = true,
        Map<String, dynamic>? arguments}) =>
    Navigator.of(context ?? navigatorKey.currentContext!,
            rootNavigator: isRootNavigator)
        .pushNamed(route, arguments: arguments);

/// Color list
const Color mediumPurple = Color.fromRGBO(79, 0, 241, 1.0);
List<Color> colors = [mediumPurple, Colors.orange, Colors.teal];
