import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/data_run/screens/home_screen/home_screen.widget.dart';
import 'package:mass_pro/data_run/screens/view/view_base.dart';
import 'package:mass_pro/generated/l10n.dart';
import 'package:mass_pro/main/data/service/work_manager/nmc_worker/work_info.dart';
import 'package:mass_pro/main/data/service/work_manager/work_manager_controller_impl.dart';
import 'package:mass_pro/main/usescases/login/login_screen.widget.dart';
import 'package:mass_pro/main/usescases/sync/sync_screen_presenter.dart';
import 'package:mass_pro/main/usescases/sync/sync_view.dart';
import 'package:mass_pro/riverpod/use_on_init_hook.dart';
import 'package:mass_pro/utils/mass_utils/utils.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


class SyncScreen extends ConsumerStatefulWidget {
  const SyncScreen({super.key});

  static const String route = '/sync-screen';

  @override
  ConsumerState<SyncScreen> createState() => _SyncScreenState();
}

class _SyncScreenState extends ConsumerState<SyncScreen>
    with SyncView, ViewBase {
  late final SyncScreenPresenter presenter;

  @override
  Widget build(BuildContext context) {
    final syncProgressInfo = ref.watch(syncProgressProvider);

    return Scaffold(
      body: ColoredBox(
          color: convertHexStringToColor('#2C98F0')!,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: CircularPercentIndicator(
                radius: 40.0,
                lineWidth: 3.0,
                animation: true,
                animateFromLastPercent: true,
                percent: syncProgressInfo.progress / 100,
                // header: Icon(
                //   Icons.person_pin,
                //   size: 50.0,
                //   color: Colors.blue[100],
                // ),
                center: syncProgressInfo.state == WorkInfoState.SUCCEEDED
                    ? const Icon(
                        Icons.check,
                        color: Color(0xffffad30),
                        size: 35,
                      )
                    : Text(
                        '${syncProgressInfo.progress}%',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            color: Color(0xffb3cbf4)),
                      ),
                footer: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    syncProgressInfo.state != WorkInfoState.SUCCEEDED
                        ? syncProgressInfo.message
                        : S.of(context).configurationReady,
                    style: const TextStyle(fontSize: 13.0, color: Colors.white),
                  ),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                backgroundColor: Colors.transparent,
                progressColor: Colors.blue[100],
              ),
            ),
          )),
    );
  }

  @override
  void initState() {
    super.initState();
    presenter = ref.read(syncScreenPresenterProvider(this));
    ref.listenManual<bool?>(
        syncProgressProvider.select(
            (progressInfo) => progressInfo.state == WorkInfoState.SUCCEEDED),
        (previous, next) {
      if (next ?? false) {
        // WidgetsBinding.instance.addPostFrameCallback((_) {
        setMetadataSyncSucceed();
        // });
      }
    });

    ref.listenManual<bool?>(
        syncProgressProvider.select(
            (progressInfo) => progressInfo.state == WorkInfoState.FAILED),
        (previous, next) {
      if (next ?? false) {
        // WidgetsBinding.instance.addPostFrameCallback((_) {
        showMetadataFailedMessage(ref.read(syncProgressProvider).message);
        // });
      }
    });
  }

  @override
  void didChangeDependencies() {
    useOnInit(() => presenter.init());
    // presenter.init();
    super.didChangeDependencies();
  }

  @override
  void setMetadataSyncSucceed() {
    presenter.onMetadataSyncSuccess();
  }

  @override
  void showMetadataFailedMessage(String? message) {
    showInfoDialog(
      title: L('something_wrong'),
      prefix: L('metada_first_sync_error'),
      message: message ?? '',
      // positiveButtonText: L('share'),
      negativeButtonText: L('go_back'),
      // onPositiveClick: () => message?.let((it) => share(it)),
      onNegativeClick: () => presenter.onLogout(),
    );
  }

  @override
  void goToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
    // ref
    //     .read(appStateNotifierProvider.notifier)
    //     .gotToNextScreenPopAll(const LoginScreen());
  }

  @override
  void goToMain() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreenWidget()),
    );
    // Get.offNamed(HomeScreenWidget.route);
  }

  @override
  void setFlag(String? flagName) {
    // TODO: implement setFlag
  }

  @override
  void setMetadataSyncStarted([int? progresss]) {
    // TODO: implement setMetadataSyncStarted
  }

  @override
  void setServerTheme(int themeId) {
    // TODO: implement setServerTheme
  }
}

final syncSucceedProvider = Provider.autoDispose<bool>((ref) {
  final succeeded = ref.watch(syncProgressProvider
      .select((progressInfo) => progressInfo.state == WorkInfoState.SUCCEEDED));
  return succeeded;
});

final syncFailedProvider = Provider.autoDispose<bool>((ref) {
  final failed = ref.watch(syncProgressProvider
      .select((progressInfo) => progressInfo.state == WorkInfoState.FAILED));
  return failed;
});
