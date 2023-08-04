import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../commons/state/app_state_notifier.dart';
import '../general/view_base.dart';
import '../login/login_screen.widget.dart';
import '../main/main_screen.widget.dart';
import '../sync/sync_screen.widget.dart';
import 'splash_presenter.dart';
import 'splash_view.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  static const String route = '/';

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SplashView, ViewBase {
  late final SplashPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
            child: Text(
      'Splash Screen...',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    )));
  }

  @override
  void initState() {
    super.initState();
    presenter = ref.read(splashPresenterProvider(this));
  }

  @override
  void didChangeDependencies() {
    presenter.init();
    super.didChangeDependencies();
  }

  @override
  void goToNextScreen(
      {required bool isUserLogged,
      required bool sessionLocked,
      required bool initialSyncDone,
      required bool initialDataSyncDone}) {
    if (isUserLogged && initialSyncDone && !sessionLocked) {
      // ref
      //     .read(appStateNotifierProvider.notifier)
      //     .gotToNextScreen(MainScreen(launchDataSync: initialDataSyncDone));
      ref
          .read(appStateNotifierProvider.notifier)
          .gotToNextScreenPopAll(MainScreen(launchDataSync: initialDataSyncDone));
    } else if (isUserLogged && !initialSyncDone) {
      ref
          .read(appStateNotifierProvider.notifier)
          // .gotToNextRoute(SyncScreen.route);
          .gotToNextScreenPopAll(const SyncScreen());
    } else {
      presenter.getAccounts().then((count) {
        ref
            .read(appStateNotifierProvider.notifier)
            // .gotToNextRoute(LoginScreen.route, arguments: count);
            .gotToNextScreenPopAll(LoginScreen(accountsCount: count));
      });
    }
  }

  @override
  void renderFlag(String flagName) {
    // TODO: implement renderFlag
  }
}
