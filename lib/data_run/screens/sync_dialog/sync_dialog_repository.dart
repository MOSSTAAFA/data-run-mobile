import 'package:d2_remote/modules/datarun_shared/queries/syncable.query.dart';
import 'package:mass_pro/data_run/form/form.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sync_dialog_repository.g.dart';

@riverpod
SyncDialogRepository syncDialogRepository(SyncDialogRepositoryRef ref,
    {required String formCode}) {
  final SyncableQuery d2SyncableQuery =
      ref.watch(databaseSyncableQueryProvider(formCode)).provideQuery();

  return SyncDialogRepository(ref: ref, d2SyncableQuery: d2SyncableQuery);
}

class SyncDialogRepository {
  SyncDialogRepository(
      {required this.ref, required SyncableQuery d2SyncableQuery})
      : _d2SyncableQuery = d2SyncableQuery;

  final SyncableQuery _d2SyncableQuery;
  final SyncDialogRepositoryRef ref;

  Future<List<dynamic>?> syncEntities(List<String> uids) async {
    return _d2SyncableQuery
        // .byIds(uids)
        .upload();
  }
}
