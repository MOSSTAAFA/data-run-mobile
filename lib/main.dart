import 'dart:async';

import 'package:d2_remote/d2_remote.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:mass_pro/commons/prefs/preference_provider.dart';
import 'package:mass_pro/data_run/screens/dashboard/dashboard_screen.widget.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_screen.widget.dart';
import 'package:mass_pro/generated/l10n.dart';
import 'package:mass_pro/main/usescases/splash/splash_presenter.dart';
import 'package:mass_pro/main/usescases/splash/splash_screen.widget.dart';
import 'package:mass_pro/main_constants/main_constants.dart';
import 'package:mass_pro/riverpod/provider_logger.dart';
import 'package:mass_pro/utils/app_appearance.dart';
import 'package:mass_pro/utils/navigator_key.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;

import 'package:mass_pro/main.reflectable.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeReflectable();

  await PreferenceProvider.initialize();

  await D2Remote.initialize(
      /*
      databaseFactory: kIsWeb ? databaseFactoryFfiWeb : null*/
      );

  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) {
      return stack.vmTrace;
    }
    if (stack is stack_trace.Chain) {
      return stack.toTrace().vmTrace;
    }
    return stack;
  };

  /*await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://c39a75530f4b8694183508a689bbafb7@o4504831846645760.ingest.us.sentry.io/4507587127214080';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
      // The sampling rate for profiling is relative to tracesSampleRate
      // Setting to 1.0 will profile 100% of sampled transactions:
      options.profilesSampleRate = 1.0;
    },
    appRunner: () => */
  runApp(ProviderScope(
    observers: <ProviderObserver>[
      ProviderLogger(
          providersNameToLog:
              const IListConst(<String>['formConfigurationProvider', 'treeNodeDataSourceProvider']))
    ],
    child: const App(),
  )) /*,
  )*/
      ;
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // const locale = Locale('en', 'en_us');
    const Locale locale = Locale('ar', '');

    return GetMaterialApp(
      navigatorKey: navigatorKey,
      title: 'MASS PRO',
      debugShowCheckedModeBanner: false,
      themeMode: ref.watch(appAppearanceNotifierProvider).themeMode,
      theme: ThemeData(
        colorSchemeSeed:
            ref.watch(appAppearanceNotifierProvider).colorSelectionMethod ==
                    ColorSelectionMethod.colorSeed
                ? ref.watch(appAppearanceNotifierProvider).colorSelected.color
                : null,
        colorScheme:
            ref.watch(appAppearanceNotifierProvider).colorSelectionMethod ==
                    ColorSelectionMethod.image
                ? ref.watch(appAppearanceNotifierProvider).imageColorScheme
                : null,
        useMaterial3: ref.watch(appAppearanceNotifierProvider).useMaterial3,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: ref
                    .watch(appAppearanceNotifierProvider)
                    .colorSelectionMethod ==
                ColorSelectionMethod.colorSeed
            ? ref.watch(appAppearanceNotifierProvider).colorSelected.color
            : ref.watch(appAppearanceNotifierProvider).imageColorScheme.primary,
        useMaterial3: ref.watch(appAppearanceNotifierProvider).useMaterial3,
        brightness: Brightness.dark,
      ),
      localizationsDelegates: const <LocalizationsDelegate>[
        // L.delegate,
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[
        Locale('ar', ''),
        Locale('en', 'en_us'),
      ],
      locale: locale,
      initialRoute: SplashScreen.route,
      getPages: <GetPage>[
        GetPage(
          name: SplashScreen.route,
          page: () {
            ref.read(splashPresenterProvider).init();
            return const SplashScreen();
          },
          transition: Transition.fade,
        ),
        GetPage(
          name: DashboardScreenWidget.route,
          page: () => const DashboardScreenWidget(),
          transition: Transition.fade,
        ),
        GetPage(
          name: ProjectDetailScreenWidget.route,
          page: () => const ProjectDetailScreenWidget(),
          transition: Transition.fade,
        ),
      ],
    );
  }
}
