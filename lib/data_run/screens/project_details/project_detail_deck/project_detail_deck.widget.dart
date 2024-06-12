import 'package:d2_remote/modules/datarun/common/standard_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:mass_pro/commons/extensions/dynamic_extensions.dart';
import 'package:mass_pro/core/program/program_type.dart';
import 'package:mass_pro/data_run/screens/general/view_base.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_deck/project_detail_deck.providers.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_deck/project_detail_deck.view.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_deck/project_detail_deck_presenter.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_deck/project_detail_item.model.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_deck/project_detail_items.widget.dart';
import 'package:mass_pro/main/usescases/bundle/bundle.dart';

/// ProgramFragment
class ProjectDetailDeckWidget extends ConsumerStatefulWidget {
  const ProjectDetailDeckWidget({super.key});

  @override
  ConsumerState<ProjectDetailDeckWidget> createState() =>
      _ProjectDeckWidgetState();
}

class _ProjectDeckWidgetState extends ConsumerState<ProjectDetailDeckWidget>
    with ProjectDetailDeckView, ViewBase {
  Bundle bundle = Bundle();
  late final KeepAliveLink bundleKeepAliveLink;
  late final ProjectDetailDeckPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return ProjectDetailItemsWidget(
      onItemClick: (projectDetailItemModel) =>
          presenter.onItemClick(projectDetailItemModel!),
      onGranularSyncClick: (projectDetailItemModel) =>
          presenter.onSyncStatusClick(projectDetailItemModel!),
      onDescriptionClick: (projectDetailItemModel) =>
          presenter.showDescription(projectDetailItemModel?.description),
    );
  }

  @override
  void initState() {
    // bundle = ref.read(bundleObjectProvider.notifier).ref;
    // bundleKeepAliveLink = ref.read(bundleObjectProvider.notifier).ref.keepAlive();
    presenter = ref.read(projectDetailDeckPresenterProvider(this));
    super.initState();
  }

  @override
  void navigateTo(ProjectDetailItemModel project) {
    when(project.programType, {
      ProgramType.WITH_REGISTRATION.name: () {
        Get.snackbar('', '${project.programType} not Implemented yet1',
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
        // bundle = bundle.putString(EXTRA_PROJECT_UID, program.uid);
        logInfo(info: 'EXTRA_PROGRAM_UID, ${project.uid}');
        // navigatorKey.currentState!.pushNamed(ProgramEventDetailScreen.route);
        // ref
        //     .read(appStateNotifierProvider.notifier)
        //     .navigateToRoute(ProjectScreenWidget.route, arguments: bundle);
        // Navigator.of(context).pushNamed(ProjectDetailScreenWidget.route);
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) {
        //       return const ProjectScreenWidget();
        //     },
        //   ),
        // );
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
  Future<void> showSyncDialog<ProjectItemModel>(
      [ProjectItemModel? program]) async {}
}
