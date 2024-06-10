// import 'dart:async';
//
// import 'package:d2_remote/d2_remote.dart';
// import 'package:fast_immutable_collections/fast_immutable_collections.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:mass_pro/commons/prefs/preference_provider.dart';
// import 'package:mass_pro/data_run/screens/dashboard/dashboard_screen.widget.dart';
// import 'package:mass_pro/data_run/screens/project/project_screen.widget.dart';
// import 'package:mass_pro/main/di.dart' as di;
// import 'package:mass_pro/main/l10n/app_localizations.dart';
// import 'package:mass_pro/main/usescases/events_without_registration/event_capture/event_capture_screen.widget.dart';
// import 'package:mass_pro/main/usescases/events_without_registration/event_initial/event_initial_screen.widget.dart';
// import 'package:mass_pro/main/usescases/program_event_detail/program_event_detail_screen.widget.dart';
// import 'package:mass_pro/main/usescases/splash/splash_screen.widget.dart';
// import 'package:mass_pro/riverpod/provider_logger.dart';
// import 'package:stack_trace/stack_trace.dart' as stack_trace;
//
// import 'main.reflectable.dart';
//
// final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
//
// extension NavigatorKeyUtils on GlobalKey<NavigatorState> {
//   AppLocalization get localization {
//     return AppLocalization.of(currentContext!)!;
//   }
// }
//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   initializeReflectable();
//
//   await PreferenceProvider.initialize();
//
//   await D2Remote.initialize();
//   // await setUpActivityManagementMocks();
//
//   di.init();
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
//   // wrap the entire app with a ProviderScope so that widgets
//   // will be able to read providers
//   runApp(ProviderScope(
//     /// log specific provider
//     observers: [
//       ProviderLogger(
//           providersNameToLog: const IListConst(const [
//         /*'formViewModelNotifierProvider', 'formViewIndexProvider'*/
//       ]))
//     ],
//
//     /// log all providers
//     // observers: [ProviderLogger(providerNameToLog: '')],
//     child: const App(),
//   ));
// }
//
// class App extends StatelessWidget {
//   const App({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // final routeObserver = Get.put<RouteObserver>(RouteObserver<PageRoute>());
//     // final locale = AppLocalization.createLocale('en');
//
//     return MaterialApp(
//       routes: {
//         '/': (context) => const SplashScreen(),
//         ProgramEventDetailScreen.route: (context) =>
//             const ProgramEventDetailScreen(),
//         EventInitialScreen.route: (context) => const EventInitialScreen(),
//         EventCaptureScreen.route: (context) => const EventCaptureScreen(),
//         DashboardScreenWidget.route: (context) => const DashboardScreenWidget(),
//         ProjectScreenWidget.route: (context) => const ProjectScreenWidget(),
//       },
//       title: 'Flutter FormBuilder Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.light().copyWith(
//           appBarTheme: const AppBarTheme()
//               .copyWith(backgroundColor: Colors.blue.shade200)),
//
//       // home: const SplashScreen(),
//     );
//   }
// }
