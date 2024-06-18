import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/data_run/screens/dashboard/dashboard_screen.widget.dart';
import 'package:mass_pro/data_run/screens/view/view_base.dart';

import '../../../commons/state/app_state_notifier.dart';
import '../login/login_screen.widget.dart';
import '../sync/sync_screen.widget.dart';
import 'splash_presenter.dart';
import 'splash_view.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  static const String route = '/SplashScreen';

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
      // ref
      //     .read(appStateNotifierProvider.notifier)
      //     .gotToNextScreen(DashboardScreenWidget(launchDataSync: initialDataSyncDone));

      ref
          .read(appStateNotifierProvider.notifier)
          .gotToNextScreen(DashboardScreenWidget(launchDataSync: initialDataSyncDone));
    } else if (isUserLogged && !initialSyncDone) {
      ref
          .read(appStateNotifierProvider.notifier)
          .gotToNextScreen(const SyncScreen());
    // .navigateToScreen(const SyncScreen());
    //       .gotToNextScreenPopAll(const SyncScreen());
    } else {
      presenter.getAccounts().then((count) {
        ref
            .read(appStateNotifierProvider.notifier)
            // .navigateToScreen(LoginScreen(accountsCount: count));
        .gotToNextScreen(LoginScreen(accountsCount: count));
            // .gotToNextScreenPopAll(LoginScreen(accountsCount: count));
      });
    }
  }

  @override
  void renderFlag(String flagName) {
    // TODO: implement renderFlag
  }
}
