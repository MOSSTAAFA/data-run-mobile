import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'sync_presenter.dart';
import 'sync_view.dart';

class SyncScreen extends ConsumerStatefulWidget {
  const SyncScreen({super.key});

  @override
  ConsumerState<SyncScreen> createState() => _SyncScreenState();
}

class _SyncScreenState extends ConsumerState<SyncScreen> with SyncView {
  late final SyncScreenPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void initState() {
    super.initState();
    presenter = ref.read(syncScreenPresenterProvider(this));
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
