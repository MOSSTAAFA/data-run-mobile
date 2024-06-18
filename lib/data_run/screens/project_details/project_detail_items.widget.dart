import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_deck/project_detail_deck.providers.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_deck/project_detail_item.model.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_deck/project_detail_item.widget.dart';
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
  final void Function(ProjectDetailItemModel? programViewModel)? onDescriptionClick;

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
    final itemCount = ref.watch(projectDetailItemModelsListLengthProvider).value;
    return itemCount != null
        ? ScrollablePositionedList.builder(
            shrinkWrap: true,
            itemCount: itemCount,
            itemBuilder: (BuildContext context, int index) => ProviderScope(
              overrides: [
                projectDetailItemModelIndexProvider.overrideWith((_) => index)
              ],
              child: ProjectDetailItemWidget(
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
