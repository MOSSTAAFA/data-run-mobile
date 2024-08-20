import 'package:equatable/equatable.dart';

class SubmissionItemSummaryModel with EquatableMixin {
  SubmissionItemSummaryModel({required this.orgUnit, Map<String, dynamic>? formData})
      : this.formData = formData ?? {};

  final String orgUnit;
  final Map<String, dynamic> formData;

  @override
  List<Object?> get props => [orgUnit, formData];
}