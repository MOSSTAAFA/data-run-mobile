import 'package:equatable/equatable.dart';

/// data class
class EventSectionModel with EquatableMixin {
  const EventSectionModel(
      {required this.sectionName,
      required this.sectionUid,
      required this.numberOfCompletedFields,
      required this.numberOfTotalFields});

  final String sectionName;
  final String sectionUid;
  final int numberOfCompletedFields;
  final int numberOfTotalFields;

  /// copyWith
  EventSectionModel copyWith(
          {final String? sectionName,
          final String? sectionUid,
          final int? numberOfCompletedFields,
          final int? numberOfTotalFields}) =>
      EventSectionModel(
          sectionName: sectionName ?? this.sectionName,
          sectionUid: sectionUid ?? this.sectionUid,
          numberOfCompletedFields:
              numberOfCompletedFields ?? this.numberOfCompletedFields,
          numberOfTotalFields: numberOfTotalFields ?? this.numberOfTotalFields);

  @override
  List<Object?> get props =>
      [sectionName, sectionUid, numberOfCompletedFields, numberOfTotalFields];
}
