// import 'dart:async';
//
// import 'package:d2_remote/d2_remote.dart';
// import 'package:fast_immutable_collections/fast_immutable_collections.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:get/get.dart';
// import 'package:mass_pro/commons/constants.dart';
// import 'package:mass_pro/commons/prefs/preference_provider.dart';
// import 'package:mass_pro/data_run/screens/dashboard/dashboard_screen.widget.dart';
// import 'package:mass_pro/data_run/screens/project_details/project_detail_screen.widget.dart';
// import 'package:mass_pro/utils/mass_utils/utils.dart';
// import 'package:mass_pro/main/usescases/splash/splash_presenter.dart';
// import 'package:mass_pro/main/usescases/splash/splash_screen.widget.dart';
// import 'package:mass_pro/riverpod/provider_logger.dart';
// import 'package:mass_pro/utils/navigator_key.dart';
// import 'package:stack_trace/stack_trace.dart' as stack_trace;
//
// import 'main.reflectable.dart';
//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   initializeReflectable();
//
//   await PreferenceProvider.initialize();
//   await D2Remote.initialize();
//
//   FlutterError.demangleStackTrace = (StackTrace stack) {
//     if (stack is stack_trace.Trace) {
//       return stack.vmTrace;
//     }
//     if (stack is stack_trace.Chain) {
//       return stack.toTrace().vmTrace;
//     }
//     return stack;
//   };
//
//   runApp(ProviderScope(
//     observers: [
//       ProviderLogger(providersNameToLog: const IListConst(const [
//         'formFieldsRepositoryProvider'
//       ]))
//     ],
//     child: const App(),
//   ));
// }
//
// class App extends ConsumerWidget {
//   const App({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final routeObserver = Get.put<RouteObserver>(RouteObserver<PageRoute>());
//     final locale = L.createLocale('en');
//
//     return GetMaterialApp(
//       navigatorKey: navigatorKey,
//       navigatorObservers: [routeObserver],
//       title: 'Flutter FormBuilder Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.light().copyWith(
//         appBarTheme: const AppBarTheme().copyWith(backgroundColor: Colors.blue.shade200),
//       ),
//       localizationsDelegates: const [
//         L.delegate,
//         GlobalMaterialLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//       ],
//       supportedLocales: kLanguages
//           .map((String locale) => L.createLocale(locale))
//           .toList(),
//       locale: locale,
//       localeResolutionCallback: (locale, supportedLocales) {
//         if (locale != null) {
//           return locale;
//         }
//         for (final Locale supportedLocale in supportedLocales) {
//           if (supportedLocale.languageCode == locale?.languageCode &&
//               supportedLocale.countryCode == locale?.countryCode) {
//             return supportedLocale;
//           }
//         }
//         return supportedLocales.first;
//       },
//       initialRoute: SplashScreen.route,
//       getPages: [
//         GetPage(
//           name: SplashScreen.route,
//           page: () {
//             ref.read(splashPresenterProvider).init();
//             return const SplashScreen();
//           },
//           transition: Transition.fade,
//         ),
//         GetPage(
//           name: DashboardScreenWidget.route,
//           page: () => const DashboardScreenWidget(),
//           transition: Transition.fade,
//         ),
//         GetPage(
//           name: ProjectDetailScreenWidget.route,
//           page: () => const ProjectDetailScreenWidget(),
//           transition: Transition.fade,
//         ),
//       ],
//     );
//   }
// }
