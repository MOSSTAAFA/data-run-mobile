import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/datarun/iccm/entities/chv_session.entity.dart';
import 'package:d2_remote/modules/datarun_shared/entities/syncable.entity.dart';
import 'package:d2_remote/modules/datarun/common/standard_extensions.dart';
import 'package:mass_pro/core/common/state.dart';
import 'package:mass_pro/data_run/repository/activity_data_repository/activity_data_repository.dart';
import 'package:mass_pro/data_run/repository/activity_data_repository/activity_form_data_repository.dart';

class ActivityDataChvSessionRepository with ActivityDataRepository<ChvSession> {
  ActivityDataChvSessionRepository(/*this.repository*/);

  // final ActivityFormDataRepository<ChvSession> repository;

  @override
  Future<SyncableEntityState> getState([String? id]) async {
    final query = D2Remote.iccmModule.chvSession;

    final withSyncErrorState = await query.withSyncErrorState().count();

    final withUpdateErrorState =
        await query.withUpdateSyncedErrorState().count();

    final withToPostState = await query.withToPostState().count();
    final withToUpdateState = await query.withToUpdateState().count();

    return when(true, {
      withUpdateErrorState > 0 || withSyncErrorState > 0: () => SyncableEntityState.WARNING,
      withToPostState > 0: () => SyncableEntityState.TO_POST,
      withToUpdateState > 0: () => SyncableEntityState.TO_UPDATE,
    }).orElse(() => SyncableEntityState.SYNCED);
  }

  @override
  Future<List<ChvSession>> fetchData([String? id]) {
    return D2Remote.iccmModule.chvSession.get();
  }

  @override
  Future<ChvSession> saveData(SyncableEntity data) {
    // TODO: implement saveData
    throw UnimplementedError();
  }
}
