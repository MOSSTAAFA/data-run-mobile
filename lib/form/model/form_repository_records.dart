import 'package:mass_pro/commons/date/entry_mode.dart';
import 'package:mass_pro/form/model/enrollment_mode.dart';

class FormRepositoryRecords {
  final String? recordUid;
  final EntryMode? entryMode;
  final bool allowMandatoryFields;
  final bool isBackgroundTransparent;

  const FormRepositoryRecords._(
      {this.recordUid,
      this.entryMode,
      this.allowMandatoryFields = true,
      this.isBackgroundTransparent = true});

  const factory FormRepositoryRecords.enrollmentRecords(
      String enrollmentUid, EnrollmentMode enrollmentMode) = EnrollmentRecords;

  const factory FormRepositoryRecords.eventRecords(String eventUid) =
      EventRecords;

  const factory FormRepositoryRecords.searchRecords(
      String programUid,
      String teiTypeUid,
      Map<String, String> currentSearchValues) = SearchRecords;
}

class EnrollmentRecords extends FormRepositoryRecords {
  final String enrollmentUid;
  final EnrollmentMode enrollmentMode;

  const EnrollmentRecords(this.enrollmentUid, this.enrollmentMode)
      : super._(recordUid: enrollmentUid, entryMode: EntryMode.ATTR);
}

class EventRecords extends FormRepositoryRecords {
  final String eventUid;

  const EventRecords(this.eventUid)
      : super._(recordUid: eventUid, entryMode: EntryMode.DE);
}

class SearchRecords extends FormRepositoryRecords {
  final String programUid;
  final String teiTypeUid;
  final Map<String, String> currentSearchValues;

  const SearchRecords(
      this.programUid, this.teiTypeUid, this.currentSearchValues)
      : super._(
            recordUid: programUid,
            allowMandatoryFields: false,
            isBackgroundTransparent: false);
}
