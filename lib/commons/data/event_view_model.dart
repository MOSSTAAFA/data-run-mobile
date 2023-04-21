import 'package:d2_remote/modules/data/tracker/entities/event.entity.dart';
import 'package:d2_remote/modules/metadata/program/entities/program_stage.entity.dart';
import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../helpers/collections.dart';

part 'event_view_model.g.dart';

@riverpod
class EventViewModel extends _$EventViewModel {
  /// TODO(NMC): may add orgUnit and Type as parameter
  @override
  EventModel build() {
    return EventModel();
  }

  void toggleValueList(bool isOpen) {
    state = state.copyWith(valueListIsOpen: isOpen);
  }
}

@riverpod
bool canShowAddButton(CanShowAddButtonRef ref) {
  final type =
      ref.watch(eventViewModelProvider.select((eventModel) => eventModel.type));
  final canAddNewEvent = ref.watch(
      eventViewModelProvider.select((eventModel) => eventModel.canAddNewEvent));
  final stageRepeatable = ref.watch(eventViewModelProvider
      .select((eventModel) => eventModel.stage?.repeatable));
  final eventCount = ref.watch(
      eventViewModelProvider.select((eventModel) => eventModel.eventCount));

  if (type == EventViewModelType.STAGE) {
    return canAddNewEvent && ((stageRepeatable ?? false) || eventCount == 0);
  } else {
    return true;
  }
}

enum EventViewModelType { STAGE, EVENT }

class EventModel with EquatableMixin {
  EventModel(
      {this.type,
      this.stage,
      this.event,
      this.eventCount = 0,
      this.lastUpdate,
      this.isSelected = false,
      this.canAddNewEvent = true,
      this.orgUnitName,
      this.activityName,
      this.dataElementValues,
      this.groupedByStage = false,
      this.valueListIsOpen = false,
      this.showTopShadow = false,
      this.showBottomShadow = false,
      this.displayDate});

  // final EventViewModelType type;
  final EventViewModelType? type;
  final ProgramStage? stage;
  final Event? event;
  final int eventCount;
  final DateTime? lastUpdate;
  final bool isSelected;
  final bool canAddNewEvent;
  // final String orgUnitName;
  final String? orgUnitName;
  final String? activityName;
  final List<Pair<String, String?>>? dataElementValues;
  final bool groupedByStage;
  final bool valueListIsOpen;
  final bool showTopShadow;
  final bool showBottomShadow;
  final String? displayDate;

  // EventModel toggleValueList() {
  //   return copyWith(valueListIsOpen: !valueListIsOpen);
  // }

  EventModel copyWith(
          {EventViewModelType? type,
          ProgramStage? stage,
          Event? event,
          int? eventCount,
          DateTime? lastUpdate,
          bool? isSelected,
          bool? canAddNewEvent,
          String? orgUnitName,
          String? activityName,
          List<Pair<String, String?>>? dataElementValues,
          bool? groupedByStage,
          bool? valueListIsOpen,
          bool? showTopShadow,
          bool? showBottomShadow,
          String? displayDate}) =>
      EventModel(
          type: type ?? this.type,
          stage: stage ?? this.stage,
          event: event ?? this.event,
          eventCount: eventCount ?? this.eventCount,
          lastUpdate: lastUpdate ?? this.lastUpdate,
          isSelected: isSelected ?? this.isSelected,
          canAddNewEvent: canAddNewEvent ?? this.canAddNewEvent,
          orgUnitName: orgUnitName ?? this.orgUnitName,
          activityName: activityName ?? this.activityName,
          dataElementValues: dataElementValues ?? this.dataElementValues,
          groupedByStage: groupedByStage ?? this.groupedByStage,
          valueListIsOpen: valueListIsOpen ?? this.valueListIsOpen,
          showTopShadow: showTopShadow ?? this.showTopShadow,
          showBottomShadow: showBottomShadow ?? this.showBottomShadow,
          displayDate: displayDate ?? this.displayDate);

  @override
  List<Object?> get props => [
        type,
        stage,
        // event?.id,
        // event?.dirty,
        event,
        eventCount,
        lastUpdate,
        isSelected,
        canAddNewEvent,
        orgUnitName,
        activityName,
        dataElementValues,
        groupedByStage,
        valueListIsOpen,
        showTopShadow,
        showBottomShadow,
        displayDate
      ];
}

extension EventViewModelUids on List<EventModel> {
  List<String> uids() {
    return map((it) => it.event!.id!).toList();
  }
}
