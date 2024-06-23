import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/metadatarun/project/entities/d_project.entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:mass_pro/data_run/screens/activity_forms/activity_form_item.model.dart';
import 'package:mass_pro/data_run/screens/activity_forms/activity_form_items.widget.dart';
import 'package:mass_pro/data_run/screens/view/view_base.dart';
import 'package:mass_pro/data_run/utils/screens_constants.dart';
import 'package:mass_pro/main/usescases/bundle/bundle.dart';
import 'package:mass_pro/riverpod/use_on_init_hook.dart';

/// List Activities of certain project
class ActivityFormScreenWidget extends ConsumerStatefulWidget with ViewBase {
  const ActivityFormScreenWidget({super.key, this.projectId});

  static const String route = '/projects/detail';

  final String? projectId;

  @override
  ConsumerState<ActivityFormScreenWidget> createState() =>
      _ActivityFormScreenWidgetState();
}

class _ActivityFormScreenWidgetState
    extends ConsumerState<ActivityFormScreenWidget> with ViewBase {
  late final String? projectUid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('project details'),
      ),
      body: ActivityFormItemsWidget(
        onItemClick: (activityFormItemModel) =>
            navigateTo(activityFormItemModel!),
        onGranularSyncClick: (activityFormItemModel) =>
            showSyncDialog(activityFormItemModel),
        onDescriptionClick: (activityFormItemModel) =>
            activityFormItemModel?.description != null
                ? showDescription(activityFormItemModel!.description!)
                : null,
      ),
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

  void navigateTo(ActivityFormItemModel project) {}

  void setProject(DProject project) {
    // useOnInit(() => ref
    //     .read(projectNameProvider.notifier)
    //     .update((state) => project.displayName ?? project.name ?? ''));
    // Future(() => ref
    //     .read(activityNameProvider.notifier)
    //     .update((state) => activity.displayName ?? activity.name ?? ''));
  }

  @override
  Future<void> showSyncDialog<ProjectItemModel>(
      [ProjectItemModel? activity]) async {}
}

