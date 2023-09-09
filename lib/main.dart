import 'dart:async';

import 'package:d2_remote/d2_remote.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get/get.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;

import 'activity_test_setup.dart';
import 'commons/constants.dart';
import 'commons/prefs/preference_provider.dart';
import 'main.reflectable.dart';
import 'main/di.dart' as di;
import 'main/l10n/app_localizations.dart';
import 'main/usescases/events_without_registration/event_capture/event_capture_screen.widget.dart';
import 'main/usescases/events_without_registration/event_initial/event_initial_screen.widget.dart';
import 'main/usescases/program_event_detail/program_event_detail_screen.widget.dart';
import 'main/usescases/splash/splash_screen.widget.dart';
import 'riverpod/provider_logger.dart';

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
  await setUpActivityManagementMocks();

  di.init();

  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) {
      return stack.vmTrace;
    }
    if (stack is stack_trace.Chain) {
      return stack.toTrace().vmTrace;
    }
    return stack;
  };

  // wrap the entire app with a ProviderScope so that widgets
  // will be able to read providers
  runApp(ProviderScope(
    /// log specific provider
    observers: [ProviderLogger(
        providersNameToLog:
        const IListConst(
            const [/*'formViewModelNotifierProvider', 'formViewIndexProvider'*/])
    )
    ],
    /// log all providers
    // observers: [ProviderLogger(providerNameToLog: '')],
    child: const App(),
  ));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final routeObserver = Get.put<RouteObserver>(RouteObserver<PageRoute>());
    final locale = AppLocalization.createLocale('en');

    return StyledToast(
      locale: locale,
      child: GetMaterialApp(
        // builder: (BuildContext context, Widget? child) {
        //   final MediaQueryData data = MediaQuery.of(context);
        //   return MediaQuery(
        //     data:
        //         data /* .copyWith(
        //           textScaleFactor: context.select(
        //               (AppBloc bloc) => bloc.state.prefState.textScaleFactor),
        //         ) */
        //     ,
        //     child: child!,
        //   );
        // },
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
        // home: /* const MainApp(), */ const SplashScreen(),
        initialRoute: SplashScreen.route,
        getPages: [
          GetPage(
            name: SplashScreen.route,
            page: () => const SplashScreen(),
            transition: Transition.fade,
          ),
          // GetPage(
          //   name: MainScreen.route,
          //   page: () => const MainScreen(),
          //   transition: Transition.fade,
          // ),
          GetPage(
            name: ProgramEventDetailScreen.route,
            page: () => const ProgramEventDetailScreen(),
            transition: Transition.fade,
          ),
          GetPage(
            name: EventInitialScreen.route,
            page: () => const EventInitialScreen(),
            transition: Transition.fade,
          ),

          GetPage(
            name: EventCaptureScreen.route,
            page: () => const EventCaptureScreen(),
            transition: Transition.fade,
          ),
        ],
      ),
    );
  }
}
