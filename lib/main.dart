import 'package:d2_remote/d2_remote.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import 'commons/constants.dart';
import 'commons/prefs/preference_provider.dart';
import 'main.reflectable.dart';
import 'main/di.dart' as di;
import 'main/l10n/app_localizations.dart';
import 'main_app.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

extension NavigatorKeyUtils on GlobalKey<NavigatorState> {
  AppLocalization get localization {
    return AppLocalization.of(currentContext!)!;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeReflectable();

  await PreferenceProvider.init();

  D2Remote.initialize();
  di.init();

  // wrap the entire app with a ProviderScope so that widgets
  // will be able to read providers
  runApp(const ProviderScope(
    child: App(),
  ));
  //
  // runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeObserver = Get.put<RouteObserver>(RouteObserver<PageRoute>());
    final locale = AppLocalization.createLocale('en');

    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: navigatorKey,
      localizationsDelegates: const [
        AppLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: kLanguages
          .map((String locale) => AppLocalization.createLocale(locale))
          .toList(),
      locale: locale,
      // Returns a locale which will be used by the app
      localeResolutionCallback: (locale, supportedLocales) {
        if (locale != null) {
          return locale;
        }

        // Check if the current device locale is supported
        for (final Locale supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode &&
              supportedLocale.countryCode == locale?.countryCode) {
            return supportedLocale;
          }
        }
        // If the locale of the device is not supported, use the first one
        // from the list (English, in this case).
        return supportedLocales.first;
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainApp(
        title: 'Title',
      ),
    );
  }
}
