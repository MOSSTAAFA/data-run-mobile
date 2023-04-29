import 'package:flutter/material.dart';

import 'sync_view.dart';

class SyncScreen extends StatefulWidget {
  const SyncScreen({super.key});

  @override
  State<SyncScreen> createState() => _SyncScreenState();
}

class _SyncScreenState extends State<SyncScreen> with SyncView {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void goToLogin() {
    // TODO: implement goToLogin
  }

  @override
  void goToMain() {
    // TODO: implement goToMain
  }

  @override
  void setFlag(String? flagName) {
    // TODO: implement setFlag
  }

  @override
  void setMetadataSyncStarted() {
    // TODO: implement setMetadataSyncStarted
  }

  @override
  void setMetadataSyncSucceed() {
    // TODO: implement setMetadataSyncSucceed
  }

  @override
  void setServerTheme(int themeId) {
    // TODO: implement setServerTheme
  }

  @override
  void showMetadataFailedMessage(String? message) {
    // TODO: implement showMetadataFailedMessage
  }
}
