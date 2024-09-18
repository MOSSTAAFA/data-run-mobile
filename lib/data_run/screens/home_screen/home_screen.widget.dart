import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:mass_pro/commons/state/app_state_notifier.dart';
import 'package:mass_pro/data_run/screens/home_screen/home_deck/home_deck.widget.dart';
import 'package:mass_pro/data_run/screens/home_screen/home_presenter.dart';
import 'package:mass_pro/data_run/screens/home_screen/home_screen_view.dart';
import 'package:mass_pro/data_run/screens/view/view_base.dart';
import 'package:mass_pro/generated/l10n.dart';
import 'package:mass_pro/main/data/service/sync_status_controller.dart';
import 'package:mass_pro/main/usescases/login/login_screen.widget.dart';
import 'package:mass_pro/main/usescases/sync/sync_screen.widget.dart';
import 'package:mass_pro/main_constants/main_constants.dart';
import 'package:mass_pro/utils/app_appearance.dart';

/// Dashboard Screen is the main Screen of the app the show after login
/// Currently it lists the available projects as items other General relevant data
class HomeScreenWidget extends ConsumerStatefulWidget {
  const HomeScreenWidget(
      {super.key, this.launchDataSync = false, this.forceToNotSynced = false});

  static const String route = '/';

  final bool forceToNotSynced;

  final bool launchDataSync;

  @override
  ConsumerState<HomeScreenWidget> createState() =>
      _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends ConsumerState<HomeScreenWidget>
    with HomeScreenView, ViewBase {
  late final HomePresenter presenter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            // IconButton(
            //     onPressed: () => presenter.logOut(), icon: const Icon(Icons.logout)),
            IconButton(
                onPressed: () => presenter
                    .onSyncAllClick()
                    .then((t) => Get.to(const SyncScreen())),
                icon: const Icon(Icons.sync)),
            const _BrightnessButton(),
            const _Material3Button(),
            const _ColorSeedButton(),
            const _ColorImageButton()
          ],
          title: Text(S.of(context).home),
        ),
        body: const HomeDeck());
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

class _ColorSeedButton extends ConsumerWidget {
  const _ColorSeedButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton(
      icon: const Icon(
        Icons.palette_outlined,
      ),
      tooltip: 'Select a seed color',
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      itemBuilder: (context) {
        return List.generate(ColorSeed.values.length, (index) {
          ColorSeed currentColor = ColorSeed.values[index];

          return PopupMenuItem(
            value: index,
            enabled: currentColor !=
                    ref.watch(appAppearanceNotifierProvider).colorSelected ||
                ref.watch(appAppearanceNotifierProvider).colorSelectionMethod !=
                    ColorSelectionMethod.colorSeed,
            child: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(
                    currentColor ==
                                ref
                                    .watch(appAppearanceNotifierProvider)
                                    .colorSelected &&
                            ref
                                    .watch(appAppearanceNotifierProvider)
                                    .colorSelectionMethod !=
                                ColorSelectionMethod.image
                        ? Icons.color_lens
                        : Icons.color_lens_outlined,
                    color: currentColor.color,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(currentColor.label),
                ),
              ],
            ),
          );
        });
      },
      onSelected:
          ref.read(appAppearanceNotifierProvider.notifier).handleColorSelect,
    );
  }
}

class _ColorImageButton extends ConsumerWidget {
  const _ColorImageButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton(
      icon: const Icon(
        Icons.image_outlined,
      ),
      tooltip: 'Select a color extraction image',
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      itemBuilder: (context) {
        return List.generate(ColorImageProvider.values.length, (index) {
          final currentImageProvider = ColorImageProvider.values[index];

          return PopupMenuItem(
            value: index,
            enabled: currentImageProvider !=
                    ref.watch(appAppearanceNotifierProvider).imageSelected ||
                ref.watch(appAppearanceNotifierProvider).colorSelectionMethod !=
                    ColorSelectionMethod.image,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 48),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image(
                          image: NetworkImage(currentImageProvider.url),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(currentImageProvider.label),
                ),
              ],
            ),
          );
        });
      },
      onSelected:
          ref.read(appAppearanceNotifierProvider.notifier).handleImageSelect,
    );
  }
}

class _BrightnessButton extends ConsumerWidget {
  const _BrightnessButton({
    this.showTooltipBelow = true,
  });

  final bool showTooltipBelow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isBright = Theme.of(context).brightness == Brightness.light;
    return Tooltip(
      preferBelow: showTooltipBelow,
      message: 'Toggle brightness',
      child: IconButton(
        icon: isBright
            ? const Icon(Icons.dark_mode_outlined)
            : const Icon(Icons.light_mode_outlined),
        onPressed: () => ref
            .read(appAppearanceNotifierProvider.notifier)
            .handleBrightnessChange(!isBright),
      ),
    );
  }
}

class _Material3Button extends ConsumerWidget {
  const _Material3Button({
    this.showTooltipBelow = true,
  });

  final bool showTooltipBelow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final useMaterial3 = Theme.of(context).useMaterial3;
    return Tooltip(
      preferBelow: showTooltipBelow,
      message: 'Switch to Material ${useMaterial3 ? 2 : 3}',
      child: IconButton(
        icon: useMaterial3
            ? const Icon(Icons.filter_2)
            : const Icon(Icons.filter_3),
        onPressed: ref
            .read(appAppearanceNotifierProvider.notifier)
            .handleMaterialVersionChange,
      ),
    );
  }
}
