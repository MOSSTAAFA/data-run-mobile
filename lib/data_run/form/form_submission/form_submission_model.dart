import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_submission_model.freezed.dart';

@freezed
class SubmissionEditStatus {
  const factory SubmissionEditStatus.editable() = Editable;

  const factory SubmissionEditStatus.unEditable({String? reason}) = UnEditable;
}

@immutable
class FormSubmissionModel with EquatableMixin {
  FormSubmissionModel({
    required this.id,
    IMap<String, dynamic>? formData,
    required this.submissionEditStatus,
    // required this.formTemplate,
  }) : this.formData = formData ?? IMap();

  final IMap<String, dynamic> formData;

  final String? id;
  final SubmissionEditStatus submissionEditStatus;
  // final FormFlatTemplate formTemplate;

  @override
  List<Object?> get props => [id, submissionEditStatus, formData];

  FormSubmissionModel copyWith({
    IMap<String, dynamic>? formData,
    String? id,
    SubmissionEditStatus? submissionEditStatus,
  }) {
    return FormSubmissionModel(
      formData: formData ?? this.formData,
      id: id ?? this.id,
      submissionEditStatus: submissionEditStatus ?? this.submissionEditStatus,
    );
  }
}
