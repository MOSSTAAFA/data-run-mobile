import 'package:equatable/equatable.dart';

import '../../commons/date/entry_mode.dart';
import 'enrollment_mode.dart';

class FormRepositoryRecords with EquatableMixin {
  const FormRepositoryRecords(
      {this.recordUid,
      this.entryMode,
      this.allowMandatoryFields = true,
      this.isBackgroundTransparent = true});

  const factory FormRepositoryRecords.searchRecords(
      String programUid,
      String teiTypeUid,
      Map<String, String> currentSearchValues) = SearchRecords;

  const factory FormRepositoryRecords.eventRecords(String eventUid) =
      EventRecords;

  const factory FormRepositoryRecords.enrollmentRecords(
      String enrollmentUid, EnrollmentMode enrollmentMode) = EnrollmentRecords;

  final String? recordUid;
  final EntryMode? entryMode;
  final bool allowMandatoryFields;
  final bool isBackgroundTransparent;

  @override
  List<Object?> get props =>
      [recordUid, entryMode, allowMandatoryFields, isBackgroundTransparent];
}

class EnrollmentRecords extends FormRepositoryRecords {
  const EnrollmentRecords(this.enrollmentUid, this.enrollmentMode)
      : super(recordUid: enrollmentUid, entryMode: EntryMode.ATTR);
  final String enrollmentUid;
  final EnrollmentMode enrollmentMode;

  @override
  List<Object?> get props => [
        recordUid,
        entryMode,
        allowMandatoryFields,
        isBackgroundTransparent,
        enrollmentMode
      ];
}

class EventRecords extends FormRepositoryRecords {
  const EventRecords(this.eventUid)
      : super(recordUid: eventUid, entryMode: EntryMode.DE);
  final String? eventUid;
}

class SearchRecords extends FormRepositoryRecords {
  const SearchRecords(
      this.programUid, this.teiTypeUid, this.currentSearchValues)
      : super(
            recordUid: programUid,
            allowMandatoryFields: false,
            isBackgroundTransparent: false);
  final String? programUid;
  final String teiTypeUid;
  final Map<String, String> currentSearchValues;
}
