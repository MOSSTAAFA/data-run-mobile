import 'package:d2_remote/d2_remote.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import 'commons/constants.dart';
import 'commons/prefs/preference_provider.dart';
import 'riverpod/provider_logger.dart';
import 'main.reflectable.dart';
import 'main/di.dart' as di;
import 'main/l10n/app_localizations.dart';
import 'dart:async';

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

  await PreferenceProvider.initialize();

  await D2Remote.initialize();
  di.init();

  // wrap the entire app with a ProviderScope so that widgets
  // will be able to read providers
  runApp(ProviderScope(
    observers: [ProviderLogger()],
    child: const App(),
  ));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final routeObserver = Get.put<RouteObserver>(RouteObserver<PageRoute>());
    final locale = AppLocalization.createLocale('en');

    return GetMaterialApp(
      builder: (BuildContext context, Widget? child) {
        final MediaQueryData data = MediaQuery.of(context);
        return MediaQuery(
          data:
              data /* .copyWith(
                textScaleFactor: context.select(
                    (AppBloc bloc) => bloc.state.prefState.textScaleFactor),
              ) */
          ,
          child: child!,
        );
      },
      title: 'Flutter Demo',
      navigatorKey: navigatorKey,
      navigatorObservers: [routeObserver],
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
        title: 'Title1',
      ),
      getPages: [
        // GetPage(
        //   name: EventCaptureScreen.route,
        //   page: () => EventCaptureScreen(),
        //   transition: Transition.fade,
        //   // binding: SplashBinding()
        // ),
      ],
    );
  }
}
