import 'dart:async';

import 'package:d2_remote/d2_remote.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:datarun/commons/prefs/preference_provider.dart';
import 'package:datarun/core/network/connectivy_service.dart';
import 'package:datarun/core/user/auth_service.dart';
import 'package:datarun/data_run/screens/home_screen/home_screen.widget.dart';
import 'package:datarun/generated/l10n.dart';
import 'package:datarun/main/usescases/login/login_screen.widget.dart';
import 'package:datarun/main/usescases/splash/splash_screen.widget.dart';
import 'package:datarun/main/usescases/sync/sync_screen.widget.dart';
import 'package:datarun/main_constants/main_constants.dart';
import 'package:datarun/utils/app_appearance.dart';
import 'package:datarun/utils/navigator_key.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;

import 'package:datarun/main.reflectable.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeReflectable();

  await PreferenceProvider.initialize();

  /// sdk all system enetieis Repositories, save, load, and provide access to them
  await D2Remote.initialize();
  
  await ConnectivityService.instance.initialize();
  await UserService.instance.checkAuthStatus();

  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) {
      return stack.vmTrace;
    }
    if (stack is stack_trace.Chain) {
      return stack.toTrace().vmTrace;
    }
    return stack;
  };

  // await SentryFlutter.init(
  //   (options) {
  //     options.dsn =
  //         'https://c39a75530f4b8694183508a689bbafb7@o4504831846645760.ingest.us.sentry.io/4507587127214080';
  //     // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
  //     // We recommend adjusting this value in production.
  //     // options.tracesSampleRate = 1.0;
  //     // The sampling rate for profiling is relative to tracesSampleRate
  //     // Setting to 1.0 will profile 100% of sampled transactions:
  //     // options.profilesSampleRate = 1.0;
  //   },
  //   appRunner: () => runApp(ProviderScope(
  //     child: const App(),
  //   )),
  // );
  runApp(ProviderScope(
    child: const App(),
  ));
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // const locale = Locale('en', 'en_us');
    const Locale locale = Locale('ar', '');
    // final userService = UserService.instance;

    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Datarun',
      debugShowCheckedModeBanner: false,
      themeMode: ref.watch(appAppearanceNotifierProvider).themeMode,
      theme: getTheme(ref),
      darkTheme: getDarkTheme(ref),
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
      locale: locale,
      home: const SplashScreen(), //const AuthCheck(),
      onGenerateRoute: (settings) {
        // Handle named routes with arguments
        if (settings.name == SyncScreen.routeName) {
          // final syncArgument = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) => SyncScreen(/*syncArgument: syncArgument*/),
          );
        }
        return null;
      },
      routes: {
        // '/': (context) => AuthCheck(),
        HomeScreen.routeName: (context) => HomeScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
      },
    );
  }

  ThemeData getTheme(WidgetRef ref) => ThemeData(
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
      );

  ThemeData getDarkTheme(WidgetRef ref) => ThemeData(
        colorSchemeSeed: ref
                    .watch(appAppearanceNotifierProvider)
                    .colorSelectionMethod ==
                ColorSelectionMethod.colorSeed
            ? ref.watch(appAppearanceNotifierProvider).colorSelected.color
            : ref.watch(appAppearanceNotifierProvider).imageColorScheme.primary,
        useMaterial3: ref.watch(appAppearanceNotifierProvider).useMaterial3,
        brightness: Brightness.dark,
      );

  final supportedLocales = const <Locale>[
    Locale('ar', ''),
    Locale('en', 'en_us'),
  ];

  final localizationsDelegates = const <LocalizationsDelegate<dynamic>>[
    // L.delegate,
    S.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];
}
