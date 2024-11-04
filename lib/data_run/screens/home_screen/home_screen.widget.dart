import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/core/user/auth_service.dart';
import 'package:mass_pro/data_run/screens/home_screen/drawer/settings_page.dart';
import 'package:mass_pro/data_run/screens/home_screen/home_deck/home_deck.widget.dart';
import 'package:mass_pro/data_run/screens/home_screen/home_presenter.dart';
import 'package:mass_pro/data_run/screens/home_screen/home_screen_view.dart';
import 'package:mass_pro/data_run/screens/view/view_base.dart';
import 'package:mass_pro/generated/l10n.dart';
import 'package:mass_pro/main/data/service/sync_status_controller.dart';
import 'package:mass_pro/main/usescases/auth/internet_aware_screen.dart';
import 'package:mass_pro/main/usescases/login/login_screen.widget.dart';
import 'package:mass_pro/main/usescases/sync/sync_screen.widget.dart';
import 'package:mass_pro/utils/navigator_key.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen(
      {super.key, this.launchDataSync = false, this.forceToNotSynced = false});

  static String routeName = '/home';

  final bool forceToNotSynced;

  final bool launchDataSync;

  @override
  _HomeScreenWidgetState createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends ConsumerState<HomeScreen>
    with HomeScreenView, ViewBase {
  late final HomePresenter presenter;

  @override
  Widget build(BuildContext context) {
    final userService = UserService.instance;
    final user = userService.user!;
    final userInfo = user.firstName ?? user.username;

    return Scaffold(
      appBar: AppBar(
        actions: const [InternetAwareChip()],
        title: Text(S.of(context).home),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(userInfo),
              accountEmail: Text(S.of(context).organization),
              currentAccountPicture: CircleAvatar(
                child: Text(userInfo.substring(0, 1)),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(S.of(context).settings),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    navigatorKey.currentContext!,
                    MaterialPageRoute(
                      builder: (context) => const SettingsPage(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.sync),
              title: Text(S.of(context).fetchUpdates),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  navigatorKey.currentContext!,
                  MaterialPageRoute(builder: (context) => const SyncScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text(S.of(context).logout),
              onTap: () {
                Navigator.pop(context);
                presenter.logOut();
              },
            ),
          ],
        ),
      ),
      body: const HomeDeck(), // Main content
    );
  }

  void logOut() {
    // Navigator.push(
    //     navigatorKey.currentContext!,
    //     MaterialPageRoute(
    //       builder: (context) => const SettingsPage(),
    //     ));
  }

  @override
  void initState() {
    presenter = ref.read(homePresenterProvider(this));

    ref.listenManual<bool?>(
        syncStatusControllerInstanceProvider.select((syncStatusController) =>
            syncStatusController.syncStatusData.running), (previous, next) {
      if (next ?? false) {
      } else {
        presenter.onDataSuccess();
      }
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    presenter.wasSyncAlreadyDone().then((alreadyDone) {
      if (!alreadyDone) {
        presenter.launchInitialDataSync();
      }
    });
    super.didChangeDependencies();
  }

  @override
  void goToLogin(int accountsCount, {bool isDeletion = false}) {
    Navigator.pushAndRemoveUntil(
        navigatorKey.currentContext!,
        MaterialPageRoute(
            builder: (context) => LoginScreen(
                  accountsCount: accountsCount,
                  isDeletion: isDeletion,
                )),
        (r) => r.isFirst);
  }

  @override
  bool hasToNotSync() {
    return widget.forceToNotSynced;
  }
}
