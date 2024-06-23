import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/data_run/screens/project_details/activity_item_expansion_tile.widget.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_item.model.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_items_models_notifier.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ProjectDetailItemsWidget extends ConsumerStatefulWidget {
  const ProjectDetailItemsWidget({
    super.key,
    required this.onItemClick,
    required this.onGranularSyncClick,
    this.onDescriptionClick,
  });

  final void Function(ProjectDetailItemModel? programViewModel)? onItemClick;
  final void Function(ProjectDetailItemModel? programViewModel)?
      onGranularSyncClick;
  final void Function(ProjectDetailItemModel? programViewModel)?
      onDescriptionClick;

  @override
  ConsumerState<ProjectDetailItemsWidget> createState() =>
      _ProjectItemsWidgetState();
}

class _ProjectItemsWidgetState extends ConsumerState<ProjectDetailItemsWidget> {
  final ItemScrollController itemScrollController = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    // final itemCount = ref.watch(programViewModelsProvider
    //     .select((programModels) => programModels.value?.length ?? 0));
    final value = ref.watch(projectDetailItemsModelsNotifierProvider);
    return value.when(
        data: (data) => ScrollablePositionedList.builder(
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) => ProviderScope(
                overrides: [
                  projectDetailItemModelProvider
                      .overrideWith((_) => data[index])
                ],
                child: ActivityItemsExpansionTiles(
                  onGranularSyncClick: (programViewModel) =>
                      widget.onGranularSyncClick?.call(programViewModel),
                  onDescriptionClick: (programViewModel) =>
                      widget.onDescriptionClick?.call(programViewModel),
                ),
              ),
              itemScrollController: itemScrollController,
              // itemPositionsListener: itemPositionsListener,
            ),
        error: (error, _) => Text('Error: $error'),
        loading: () => const CircularProgressIndicator());
  }
}
