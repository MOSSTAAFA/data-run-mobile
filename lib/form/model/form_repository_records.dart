import '../../commons/date/entry_mode.dart';
import 'enrollment_mode.dart';

class FormRepositoryRecords {
  const factory FormRepositoryRecords.searchRecords(
      String programUid,
      String teiTypeUid,
      Map<String, String> currentSearchValues) = SearchRecords;

  const factory FormRepositoryRecords.eventRecords(String eventUid) =
      EventRecords;

  const factory FormRepositoryRecords.enrollmentRecords(
      String enrollmentUid, EnrollmentMode enrollmentMode) = EnrollmentRecords;

  const FormRepositoryRecords._(
      {this.recordUid,
      this.entryMode,
      this.allowMandatoryFields = true,
      this.isBackgroundTransparent = true});

  final String? recordUid;
  final EntryMode? entryMode;
  final bool allowMandatoryFields;
  final bool isBackgroundTransparent;
}

class EnrollmentRecords extends FormRepositoryRecords {
  const EnrollmentRecords(this.enrollmentUid, this.enrollmentMode)
      : super._(recordUid: enrollmentUid, entryMode: EntryMode.ATTR);
  final String enrollmentUid;
  final EnrollmentMode enrollmentMode;
}

class EventRecords extends FormRepositoryRecords {
  const EventRecords(this.eventUid)
      : super._(recordUid: eventUid, entryMode: EntryMode.DE);
  final String? eventUid;
}

class SearchRecords extends FormRepositoryRecords {
  const SearchRecords(
      this.programUid, this.teiTypeUid, this.currentSearchValues)
      : super._(
            recordUid: programUid,
            allowMandatoryFields: false,
            isBackgroundTransparent: false);
  final String? programUid;
  final String teiTypeUid;
  final Map<String, String> currentSearchValues;
}
