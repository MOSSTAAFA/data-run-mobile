
import 'package:mass_pro/data_run/form/form_configuration.dart';
import 'package:mass_pro/data_run/submission/submission_initial_repository.dart';
import 'package:mass_pro/data_run/submission/submission_mapping_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'submission.g.dart';

@riverpod
SubmissionInitialRepository submissionInitialRepository(
    SubmissionInitialRepositoryRef ref,
    {required FormConfiguration formConfiguration}) {
  return SubmissionInitialRepository(formConfiguration: formConfiguration);
}

/// Depends on Bundle from the route
///
@riverpod
SubmissionMappingRepository submissionMappingRepository(
    SubmissionMappingRepositoryRef ref,
    {required FormConfiguration formConfiguration,
    required String submissionUid}) {
  return SubmissionMappingRepository(
      formConfiguration: formConfiguration, submissionUid: submissionUid);
}
