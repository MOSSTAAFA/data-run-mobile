import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/datarun/common/standard_extensions.dart';
import 'package:d2_remote/modules/metadatarun/project/entities/d_project.entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:mass_pro/commons/extensions/dynamic_extensions.dart';
import 'package:mass_pro/core/program/program_type.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_item.model.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_items.widget.dart';
import 'package:mass_pro/data_run/screens/view/view_base.dart';
import 'package:mass_pro/data_run/utils/screens_constants.dart';
import 'package:mass_pro/main/usescases/bundle/bundle.dart';

/// ProgramFragment
class ProjectDetailScreenWidget extends ConsumerStatefulWidget {
  const ProjectDetailScreenWidget({super.key, this.projectUid});

  static const String route = '/projects/detail';

  final String? projectUid;

  @override
  ConsumerState<ProjectDetailScreenWidget> createState() =>
      _ProjectDetailScreenWidgetState();
}

class _ProjectDetailScreenWidgetState
    extends ConsumerState<ProjectDetailScreenWidget> with ViewBase {
  Bundle bundle = Bundle();
  late final String? projectUid;

  @override
  Widget build(BuildContext context) {
    return ProjectDetailItemsWidget(
      onItemClick: (projectDetailItemModel) =>
          navigateTo(projectDetailItemModel!),
      onGranularSyncClick: (projectDetailItemModel) =>
          showSyncDialog(projectDetailItemModel),
      onDescriptionClick: (projectDetailItemModel) =>
          projectDetailItemModel?.description != null
              ? showDescription(projectDetailItemModel!.description!)
              : null,
    );
  }

  @override
  void initState() {
    projectUid = (Get.arguments as Bundle).getString(EXTRA_PROJECT_UID)!;
    D2Remote.projectModuleD.project
        .byId(projectUid!)
        .getOne()
        .then((project) => setProject(project!));
    super.initState();
  }

  void navigateTo(ProjectDetailItemModel project) {
    Bundle bundle = Bundle();
    // Bundle bundle = ref.read(bundleObjectProvider);
    //

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

  void setProject(DProject project) {
    // useOnInit(() => ref
    //     .read(projectNameProvider.notifier)
    //     .update((state) => project.displayName ?? project.name ?? ''));
    // Future(() => ref
    //     .read(programNameProvider.notifier)
    //     .update((state) => program.displayName ?? program.name ?? ''));
  }

  @override
  Future<void> showSyncDialog<ProjectItemModel>(
      [ProjectItemModel? program]) async {}
}
