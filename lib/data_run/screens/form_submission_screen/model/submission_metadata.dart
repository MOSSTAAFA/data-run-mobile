import 'package:equatable/equatable.dart';

class SubmissionMetadata with EquatableMixin {
  SubmissionMetadata(
      {required this.form,
      required this.formVersion,
      required this.activity,
      required this.team,
      this.submissionId});

  final String form;
  final int formVersion;
  final String activity;
  final String team;
  final String? submissionId;

  @override
  List<Object?> get props => [form, formVersion, activity, team, submissionId];
}
