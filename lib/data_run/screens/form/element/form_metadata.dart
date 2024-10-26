import 'package:equatable/equatable.dart';

class FormMetadata with EquatableMixin {
  const FormMetadata({
    required this.form,
    required this.formLabel,
    required this.activity,
    required this.version,
    this.submission,
  });

  final String form;
  final String formLabel;
  final int version;
  final String activity;
  final String? submission;

  FormMetadata copyWith({
    String? form,
    String? formLabel,
    String? activity,
    int? version,
    String? submission,
  }) {
    return FormMetadata(
        form: form ?? this.form,
        formLabel: formLabel ?? this.formLabel,
        submission: submission ?? this.submission,
        activity: activity ?? this.activity,
        version: version ?? this.version);
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [form, formLabel, submission, activity, version];
}
