// ignore_for_file: prefer_if_elements_to_conditional_expressions

import 'package:d2_remote/modules/data/tracker/entities/event.entity.dart';
import 'package:d2_remote/modules/metadata/program/entities/program.entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../commons/data/event_view_model.dart';
import '../../../commons/helpers/collections.dart';
import '../../../core/event/event_extensions.dart';
import '../../../core/event/event_status.dart';
import '../../../core/program/program_type.dart';
import '../../../utils/mass_utils/utils.dart';

/// EventViewHolder
class EventViewItem extends ConsumerStatefulWidget {
  const EventViewItem(
      {super.key,
      required this.onSyncClick,
      required this.onScheduleClick,
      required this.onEventSelected,
      required this.program});

  final Program program;
  final void Function(String?) onSyncClick;
  final void Function(String?) onScheduleClick;
  final Function(String?, String?, String?, EventStatus?) onEventSelected;

  @override
  ConsumerState<EventViewItem> createState() => _EventViewItemState();
}

class _EventViewItemState extends ConsumerState<EventViewItem> {
  @override
  Widget build(BuildContext context) {
    // final eventModel = ref.watch(eventViewModelProvider);
    final event =
        // eventModel.event;
        ref.watch(
            eventViewModelProvider.select((eventModel) => eventModel.event));
    final activityName =
        // eventModel.activityName;
        ref.watch(eventViewModelProvider
            .select((eventModel) => eventModel.activityName));
    final orgUnitName =
        // eventModel.orgUnitName;
        ref.watch(eventViewModelProvider
            .select((eventModel) => eventModel.orgUnitName));
    final dataValues =
        // eventModel.dataElementValues;
        ref.watch(eventViewModelProvider
            .select((eventModel) => eventModel.dataElementValues));
    final displayDate =
        // eventModel.displayDate;
        ref.watch(eventViewModelProvider
            .select((eventModel) => eventModel.displayDate));
    final stage =
        // eventModel.stage;
        ref.watch(
            eventViewModelProvider.select((eventModel) => eventModel.stage));
    final groupedByStage =
        // eventModel.groupedByStage;
        ref.watch(eventViewModelProvider
            .select((eventModel) => eventModel.groupedByStage));

    final Color? cardColor = widget.program.programType.toProgramType ==
            ProgramType.WITH_REGISTRATION
        ? convertHexStringToColor('#FAFAFA')
        : Colors.white;

    final String title =
        groupedByStage ? stage?.displayName ?? '' : displayDate ?? '';

    bool showDataElementValues = false;
    if (dataValues != null && dataValues.isNotEmpty) {
      showDataElementValues = true;
    } else {
      showDataElementValues = false;
    }

    return Card(
      color: cardColor,
      child: ExpansionTile(
          initiallyExpanded: ref.watch(eventViewModelProvider
              .select((eventModel) => eventModel.valueListIsOpen)),
          onExpansionChanged: (bool isExpanded) {
            ref
                .read(eventViewModelProvider.notifier)
                .toggleValueList(isExpanded);
          },
          leading: const Icon(Icons.event_note_sharp),
          title: InkWell(
            onTap: () {
              switch (event?.status.toEventStatus) {
                case EventStatus.SCHEDULE:
                case EventStatus.OVERDUE:
                case EventStatus.SKIPPED:
                  widget.onScheduleClick.call(event?.id);
                  break;
                case EventStatus.VISITED:
                  break;
                case EventStatus.ACTIVE:
                case EventStatus.COMPLETED:
                  widget.onEventSelected.call(
                      event?.id,
                      event?.orgUnit,
                      event?.activity is String
                          ? event?.activity
                          : event?.activity.id,
                      event?.status.toEventStatus);
                  break;
                default:
                  break;
              }
            },
            child: Row(children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title),
                    Text(
                      '$activityName - $orgUnitName',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              event?.dirty ?? false
                  ? ActionChip(
                      label: const Icon(
                        Icons.sync,
                      ),
                      onPressed: () => widget.onSyncClick.call(event?.id),
                    )
                  : Icon(
                      Icons.check,
                      color: Colors.green[300],
                    ),
            ]),
          ),
          // subtitle: Text('Trailing expansion arrow icon'),
          // backgroundColor: Colors.grey[200],
          childrenPadding: EdgeInsets.zero,
          trailing: showDataElementValues ? null : const SizedBox(),
          children: showDataElementValues
              ? dataValues!
                  .map(
                    (Pair<String, String?> value) => ListTile(
                      title: Text('${value.first}: ${value.second}'),
                      dense: true,
                      tileColor: Colors.grey[200],
                      minVerticalPadding: 0,
                    ),
                  )
                  .toList()
              : []),
    );
  }
}
