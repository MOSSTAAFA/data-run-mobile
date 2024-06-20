import 'package:d2_remote/d2_remote.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/commons/prefs/preference_provider.dart';
import 'package:mass_pro/l10n/app_localizations.dart';
import 'package:mass_pro/l10n/locale_selector.dart';
import 'package:mass_pro/main.reflectable.dart';
import 'package:mass_pro/riverpod/provider_logger.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeReflectable();

  await PreferenceProvider.initialize();

  await D2Remote.initialize();

  // await setUpActivityManagementMocks();

  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) {
      return stack.vmTrace;
    }
    if (stack is stack_trace.Chain) {
      return stack.toTrace().vmTrace;
    }
    return stack;
  };

  runApp(ProviderScope(
    /// log specific provider
    observers: [
      ProviderLogger(
          providersNameToLog: const IListConst(const [
        /*'formViewModelNotifierProvider', 'formViewIndexProvider'*/
      ]))
    ],

    /// log all providers
    // observers: [ProviderLogger(providerNameToLog: '')],
    child: App(),
  ));
}

class App extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localeProvider = ref.watch(localeSelectorProvider);

    return MaterialApp(
      locale: localeProvider,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('es'),
      ],
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localeProvider = ref.watch(localeSelectorProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('title')),
        actions: [
          DropdownButton<Locale>(
            value: localeProvider,
            items: const [
              DropdownMenuItem(
                value: Locale('en'),
                child: Text('English'),
              ),
              DropdownMenuItem(
                value: Locale('es'),
                child: Text('Español'),
              ),
            ],
            onChanged: (locale) {
              ref
                  .read(localeSelectorProvider.notifier)
                  .setLocale((locale) => locale);
            },
          ),
        ],
      ),
      body: Center(
        child: Text(AppLocalizations.of(context).translate('message')),
      ),
    );
  }
}
