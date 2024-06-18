import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/datarun/iccm/entities/patient_info.entity.dart';
import 'package:d2_remote/modules/datarun_shared/entities/syncable.entity.dart';
import 'package:d2_remote/modules/datarun/common/standard_extensions.dart';
import 'package:mass_pro/core/common/state.dart';
import 'package:mass_pro/data_run/repository/activity_data_repository/activity_data_repository.dart';
import 'package:mass_pro/data_run/repository/activity_data_repository/activity_form_data_repository.dart';

class ActivityDataChvPatientRepository
    with ActivityDataRepository<PatientInfo> {
  ActivityDataChvPatientRepository(this.repository);

  final ActivityFormDataRepository<PatientInfo> repository;

  @override
  Future<State> getState([String? id]) async {
    final query = D2Remote.iccmModule.patientInfo;

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
  Future<List<PatientInfo>> fetchData([String? id]) {
    return D2Remote.iccmModule.patientInfo.get();
  }

  @override
  Future<PatientInfo> saveData(SyncableEntity data) {
    // TODO: implement saveData
    throw UnimplementedError();
  }
}
