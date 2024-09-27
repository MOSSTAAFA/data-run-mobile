import 'package:d2_remote/modules/metadatarun/activity/entities/d_activity.entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/commons/custom_widgets/async_value.widget.dart';
import 'package:mass_pro/data_run/screens/project_activity_detail/activity_expanded_card.widget.dart';
import 'package:mass_pro/data_run/screens/project_activity_detail/model/project_activities.provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ProjectActivitiesCards extends ConsumerStatefulWidget {
  const ProjectActivitiesCards({
    super.key,
    required this.project,
    this.onDescriptionClick,
  });

  final String project;

  final void Function(DActivity activity)? onDescriptionClick;

  @override
  ConsumerState<ProjectActivitiesCards> createState() =>
      _ProjectActivitiesScreenState();
}

class _ProjectActivitiesScreenState
    extends ConsumerState<ProjectActivitiesCards> {
  final ItemScrollController itemScrollController = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<DActivity>> value =
        ref.watch(projectActiveActivitiesProvider(widget.project));

    return AsyncValueWidget(
      value: value,
      data: (List<DActivity> activities) => ScrollablePositionedList.builder(
        shrinkWrap: true,
        itemCount: activities.length,
        itemBuilder: (BuildContext context, int index) => ActivityExpandedCard(
          activity: activities[index],
          onDescriptionClick: () =>
              widget.onDescriptionClick?.call(activities[index]),
        ),
        itemScrollController: itemScrollController,
      ),
    );
  }
}
