import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/data_run/screens/project/project_deck/project_deck.providers.dart';
import 'package:mass_pro/data_run/screens/project/project_deck/project_item.model.dart';
import 'package:mass_pro/data_run/screens/project/project_deck/project_item.widget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ProjectItemsWidget extends ConsumerStatefulWidget {
  const ProjectItemsWidget({
    super.key,
    required this.onItemClick,
    required this.onGranularSyncClick,
    this.onDescriptionClick,
  });

  final void Function(ProjectItemModel? programViewModel)? onItemClick;
  final void Function(ProjectItemModel? programViewModel)?
      onGranularSyncClick;
  final void Function(ProjectItemModel? programViewModel)? onDescriptionClick;

  @override
  ConsumerState<ProjectItemsWidget> createState() =>
      _ProjectItemsWidgetState();
}

class _ProjectItemsWidgetState extends ConsumerState<ProjectItemsWidget> {
  final ItemScrollController itemScrollController = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    // final itemCount = ref.watch(programViewModelsProvider
    //     .select((programModels) => programModels.value?.length ?? 0));
    final itemCount = ref.watch(projectItemModelsListLengthProvider).value;
    return itemCount != null
        ? ScrollablePositionedList.builder(
            shrinkWrap: true,
            itemCount: itemCount,
            itemBuilder: (BuildContext context, int index) => ProviderScope(
              overrides: [
                projectItemModelIndexProvider.overrideWith((_) => index)
              ],
              child: ProjectItemWidget(
                onItemClick: (programViewModel) =>
                    widget.onItemClick?.call(programViewModel),
                onGranularSyncClick: (programViewModel) =>
                    widget.onGranularSyncClick?.call(programViewModel),
                onDescriptionClick: (programViewModel) =>
                    widget.onDescriptionClick?.call(programViewModel),
              ),
            ),
            itemScrollController: itemScrollController,
            // itemPositionsListener: itemPositionsListener,
          )
        : const SizedBox.shrink();
  }
}
