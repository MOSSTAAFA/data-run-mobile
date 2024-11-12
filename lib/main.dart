import 'dart:async';

import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/datarun_shared/utilities/authenticated_user.dart';
import 'package:datarun/data_run/usecases/auth/auth_service.dart';
import 'package:datarun/data_run/usecases/auth/user_session_manager.dart';
import 'package:datarun/data_run/usecases/login/auth_wrapper.dart';
import 'package:datarun/utils/user_preferences/preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:datarun/commons/prefs/preference_provider.dart';
import 'package:datarun/core/network/connectivy_service.dart';
import 'package:datarun/generated/l10n.dart';
import 'package:datarun/main_constants/main_constants.dart';
import 'package:datarun/utils/app_appearance.dart';
import 'package:datarun/utils/navigator_key.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;

import 'package:datarun/main.reflectable.dart';

AuthenticationResult? authenticationResult;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeReflectable();

  await PreferenceProvider.initialize();
  final sharedPreferences = await SharedPreferences.getInstance();

  // // SDK initialization and repository setup
  // await D2Remote.initialize();

  await ConnectivityService.instance.initialize();

  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) {
      return stack.vmTrace;
    }
    if (stack is stack_trace.Chain) {
      return stack.toTrace().vmTrace;
    }
    return stack;
  };

  // // Global error handling
  // FlutterError.onError = (FlutterErrorDetails details) {
  //   // Report Flutter framework errors
  //   DExceptionReporter().report(
  //     DException(details.exceptionAsString(), cause: details.exception),
  //   );
  //
  //   // Optionally show user feedback or display a fallback UI if needed
  //   FlutterError.presentError(details);
  // };
  final userSessionManager = UserSessionManager(sharedPreferences);

  final authService = AuthService(userSessionManager);

  // does the user have active session in preference (local check)
  final bool hasExistingSession =  userSessionManager.isAuthenticated;

  // is has active session initialize, otherwise it will be initialized
  // by user login in.
  if(hasExistingSession) {
    await D2Remote.initialize();
  }

  runApp(ProviderScope(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      authServiceProvider.overrideWithValue(authService),
      userSessionManagerProvider.overrideWithValue(userSessionManager),
    ],
    child: App(
      isAuthenticated: hasExistingSession,
    ),
  ));
}

class App extends ConsumerWidget {
  const App({super.key, required this.isAuthenticated});

  final bool isAuthenticated;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = ref.watch(preferenceNotifierProvider(Preference.language));

    Locale locale = Locale(language, language == 'en' ? 'en_US' : '');

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
      home: AuthWrapper(isAuthenticated: isAuthenticated),
      // home: const SplashScreen(),
      //const AuthCheck(),
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
