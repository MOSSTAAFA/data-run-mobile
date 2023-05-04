import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../commons/state/app_state_notifier.dart';
import '../login/login_screen.widget.dart';
import '../main/main_screen.widget.dart';
import '../sync/sync_screen.widget.dart';
import 'splash_presenter.dart';
import 'splash_view.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> with SplashView {
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
      ref.read(appStateNotifierProvider.notifier).gotToNextScreenPopAll(
          MainScreen(launchDataSync: initialDataSyncDone));
    } else if (isUserLogged && !initialSyncDone) {
      ref
          .read(appStateNotifierProvider.notifier)
          .gotToNextScreenPopAll(const SyncScreen());
    } else {
      presenter.getAccounts().then((int count) {
        ref
            .read(appStateNotifierProvider.notifier)
            .gotToNextScreenPopAll(LoginScreen(accountsCount: count));
      });
    }
  }

  @override
  void renderFlag(String flagName) {
    // TODO: implement renderFlag
  }
}
