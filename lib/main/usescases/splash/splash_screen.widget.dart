import 'package:flutter/material.dart';

import 'splash_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SplashView {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void goToNextScreen(
      {required bool isUserLogged,
      required bool sessionLocked,
      required bool initialSyncDone,
      required bool initialDataSyncDone}) {
    // TODO: implement goToNextScreen
  }

  @override
  void renderFlag(String flagName) {
    // TODO: implement renderFlag
  }
}
