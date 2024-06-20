import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/commons/extensions/standard_extensions.dart';
import 'package:mass_pro/commons/state/app_state_notifier.dart';
import 'package:mass_pro/data_run/screens/dashboard/dashboard_deck/dashboard_deck.widget.dart';
import 'package:mass_pro/data_run/screens/dashboard/dashboard_presenter.dart';
import 'package:mass_pro/data_run/screens/dashboard/dashboard_screen_view.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_screen.widget.dart';
import 'package:mass_pro/data_run/screens/view/view_base.dart';
import 'package:mass_pro/main/data/service/sync_status_controller.dart';
import 'package:mass_pro/main/l10n/app_localizations.dart';
import 'package:mass_pro/main/usescases/login/login_screen.widget.dart';
import 'package:mass_pro/utils/navigator_key.dart';

/// Dashboard Screen is the main Screen of the app the show after login
/// Currently it lists the available projects as items other General relevant data
class DashboardScreenWidget extends ConsumerStatefulWidget {
  const DashboardScreenWidget(
      {super.key, this.launchDataSync = false, this.forceToNotSynced = false});

  static const String route = '/';

  final bool forceToNotSynced;

  final bool launchDataSync;

  @override
  ConsumerState<DashboardScreenWidget> createState() =>
      _DashboardScreenWidgetState();
}

class _DashboardScreenWidgetState extends ConsumerState<DashboardScreenWidget>
    with DashboardScreenView, ViewBase {
  late final DashboardPresenter presenter;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalization.of(context)!;

    return Theme(
      data: ThemeData(
          colorScheme:
              Theme.of(context).colorScheme.copyWith(primary: colors[0])),
      child: Navigator(
          key: dashboardKey,
          initialRoute: '/',
          onGenerateRoute: (RouteSettings settings) {
            WidgetBuilder builder;
            builder = (_) => when(settings.name, {
                  '/': () => const DashboardDeckWidget(),
                  ProjectDetailScreenWidget.route: () {
                    // final id = (settings.arguments as Bundle)['id'];
                    return const ProjectDetailScreenWidget(/*projectUid: id*/);
                  },
                }).orElse(() => const DashboardDeckWidget());
            return MaterialPageRoute(builder: builder, settings: settings);
          }),
    );
  }

  @override
  void initState() {
    presenter = ref.read(dashboardPresenterProvider(this));

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
    ref
        .read(appStateNotifierProvider.notifier)
        .gotToNextScreenPopAll(LoginScreen(
          accountsCount: accountsCount,
          isDeletion: isDeletion,
        ));
  }

  @override
  bool hasToNotSync() {
    return widget.forceToNotSynced;
  }

  @override
  void openDrawer(int gravity) {
    // TODO: implement openDrawer
  }

  @override
  void renderUsername(String username) {
    // TODO: implement renderUsername
  }

  @override
  void showGranularSync() {
    // TODO: implement showGranularSync
  }
}
