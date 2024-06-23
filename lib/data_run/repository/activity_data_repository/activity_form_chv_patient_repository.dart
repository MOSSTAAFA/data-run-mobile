import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/datarun/iccm/entities/chv_register.entity.dart';
import 'package:d2_remote/modules/datarun_shared/entities/syncable.entity.dart';
import 'package:d2_remote/modules/datarun/common/standard_extensions.dart';
import 'package:mass_pro/core/common/state.dart';
import 'package:mass_pro/data_run/repository/activity_data_repository/activity_data_repository.dart';
import 'package:mass_pro/data_run/repository/activity_data_repository/activity_form_data_repository.dart';

class ActivityDataChvPatientRepository
    with ActivityDataRepository<ChvRegister> {
  ActivityDataChvPatientRepository(this.repository);

  final ActivityFormDataRepository<ChvRegister> repository;

  @override
  Future<SyncableEntityState> getState([String? id]) async {
    final query = D2Remote.iccmModule.chvRegister;

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
  Future<List<ChvRegister>> fetchData([String? id]) {
    return D2Remote.iccmModule.chvRegister.get();
  }

  @override
  Future<ChvRegister> saveData(SyncableEntity data) {
    // TODO: implement saveData
    throw UnimplementedError();
  }
}
