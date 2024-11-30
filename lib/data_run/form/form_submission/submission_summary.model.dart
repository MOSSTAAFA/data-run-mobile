import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:datarun/core/common/state.dart';

class SubmissionItemSummaryModel with EquatableMixin {
  SubmissionItemSummaryModel(
      {this.code,
      required this.orgUnit,
      required this.syncStatus,
      Iterable<dynamic>? formData})
      : this.formData = IList.orNull(formData) ?? const IList.empty();

  final String? code;
  final String orgUnit;
  final SyncStatus syncStatus;
  final IList<dynamic> formData;

  @override
  List<Object?> get props => [code, orgUnit, syncStatus, formData];
}
