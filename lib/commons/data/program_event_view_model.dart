import 'package:d2_remote/modules/data/tracker/models/geometry.dart';
import 'package:equatable/equatable.dart';

import '../../core/event/event_status.dart';
import '../helpers/collections.dart';
import 'carousel_item_model.dart';

class ProgramEventViewModel with EquatableMixin implements CarouselItemModel {
  ProgramEventViewModel(
      {required this.uid,
      required this.orgUnitUid,
      required this.orgUnitName,
      required this.date,
      required this.dirty,
      required this.eventDisplayData,
      required this.eventStatus,
      required this.isExpired,
      required this.activityUid,
      required this.activityName,
      this.geometry,
      this.canBeEdited = true,
      this.openedAttributeList = false});

  @override
  final String uid;

  final String orgUnitUid;

  final String orgUnitName;

  final DateTime date;

  final bool dirty;

  final List<Pair<String, String>> eventDisplayData;

  final EventStatus eventStatus;

  final bool isExpired;

  final String activityUid;

  final String activityName;

  final Geometry? geometry;

  final bool canBeEdited;

  final bool openedAttributeList;

  // void toggleAttributeList() {
  //   openedAttributeList = !openedAttributeList;
  // }

  ProgramEventViewModel copyWith(
          {String? uid,
          String? orgUnitUid,
          String? orgUnitName,
          DateTime? date,
          bool? dirty,
          List<Pair<String, String>>? eventDisplayData,
          EventStatus? eventStatus,
          bool? isExpired,
          String? activityUid,
          String? activityName,
          Geometry? geometry,
          bool? canBeEdited,
          bool? openedAttributeList}) =>
      ProgramEventViewModel(
          uid: uid ?? this.uid,
          orgUnitUid: orgUnitUid ?? this.orgUnitUid,
          orgUnitName: orgUnitName ?? this.orgUnitName,
          date: date ?? this.date,
          dirty: dirty ?? this.dirty,
          eventDisplayData: eventDisplayData ?? this.eventDisplayData,
          eventStatus: eventStatus ?? this.eventStatus,
          isExpired: isExpired ?? this.isExpired,
          activityUid: activityUid ?? this.activityUid,
          activityName: activityName ?? this.activityName,
          geometry: geometry ?? this.geometry,
          canBeEdited: canBeEdited ?? this.canBeEdited,
          openedAttributeList: openedAttributeList ?? this.openedAttributeList);

  @override
  List<Object?> get props => [
        uid,
        orgUnitUid,
        orgUnitName,
        date,
        dirty,
        eventDisplayData,
        eventStatus,
        isExpired,
        activityUid,
        activityName,
        geometry,
        canBeEdited,
        openedAttributeList
      ];
}
