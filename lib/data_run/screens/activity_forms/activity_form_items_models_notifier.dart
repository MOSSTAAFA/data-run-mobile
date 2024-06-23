// ignore_for_file: avoid_dynamic_calls

import 'package:d2_remote/modules/datarun/common/standard_extensions.dart';
import 'package:d2_remote/modules/metadatarun/activity/entities/d_activity.entity.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mass_pro/commons/resources/resource_manager.dart';
import 'package:mass_pro/commons/ui/metadata_icon_data.dart';
import 'package:mass_pro/data_run/screens/activity_forms/activity_form_item.model.dart';
import 'package:mass_pro/data_run/utils/activities_access_repository.dart';
import 'package:mass_pro/data_run/utils/screens_constants.dart';
import 'package:mass_pro/data_run/utils/utils.providers.dart';
import 'package:mass_pro/main/data/service/sync_status_data.dart';
import 'package:mass_pro/main/usescases/bundle/bundle.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'activity_form_items_models_notifier.g.dart';

@riverpod
ActivityFormItemModel activityFormItemModel(ActivityFormItemModelRef ref) {
  throw UnimplementedError();
}

@riverpod
class ActivityFormItemsModelsNotifier
    extends _$ActivityFormItemsModelsNotifier {
  @override
  Future<IList<ActivityFormItemModel>> build() async {
    final formUid = (Get.arguments as Bundle).getString(EXTRA_PROJECT_UID)!;

    final IList<DActivity> activeActivities = await ref
        .watch(activitiesAccessRepositoryProvider)
        .getActiveActivities();

    final projectActivities =
        activeActivities.where((t) => t.project == formUid);
    IList<ActivityFormItemModel> activityModles =
        IList<ActivityFormItemModel>();
    for (final activity in projectActivities) {
      final state =
          await ref.read(activityUtilsProvider).getActivityState(activity);

      // final count =
      // await ref.read(projectUtilsProvider).getActivitiesCount(activity);

      final ActivityFormItemModel activityModel = ActivityFormItemModel(
          uid: activity.uid!,
          title: activity.name ?? activity.code ?? activity.uid!,
          metadataIconData: MetadataIconData(
              programColor: ref
                  .read(resourceManagerProvider)
                  .getColorOrDefaultFrom(/* activity.style?.color */ null),
              iconResource: ref
                  .read(resourceManagerProvider)
                  .getObjectStyleDrawableResource(
                      /* activity.style()?.icon() */
                      null,
                      Icons.question_mark)),
          // count: count,
          dirty: activity.dirty,
          state: state);

      activityModles = activityModles.add(activityModel);
    }
    return activityModles.let((t) => applyFilters(t)).sort(
        (p1, p2) => p1.title.toLowerCase().compareTo(p2.title.toLowerCase()));
  }

  IList<ActivityFormItemModel> applyFilters(
      IList<ActivityFormItemModel> models) {
    // TODO(NMC): implement filtering

    return models;
  }

  IList<ActivityFormItemModel> applySync(
      IList<ActivityFormItemModel> models, SyncStatusData syncStatusData) {
    return models;
  }
}
