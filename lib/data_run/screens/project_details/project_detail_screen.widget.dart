import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/metadatarun/project/entities/d_project.entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:mass_pro/data_run/screens/project_details/model/project_detail_item.model.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_items.widget.dart';
import 'package:mass_pro/data_run/screens/view/view_base.dart';
import 'package:mass_pro/data_run/utils/screens_constants.dart';
import 'package:mass_pro/main/usescases/bundle/bundle.dart';
import 'package:mass_pro/riverpod/use_on_init_hook.dart';

/// List Activities of certain project
class ProjectDetailScreenWidget extends ConsumerStatefulWidget with ViewBase {
  const ProjectDetailScreenWidget({super.key});

  static const String route = '/projects/detail';

  @override
  ConsumerState<ProjectDetailScreenWidget> createState() =>
      _ProjectDetailScreenWidgetState();
}

class _ProjectDetailScreenWidgetState
    extends ConsumerState<ProjectDetailScreenWidget> with ViewBase {
  late final String? projectUid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ref.watch(projectNameProvider)),
      ),
      body: ProjectDetailItemsWidget(
        onItemClick: (ProjectDetailItemModel? projectDetailItemModel) =>
            navigateTo(projectDetailItemModel!),
        onGranularSyncClick: (ProjectDetailItemModel? projectDetailItemModel) =>
            showSyncDialog(projectDetailItemModel),
        onDescriptionClick: (ProjectDetailItemModel? projectDetailItemModel) =>
            projectDetailItemModel?.description != null
                ? showDescription(projectDetailItemModel!.description!)
                : null,
      ),
    );
  }

  @override
  void initState() {
    projectUid = (Get.arguments as Bundle).getString(EXTRA_PROJECT_UID);
    D2Remote.projectModuleD.project
        .byId(projectUid!)
        .getOne()
        .then((project) => setProject(project!));
    super.initState();
  }

  void navigateTo(ProjectDetailItemModel project) {}

  void setProject(DProject project) {
    useOnInit(() => ref
        .read(projectNameProvider.notifier)
        .update((String state) => project.displayName ?? project.name ?? ''));
  }

  @override
  Future<void> showSyncDialog<ProjectItemModel>(
      [ProjectItemModel? program]) async {}
}

final AutoDisposeStateProvider<String> projectNameProvider = StateProvider.autoDispose<String>((AutoDisposeStateProviderRef<String> ref) => '');
