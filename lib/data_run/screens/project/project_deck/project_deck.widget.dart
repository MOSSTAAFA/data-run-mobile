import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import 'package:mass_pro/commons/extensions/dynamic_extensions.dart';
import 'package:mass_pro/commons/extensions/standard_extensions.dart';
import 'package:mass_pro/commons/state/app_state_notifier.dart';
import 'package:mass_pro/core/program/program_type.dart';
import 'package:mass_pro/main/usescases/bundle/bundle.dart';
import 'package:mass_pro/data_run/screens/general/view_base.dart';
import 'package:mass_pro/data_run/screens/project/project_deck/project_deck.providers.dart';
import 'package:mass_pro/data_run/screens/project/project_deck/project_deck.view.dart';
import 'package:mass_pro/data_run/screens/project/project_deck/project_deck_presenter.dart';
import 'package:mass_pro/data_run/screens/project/project_deck/project_item.model.dart';
import 'package:mass_pro/data_run/screens/project/project_deck/project_items.widget.dart';
import 'package:mass_pro/data_run/screens/project/project_screen.widget.dart';

/// ProgramFragment
class ProjectDeckWidget extends ConsumerStatefulWidget {
  const ProjectDeckWidget({super.key});

  @override
  ConsumerState<ProjectDeckWidget> createState() => _ProjectDeckWidgetState();
}

class _ProjectDeckWidgetState extends ConsumerState<ProjectDeckWidget>
    with ProjectDeckView, ViewBase {
  Bundle bundle = Bundle();
  late final KeepAliveLink bundleKeepAliveLink;
  late final ProjectDeckPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return ProjectItemsWidget(
      onItemClick: (projectItemModel) =>
          presenter.onItemClick(projectItemModel!),
      onGranularSyncClick: (projectItemModel) =>
          presenter.onSyncStatusClick(projectItemModel!),
      onDescriptionClick: (projectItemModel) =>
          presenter.showDescription(projectItemModel?.description),
    );
  }

  @override
  void initState() {
    // bundle = ref.read(bundleObjectProvider.notifier).ref;
    // bundleKeepAliveLink = ref.read(bundleObjectProvider.notifier).ref.keepAlive();
    presenter = ref.read(projectDeckPresenterProvider(this));
    super.initState();
  }

  @override
  void clearFilters() {
    // TODO: implement clearFilters
  }

  @override
  void navigateTo(ProjectItemModel program) {
    when(program.programType, {
      ProgramType.WITH_REGISTRATION.name: () {
        Get.snackbar('', '${program.programType} not Implemented yet1',
            snackPosition: SnackPosition.BOTTOM,
            barBlur: 16,
            backgroundColor: Colors.orangeAccent.withOpacity(0.3));
        // Intent(activity, SearchTEActivity::class.java).apply {
        //     putExtras(bundle)
        //     getActivityContent.launch(this)
        // }
      },
      ProgramType.WITHOUT_REGISTRATION.name: () {
        // ref
        //     .read(bundleObjectProvider.notifier)
        //     .putString(EXTRA_PROGRAM_UID, program.uid);
        bundle = bundle.putString(EXTRA_PROJECT_UID, program.uid);
        logInfo(info: 'EXTRA_PROGRAM_UID, ${program.uid}');
        // navigatorKey.currentState!.pushNamed(ProgramEventDetailScreen.route);
        ref
            .read(appStateNotifierProvider.notifier)
            .navigateToRoute(ProjectScreenWidget.route, arguments: bundle);
        // Intent(activity, ProgramEventDetailActivity::class.java).apply {
        //     putExtras(ProgramEventDetailActivity.getBundle(program.uid))
        //     getActivityContent.launch(this)
        // }
      }
    }) /*.orElse(() {
      Get.snackbar('', '${program.programType} not Implemented yet');
      // Intent(activity, DataSetDetailActivity::class.java).apply {
      //               putExtras(bundle)
      //               getActivityContent.launch(this)
      //           }
    })*/
        ;
  }

  @override
  void openOrgUnitTreeSelector() {
    // TODO: implement openOrgUnitTreeSelector
  }

  @override
  void showFilterProgress() {
    // TODO: implement showFilterProgress
  }

  @override
  void showHideFilter() {
    // TODO: implement showHideFilter
  }

  @override
  void swapProgramModelData(IList<ProjectItemModel> projectItems) {
    // TODO: implement swapProgramModelData
  }

  @override
  Future<void> showSyncDialog<ProjectItemModel>(
      [ProjectItemModel? program]) async {}
}
