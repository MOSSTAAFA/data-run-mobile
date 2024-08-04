import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/datarun_shared/queries/syncable.query.dart';
import 'package:mass_pro/data_run/form/form.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sync_submission_repository.g.dart';

@riverpod
SyncSubmissionRepository syncSubmissionRepository(
    SyncSubmissionRepositoryRef ref) {
  return SyncSubmissionRepository();
}

class SyncSubmissionRepository {

  Future<List<dynamic>?> syncEntities(List<String> uids) async {
    return D2Remote.formModule.formSubmission.byIds(uids).upload();
  }
}
