import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/datarun/iccm/entities/chv_session.entity.dart';
import 'package:d2_remote/modules/datarun/shared/entities/syncable.entity.dart';
import 'package:mass_pro/commons/extensions/standard_extensions.dart';
import 'package:mass_pro/core/common/state.dart';
import 'package:mass_pro/data_run/repository/activity_data_repository/activity_data_repository.dart';

class ActivityDataChvSessionRepository with ActivityDataRepository<ChvSession> {
  ActivityDataChvSessionRepository();

  @override
  Future<State> getState([String? id]) async {
    final query = D2Remote.iccmModule.chvSession;

    final withSyncErrorState = await query.withSyncErrorState().count();

    final withUpdateErrorState =
        await query.withUpdateSyncedErrorState().count();

    final withToPostState = await query.withToPostState().count();
    final withToUpdateState = await query.withToUpdateState().count();

    return when(true, {
      withUpdateErrorState > 0 || withSyncErrorState > 0: () => State.WARNING,
      withToPostState > 0: () => State.TO_POST,
      withToUpdateState > 0: () => State.TO_UPDATE,
    }).orElse(() => State.SYNCED);
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
