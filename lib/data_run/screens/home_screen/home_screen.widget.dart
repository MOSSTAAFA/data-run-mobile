import 'package:d2_remote/modules/auth/user/entities/d_user.entity.dart';
import 'package:datarun/commons/custom_widgets/async_value.widget.dart';
import 'package:datarun/data_run/screens/home_screen/home_deck/home_items_models_notifier.dart';
import 'package:datarun/data_run/screens/sync_screen/sync_screen.widget.dart';
import 'package:datarun/data_run/usecases/auth/auth_service.dart';
import 'package:datarun/data_run/usecases/auth/internet_aware_screen.dart';
import 'package:datarun/data_run/usecases/auth/user_session_manager.dart';
import 'package:datarun/data_run/usecases/sync_manager/sync_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:datarun/data_run/screens/home_screen/drawer/settings_page.dart';
import 'package:datarun/data_run/screens/home_screen/home_deck/home_deck.widget.dart';
import 'package:datarun/generated/l10n.dart';
import 'package:datarun/utils/navigator_key.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen(
      {super.key, this.launchDataSync = false, this.forceToNotSynced = false});

  static String routeName = '/';

  final bool forceToNotSynced;

  final bool launchDataSync;

  @override
  _HomeScreenWidgetState createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userSessionManager = ref.watch(userSessionManagerProvider);
    final userInfoAsync = ref.watch(userInfoProvider);
    return AsyncValueWidget(
      value: userInfoAsync,
      valueBuilder: (userInfo) {
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
                  accountName: Text(userInfo?.firstName ?? 'no Info'),
                  accountEmail: Text(S.of(context).organization),
                  currentAccountPicture: CircleAvatar(
                    child: Text(userInfo?.username?.substring(0, 1) ?? ''),
                  ),
                ),
                Text('${S.of(context).version}: 1.0.1'),
                Text('database: ${userSessionManager.databaseName}'),
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
                      MaterialPageRoute(
                          builder: (context) => const SyncScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
          body: const HomeDeck(), // Main content
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkAndSync();
    });
  }

  Future<void> _checkAndSync() async {
    final syncService = ref.read(syncServiceProvider.notifier);
    if ((await syncService.needsSync()) || widget.launchDataSync) {
      Navigator.push(
        navigatorKey.currentContext!,
        MaterialPageRoute(builder: (context) => const SyncScreen()),
      );
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.refresh(homeItemsModelsNotifierProvider);
    });
  }
}
